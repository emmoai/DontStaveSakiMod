local assets=
{
    Asset("ANIM", "anim/waxwelldoll.zip"),
    Asset("ANIM", "anim/swap_waxwelldoll.zip"),
  
    Asset("ATLAS", "images/inventoryimages/waxwelldoll.xml"),
    Asset("IMAGE", "images/inventoryimages/waxwelldoll.tex"),
}
local function OnEquip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_waxwelldoll", "swap_waxwelldoll")
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
      
    inst.AnimState:SetBank("waxwelldoll")
    inst.AnimState:SetBuild("waxwelldoll")
    inst.AnimState:PlayAnimation("idle")
	
    inst.MiniMapEntity:SetIcon("waxwelldoll.tex")
 
    inst:AddTag("sharp")
 
    if not TheWorld.ismastersim then
        return inst
    end
 
    inst.entity:SetPristine()
     
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(40)
  
    inst:AddComponent("inspectable")
      
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "waxwelldoll"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/waxwelldoll.xml"
	
	inst:AddComponent("perishable")
	inst.components.perishable:SetPerishTime(TUNING.PERISH_PRESERVED * 2)
	inst.components.perishable:StartPerishing()
	inst.components.perishable.onperishreplacement = "nightmarefuel"
	
	inst:AddComponent("periodicspawner")
    inst.components.periodicspawner:SetPrefab("nightmarefuel")
    inst.components.periodicspawner:SetRandomTimes(2, TUNING.PERISH_FAST)
    inst.components.periodicspawner:SetDensityInRange(20, 5)
    inst.components.periodicspawner:Start()
      
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
     
    return inst
end
return  Prefab("common/inventory/waxwelldoll", fn, assets) 