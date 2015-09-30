local assets=
{
	Asset("ANIM", "anim/earhat.zip"),
	Asset("IMAGE", "images/inventoryimages/earhat.tex"),
	Asset("ATLAS", "images/inventoryimages/earhat.xml"),
}

local function onusehat(inst)
    local owner = inst.components.inventoryitem.owner
    if owner then
        owner.sg:GoToState("hide")
    end
end

local function stopusinghat(inst, data)
        local hat = inst.components.inventory and inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
        if hat and not (data.statename == "hide_idle" or data.statename == "hide") then
            hat.components.useableitem:StopUsingItem()
        end
end

local function ShouldAcceptItem(inst, item)
	if ThePlayer.components.inventory:Has("goldnugget", 5) then
		if item.prefab == "goldnugget" then
			return true
		end
	end
		return false
end

local function OnGetItemFromPlayer(inst, giver, item)
	if item.prefab == "goldnugget" then
    giver.components.inventory:ConsumeByName("goldnugget", 4)
	end
	local player = ThePlayer
	player.components.talker:Say("Everyone in my hat ! ! ! !", 4, false) 
    SpawnPrefab("book_fx").Transform:SetPosition(player.Transform:GetWorldPosition())
	local pos = Vector3(inst.Transform:GetWorldPosition())
	local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 15)
		for k,v in pairs(ents) do
			if v.components.pickable and v.prefab ~= "flower" then
				v.components.pickable:Pick(ThePlayer)
			end
			if v.components.crop then
				v.components.crop:Harvest(ThePlayer)
			end
		end
end



local function onequiphat(inst, owner)
    owner.AnimState:OverrideSymbol("swap_hat", "earhat", "swap_hat")
    owner.AnimState:Show("HAT")
    owner.AnimState:Show("HAT_HAIR")
    owner.AnimState:Hide("HAIR_NOHAT")
    owner.AnimState:Hide("HAIR")
        
    if owner:HasTag("player") then
        owner.AnimState:Hide("HEAD")
        owner.AnimState:Show("HEAD_HAT")
    end

    owner:AddTag("beefalo")

	inst.damagefn = function(attacked, data)
		local summonchance = 0.5
	    local attacker = data and data.attacker
	    if attacker and attacker.components.health then
	    attacker.components.health:DoDelta(-50)
	    end
	    if math.random() < summonchance then 
	        local pt = attacker:GetPosition()
	        local st_pt =  FindWalkableOffset(pt or owner:GetPosition(), math.random()*2*PI, 2, 3)
	        if st_pt then
	            st_pt = st_pt + pt
	            SpawnPrefab("collapse_big").Transform:SetPosition(owner.Transform:GetWorldPosition())
	            local st1 = SpawnPrefab("icebee")
	            local st2 = SpawnPrefab("icebee")
	            local st3 = SpawnPrefab("icebee")
	            st1.Transform:SetPosition(st_pt:Get())
	            st1.components.combat:SetTarget(attacker)
	            st2.Transform:SetPosition(st_pt:Get())
	            st2.components.combat:SetTarget(attacker)
	        end
	    end
	end
	inst:ListenForEvent("attacked", inst.damagefn, owner)
    inst:ListenForEvent("newstate", stopusinghat, owner) 
end

local function onunequiphat(inst, owner)
    owner.AnimState:Hide("HAT")
    owner.AnimState:Hide("HAT_HAIR")
    owner.AnimState:Show("HAIR_NOHAT")
    owner.AnimState:Show("HAIR")

    owner:RemoveTag("beefalo")
	
    if owner:HasTag("player") then
        owner.AnimState:Show("HEAD")
        owner.AnimState:Hide("HEAD_HAT")
    end
	
	ThePlayer.components.health.absorb = 0
	inst:RemoveEventCallback("attacked", inst.damagefn, owner)
    inst:RemoveEventCallback("newstate", stopusinghat, owner)
end


local function fn(Sim)
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
    local sound = inst.entity:AddSoundEmitter()
    MakeInventoryPhysics(inst)
    
    anim:SetBank("bushhat")
    anim:SetBuild("earhat")
    anim:PlayAnimation("anim")
    
    inst:AddTag("sharp")
	inst:AddTag("hat")
	inst:AddTag("hide")
	inst:AddTag("umbrella")
    
	inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_ABSOLUTE)

    inst:AddComponent("insulator")
    inst.components.insulator:SetInsulation(TUNING.INSULATION_LARGE)

	inst:AddComponent("useableitem")
    inst.components.useableitem:SetOnUseFn(onusehat)
	
    inst:AddComponent("inspectable")
		
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/earhat.xml"
	inst.components.inventoryitem.foleysound = "dontstarve/movement/foley/bushhat"
    
    inst:AddComponent("equippable")
	inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
	inst.components.equippable:SetOnEquip( onequiphat )
    inst.components.equippable:SetOnUnequip( onunequiphat )
	
	inst:AddComponent("trader")
    inst.components.trader.onaccept = OnGetItemFromPlayer
    inst.components.trader:SetAcceptTest(ShouldAcceptItem)
	
    return inst
end

return Prefab( "common/inventory/earhat", fn, assets, prefabs) 