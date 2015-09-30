local assets =
{
	Asset("ANIM", "anim/reeds.zip"),
	
	Asset("ATLAS", "images/inventoryimages/dug_reeds.xml"),
	
	Asset("IMAGE", "images/inventoryimages/dug_reeds.tex"),
}

local function ground(inst, pt)
	local tiletype = TheWorld.Map:GetTileAtPoint(pt:Get())
	local ground_OK = tiletype == GROUND.MARSH
	
	if ground_OK then
    	return true
	end

	return false
	
end

local function CanDeploy(inst) return true end

local function ondeploy(inst, pt)
	local reeds = SpawnPrefab("reeds") 
	if reeds then 
		reeds.Transform:SetPosition(pt.x, pt.y, pt.z) 
		inst.components.stackable:Get():Remove()
			reeds.components.pickable:OnTransplant()
		reeds.SoundEmitter:PlaySound("dontstarve/wilson/pickup_reeds")
	end 
end

local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	MakeInventoryPhysics(inst)
	inst.entity:AddNetwork()
    
	inst.AnimState:SetBank("grass")
	inst.AnimState:SetBuild("reeds")
	inst.AnimState:PlayAnimation("dropped")

	if not TheWorld.ismastersim then
	    return inst
    end

	--inst:AddComponent("pickable")
	
	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_LARGEITEM
	
	inst:AddComponent("inspectable")
	inst.components.inspectable.nameoverride = "dug_reeds"

	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/dug_reeds.xml"
    inst.components.inventoryitem.imagename = "dug_reeds"
	
	inst:AddComponent("fuel")
	inst.components.fuel.fuelvalue = TUNING.LARGE_FUEL
    

    MakeMediumBurnable(inst, TUNING.LARGE_BURNTIME)
	MakeSmallPropagator(inst)
	
    inst:AddComponent("deployable")
    inst.components.deployable.ondeploy = ondeploy
    inst.components.deployable.test = ground
    inst.components.deployable.min_spacing = 2    
	
    
	---------------------  
	return inst      
end

return Prefab( "common/objects/dug_reeds", fn, assets),
	MakePlacer( "common/dug_reeds_placer", "grass", "reeds", "picked")