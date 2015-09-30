local assets=
{
    Asset("ANIM", "anim/wesdoll.zip"),
    Asset("ANIM", "anim/swap_wesdoll.zip"),
  
    Asset("ATLAS", "images/inventoryimages/wesdoll.xml"),
    Asset("IMAGE", "images/inventoryimages/wesdoll.tex"),
}
local function OnEquip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_wesdoll", "swap_wesdoll")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end
  
local function OnUnequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end

local prefabs = 
{
	"balloon2"
}
 
local function fn()
  
    local inst = CreateEntity()
 
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
	inst.entity:AddMiniMapEntity()
     
    MakeInventoryPhysics(inst)   
      
    inst.AnimState:SetBank("wesdoll")
    inst.AnimState:SetBuild("wesdoll")
    inst.AnimState:PlayAnimation("idle")
	
    inst.MiniMapEntity:SetIcon("wesdoll.tex")
 
    inst:AddTag("sharp")
 
    if not TheWorld.ismastersim then
        return inst
    end
 
    inst.entity:SetPristine()
     
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(10)
  
    inst:AddComponent("inspectable")
      
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "wesdoll"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/wesdoll.xml"
	      
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
	
    inst:AddComponent("periodicspawner")
    inst.components.periodicspawner:SetPrefab("balloon2")
    inst.components.periodicspawner:SetRandomTimes(2, 4)
    inst.components.periodicspawner:SetDensityInRange(20, 10)
    inst.components.periodicspawner:Start()
     
    return inst
end
return  Prefab("common/inventory/wesdoll", fn, assets) 