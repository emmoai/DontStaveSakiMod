local assets =
{
    Asset("ANIM", "anim/bluemedicine.zip"),
	
	Asset("ATLAS", "images/inventoryimages/bluemedicine.xml"),
    Asset("IMAGE", "images/inventoryimages/bluemedicine.tex"),
}

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("bluemedicine")
    inst.AnimState:SetBuild("bluemedicine")
    inst.AnimState:PlayAnimation("idle")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "bluemedicine"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/bluemedicine.xml"
	
    inst:AddComponent("edible")
    inst.components.edible.healthvalue = TUNING.HEALING_MEDLARGE
    inst.components.edible.sanityvalue = TUNING.SANITY_MEDLARGE
    inst.components.edible.foodtype = "MEAT"

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("common/inventory/bluemedicine", fn, assets, prefabs)