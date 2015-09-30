local assets =
{
    Asset("ANIM", "anim/greenmedicine.zip"),
	
	Asset("ATLAS", "images/inventoryimages/greenmedicine.xml"),
    Asset("IMAGE", "images/inventoryimages/greenmedicine.tex"),
}

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("greenmedicine")
    inst.AnimState:SetBuild("greenmedicine")
    inst.AnimState:PlayAnimation("idle")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "greenmedicine"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/greenmedicine.xml"
	
    inst:AddComponent("edible")
    inst.components.edible.healthvalue = TUNING.HEALING_SMALL
    inst.components.edible.sanityvalue = TUNING.SANITY_LARGE*1.2
    inst.components.edible.foodtype = "MEAT"

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("common/inventory/greenmedicine", fn, assets, prefabs)