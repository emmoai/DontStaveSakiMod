local assets=
{
    Asset("ANIM", "anim/woodiedoll.zip"),
    Asset("ANIM", "anim/swap_woodiedoll.zip"),
  
    Asset("ATLAS", "images/inventoryimages/woodiedoll.xml"),
    Asset("IMAGE", "images/inventoryimages/woodiedoll.tex"),
}
local function OnEquip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_woodiedoll", "swap_woodiedoll")
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
      
    inst.AnimState:SetBank("woodiedoll")
    inst.AnimState:SetBuild("woodiedoll")
    inst.AnimState:PlayAnimation("idle")
	
    inst.MiniMapEntity:SetIcon("woodiedoll.tex")
 
    inst:AddTag("sharp")
 
    if not TheWorld.ismastersim then
        return inst
    end
 
    inst.entity:SetPristine()
     
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(40)
  
    inst:AddComponent("inspectable")
      
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "woodiedoll"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/woodiedoll.xml"
	
	inst:AddComponent("perishable")
	inst.components.perishable:SetPerishTime(TUNING.PERISH_PRESERVED * 2)
	inst.components.perishable:StartPerishing()
	inst.components.perishable.onperishreplacement = "goldenaxe"
      
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
	
	inst:AddComponent("periodicspawner")
    inst.components.periodicspawner:SetPrefab("pinecone")
    inst.components.periodicspawner:SetRandomTimes(2, TUNING.PERISH_SUPERFAST)
    inst.components.periodicspawner:SetDensityInRange(20, 3)
    inst.components.periodicspawner:Start()
     
    return inst
end
return  Prefab("common/inventory/woodiedoll", fn, assets) 