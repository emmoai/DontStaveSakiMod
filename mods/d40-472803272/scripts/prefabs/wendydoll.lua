local assets=
{
    Asset("ANIM", "anim/wendydoll.zip"),
    Asset("ANIM", "anim/swap_wendydoll.zip"),
  
    Asset("ATLAS", "images/inventoryimages/wendydoll.xml"),
    Asset("IMAGE", "images/inventoryimages/wendydoll.tex"),
}

local function OnEquip(inst, owner)	
    owner.AnimState:OverrideSymbol("swap_object", "swap_wendydoll", "swap_wendydoll")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end
  
local function OnUnequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end

local prefabs = 
{
	"ghost2"
}
 
local function fn()
  
    local inst = CreateEntity()
 
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
	inst.entity:AddMiniMapEntity()
     
    MakeInventoryPhysics(inst)   
      
    inst.AnimState:SetBank("wendydoll")
    inst.AnimState:SetBuild("wendydoll")
    inst.AnimState:PlayAnimation("idle")
	
    inst.MiniMapEntity:SetIcon("wendydoll.tex")
 
    inst:AddTag("sharp")
 
    if not TheWorld.ismastersim then
        return inst
    end
 
    inst.entity:SetPristine()
     
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(40)
  
    inst:AddComponent("inspectable")
      
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "wendydoll"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/wendydoll.xml"
	
	inst:AddComponent("perishable")
	inst.components.perishable:SetPerishTime(TUNING.PERISH_PRESERVED * 2)
	inst.components.perishable:StartPerishing()
	inst.components.perishable.onperishreplacement = "petals"
      
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
	
	inst:AddComponent("periodicspawner")
    inst.components.periodicspawner:SetPrefab("ghost2")
    inst.components.periodicspawner:SetRandomTimes(2, TUNING.PERISH_SUPERFAST)
    inst.components.periodicspawner:SetDensityInRange(20, 3)
    inst.components.periodicspawner:Start()
     
    return inst
end
return  Prefab("common/inventory/wendydoll", fn, assets) 