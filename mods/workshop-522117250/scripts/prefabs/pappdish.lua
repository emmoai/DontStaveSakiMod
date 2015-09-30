local assets=
{
	Asset("ANIM", "anim/pappdish.zip"),
	Asset("ATLAS", "images/inventoryimages/pappdish.xml"),  
	Asset("IMAGE", "images/inventoryimages/pappdish.tex"),	
}

local prefabs = {"spoiled_food",}

local function oneaten(inst, eater)	
	if eater and eater.components.temperature then
		local temp = eater.components.temperature:GetCurrent()
		eater.components.temperature:SetTemperature(temp-4)
	end	
end

--[[local function onfinished(inst)
    --inst:RemoveComponent("inventoryitem")    
    inst:Remove()
end]]

local function MakePappdish()
	local inst = CreateEntity()
	inst.entity:AddTransform()
	--local s  = 1
    --inst.Transform:SetScale(s,s,s)
	inst.entity:AddAnimState()
	--inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()
	MakeInventoryPhysics(inst)
	
	inst.AnimState:SetBank("pappdish")
    inst.AnimState:SetBuild("pappdish")


    inst.AnimState:PlayAnimation("idle")
	--inst:AddTag("preparedfood")
	--inst:AddTag("coconutmilk")
	--inst:AddTag("tool")
	
	if not TheWorld.ismastersim then
        return inst
    end

    inst.entity:SetPristine()
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

     inst:AddComponent("edible")
    inst.components.edible.healthvalue = 8
    inst.components.edible.hungervalue = 18
    inst.components.edible.sanityvalue = 8
    inst.components.edible.temperaturedelta = TUNING.COLD_FOOD_BONUS_TEMP
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
    inst.components.perishable:SetPerishTime(TUNING.PERISH_PRESERVED)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food"

	inst:AddComponent("inspectable")
	inst:AddComponent("inventoryitem")	
	inst.components.inventoryitem.imagename = "pappdish"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/pappdish.xml"
		
	return inst
end

STRINGS.NAMES.PAPPDISH = "Pinapple Medley"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.PAPPDISH = {   
    "Ooooooh, so cold",
    "What's better for a hot day",
    "Exotic stuff makes me feel fuzzy",
}


return Prefab( "common/inventory/pappdish", MakePappdish, assets)