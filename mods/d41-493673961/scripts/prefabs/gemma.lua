local assets = {
	Asset("ANIM", "anim/gemma.zip"),
	Asset("ANIM", "anim/swap_gemma.zip"),

	Asset("ATLAS", "images/inventoryimages/gemma.xml"),
	Asset("IMAGE", "images/inventoryimages/gemma.tex")
}

local function OnEquip(inst, owner)
	owner.AnimState:OverrideSymbol("swap_object", "swap_gemma", "swap_gemma")
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
	
	inst.AnimState:SetBank("gemma")
	inst.AnimState:SetBuild("gemma")
	inst.AnimState:PlayAnimation("idle")

	inst:AddTag("icebox_valid")
	inst:AddTag("sharp")
	
	inst.entity:SetPristine()
	
	if not TheWorld.ismastersim then
		return inst
	end
	
	inst:AddComponent("tool")
	inst.components.tool:SetAction(ACTIONS.MINE, 1)
		
	inst:AddComponent("equippable")
	inst.components.equippable:SetOnEquip(OnEquip)
	inst.components.equippable:SetOnUnequip(OnUnequip)
	
	inst:AddComponent("inspectable")
	
	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "gemma"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/gemma.xml"

	inst:AddComponent("weapon")
	inst.components.weapon:SetDamage(40)

	return inst
end

return Prefab("common/inventory/gemma", fn, assets)
