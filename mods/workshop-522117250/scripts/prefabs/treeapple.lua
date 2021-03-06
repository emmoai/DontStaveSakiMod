local assets=
{
	Asset("ANIM", "anim/treeapple.zip"),
	Asset("ATLAS", "images/inventoryimages/treeapple.xml"),  
	Asset("IMAGE", "images/inventoryimages/treeapple.tex"),
	
}

--[[local prefabs =
{
    "appletree",
}]]

--[[local function onfinished(inst)
    inst:RemoveComponent("inventoryitem")    
    inst:Remove()
end]]
local function growtree(inst)
	--print ("GROWTREE")
    inst.growtask = nil
    inst.growtime = nil
    inst.issapling:set(false)
	local tree = SpawnPrefab("appletree") 
    if tree then 
        --tree.Transform:SetScale(1,1,1)        
		tree.Transform:SetPosition(inst.Transform:GetWorldPosition() ) 
        tree:growfromseed()--PushEvent("growfromseed")
        inst:Remove()
	end
end

local function plant(inst, growtime)
    inst:RemoveComponent("inventoryitem")
    MakeHauntableIgnite(inst)
    RemovePhysicsColliders(inst)
    inst.AnimState:PlayAnimation("idle_planted")
    --inst.Transform:SetScale(2.5,2.5,2.5)
    inst.SoundEmitter:PlaySound("dontstarve/wilson/plant_tree")
    inst.growtime = GetTime() + growtime
    inst.issapling:set(true)
    --print ("PLANT", growtime)
    inst.growtask = inst:DoTaskInTime(growtime, growtree)


end

local function ondeploy(inst, pt)
    inst = inst.components.stackable:Get()
    inst.Physics:Teleport(pt:Get())
    local timeToGrow = GetRandomWithVariance(TUNING.PINECONE_GROWTIME.base, TUNING.PINECONE_GROWTIME.random)
    plant(inst, timeToGrow)
	
	--tell any nearby leifs to chill out
	--[[local ents = TheSim:FindEntities(pt.x,pt.y,pt.z, TUNING.LEIF_PINECONE_CHILL_RADIUS, {"leif"})







	
	local played_sound = false
	for k,v in pairs(ents) do
		
		local chill_chance = TUNING.LEIF_PINECONE_CHILL_CHANCE_FAR
		if distsq(pt, Vector3(v.Transform:GetWorldPosition())) < TUNING.LEIF_PINECONE_CHILL_CLOSE_RADIUS*TUNING.LEIF_PINECONE_CHILL_CLOSE_RADIUS then
			chill_chance = TUNING.LEIF_PINECONE_CHILL_CHANCE_CLOSE
		end



	
		if math.random() < chill_chance then
			if v.components.sleeper then
				v.components.sleeper:GoToSleep(1000)
			end
		else
			if not played_sound then
				v.SoundEmitter:PlaySound("dontstarve/creatures/leif/taunt_VO")
				played_sound = true
			end
		end
		
	end]]	
end

local function stopgrowing(inst)
    if inst.growtask then
        inst.growtask:Cancel()
        inst.growtask = nil
    end
    inst.growtime = nil
    inst.issapling:set(false)
end

local function restartgrowing(inst)
    if inst and not inst.growtask then
        local growtime = GetRandomWithVariance(TUNING.PINECONE_GROWTIME.base, TUNING.PINECONE_GROWTIME.random)
        inst.growtime = GetTime() + growtime
        inst.growtask = inst:DoTaskInTime(growtime, growtree)
    end
end

local function describe(inst)
    if inst.growtime then
        return "PLANTED"
    end
end

--[[local function displaynamefn(inst)
    return STRINGS.NAMES[inst.issapling:value() and "PINECONE_SAPLING" or "PINECONE"]
end]]

local function OnSave(inst, data)
    if inst.growtime then
        data.growtime = inst.growtime - GetTime()
    end
end

local function OnLoad(inst, data)
    if data and data.growtime then
        plant(inst, data.growtime)
    end

end

local function MakeTreeapple()
	local inst = CreateEntity()
	inst.entity:AddTransform()
	local s  = 1.2
    inst.Transform:SetScale(s,s,s)
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	MakeInventoryPhysics(inst)
    inst.entity:AddNetwork()
	inst.AnimState:SetBank("treeapple")
    inst.AnimState:SetBuild("treeapple")
	
	
	inst.AnimState:PlayAnimation("idle")

    inst.issapling = net_bool(inst.GUID, "issapling")
    inst.issapling:set(false)
	
	inst:AddTag("apple")
	inst:AddTag("cattoy")
	MakeDragonflyBait(inst, 3)

    inst.entity:SetPristine()

	if not TheWorld.ismastersim then
        return inst
    end
    
    inst:AddComponent("tradable")
    inst.components.tradable.goldvalue = 1
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM

     inst:AddComponent("edible")
    inst.components.edible.healthvalue = 12
    inst.components.edible.hungervalue = 8
    inst.components.edible.sanityvalue = 3
    inst.components.edible.foodtype = "VEGGIE"

	inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_PRESERVED)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food"

	inst:AddComponent("inspectable")
	inst:AddComponent("inventoryitem")	
	inst.components.inventoryitem.imagename = "treeapple"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/treeapple.xml"
	MakeHauntableLaunchAndIgnite(inst)

    inst:AddComponent("deployable")
    inst.components.deployable:SetDeployMode(DEPLOYMODE.PLANT)

    inst.components.deployable.ondeploy = ondeploy



    inst.OnSave = OnSave
    inst.OnLoad = OnLoad
	return inst
end

STRINGS.NAMES.TREEAPPLE = "苹果"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.TREEAPPLE = {   
    "一天一个小苹果，医生远离我",
    "多么靓丽，还闪着光",
}
AddIngredientValues({"treeapple"}, {treeapple=1, fruit=1})

return Prefab( "common/inventory/treeapple", MakeTreeapple, assets),
		MakePlacer("common/treeapple_placer", "treeapple", "treeapple", "idle_planted")