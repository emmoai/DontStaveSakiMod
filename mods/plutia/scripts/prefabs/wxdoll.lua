local assets=
{
    Asset("ANIM", "anim/wxdoll.zip"),
    Asset("ANIM", "anim/swap_wxdoll.zip"),
  
    Asset("ATLAS", "images/inventoryimages/wxdoll.xml"),
    Asset("IMAGE", "images/inventoryimages/wxdoll.tex"),
}
local function OnEquip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_wxdoll", "swap_wxdoll")
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
      
    inst.AnimState:SetBank("wxdoll")
    inst.AnimState:SetBuild("wxdoll")
    inst.AnimState:PlayAnimation("idle")
	
    inst.MiniMapEntity:SetIcon("wxdoll.tex")
 
    inst:AddTag("sharp")
 
    if not TheWorld.ismastersim then
        return inst
    end
 
    inst.entity:SetPristine()
     
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(40)
  
    inst:AddComponent("inspectable")
      
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "wxdoll"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/wxdoll.xml"
	
	inst:AddComponent("perishable")
	inst.components.perishable:SetPerishTime(TUNING.PERISH_PRESERVED * 2)
	inst.components.perishable:StartPerishing()
	inst.components.perishable.onperishreplacement = "gears"
      
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
	
	inst:AddComponent("periodicspawner")
    inst.components.periodicspawner:SetPrefab("gears")
    inst.components.periodicspawner:SetRandomTimes(2, TUNING.PERISH_FAST)
    inst.components.periodicspawner:SetDensityInRange(20, 3)
    inst.components.periodicspawner:Start()
     
    return inst
end
return  Prefab("common/inventory/wxdoll", fn, assets) 