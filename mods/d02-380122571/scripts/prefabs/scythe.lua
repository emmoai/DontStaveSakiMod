local assets=
{
	Asset("ANIM", "anim/scythe.zip"),
    Asset("ANIM", "anim/swap_scythe.zip"), 

    Asset("ATLAS", "images/inventoryimages/scythe.xml"),
    Asset("IMAGE", "images/inventoryimages/scythe.tex")
}


    local function OnEquip(inst, owner)
        owner.AnimState:OverrideSymbol("swap_object", "swap_scythe", "scythe")
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
    inst.entity:AddLight()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)


    inst.AnimState:SetBank("scythe")
    inst.AnimState:SetBuild("scythe")
    inst.AnimState:PlayAnimation("idle")
	
	    inst:AddTag("sharp")

    if not TheWorld.ismastersim then
        return inst
    end

    inst.entity:SetPristine()

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/scythe.xml"

	inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
	
	inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(TUNING.SPEAR_DAMAGE*2)

	
    MakeHauntableLaunch(inst)

	return inst
end
	

return Prefab( "common/inventory/scythe", fn, assets ) 