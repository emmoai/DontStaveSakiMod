
local assets=
{
    Asset("ANIM", "anim/anniefire.zip"),
    Asset("ANIM", "anim/swap_anniefire.zip"),
 
    Asset("ATLAS", "images/inventoryimages/anniefire.xml"),
    Asset("IMAGE", "images/inventoryimages/anniefire.tex"),
}

local function fn()
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	inst.AnimState:SetBank("anniefire")
    inst.AnimState:SetBuild("anniefire")
    inst.AnimState:PlayAnimation("idle")
	
	if not TheWorld.ismastersim then
        return inst
    end
 
    local function OnEquip(inst, owner)
        owner.AnimState:OverrideSymbol("swap_object", "swap_anniefire", "swap_anniefire")
        owner.AnimState:Show("ARM_carry")
        owner.AnimState:Hide("ARM_normal")
    end
 
    local function OnUnequip(inst, owner)
        owner.AnimState:Hide("ARM_carry")
        owner.AnimState:Show("ARM_normal")
    end
 
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.keepondeath = true
    inst.components.inventoryitem.imagename = "anniefire"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/anniefire.xml"
     
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
	inst.components.inventoryitem.keepondeath = true
			
	inst:AddComponent("inspectable")
			
	inst:AddTag("shadow")
 	inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(30)
    inst.components.weapon:SetRange(8, 10)
	inst.components.weapon:SetProjectile("fire_projectile")

    return inst
	
end
	
return  Prefab("common/inventory/anniefire", fn, assets)