require "prefabutil"
require "recipe"
require "modutil"

local MAXHITS = 10  -- make this an even number
local EMPTY = ""
local BROKEN = "_broken"

local assets=
{
    Asset("ANIM", "anim/altar.zip"),
    Asset("ATLAS", "images/inventoryimages/altar.xml"),
    Asset("IMAGE", "images/inventoryimages/altar.tex"),

    Asset("ANIM", "anim/altar_broken.zip"),
    Asset("ATLAS", "images/inventoryimages/altar_broken.xml"),
    Asset("IMAGE", "images/inventoryimages/altar_broken.tex"),
}

--------------------------------
local prefabs =
{
    "armormarble",
    "armor_sanity",
    "armorsnurtleshell",
    "resurrectionstatue",
    "icestaff",
    "firestaff",
    "telestaff",
    "thulecite",
    "orangestaff",
    "greenstaff",
    "yellowstaff",
    "amulet",
    "blueamulet",
    "purpleamulet",
    "orangeamulet",
    "greenamulet",
    "yellowamulet",
    "redgem",
    "bluegem",
    "orangegem",
    "greengem",
    "purplegem",
    "hound",
    "icehound",
    "firehound",
    "spider",
    "spider_warrior",
    "gears",
    "crawlingnightmare",
    "nightmarebeak",
    "collapse_small",
}

local spawns =
    {
        armormarble         = 0.5,
        armor_sanity        = 0.5,
        armorsnurtleshell   = 0.5,
        resurrectionstatue  = 1,
        icestaff            = 1,
        firestaff           = 1,
        telestaff           = 1,
        thulecite           = 1,
        orangestaff         = 1,
        greenstaff          = 1,
        yellowstaff         = 1,
        amulet              = 1,
        blueamulet          = 1,
        purpleamulet        = 1,
        orangeamulet        = 1,
        greenamulet         = 1,
        yellowamulet        = 1,
        redgem              = 5,
        bluegem             = 5,
        orangegem           = 5,
        greengem            = 5,
        purplegem           = 5,
        health_plus         = 10,
        health_minus        = 10,
        hound               = 15,
        icehound            = 100,
        firehound           = 100,
        spider              = 100,
        spider_warrior      = 100,
        trinket             = 100,
        gears               = 100,
        crawlingnightmare   = 110,
        nightmarebeak       = 110,
    }

local actions =
    {
        hound               = { cnt = 3 },
        icehound            = { cnt = 3, },
        firehound           = { cnt = 3, },
        trinket             = { cnt = 4, },
        spider              = { cnt = 2, },
        spider_warrior      = { cnt = 2, },
        health_plus         = { cnt = 0, health = 25, },
        health_minus        = { cnt = 0, health = -10, },
    }

local function PlayerSpawnCritter(player, critter, pos)
    TheWorld:PushEvent("ms_sendlightningstrike", pos)
    SpawnPrefab("collapse_small").Transform:SetPosition(pos:Get())
    local spawn = SpawnPrefab(critter)
    if spawn ~= nil then
        spawn.Transform:SetPosition(pos:Get())
        if spawn.components.combat ~= nil then
            spawn.components.combat:SetTarget(player)
        end
    end
end

local function SpawnCritter(critter, pos, player)
    player:DoTaskInTime(GetRandomWithVariance(1, 0.8), PlayerSpawnCritter, critter, pos)
end

local function SpawnAt(inst, prefab)
    local pos = inst:GetPosition()
    local offset, check_angle, deflected = FindWalkableOffset(pos, math.random() * 2 * PI, 4 , 8, true, false) -- try to avoid walls
    if offset ~= nil then
        return SpawnPrefab(prefab).Transform:SetPosition((pos + offset):Get())
    end
end

local function DoRandomThing(inst, pos, count, target)
    count = count or 1
    pos = pos or inst:GetPosition()

    for doit = 1, count do
        local item = weighted_random_choice(spawns)

        local doaction = actions[item]

        local cnt = doaction ~= nil and doaction.cnt or 1
        local sanity = doaction ~= nil and doaction.sanity or 0
        local health = doaction ~= nil and doaction.health or 0
        local func = doaction ~= nil and doaction.callback or nil
        local radius = doaction ~= nil and doaction.radius or 4

        local player = target

        if doaction ~= nil and doaction.var ~= nil then
            cnt = math.max(0, GetRandomWithVariance(cnt, doaction.var))
        end

        if cnt == 0 and func ~= nil then
            func(inst, item, doaction)
        end

        for i = 1, cnt do
            local offset, check_angle, deflected = FindWalkableOffset(pos, math.random() * 2 * PI, radius , 8, true, false) -- try to avoid walls
            if offset ~= nil then
                if func ~= nil then
                    func(inst, item, doaction)
                elseif item == "trinket" then
                    SpawnCritter("trinket_"..tostring(math.random(NUM_TRINKETS)), pos + offset, player)
                else
                    SpawnCritter(item, pos + offset, player)
                end
            end
        end

        if health ~= 0 then
            if player.components.health.currenthealth <= health then
                --V2C: is this rly?
                --     it means a health_plus will end up killing you
                --     if you only have 5 hp
                health = player.components.health.currenthealth - 10
            end
            player.components.health:DoDelta(health, false, "altar")
        end

        if sanity ~= 0 then
            player.components.sanity:DoDelta(sanity)
        end
    end
end

local function ShowState(inst)
    local anim = "idle"
    local loop = false

    if not inst.state:value() then
        anim = anim..BROKEN
    else
        if inst.components.prototyper.on then
            anim = "proximity_loop"
            loop = true
        else
            anim = anim.."_full"
        end
    end

    inst.AnimState:PushAnimation(anim, loop)
end

local function SetState(inst, state)
    inst.state:set(state)

    if state then
        inst.components.workable:SetWorkLeft(MAXHITS)
        inst.components.prototyper.trees = TUNING.PROTOTYPER_TREES.ANCIENTALTAR_HIGH
        --inst:SetPrefabName("ancient_altar")
    else        
        inst.components.prototyper.trees = TUNING.PROTOTYPER_TREES.ANCIENTALTAR_LOW
        --inst:SetPrefabName("ancient_altar_broken")
    end

    ShowState(inst)
end

local function OnRepaired(inst, doer, repair_item)
    if inst.components.workable.workleft < MAXHITS then
        inst.AnimState:PlayAnimation("hit_broken")
        ShowState(inst)
        inst.SoundEmitter:PlaySound("dontstarve/common/ancienttable_repair")
    elseif inst.components.workable.workleft >= MAXHITS then -- Repaired
        inst.components.workable:SetWorkLeft(MAXHITS) -- don't need to repair more
        local pt = inst:GetPosition()
        TheWorld:PushEvent("ms_sendlightningstrike", pt)
        SpawnPrefab("collapse_big").Transform:SetPosition(pt:Get())

        inst.AnimState:PlayAnimation(inst.state:value() and "hit" or ("hit"..BROKEN))
        inst.SoundEmitter:PlaySound("dontstarve/common/ancienttable_activate")
        SetState(inst, true)
    end

    inst.Light:Enable(true)
    inst.components.lighttweener:StartTween(nil, 3, nil, nil, nil, 0.5) 
end

local function OnHammered(inst, worker)
    inst.components.lootdropper:SetLoot({ "thulecite", "thulecite" })
    inst.components.lootdropper:AddChanceLoot("nightmarefuel", 0.5)
    inst.components.lootdropper:AddChanceLoot("trinket_6", 0.5)
    inst.components.lootdropper:AddChanceLoot("rocks", 0.5)
    inst.components.lootdropper:DropLoot()

    local pt = inst:GetPosition()
    TheWorld:PushEvent("ms_sendlightningstrike", pt)
    DoRandomThing(inst, pt, nil, worker)
    SpawnPrefab("collapse_small").Transform:SetPosition(pt:Get())
    inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
    inst:Remove()
end

local function OnLoadWork(inst, data)
    SetState(inst, inst.components.workable.workleft >= MAXHITS)
    if inst.components.workable.workleft < MAXHITS then
        inst.AnimState:PlayAnimation("idle_broken")
    else
        ShowState(inst)
    end
end

local function OnLoad(inst, data)
    if data == nil then
        return
    end
    inst.state:set((inst.components.workable ~= nil and inst.components.workable.workleft >= MAXHITS) or data.state == true)
    SetState(inst, inst.state:value())
end

local function OnSave(inst, data)
    data.state = inst.state:value()
end

local function OnWorked(inst, worker, workLeft)
    if workLeft < MAXHITS then
        local pos = inst:GetPosition()
        inst.AnimState:PlayAnimation("hit_broken")
        if workLeft == MAXHITS - 1 then
            TheWorld:PushEvent("ms_sendlightningstrike", pos)
        end
        DoRandomThing(inst, pos, nil, worker)
        SetState(inst, false)
    else
        local anim = "hit"
        if not inst.state:value() then
            anim = anim..BROKEN
        end
        inst.AnimState:PlayAnimation(inst.state:value() and "hit" or ("hit"..BROKEN))
    end
end

--[[
Broken / Repaired 
Broken: Shows only low level Ancient
Repaired: Shows high level Ancient
]]

local function turnlightoff(inst, light)
    inst.SoundEmitter:KillSound("idlesound")
    if light ~= nil then
        light:Enable(false)
    end
end

-- light, rad, intensity, falloff, colour, time, callback
local function OnTurnOn(inst)
    inst.components.prototyper.on = true  -- prototyper doesn't set this until after this function is called!!
    ShowState(inst)
    if not inst.SoundEmitter:PlayingSound("idlesound") then
        inst.SoundEmitter:PlaySound("dontstarve/common/ancienttable_LP", "idlesound")
    end
    
    inst.Light:Enable(true)
    inst.components.lighttweener:StartTween(nil, 3, nil, nil, nil, 0.5) 
end

local function OnTurnOff(inst)
    inst.components.prototyper.on = false  -- prototyper doesn't set this until after this function is called
    ShowState(inst)
    inst.components.lighttweener:StartTween(nil, 0, nil, nil, nil, 1, turnlightoff) 
end

local function GetStatus(inst)
    return inst.state:value() and "WORKING" or "BROKEN"
end

local function DisplayNameFn(inst)
    return STRINGS.NAMES[inst.state:value() and "ALTAR" or "ALTAR_BROKEN"]
end

local function DoOnAct(inst, soundprefix)
    if inst._activecount > 1 then
        inst._activecount = inst._activecount - 1
    else
        inst._activecount = 0
        inst.SoundEmitter:KillSound("sound")
    end
    inst.SoundEmitter:PlaySound("dontstarve/common/researchmachine_"..soundprefix.."_ding", "sound")
    if inst.components.workable.workleft < MAXHITS then
        SpawnPrefab("sanity_lower").Transform:SetPosition(inst.Transform:GetWorldPosition())
    end
end

local function CreateAltar(name, state, soundprefix, techtree)
    local function OnActivate(inst)
        if inst.components.workable.workleft < MAXHITS then
            inst.AnimState:PlayAnimation("hit_broken")
            inst.AnimState:PushAnimation("idle_broken")
        else
            inst.AnimState:PlayAnimation("use")
            inst.AnimState:PushAnimation("idle_full")
            inst.AnimState:PushAnimation("proximity_loop", true)
        end
        if not inst.SoundEmitter:PlayingSound("sound") then
            inst.SoundEmitter:PlaySound("dontstarve/common/ancienttable_craft", "sound")
        end
        inst._activecount = inst._activecount + 1
        inst:DoTaskInTime(1.5, DoOnAct, soundprefix)
    end

    local function InitFn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddMiniMapEntity()
        inst.entity:AddSoundEmitter()
        inst.entity:AddLight()
        inst.entity:AddNetwork()

        MakeObstaclePhysics(inst, 0.8, 1.2)

        inst.MiniMapEntity:SetPriority(5)
        inst.MiniMapEntity:SetIcon("tab_crafting_table.png")
        inst.Transform:SetScale(1, 1, 1)

        inst.AnimState:SetBank("crafting_table")
        inst.AnimState:SetBuild("crafting_table")
        inst.AnimState:PlayAnimation("idle")

        inst:AddTag("prototyper")
        inst:AddTag("altar")
        inst:AddTag("structure")
        inst:AddTag("stone")

        inst.state = net_bool(inst.GUID, "state")
        inst.state:set(state)

        inst:SetPrefabName("altar")
        inst.displaynamefn = DisplayNameFn

        inst.Light:Enable(false)
        inst.Light:SetRadius(.6)
        inst.Light:SetFalloff(1)
        inst.Light:SetIntensity(.5)
        inst.Light:SetColour(1, 1, 1)

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst._activecount = 0

        inst.OnSave = OnSave
        inst.OnLoad = OnLoad

        inst:AddComponent("inspectable")
        inst.components.inspectable.getstatus = GetStatus

        inst:AddComponent("prototyper")
        inst.components.prototyper.onturnon = OnTurnOn
        inst.components.prototyper.onturnoff = OnTurnOff
        inst.components.prototyper.trees = techtree
        inst.components.prototyper.onactivate = OnActivate

        inst:AddComponent("repairable")
        inst.components.repairable.repairmaterial = MATERIALS.THULECITE
        inst.components.repairable.onrepaired = OnRepaired

        inst:AddComponent("lootdropper")

        inst:AddComponent("workable")
        inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
        inst.components.workable:SetWorkLeft(MAXHITS)
        inst.components.workable:SetMaxWork(MAXHITS)
        inst.components.workable:SetOnFinishCallback(OnHammered)
        inst.components.workable:SetOnWorkCallback(OnWorked)
        inst.components.workable.savestate = true
        inst.components.workable:SetOnLoadFn(OnLoadWork)

        inst:AddComponent("lighttweener")
        inst.components.lighttweener:StartTween(inst.Light, 1, .9, 0.9, { 255/255, 255/255, 255/255 }, 0, turnlightoff)

        if not state then
            inst.components.workable:SetWorkLeft(2)
        end

        ShowState(inst)

        return inst
    end

    return Prefab("common/objects/"..name, InitFn, assets, prefabs),
        MakePlacer( "common/altar_broken_placer", "altar_broken", "altar_broken", "idle" ) 
end

return CreateAltar("altar", true, 2, TUNING.PROTOTYPER_TREES.ANCIENTALTAR_HIGH),
    CreateAltar("altar_broken", false, 1, TUNING.PROTOTYPER_TREES.ANCIENTALTAR_LOW)

