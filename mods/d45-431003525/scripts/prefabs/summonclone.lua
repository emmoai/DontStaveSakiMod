local brain = require "brains/summonclonebrain"

local assets = {
	Asset("ATLAS", "images/inventoryimages/summonclone.xml")
}

local prefabs = {
	"saberlion"
}

local function ShouldAcceptItem(inst, item)
	local currenthealth = inst.components.health.currenthealth / inst.components.health.maxhealth
	if item.components.edible and currenthealth < 1 and item.components.edible.healthvalue > 0 then
		return true
	end
	if item.components.equippable and 
	(item.components.equippable.equipslot == EQUIPSLOTS.HEAD or 
	item.components.equippable.equipslot == EQUIPSLOTS.HANDS or 
	item.components.equippable.equipslot == EQUIPSLOTS.BODY) and 
	not item.components.projectile then
		if item.prefab == "batbat" then
			print("refusing batbat")
			return false
		end
		return true
	end
end

local function OnGetItemFromPlayer(inst, giver, item)
	if item.components.equippable and 
	(item.components.equippable.equipslot == EQUIPSLOTS.HEAD or 
	item.components.equippable.equipslot == EQUIPSLOTS.HANDS or 
	item.components.equippable.equipslot == EQUIPSLOTS.BODY) then     
		local newslot = item.components.equippable.equipslot
		local current = inst.components.inventory:GetEquippedItem(newslot)
		if current then
			inst.components.inventory:DropItem(current)
		end      
		inst.components.inventory:Equip(item)
	elseif item.components.edible then
		inst.components.health:DoDelta(item.components.edible:GetHunger(inst), nil, item.prefab)
		inst:PushEvent("oneatsomething", {food = item})
		inst.sg:GoToState("eat")
	end
end

local function OnRefuseItem(inst, item)
	inst.sg:GoToState("refuse")
	inst.components.talker:Say("GAO πæ‡‡πæ‡‡ƒ„")
end

local function NormalRetargetFn(inst)
	return FindEntity(inst, TUNING.PIG_TARGET_DIST, function(guy)
		return guy:HasTag("monster") and guy.prefab ~= "webber" 
		and guy.components.health and not guy.components.health:IsDead() 
		and inst.components.combat:CanTarget(guy)
	end)
end

local function linkToBuilder(inst, builder)
	if not builder.components.leader then
		builder:AddComponent("leader")
	end
	builder.components.leader:AddFollower(inst, true)
end

local function OnAttacked(inst, data)
	local attacker = data.attacker
    inst.components.combat:SetTarget(attacker)
    inst.components.combat:ShareTarget(attacker, 30, function(dude)
		return dude:HasTag("summonedbyplayer") and dude.components.follower.leader == inst.components.follower.leader
	end, 5)
end

local function OnAttackOther(inst, data)
	local target = data.target
	inst.components.combat:ShareTarget(target, 30, function(dude)
		return dude:HasTag("summonedbyplayer") and dude.components.follower.leader == inst.components.follower.leader
	end, 5)
end

local function fn()
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddMiniMapEntity()
	inst.entity:AddSoundEmitter()
	inst.entity:AddDynamicShadow()
	inst.entity:AddNetwork()
	
	MakeCharacterPhysics(inst, 30, .3)
	
	inst.DynamicShadow:SetSize(2, 1.5)
	
	inst.Transform:SetFourFaced()
	inst.Transform:SetScale(0.8, 0.8, 0.8)

	inst.AnimState:SetBank("wilson")
	inst.AnimState:SetBuild("saberlion")
	inst.AnimState:PlayAnimation("idle_loop", true)
	inst.AnimState:Hide("ARM_carry")
	inst.AnimState:Show("ARM_normal")
	
    inst.MiniMapEntity:SetIcon("summonclone.tex")
    inst.MiniMapEntity:SetPriority(4)
	
	inst:AddTag("summonclone")
	inst:AddTag("sheltercarrier")
	inst:AddTag("summonedbyplayer")
	inst:AddTag("scarytoprey")
	
	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end
	
	MakeMediumBurnableCharacter(inst, "pig_torso")
	
	inst:AddComponent("clonecracker")
	
	inst:AddComponent("combat")
	inst.components.combat:SetDefaultDamage(TUNING.UNARMED_DAMAGE)
	inst.components.combat:SetAttackPeriod(2)
	inst.components.combat:SetRetargetFunction(3, NormalRetargetFn)
	
	inst:AddComponent("follower")
	
	inst:AddComponent("followersitcommand")
	
	inst:AddComponent("health")
	inst.components.health:SetMaxHealth(350)
	inst.components.health:StartRegen(1, 1)
	
	inst:AddComponent("inspectable")
	
	inst:AddComponent("inventory")
	
	inst:AddComponent("locomotor")
	inst.components.locomotor.runspeed = 8
	inst.components.locomotor.walkspeed = 9
	
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("talker")
	inst.components.talker:StopIgnoringAll()
	
	inst:AddComponent("trader")
	inst.components.trader:SetAcceptTest(ShouldAcceptItem)
	inst.components.trader.deleteitemonaccept = false
	inst.components.trader.onaccept = OnGetItemFromPlayer
	inst.components.trader.onrefuse = OnRefuseItem
	inst.components.trader:Enable()

	inst:SetBrain(brain)
	inst:SetStateGraph("SGsummonclone")

	inst:WatchWorldState("startnight", function()  
		inst.components.health:DoDelta(-20)  
	end)

	inst.OnBuilt = linkToBuilder
	
	inst:ListenForEvent("attacked", OnAttacked)  
	inst:ListenForEvent("onattackother", OnAttackOther)

	return inst
end

return Prefab("common/summonclone", fn, assets, prefabs)
