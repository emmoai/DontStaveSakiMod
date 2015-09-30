local assets=
{
    Asset("ANIM", "anim/wickerdoll.zip"),
    Asset("ANIM", "anim/swap_wickerdoll.zip"),
  
    Asset("ATLAS", "images/inventoryimages/wickerdoll.xml"),
    Asset("IMAGE", "images/inventoryimages/wickerdoll.tex"),
}
local function OnEquip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_wickerdoll", "swap_wickerdoll")
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
	inst.entity:AddMiniMapEntity()
     
    MakeInventoryPhysics(inst)   
      
    inst.AnimState:SetBank("wickerdoll")
    inst.AnimState:SetBuild("wickerdoll")
    inst.AnimState:PlayAnimation("idle")
	
    inst.MiniMapEntity:SetIcon("wickerdoll.tex")
 
    inst:AddTag("sharp")
 
    if not TheWorld.ismastersim then
        return inst
    end
 
    inst.entity:SetPristine()
     
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(40)
  
    inst:AddComponent("inspectable")
      
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "wickerdoll"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/wickerdoll.xml"
	
	inst:AddComponent("perishable")
	inst.components.perishable:SetPerishTime(TUNING.PERISH_PRESERVED * 2)
	inst.components.perishable:StartPerishing()
	inst.components.perishable.onperishreplacement = "papyrus"
      
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
     
    return inst
end
return  Prefab("common/inventory/wickerdoll", fn, assets) 