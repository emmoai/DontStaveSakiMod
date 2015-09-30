local Assets=
{
    Asset("ANIM", "anim/chocolate.zip"),
	Asset("ATLAS", "images/inventoryimages/chocolate.xml"),
}

local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
    
    inst.AnimState:SetBuild("chocolate")
    inst.AnimState:SetBank("chocolate")
    inst.AnimState:PlayAnimation("idle", false)
	
	inst:AddTag("preparedfood")
				
    inst:AddComponent("edible")
	inst.components.edible.foodtype = "GENERIC"
	
    inst.components.edible.hungervalue = 50
	inst.components.edible.sanityvalue = 20

    inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")
    
	inst:AddComponent("perishable")
	inst.components.perishable:SetPerishTime(TUNING.PERISH_SUPERSLOW)
	inst.components.perishable:StartPerishing()
	inst.components.perishable.onperishreplacement = "spoiled_food"
    
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/chocolate.xml"	

    return inst
end

return Prefab( "common/inventory/chocolate", fn, Assets) 
