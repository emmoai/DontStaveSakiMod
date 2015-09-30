local assets=
{
    Asset("ANIM", "anim/galientsword.zip"),
    Asset("ANIM", "anim/swap_galientsword.zip"),
  
    Asset("ATLAS", "images/inventoryimages/galientsword.xml"),
    Asset("IMAGE", "images/inventoryimages/galientsword.tex"),
}
local function OnEquip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_galientsword", "swap_galientsword")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end

local function onattack_galient(inst, attacker, data)
	if attacker then
		SpawnPrefab("statue_transition").Transform:SetPosition(inst:GetPosition():Get())
	end
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
      
    inst.AnimState:SetBank("galientsword")
    inst.AnimState:SetBuild("galientsword")
    inst.AnimState:PlayAnimation("idle")
	
    inst.MiniMapEntity:SetIcon("galientsword.tex")
 
    inst:AddTag("sharp")
 
    if not TheWorld.ismastersim then
        return inst
    end
 
    inst.entity:SetPristine()
     
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(60)
	inst.components.weapon:SetOnAttack(onattack_galient)
  
    inst:AddComponent("inspectable")
      
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "galientsword"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/galientsword.xml"
	      
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
     
    return inst
end
return  Prefab("common/inventory/galientsword", fn, assets) 