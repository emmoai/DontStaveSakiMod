    local assets =
{
	Asset("ANIM", "anim/rock_light.zip"),
}

local prefabs =
{
    "nightmarelightfx",
}

local function ReturnChildren(inst)
    for k,child in pairs(inst.components.childspawner.childrenoutside) do
        if child.components.combat then
            child.components.combat:SetTarget(nil)
        end

        if child.components.lootdropper then
            child.components.lootdropper:SetLoot({})
			child.components.lootdropper:SetChanceLootTable(nil)
        end

        if child.components.health then
            child.components.health:Kill()
        end
    end
end

local function turnoff(inst, light)
    if light then
        light:Enable(false)
    end
end

local function spawnfx(inst)
    if not inst.fx then
        inst.fx = SpawnPrefab("nightmarelightfx")
        local pt = inst:GetPosition()
        inst.fx.Transform:SetPosition(pt.x, -0.1, pt.z)
    end
end


local states =
{
    calm = function(inst, instant)

        inst.SoundEmitter:KillSound("warnLP")
        inst.SoundEmitter:KillSound("nightmareLP")

        inst.Light:Enable(true)

        inst.components.lighttweener:StartTween(nil, 0, nil, nil, nil, (instant and 0) or 1, turnoff) 
        
        if not instant then
            inst.AnimState:PushAnimation("close_2") 
            inst.AnimState:PushAnimation("idle_closed")

            inst.fx.AnimState:PushAnimation("close_2") 
            inst.fx.AnimState:PushAnimation("idle_closed")
            inst.SoundEmitter:PlaySound("dontstarve/cave/nightmare_spawner_close")
        else
            inst.AnimState:PlayAnimation("idle_closed")
            inst.fx.AnimState:PlayAnimation("idle_closed")            
        end

        if inst.components.childspawner then
            inst.components.childspawner:StopSpawning()
            inst.components.childspawner:StartRegen()
            ReturnChildren(inst)
        end        
    end,
	
    day = function(inst, instant)

        inst.SoundEmitter:KillSound("warnLP")
        inst.SoundEmitter:KillSound("nightmareLP")

        inst.Light:Enable(true)

        inst.components.lighttweener:StartTween(nil, 0, nil, nil, nil, (instant and 0) or 1, turnoff) 
        
        if not instant then
            inst.AnimState:PushAnimation("close_2") 
            inst.AnimState:PushAnimation("idle_closed")

            inst.fx.AnimState:PushAnimation("close_2") 
            inst.fx.AnimState:PushAnimation("idle_closed")
            inst.SoundEmitter:PlaySound("dontstarve/cave/nightmare_spawner_close")
        else
            inst.AnimState:PlayAnimation("idle_closed")
            inst.fx.AnimState:PlayAnimation("idle_closed")            
        end

        if inst.components.childspawner then
            inst.components.childspawner:StopSpawning()
            inst.components.childspawner:StartRegen()
            ReturnChildren(inst)
        end        
    end,
	
    dusk = function(inst, instant)

        inst.Light:Enable(true)

        inst.components.lighttweener:StartTween(nil, 3, nil, nil, nil, (instant and 0) or  0.5)

        inst.AnimState:PlayAnimation("open_1") 
        inst.fx.AnimState:PlayAnimation("open_1")
        inst.SoundEmitter:PlaySound("dontstarve/cave/nightmare_spawner_open_warning")
        inst.SoundEmitter:PlaySound("dontstarve/cave/nightmare_spawner_warning_LP", "warnLP")
    end,

    warn = function(inst, instant)

        inst.Light:Enable(true)

        inst.components.lighttweener:StartTween(nil, 3, nil, nil, nil, (instant and 0) or  0.5)

        inst.AnimState:PlayAnimation("open_1") 
        inst.fx.AnimState:PlayAnimation("open_1")
        inst.SoundEmitter:PlaySound("dontstarve/cave/nightmare_spawner_open_warning")
        inst.SoundEmitter:PlaySound("dontstarve/cave/nightmare_spawner_warning_LP", "warnLP")
    end,
	
    night = function(inst, instant)

        inst.SoundEmitter:KillSound("warnLP")
        inst.SoundEmitter:PlaySound("dontstarve/cave/nightmare_spawner_open_LP", "nightmareLP")

        inst.Light:Enable(true)

        inst.components.lighttweener:StartTween(nil, 6, nil, nil, nil, (instant and 0) or 0.5)
        if not instant then
            inst.AnimState:PlayAnimation("open_2")
            inst.AnimState:PushAnimation("idle_open")

            inst.fx.AnimState:PlayAnimation("open_2")
            inst.fx.AnimState:PushAnimation("idle_open")
            inst.SoundEmitter:PlaySound("dontstarve/cave/nightmare_spawner_open")
        else
            inst.AnimState:PlayAnimation("idle_open")

            inst.fx.AnimState:PlayAnimation("idle_open")
        end

        if inst.components.childspawner then
            inst.components.childspawner:StartSpawning()
            inst.components.childspawner:StopRegen()
        end 
    end,

    nightmare = function(inst, instant)

        inst.SoundEmitter:KillSound("warnLP")
        inst.SoundEmitter:PlaySound("dontstarve/cave/nightmare_spawner_open_LP", "nightmareLP")

        inst.Light:Enable(true)

        inst.components.lighttweener:StartTween(nil, 6, nil, nil, nil, (instant and 0) or 0.5)
        if not instant then
            inst.AnimState:PlayAnimation("open_2")
            inst.AnimState:PushAnimation("idle_open")

            inst.fx.AnimState:PlayAnimation("open_2")
            inst.fx.AnimState:PushAnimation("idle_open")
            inst.SoundEmitter:PlaySound("dontstarve/cave/nightmare_spawner_open")
        else
            inst.AnimState:PlayAnimation("idle_open")

            inst.fx.AnimState:PlayAnimation("idle_open")
        end

        if inst.components.childspawner then
            inst.components.childspawner:StartSpawning()
            inst.components.childspawner:StopRegen()
        end 
    end,


    dawn = function(inst, instant)

        inst.SoundEmitter:KillSound("nightmareLP")
        inst.Light:Enable(true)
        inst.components.lighttweener:StartTween(nil, 3, nil, nil, nil, (instant and 0) or 0.5)
        inst.SoundEmitter:PlaySound("dontstarve/cave/nightmare_spawner_close")
        inst.SoundEmitter:KillSound("nightmareLP")
        inst.SoundEmitter:PlaySound("dontstarve/cave/nightmare_spawner_open_LP", "nightmareLP")

        inst.AnimState:PlayAnimation("close_1")
        inst.fx.AnimState:PlayAnimation("close_1")
       
        inst.SoundEmitter:PlaySound("dontstarve/cave/nightmare_spawner_open")

        if inst.components.childspawner then
            inst.components.childspawner:StartSpawning()
            inst.components.childspawner:StopRegen()
        end 
    end
}


local function onsave(inst, data)
    if inst.rockstate then
        data.rockstate = inst.rockstate
    end
end

local function onload(inst, data)
    if not data then
        return
    end
    if data.rockstate then
        inst.rockstate = data.rockstate        
        spawnfx(inst)
        states[inst.rockstate](inst, true)
    end
end

local function getsanityaura(inst)
    if inst.rockstate == "calm" or inst.rockstate == "day" then
        return 0
    elseif inst.rockstate == "warn" or inst.rockstate == "dusk" then
        return -TUNING.SANITY_SMALL
    else
        return -TUNING.SANITY_MED
    end
end

local function changestate(inst, data)
    local statefn = states[data.newphase or data]

    if statefn then
        spawnfx(inst)
        inst.rockstate = data.newphase or data
        inst:DoTaskInTime(math.random() * 2, statefn)
    end
end

local function fn()

	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()
    
    local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon( "nightmarelight.png" )

    inst.rockstate = "calm"

    anim:SetBuild("rock_light")
    anim:SetBank("rock_light")
    anim:PlayAnimation("idle_closed",false)
  
    MakeObstaclePhysics(inst, 1) 
	
	local light = inst.entity:AddLight()
	
    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("sanityaura")
    inst.components.sanityaura.aurafn = getsanityaura

    inst:AddComponent( "childspawner" )
    inst.components.childspawner:SetRegenPeriod(5)
    inst.components.childspawner:SetSpawnPeriod(30)
    inst.components.childspawner:SetMaxChildren(math.random(1,2))
    inst.components.childspawner.childname = "crawlingnightmare"
    inst.components.childspawner:SetRareChild("nightmarebeak", 0.35)

    inst:AddComponent("inspectable")

    inst:AddComponent("lighttweener")
    
    inst.components.lighttweener:StartTween(light, 1, .9, 0.9, {255/255,255/255,255/255}, 0, turnoff)

	if TheWorld._iscave then
		inst:ListenForEvent("phasechange", function(world, data) changestate(inst, data) end, TheWorld)
	else 
		inst:WatchWorldState("startday", function() changestate(inst, "day") end)
		inst:WatchWorldState("startdusk", function() changestate(inst, "dusk") end)
		inst:WatchWorldState("startnight", function() changestate(inst, "night") end)
	end

    inst.OnSave = onsave
    inst.OnLoad = onload

    return inst
end

return Prefab( "common/objects/nightmarelight", fn, assets, prefabs)

