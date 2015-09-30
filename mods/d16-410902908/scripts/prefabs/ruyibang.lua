local assets=
{
    Asset("ANIM", "anim/ruyibang.zip"),
    Asset("ANIM", "anim/swap_ruyibang.zip"),
 
    Asset("ATLAS", "images/inventoryimages/ruyibang.xml"),
    Asset("IMAGE", "images/inventoryimages/ruyibang.tex"),
}
prefabs = {
}
local function fn()
 
    local function OnEquip(inst, owner)
        owner.AnimState:OverrideSymbol("swap_object", "swap_ruyibang", "swap_ruyibang")
        owner.AnimState:Show("ARM_carry")
        owner.AnimState:Hide("ARM_normal")
    end
 
    local function OnUnequip(inst, owner)
        owner.AnimState:Hide("ARM_carry")
        owner.AnimState:Show("ARM_normal")
    end
 
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    local sound = inst.entity:AddSoundEmitter()
    MakeInventoryPhysics(inst)
	inst.entity:AddNetwork() 
     
    anim:SetBank("ruyibang")
    anim:SetBuild("ruyibang")
    anim:PlayAnimation("idle")
	
	inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(30)
	inst.components.weapon:SetRange(3, 4)
	
	if not TheWorld.ismastersim then
   return inst
end
 
    inst:AddComponent("inspectable")
     
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.keepondeath = true
    inst.components.inventoryitem.imagename = "ruyibang"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/ruyibang.xml"
     
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
 	inst.components.inventoryitem.keepondeath = true
	
	if not inst.components.characterspecific then
		inst:AddComponent("characterspecific")
	end
 
	inst.components.characterspecific:SetOwner("wukong")
	inst.components.characterspecific:SetStorable(true)
	inst.components.characterspecific:SetComment("It's heavier than it looks.") 
	
    return inst
end
return  Prefab("common/inventory/ruyibang", fn, assets, prefabs)