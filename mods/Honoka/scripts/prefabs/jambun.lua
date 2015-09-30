local assets =
{
	Asset("ANIM", "anim/jambun.zip"),
    Asset( "ATLAS", "images/inventoryimages/jambun.xml" ),
}

local prefabs = {
	"yo",
}

local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("petals")
    inst.AnimState:SetBuild("jambun")
    inst.AnimState:PlayAnimation("anim")

    if not TheWorld.ismastersim then
        return inst
    end

    inst.entity:SetPristine()

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/jambun.xml"

    inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_LARGEITEM

	inst:AddComponent("perishable")
	inst.components.perishable:SetPerishTime(TUNING.PERISH_FAST)
	inst.components.perishable:StartPerishing()	

	inst:AddComponent("edible")
    inst.components.edible.healthvalue = 0
    inst.components.edible.hungervalue = 55
    inst.components.edible.sanityvalue = 0		
    inst.components.edible.foodtype = FOODTYPE.GENERIC

    inst:AddComponent("inspectable")

    return inst
end

return Prefab("common/inventory/jambun", fn, assets)