local assets=
{
    Asset("ANIM", "anim/wilsondoll.zip"),
    Asset("ANIM", "anim/swap_wilsondoll.zip"),
  
    Asset("ATLAS", "images/inventoryimages/wilsondoll.xml"),
    Asset("IMAGE", "images/inventoryimages/wilsondoll.tex"),
}
local function OnEquip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_wilsondoll", "swap_wilsondoll")
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
      
    inst.AnimState:SetBank("wilsondoll")
    inst.AnimState:SetBuild("wilsondoll")
    inst.AnimState:PlayAnimation("idle")
	
    inst.MiniMapEntity:SetIcon("wilsondoll.tex")
 
    inst:AddTag("sharp")
 
    if not TheWorld.ismastersim then
        return inst
    end
 
    inst.entity:SetPristine()
     
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(35)
  
    inst:AddComponent("inspectable")
      
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "wilsondoll"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/wilsondoll.xml"
      
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
     
    return inst
end
return  Prefab("common/inventory/wilsondoll", fn, assets) 