local assets=
{
	Asset("ANIM", "anim/treeapplepie.zip"),
	Asset("ATLAS", "images/inventoryimages/treeapplepie.xml"),  
	Asset("IMAGE", "images/inventoryimages/treeapplepie.tex"),	
}

local prefabs = {"spoiled_food",}

local function oneaten(inst, eater)	
	if eater and eater.components.temperature then
		local temp = eater.components.temperature:GetCurrent()
		eater.components.temperature:SetTemperature(temp+2)
	end	
end

--[[local function onfinished(inst)
    --inst:RemoveComponent("inventoryitem")    
    inst:Remove()
end]]

local function MakeApplepie()
	local inst = CreateEntity()
	inst.entity:AddTransform()
	local s  = 1.2
    inst.Transform:SetScale(s,s,s)
	inst.entity:AddAnimState()
	--inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()
	MakeInventoryPhysics(inst)
	
	inst.AnimState:SetBank("treeapplepie")
    inst.AnimState:SetBuild("treeapplepie")


    inst.AnimState:PlayAnimation("idle")
	inst:AddTag("preparedfood")
	--inst:AddTag("coconutmilk")
	--inst:AddTag("tool")

	inst.entity:SetPristine()
	
	if not TheWorld.ismastersim then
        return inst
    end
  	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

     inst:AddComponent("edible")
    inst.components.edible.healthvalue = 7
    inst.components.edible.hungervalue = 35
    inst.components.edible.sanityvalue = 15
    inst.components.edible.temperaturedelta = TUNING.HOT_FOOD_BONUS_TEMP
    inst.components.edible.temperatureduration = TUNING.FOOD_TEMP_BRIEF * 4
    --inst.components.edible:SetOnEatenFn(oneaten)
    inst.components.edible.foodtype = "VEGGIE"

	--inst:AddComponent("instrument")
    --inst.components.instrument.onplayed = OnPlayed

	--[[inst:AddComponent("tool")
    inst.components.tool:SetAction(ACTIONS.PLAY)

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(5)
    inst.components.finiteuses:SetUses(5)
    inst.components.finiteuses:SetOnFinished( onfinished)
    inst.components.finiteuses:SetConsumption(ACTIONS.PLAY, 1)]]

	inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_FAST)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food"

	inst:AddComponent("inspectable")
	inst:AddComponent("inventoryitem")	
	inst.components.inventoryitem.imagename = "treeapplepie"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/treeapplepie.xml"
		
	return inst
end

STRINGS.NAMES.TREEAPPLEPIE = "Apple Pie"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.TREEAPPLEPIE = {   
    "Ooooooh, so warm and gooey",
    "Just like grammy used to make",
    "Tastes likea slice of home",
}


return Prefab( "common/inventory/treeapplepie", MakeApplepie, assets)