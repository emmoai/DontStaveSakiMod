local assets=
{
    Asset("ANIM", "anim/wigfriddoll.zip"),
    Asset("ANIM", "anim/swap_wigfriddoll.zip"),
  
    Asset("ATLAS", "images/inventoryimages/wigfriddoll.xml"),
    Asset("IMAGE", "images/inventoryimages/wigfriddoll.tex"),
}
local function OnEquip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_wigfriddoll", "swap_wigfriddoll")
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
      
    inst.AnimState:SetBank("wigfriddoll")
    inst.AnimState:SetBuild("wigfriddoll")
    inst.AnimState:PlayAnimation("idle")
	
    inst.MiniMapEntity:SetIcon("wigfriddoll.tex")
 
    inst:AddTag("sharp")
 
    if not TheWorld.ismastersim then
        return inst
    end
 
    inst.entity:SetPristine()
     
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(40)
  
    inst:AddComponent("inspectable")
      
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "wigfriddoll"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/wigfriddoll.xml"
	
	inst:AddComponent("perishable")
	inst.components.perishable:SetPerishTime(TUNING.PERISH_PRESERVED * 2)
	inst.components.perishable:StartPerishing()
	inst.components.perishable.onperishreplacement = "papyrus"
      
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )

	inst:AddComponent("periodicspawner")
    inst.components.periodicspawner:SetPrefab("wathgrithrhat")
    inst.components.periodicspawner:SetRandomTimes(2, TUNING.PERISH_FASTISH)
    inst.components.periodicspawner:SetDensityInRange(20, 3)
    inst.components.periodicspawner:Start()
     
    return inst
end
return  Prefab("common/inventory/wigfriddoll", fn, assets) 