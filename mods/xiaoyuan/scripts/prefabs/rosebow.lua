local assets=
{
    Asset("ANIM", "anim/rosebow.zip"),
    Asset("ANIM", "anim/swap_rosebow.zip"),
 
    Asset("ATLAS", "images/inventoryimages/rosebow.xml"),
    Asset("IMAGE", "images/inventoryimages/rosebow.tex"),
}

local function onattack_rosebow(inst, attacker, target)

    if attacker and attacker.components.health and attacker.components.hunger then
        attacker.components.health:DoDelta(-1)
		attacker.components.hunger:DoDelta(-2)
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
	
	inst.AnimState:SetBank("rosebow")
    inst.AnimState:SetBuild("rosebow")
    inst.AnimState:PlayAnimation("idle")
	
	if not TheWorld.ismastersim then
        return inst
    end
 
    local function OnEquip(inst, owner)
        owner.AnimState:OverrideSymbol("swap_object", "swap_rosebow", "swap_rosebow")
        owner.AnimState:Show("ARM_carry")
        owner.AnimState:Hide("ARM_normal")
    end
 
    local function OnUnequip(inst, owner)
        owner.AnimState:Hide("ARM_carry")
        owner.AnimState:Show("ARM_normal")
    end
 
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.keepondeath = true
    inst.components.inventoryitem.imagename = "rosebow"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/rosebow.xml"
     
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
	inst.components.inventoryitem.keepondeath = true
	
	inst:AddComponent("inspectable")
		
	inst:AddTag("shadow")
 	inst:AddComponent("weapon")
	inst.components.weapon:SetOnAttack(onattack_rosebow)
    inst.components.weapon:SetDamage(55)
    inst.components.weapon:SetRange(8, 10)
	inst.components.weapon:SetProjectile("madoka_projectile")

    return inst
	
end
	
return  Prefab("common/inventory/rosebow", fn, assets)