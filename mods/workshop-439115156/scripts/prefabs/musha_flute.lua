local assets=
{
	Asset("ANIM", "anim/musha_flute.zip"),
	Asset("ATLAS", "images/inventoryimages/musha_flute.xml"),
	Asset("IMAGE", "images/inventoryimages/musha_flute.tex"),
}

local function onfinished(inst)
    inst:Remove()
end

local function Hearmusha(inst, musician, instrument, data)
local user = musician
	if inst.components.health then
	user.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
   	SpawnPrefab("sparks").Transform:SetPosition(user:GetPosition():Get())	
	user.SoundEmitter:PlaySound("dontstarve/common/onemanband") inst.AnimState:SetBloomEffectHandle( "" )
	user.components.health:DoDelta(4) 
	end
	
	if inst.components.health and inst:HasTag("player") then
	inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
   	SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())	
	inst.SoundEmitter:PlaySound("dontstarve/common/onemanband") inst.AnimState:SetBloomEffectHandle( "" )
	inst.components.health:DoDelta(20) 

	elseif inst.components.health and inst:HasTag("yamche") then
 	inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
   	SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())	
	inst.SoundEmitter:PlaySound("dontstarve/common/onemanband") inst.AnimState:SetBloomEffectHandle( "" )
	inst.components.health:DoDelta(300) 
	
	--[[if inst.components.health then
	user.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
	user.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
    	SpawnPrefab("sparks").Transform:SetPosition(user:GetPosition():Get())
	scheduler:ExecuteInTime(2.5, function() SpawnPrefab("sparkle").Transform:SetPosition(user:GetPosition():Get())
	user.SoundEmitter:PlaySound("dontstarve/common/onemanband") inst.AnimState:SetBloomEffectHandle( "" ) user.components.health:DoDelta(5) end)
	end
	
	if inst.components.health and inst:HasTag("player") then
		inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
 	SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
	SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
	scheduler:ExecuteInTime(2.5, function() SpawnPrefab("sparkle").Transform:SetPosition(inst:GetPosition():Get()) inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband")   inst.components.health:DoDelta(20) end)

	elseif inst.components.health and inst:HasTag("yamche") then
 	SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
	scheduler:ExecuteInTime(2.5, function() SpawnPrefab("sparkle").Transform:SetPosition(inst:GetPosition():Get())
	inst.components.health:DoDelta(300) end)]]
	end
 end



local function fn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
 MakeInventoryPhysics(inst) 
 	
    inst.AnimState:SetBank("pan_flute")
    inst.AnimState:SetBuild("musha_flute")
	inst.AnimState:PlayAnimation("idle")
	inst:AddTag("flute")
  	inst:AddTag("musha_flute")
	   inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "musha_flute.tex" )

  inst.entity:SetPristine()
	   if not TheWorld.ismastersim then
        return inst
    end
		
    inst:AddComponent("inspectable")
    inst:AddComponent("instrument")
    inst.components.instrument.range = TUNING.PANFLUTE_SLEEPRANGE
    inst.components.instrument:SetOnHeardFn(Hearmusha)
    
    inst:AddComponent("tool")
    inst.components.tool:SetAction(ACTIONS.PLAY)

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(50)
    inst.components.finiteuses:SetUses(50)
    inst.components.finiteuses:SetOnFinished( onfinished)
    inst.components.finiteuses:SetConsumption(ACTIONS.PLAY, 1)

    inst:AddComponent("inventoryitem")
    	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_flute.xml"
  
MakeHauntableLaunch(inst)
    AddHauntableCustomReaction(inst, function(inst, haunter)
        if math.random() <= TUNING.HAUNT_CHANCE_HALF then
            if inst.components.finiteuses then
                inst.components.finiteuses:Use(1)
                inst.components.hauntable.hauntvalue = TUNING.HAUNT_MEDIUM
                return true
            end
        end
        return false
    end, true, false, true)

    return inst
end

return Prefab( "common/inventory/musha_flute", fn, assets) 
