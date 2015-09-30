
local assets=
{
	Asset("ANIM", "anim/gear_bug.zip"),
	Asset("IMAGE", "images/inventoryimages/sentinel.tex"),	
}

local prefabs = {"gears",}

SetSharedLootTable( 'sentinel_loot', {{'gears', 0.2},})

local function OnStopFollowing(inst) 
    --inst:RemoveTag("companion") 
end

local function OnStartFollowing(inst) 
    --inst:AddTag("companion") 
end



local function OnDeath(inst)
end



local function fn(Sim)
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
    local physics = inst.entity:AddPhysics()
	local sound = inst.entity:AddSoundEmitter()
	local shadow = inst.entity:AddDynamicShadow()
	inst.entity:AddMiniMapEntity()
	inst.entity:AddNetwork()
	shadow:SetSize( 1.6, .8 )

	local scaleFactor = 0.8
    inst.Transform:SetFourFaced()
    inst.Transform:SetScale(scaleFactor, scaleFactor, scaleFactor)

	MakeCharacterPhysics(inst, 10, .5)
	
    inst:AddTag("character")	
    inst:AddTag("sentinel_loot")
	inst:AddTag("notraptrigger")
    inst:AddTag("gear_sentinel")
	inst:AddTag("scarytoprey")
	--inst:AddTag("companion")
	--inst:AddTag("lightningtarget")
	
    anim:SetBank("spider_spitter")
    anim:SetBuild("gear_bug")
    anim:PlayAnimation("idle")
    
	inst.MiniMapEntity:SetIcon( "sentinel.tex" )
	inst.MiniMapEntity:SetCanUseCache(false)

    inst.entity:SetPristine()	

    if not TheWorld.ismastersim then
        return inst
    end

	
	
    inst:AddComponent("locomotor")
    inst.components.locomotor.walkspeed = 4
    inst.components.locomotor.runspeed = 6.5
	inst.components.locomotor:SetSlowMultiplier( 1 )
	inst.components.locomotor:SetTriggersCreep(true)
    inst.components.locomotor.pathcaps = { ignorecreep = false }

    inst:SetStateGraph("SGsentinel")

	local brain = require "brains/sentinel_brain"
    inst:SetBrain(brain)

    inst:AddComponent("knownlocations")
	inst:AddComponent("inspectable")
	
    inst:AddComponent("combat")		
    inst.components.combat.hiteffectsymbol = "body"
    inst.components.combat:SetDefaultDamage(40)
    inst.components.combat:SetAttackPeriod(1.55)	
	inst.components.combat:SetRange(1.6)
	
    MakeMediumFreezableCharacter(inst, "body")

	inst:AddComponent("health")
    inst.components.health.canmurder = true
    inst.components.health:SetMaxHealth(600)
	inst.components.health.currenthealth = 200
	inst.components.health.canheal = false

    inst:AddComponent("follower")
    inst:ListenForEvent("stopfollowing", OnStopFollowing)
    inst:ListenForEvent("startfollowing", OnStartFollowing)
	inst.components.follower.maxfollowtime = 9999999
    inst.components.follower:AddLoyaltyTime(999999)	
	--GetPlayer().components.leader:AddFollower(inst)

	inst:AddComponent("trader")
	
	inst:AddComponent("talker")
    inst.components.talker.fontsize = 30
	inst.components.talker.colour = Vector3(.99, .55, 0, 0)
    inst.components.talker:StopIgnoringAll()
	
    inst:AddComponent("lootdropper")
    inst.components.lootdropper:SetChanceLootTable('sentinel_loot')
	inst:AddComponent("norecipelootdrop")
	
    inst:ListenForEvent("death", OnDeath)
	
    return inst
end

return Prefab( "forest/animals/sentinel", fn, assets, prefabs) 
