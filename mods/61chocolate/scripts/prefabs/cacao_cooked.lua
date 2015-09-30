local assets=
{
	Asset("ANIM", "anim/cacao_cooked.zip"),
	
	Asset("ATLAS", "images/inventoryimages/cacao_cooked.xml"),
	Asset("IMAGE", "images/inventoryimages/cacao_cooked.tex"),	
}

local prefabs =
{
	"spoiled_food",
}

local function fn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("cave_banana")
    inst.AnimState:SetBuild("cacao_cooked")
    inst.AnimState:PlayAnimation("cooked")

    inst:AddComponent("edible")
	inst.components.edible.foodtype = "GENERIC"
	
    inst.components.edible.hungervalue = 8
	inst.components.edible.sanityvalue = 4

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_SUPERSLOW)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food"

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/cacao_cooked.xml"

    return inst
end

return  Prefab("common/inventory/cacao_cooked", fn, assets, prefabs)
