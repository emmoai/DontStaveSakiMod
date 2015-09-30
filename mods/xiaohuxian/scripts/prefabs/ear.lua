local MakePlayerCharacter = require "prefabs/player_common"

local assets = {

        Asset( "ANIM", "anim/player_basic.zip" ),
        Asset( "ANIM", "anim/player_idles_shiver.zip" ),
        Asset( "ANIM", "anim/player_actions.zip" ),
        Asset( "ANIM", "anim/player_actions_axe.zip" ),
        Asset( "ANIM", "anim/player_actions_pickaxe.zip" ),
        Asset( "ANIM", "anim/player_actions_shovel.zip" ),
        Asset( "ANIM", "anim/player_actions_blowdart.zip" ),
        Asset( "ANIM", "anim/player_actions_eat.zip" ),
        Asset( "ANIM", "anim/player_actions_item.zip" ),
        Asset( "ANIM", "anim/player_actions_uniqueitem.zip" ),
        Asset( "ANIM", "anim/player_actions_bugnet.zip" ),
        Asset( "ANIM", "anim/player_actions_fishing.zip" ),
        Asset( "ANIM", "anim/player_actions_boomerang.zip" ),
        Asset( "ANIM", "anim/player_bush_hat.zip" ),
        Asset( "ANIM", "anim/player_attacks.zip" ),
        Asset( "ANIM", "anim/player_idles.zip" ),
        Asset( "ANIM", "anim/player_rebirth.zip" ),
        Asset( "ANIM", "anim/player_jump.zip" ),
        Asset( "ANIM", "anim/player_amulet_resurrect.zip" ),
        Asset( "ANIM", "anim/player_teleport.zip" ),
        Asset( "ANIM", "anim/wilson_fx.zip" ),
        Asset( "ANIM", "anim/player_one_man_band.zip" ),
        Asset( "ANIM", "anim/shadow_hands.zip" ),
        Asset( "SOUND", "sound/sfx.fsb" ),
        Asset( "SOUND", "sound/wilson.fsb" ),
        Asset( "ANIM", "anim/beard.zip" ),

        Asset( "ANIM", "anim/ear.zip" ),
        Asset( "ANIM", "anim/ghost_ear_build.zip" ),
}
local prefabs = {}
-- Custom starting items
local start_inv = 
{
    --"eardress",
    "earpop",
    --"earhat",
}


local function applyupgrades(inst)

    local max_upgrades = 30
    local upgrades = math.min(inst.level, max_upgrades)

    local hunger_percent = inst.components.hunger:GetPercent()
    local health_percent = inst.components.health:GetPercent()
    local sanity_percent = inst.components.sanity:GetPercent()

    inst.components.hunger.max = math.ceil (150 + upgrades * 5)
    inst.components.sanity.max = math.ceil (100 + upgrades * 10)
    inst.components.health.maxhealth = math.ceil (100 + upgrades * 10)
    inst.components.talker:Say(" - -b  Level Up! : ".. (inst.level))
    
    if inst.level >19 then
        inst.components.talker:Say("OTL Level : Max!")
    end

    inst.components.hunger:SetPercent(hunger_percent)
    inst.components.health:SetPercent(health_percent)
    inst.components.sanity:SetPercent(sanity_percent)
end

local function oneat(inst, food)
    local summonchance1 = 0.3  
    local summonchance2 = 0.3
    if math.random() < summonchance1 and food and food.components.edible.foodtype == "MEAT" then
        inst.level = inst.level + 1
        applyupgrades(inst) 
        inst.components.sanity:DoDelta(inst.components.sanity.max*0.5)
        inst.components.health:DoDelta(inst.components.health.maxhealth*0.5)
        inst.SoundEmitter:PlaySound("dontstarve/characters/wx78/levelup")
        inst.HUD.controls.status.heart:PulseGreen()
        inst.HUD.controls.status.stomach:PulseGreen()
        inst.HUD.controls.status.brain:PulseGreen()
        
        inst.HUD.controls.status.brain:ScaleTo(1.3,1,.7)
        inst.HUD.controls.status.heart:ScaleTo(1.3,1,.7)
        inst.HUD.controls.status.stomach:ScaleTo(1.3,1,.7)
    end
    
    if math.random() < summonchance2 and food then
        inst.components.sanity:DoDelta(inst.components.sanity.max)
        inst.components.health:DoDelta(inst.components.health.maxhealth)
        inst.components.talker:Say("WoW Power! I'm so lucky !")
    end
end

local function updatestats(inst)
    if TheWorld.state.isday then
        --inst.components.hunger:DoDelta(-inst.components.hunger.max*0.33)
        --inst.components.sanity:DoDelta(-inst.components.sanity.max*0.15)
        inst.components.combat.damagemultiplier = 1
        inst.components.locomotor.walkspeed = TUNING.WILSON_WALK_SPEED*1.5
        inst.components.locomotor.runspeed = TUNING.WILSON_RUN_SPEED*1.5
    elseif TheWorld.state.isdusk then
        inst.components.combat.damagemultiplier = 1.25
        inst.components.locomotor.walkspeed = TUNING.WILSON_WALK_SPEED*1.25
        inst.components.locomotor.runspeed = TUNING.WILSON_RUN_SPEED*1.25
    elseif TheWorld.state.isnight then
        inst.components.combat.damagemultiplier = 1.5
        inst.components.locomotor.walkspeed = TUNING.WILSON_WALK_SPEED*1
        inst.components.locomotor.runspeed = TUNING.WILSON_RUN_SPEED*1
    end
end

local function onpreload(inst, data)
    if data then
        if data.level then
            inst.level = data.level
            applyupgrades(inst)
            --re-set these from the save data, because of load-order clipping issues
            if data.health and data.health.health then inst.components.health.currenthealth = data.health.health end
            if data.hunger and data.hunger.hunger then inst.components.hunger.current = data.hunger.hunger end
            if data.sanity and data.sanity.current then inst.components.sanity.current = data.sanity.current end
            inst.components.health:DoDelta(0)
            inst.components.hunger:DoDelta(0)
            inst.components.sanity:DoDelta(0)
        end
    end
end

local function onsave(inst, data)
    data.level = inst.level
end
local function emote(inst, data)
    if data.anim[1] == "emoteXL_waving4" then
        for k, v in pairs(inst.components.leader.followers) do
            local fx = SpawnPrefab("emote_fx")
            fx.Transform:SetPosition(k:GetPosition():Get())
        
            inst.components.leader:RemoveFollower(k)
            k.components.combat:DropTarget(false)
        end
        
        return
    end

    local limit = 300
    for k, v in pairs(inst.components.leader.followers) do
        if k.components.combat then
            limit = limit - k.components.combat.defaultdamage
        end
    end
    
    if data.anim[1] == "emoteXL_waving1" and limit >= 0 then
        local target = FindEntity(inst, 15, function(guy)
            if guy.components.combat and guy.components.follower and guy.components.follower.leader == nil then
                return true
            else
                return false
            end
        end)
        
        if target ~= nil and target:IsValid() and not target:IsInLimbo() and target.components.health and not target.components.health:IsDead() then
            local fx = SpawnPrefab("emote_fx")
            fx.Transform:SetPosition(target:GetPosition():Get())
            
            inst.components.leader:AddFollower(target)
            target.components.combat:DropTarget(false)
            
            for k, v in pairs(inst.components.leader.followers) do
                if k.components.combat and k.components.combat:TargetIs(target) then
                    k.components.combat:DropTarget(false)
                end
            end
        end
    end
end

local function charming(inst)
    local x, y, z = inst.Transform:GetWorldPosition()
    local ents = TheSim:FindEntities(x, y, z, 30, {}, {"player",})
    
    local attackers = {}
    for k, v in pairs(ents) do
        if v.components.combat and v.components.combat:TargetIs(inst) then
            attackers[k] = v
        end
    end
    
    for k, v in pairs(inst.components.leader.followers) do
        for k2, v2 in pairs(attackers) do
            k.components.combat:SuggestTarget(v2)
        end
    end
end

-- This initializes for both the server and client. Tags can be added here.
local common_postinit = function(inst) 
    -- Minimap icon
    inst.MiniMapEntity:SetIcon( "ear.tex" )
end

-- This initializes for the server only. Components are added here.
local master_postinit = function(inst)
    -- choose which sounds this character will play
    inst.soundsname = "willow"
    
    -- Uncomment if "wathgrithr"(Wigfrid) or "webber" voice is used
    --inst.talker_path_override = "dontstarve_DLC001/characters/"
        
    inst.level = 0
    inst.components.eater:SetOnEatFn(oneat)
    applyupgrades(inst) 
    -- Stats
    inst.components.hunger:SetMax(150)
    inst.components.sanity:SetMax(100)
    inst.components.health:SetMaxHealth(100)
    --speed
    inst.components.locomotor.walkspeed = TUNING.WILSON_WALK_SPEED
    inst.components.locomotor.runspeed = TUNING.WILSON_RUN_SPEED
    --damage
    inst.components.combat.damagemultiplier = 1.1
	inst:ListenForEvent("emote", emote)
    inst.updatetask = inst:DoPeriodicTask(0.5, charming, 0.5)

    inst.components.sanity.night_drain_mult = 1.2
    inst.components.sanity.neg_aura_mult = 1.2
    inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE)

    inst.OnSave = onsave
    inst.OnPreLoad = onpreload
    
    --inst:ListenForEvent( "dusktime", function() updatestats(inst) end , GetWorld())
    --inst:ListenForEvent( "daytime", function() updatestats(inst) end , GetWorld())
    --inst:ListenForEvent( "nighttime", function() updatestats(inst) end , GetWorld())
    inst:ListenForEvent("phasechanged",function() updatestats(inst) end,TheWorld)
    updatestats(inst)

    --book
    inst:AddTag("bookbuilder")
    inst:AddComponent("reader")

    TheInput:AddKeyUpHandler(KEY_F11, function()
        inst.components.talker:Say(" - -b  Level Up! : ".. (inst.level))
    end)
end

return MakePlayerCharacter("ear", prefabs, assets, common_postinit, master_postinit, start_inv)