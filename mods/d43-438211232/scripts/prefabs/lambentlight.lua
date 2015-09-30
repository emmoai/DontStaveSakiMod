local assets=
{ 
    Asset("ANIM", "anim/lambentlight.zip"),
    Asset("ANIM", "anim/swap_lambentlight.zip"), 

    Asset("ATLAS", "images/inventoryimages/lambentlight.xml"),
    Asset("IMAGE", "images/inventoryimages/lambentlight.tex"),
}

local prefabs = 
{
}



    local function OnEquip(inst, owner) 
        --owner.AnimState:OverrideSymbol("swap_object", "swap_lambentlights", "purplestaff")
        owner.AnimState:OverrideSymbol("swap_object", "swap_lambentlight", "lambentlight")
        owner.AnimState:Show("ARM_carry") 
        owner.AnimState:Hide("ARM_normal") 
    end

    local function OnUnequip(inst, owner) 
        owner.AnimState:Hide("ARM_carry") 
        owner.AnimState:Show("ARM_normal") 
    end

	
local function fn()
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    local sound = inst.entity:AddSoundEmitter()	
    MakeInventoryPhysics(inst)
 	inst.entity:AddNetwork()
	
    anim:SetBank("lambentlight")
    anim:SetBuild("lambentlight")
    anim:PlayAnimation("idle")
	
 	inst:AddTag("sharp")
	
	inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(40)
	

	
	if not TheWorld.ismastersim then
   return inst
end	

    inst:AddComponent("inspectable")
     
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.keepondeath = true
    inst.components.inventoryitem.imagename = "lambentlight"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/lambentlight.xml"
     
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
    inst.components.equippable.walkspeedmult = 2.0
 	inst.components.inventoryitem.keepondeath = true
	
	if not inst.components.characterspecific then
		inst:AddComponent("characterspecific")
	end
 
	inst.components.characterspecific:SetOwner("asuna")
	inst.components.characterspecific:SetStorable(true)
	inst.components.characterspecific:SetComment("强大的保护.") 
	

    return inst
end

return  Prefab("common/inventory/lambentlight", fn, assets, prefabs)