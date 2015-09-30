local assets=
{
    Asset("ANIM", "anim/webberdoll.zip"),
    Asset("ANIM", "anim/swap_webberdoll.zip"),
  
    Asset("ATLAS", "images/inventoryimages/webberdoll.xml"),
    Asset("IMAGE", "images/inventoryimages/webberdoll.tex"),
}
local function OnEquip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_webberdoll", "swap_webberdoll")
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
      
    inst.AnimState:SetBank("webberdoll")
    inst.AnimState:SetBuild("webberdoll")
    inst.AnimState:PlayAnimation("idle")
	
    inst.MiniMapEntity:SetIcon("webberdoll.tex")
 
    inst:AddTag("sharp")
 
    if not TheWorld.ismastersim then
        return inst
    end
 
    inst.entity:SetPristine()
     
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(40)
  
    inst:AddComponent("inspectable")
      
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "webberdoll"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/webberdoll.xml"
	
	inst:AddComponent("perishable")
	inst.components.perishable:SetPerishTime(TUNING.PERISH_PRESERVED * 2)
	inst.components.perishable:StartPerishing()
	inst.components.perishable.onperishreplacement = "silk"
      
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
	
	inst:AddComponent("periodicspawner")
    inst.components.periodicspawner:SetPrefab("spidergland")
    inst.components.periodicspawner:SetRandomTimes(2, TUNING.PERISH_ONE_DAY)
    inst.components.periodicspawner:SetDensityInRange(20, 4)
    inst.components.periodicspawner:Start()
     
    return inst
end
return  Prefab("common/inventory/webberdoll", fn, assets) 