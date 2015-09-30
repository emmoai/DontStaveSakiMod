local Assets=
{
    Asset("ANIM", "anim/choco_cookies.zip"),
	Asset("ATLAS", "images/inventoryimages/choco_cookies.xml"),
}

local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
    
    inst.AnimState:SetBuild("choco_cookies")
    inst.AnimState:SetBank("choco_cookies")
    inst.AnimState:PlayAnimation("idle", false)
	
	inst:AddTag("preparedfood")
				
    inst:AddComponent("edible")
	inst.components.edible.foodtype = "GENERIC"
	
    inst.components.edible.hungervalue = 50
	inst.components.edible.sanityvalue = 15

    inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")
    
	inst:AddComponent("perishable")
	inst.components.perishable:SetPerishTime(TUNING.PERISH_MED)
	inst.components.perishable:StartPerishing()
	inst.components.perishable.onperishreplacement = "spoiled_food"
    
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/choco_cookies.xml"	

    return inst
end

return Prefab( "common/inventory/choco_cookies", fn, Assets) 