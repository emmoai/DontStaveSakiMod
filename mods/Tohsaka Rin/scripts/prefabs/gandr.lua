
local assets=
{
    Asset("ANIM", "anim/gandr.zip"),
    Asset("ANIM", "anim/swap_gandr.zip"),
 
    Asset("ATLAS", "images/inventoryimages/gandr.xml"),
    Asset("IMAGE", "images/inventoryimages/gandr.tex"),

}

local function onattack_gandr(inst, attacker, target)

    if attacker and attacker.components.sanity then
        attacker.components.sanity:DoDelta(-8)
    end
end

local function fn()
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	inst.AnimState:SetBank("gandr")
    inst.AnimState:SetBuild("gandr")
    inst.AnimState:PlayAnimation("idle")
	
	if not TheWorld.ismastersim then
        return inst
    end
 
    local function OnEquip(inst, owner)
        owner.AnimState:OverrideSymbol("swap_object", "swap_gandr", "swap_gandr")
        owner.AnimState:Show("ARM_carry")
        owner.AnimState:Hide("ARM_normal")
    end
 
    local function OnUnequip(inst, owner)
        owner.AnimState:Hide("ARM_carry")
        owner.AnimState:Show("ARM_normal")
    end
 
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "gandr"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/gandr.xml"
     
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
	inst.components.inventoryitem.keepondeath = true
	inst.components.equippable.dapperness = TUNING.DAPPERNESS_MED_LARGE * 1.5
	
	inst:AddComponent("inspectable")
	if not inst.components.characterspecific then
    inst:AddComponent("characterspecific")
end
 
	inst.components.characterspecific:SetOwner("rin")
	inst.components.characterspecific:SetStorable(true)
	inst.components.characterspecific:SetComment("I don't have the acquired knowledge to use this.") 

		
	inst:AddTag("shadow")
 	inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(45)
	inst.components.weapon:SetOnAttack(onattack_gandr)
    inst.components.weapon:SetRange(10, 12)
	inst.components.weapon:SetProjectile("rinprojectile")

    return inst
	
end
	
return  Prefab("common/inventory/gandr", fn, assets)