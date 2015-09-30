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
	if ThePlayer.components.inventory:Has("goldnugget", 1) then
		if item.prefab == "goldnugget" then
			return true
		end
	end
		return false
end

local function OnGetItemFromPlayer(inst, giver, item)
	if item.prefab == "goldnugget" then
    giver.components.inventory:ConsumeByName("goldnugget", 1)
	end
	local player = ThePlayer
	player.components.talker:Say("快到碗里（帽子）来! ! ! !", 1, false) 
    SpawnPrefab("book_fx").Transform:SetPosition(player.Transform:GetWorldPosition())
	local pos = Vector3(inst.Transform:GetWorldPosition())
	local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 9)
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
	
	inst.damagefn = function(attacked, data)
	SpawnPrefab("collapse_big").Transform:SetPosition(owner.Transform:GetWorldPosition())
	if data and data.attacker and data.attacker.components.health then
		data.attacker.components.health:DoDelta(-34)
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
    inst.entity:AddNetwork()
    MakeInventoryPhysics(inst)
    
    anim:SetBank("bushhat")
    anim:SetBuild("earhat")
    anim:PlayAnimation("anim")
    
    inst:AddTag("sharp")
	inst:AddTag("hat")
	inst:AddTag("hide")

	if not TheWorld.ismastersim then
        return inst
    end
    
	inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_LARGE)
	
	inst:AddComponent("useableitem")
    inst.components.useableitem:SetOnUseFn(onusehat)
	
    inst:AddComponent("inspectable")
		
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "earhat"
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