local assets = {
	Asset("ANIM", "anim/sabermeat.zip"),
	Asset("ANIM", "anim/swap_sabermeat.zip"),

	Asset("ATLAS", "images/inventoryimages/sabermeat.xml"),
	Asset("IMAGE", "images/inventoryimages/sabermeat.tex")
}

local function OnEquip(inst, owner)
	owner.AnimState:OverrideSymbol("swap_object", "swap_sabermeat", "swap_sabermeat")
	owner.AnimState:Show("ARM_carry")
	owner.AnimState:Hide("ARM_normal")
end

local function OnUnequip(inst, owner)
	owner.AnimState:Hide("ARM_carry")
	owner.AnimState:Show("ARM_normal")
end

local function fn()
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()
	
	MakeInventoryPhysics(inst)
	
	inst.AnimState:SetBank("sabermeat")
	inst.AnimState:SetBuild("sabermeat")
	inst.AnimState:PlayAnimation("idle")

	inst:AddTag("show_spoilage")
	inst:AddTag("icebox_valid")
	inst:AddTag("sharp")
	
	inst.entity:SetPristine()
	
	if not TheWorld.ismastersim then
		return inst
	end
	
	inst:AddComponent("equippable")
	inst.components.equippable:SetOnEquip(OnEquip)
	inst.components.equippable:SetOnUnequip(OnUnequip)
	
	inst:AddComponent("inspectable")
	
	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "sabermeat"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/sabermeat.xml"

	inst:AddComponent("perishable")
	inst.components.perishable:SetPerishTime(TUNING.PERISH_SLOW)
	inst.components.perishable.onperishreplacement = "boneshard"
	inst.components.perishable:StartPerishing()

	inst:AddComponent("weapon")
	inst.components.weapon:SetDamage(65)

	return inst
end

return Prefab("common/inventory/sabermeat", fn, assets)
