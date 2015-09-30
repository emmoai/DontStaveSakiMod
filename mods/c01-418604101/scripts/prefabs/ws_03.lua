
local assets=
{
	Asset("ANIM", "anim/ws_03.zip"),
	Asset("IMAGE", "images/inventoryimages/ws_03.tex"),	
}

local prefabs = {"gears","sentinel",}

SetSharedLootTable( 'ws_03_loot', {
	--{'sentinel', 1},{'sentinel', 1},{'sentinel', 1},{'sentinel', 1},{'sentinel', 1},
	{'gears', 1},{'gears',1},{'gears', 1},{'gears', 0.5},
})

local function OnStopFollowing(inst) 
    --inst:RemoveTag("companion") 
end

local function OnStartFollowing(inst) 
    --inst:AddTag("companion") 
end


local function OnDeath(inst)
	if inst.components.lootdropper then
		local master = inst.components.follower and inst.components.follower.leader
		--p(inst.components.follower)
		--p(inst.components.follower.leader)
		local children = master and {[master]=5+math.floor(math.random()+0.5)}or{}
		for i,v in ipairs(AllPlayers) do
			if v~=master and inst:GetDistanceSqToInst(v) < 25*25
				and v:IsValid() and v.entity:IsVisible() and v.components.health and v.components.health.currenthealth > 0
				and not v:HasTag("playerghost")
			then
				children[v]=1+math.floor(math.random()*3+0.5)
			end
		end
		--arr(children)
		for k,v in pairs(children) do
			for i=1,v do
				local loot = inst.components.lootdropper:SpawnLootPrefab("sentinel")
				if loot then
					loot.components.follower:SetLeader(k)
				end
			end
		end
	end
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
	shadow:SetSize( 1.8, 2 )

	local scaleFactor = 0.8
    inst.Transform:SetFourFaced()
    inst.Transform:SetScale(scaleFactor, scaleFactor, scaleFactor)

	MakeCharacterPhysics(inst, 600, 1)
	
    inst:AddTag("character")	
    inst:AddTag("ws_03_loot")
	inst:AddTag("notraptrigger")
    inst:AddTag("gear_sentinel")
	inst:AddTag("scarytoprey")
	--inst:AddTag("companion")
	inst:AddTag("lightningrod")
	
    anim:SetBank("spider_queen")
    anim:SetBuild("ws_03")
    anim:PlayAnimation("idle")

	inst.MiniMapEntity:SetIcon( "ws_03.tex" )
	inst.MiniMapEntity:SetCanUseCache(false)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	
    inst:AddComponent("locomotor")
    inst.components.locomotor.walkspeed = 3.8
    inst.components.locomotor.runspeed = 5.4
	inst.components.locomotor:SetSlowMultiplier( 1 )
	inst.components.locomotor:SetTriggersCreep(true)
    inst.components.locomotor.pathcaps = { ignorecreep = false }

    inst:SetStateGraph("SG_ws_03")

	local brain = require "brains/ws_03_brain"
    inst:SetBrain(brain)

    inst:AddComponent("knownlocations")
	inst:AddComponent("inspectable")
	
    inst:AddComponent("combat")		
    inst.components.combat.hiteffectsymbol = "body"
    inst.components.combat:SetDefaultDamage(120)
    inst.components.combat:SetAttackPeriod(1)	
	inst.components.combat:SetRange(2)
	
    MakeLargeFreezableCharacter(inst, "body")

	inst:AddComponent("health")
    inst.components.health.canmurder = true
    inst.components.health:SetMaxHealth(2400)
	inst.components.health.currenthealth = 1600
	inst.components.health.canheal = false
	
	
    inst:AddComponent("follower")
    inst:ListenForEvent("stopfollowing", OnStopFollowing)
    inst:ListenForEvent("startfollowing", OnStartFollowing)
	inst.components.follower.maxfollowtime = 9999999
    inst.components.follower:AddLoyaltyTime(999999)	
	--GetPlayer().components.leader:AddFollower(inst)
	
    inst:AddComponent("periodicspawner")
    inst.components.periodicspawner:SetPrefab("gears")
    inst.components.periodicspawner:SetRandomTimes(540,550)
    inst.components.periodicspawner:SetDensityInRange(20, 2)
    inst.components.periodicspawner:SetMinimumSpacing(15)
    inst.components.periodicspawner:Start()

	inst:AddComponent("trader")
	
	inst:AddComponent("talker")
    inst.components.talker.fontsize = 35
	inst.components.talker.colour = Vector3(.99, .55, 0, 0)
    inst.components.talker:StopIgnoringAll()
	
    inst:AddComponent("lootdropper")
    inst.components.lootdropper:SetChanceLootTable('ws_03_loot')
	inst:AddComponent("norecipelootdrop")
	
    inst:ListenForEvent("death", OnDeath)

    return inst
end

return Prefab( "forest/animals/ws_03", fn, assets, prefabs) 
