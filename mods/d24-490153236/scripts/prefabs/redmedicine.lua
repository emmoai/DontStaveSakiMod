local assets =
{
  Asset("ANIM", "anim/redmedicine.zip"),
  
  Asset("ATLAS", "images/inventoryimages/redmedicine.xml"),
  Asset("IMAGE", "images/inventoryimages/redmedicine.tex"),
}

local prefabs = 
{
}

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("redmedicine")
    inst.AnimState:SetBuild("redmedicine")
    inst.AnimState:PlayAnimation("idle")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "redmedicine"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/redmedicine.xml"
	
	
    inst:AddComponent("edible")
    inst.components.edible.healthvalue = TUNING.HEALING_LARGE
    inst.components.edible.sanityvalue = TUNING.SANITY_TINY
    inst.components.edible.foodtype = "MEAT"

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("common/inventory/redmedicine", fn, assets, prefabs)