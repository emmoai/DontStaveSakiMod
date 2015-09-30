require "tuning"


local function MakeVegStats(seedweight, hunger, health, perish_time, sanity, cooked_hunger, cooked_health, cooked_perish_time, cooked_sanity)
	return {
		health = health,
		hunger = hunger,
		cooked_health = cooked_health,
		cooked_hunger = cooked_hunger,
		seed_weight = seedweight,
		perishtime = perish_time,
		cooked_perishtime = cooked_perish_time,
		sanity = sanity,
		cooked_sanity = cooked_sanity
		
	}
end

local COMMON = 3
local UNCOMMON = 1
local RARE = .5

BERRY = 
{
	
	--[[cave_banana = MakeVegStats(0,	TUNING.CALORIES_SMALL,	TUNING.HEALING_TINY,	TUNING.PERISH_MED, 0,		
									TUNING.CALORIES_SMALL,	TUNING.HEALING_SMALL,	TUNING.PERISH_FAST, 0),

	carrot = MakeVegStats(COMMON,	TUNING.CALORIES_SMALL,	TUNING.HEALING_TINY,	TUNING.PERISH_MED, 0,		
									TUNING.CALORIES_SMALL,	TUNING.HEALING_SMALL,	TUNING.PERISH_FAST, 0),

	corn = MakeVegStats(COMMON, TUNING.CALORIES_MED,	TUNING.HEALING_SMALL,	TUNING.PERISH_MED, 0,		
								TUNING.CALORIES_SMALL,	TUNING.HEALING_SMALL,	TUNING.PERISH_SLOW, 0),
	
	pumpkin = MakeVegStats(UNCOMMON,	TUNING.CALORIES_LARGE,	TUNING.HEALING_SMALL,	TUNING.PERISH_MED, 0,		
										TUNING.CALORIES_LARGE,	TUNING.HEALING_MEDSMALL,	TUNING.PERISH_FAST, 0),
	
	eggplant = MakeVegStats(UNCOMMON,	TUNING.CALORIES_MED,	TUNING.HEALING_MEDSMALL,	TUNING.PERISH_MED, 0,		
										TUNING.CALORIES_MED,	TUNING.HEALING_MED,		TUNING.PERISH_FAST, 0),
	
	durian = MakeVegStats(RARE, TUNING.CALORIES_MED,	-TUNING.HEALING_SMALL,	TUNING.PERISH_MED, -TUNING.SANITY_TINY,
								TUNING.CALORIES_MED,	0,						TUNING.PERISH_FAST, -TUNING.SANITY_TINY),
	
	pomegranate = MakeVegStats(RARE,	TUNING.CALORIES_TINY,	TUNING.HEALING_SMALL,		TUNING.PERISH_FAST, 0,		
										TUNING.CALORIES_SMALL,	TUNING.HEALING_MED,	TUNING.PERISH_SUPERFAST, 0),
	
	dragonfruit = MakeVegStats(RARE,	TUNING.CALORIES_TINY,	TUNING.HEALING_SMALL,		TUNING.PERISH_FAST, 0,		
										TUNING.CALORIES_SMALL,	TUNING.HEALING_MED,	TUNING.PERISH_SUPERFAST, 0),
]]
	pappfruit = MakeVegStats(0,	5,	2,	TUNING.PERISH_FAST, 1,
								10,	1,	TUNING.PERISH_SUPERFAST, 2),
--[[
	cactus_meat = MakeVegStats(0, TUNING.CALORIES_SMALL, -TUNING.HEALING_SMALL, TUNING.PERISH_MED, -TUNING.SANITY_TINY,
								  TUNING.CALORIES_SMALL, TUNING.HEALING_TINY, TUNING.PERISH_MED, TUNING.SANITY_MED),

	watermelon = MakeVegStats(UNCOMMON, TUNING.CALORIES_SMALL, TUNING.HEALING_TINY, TUNING.PERISH_MED, TUNING.SANITY_TINY,
							  TUNING.CALORIES_SMALL, TUNING.HEALING_TINY, TUNING.PERISH_MED, TUNING.SANITY_TINY)
]]
}

local function MakeBerry(name, has_seeds)

	local assets=
	{
		Asset("ANIM", "anim/"..name..".zip"),
		--Asset("ANIM", "anim/"..name..".zip"),
		Asset("ATLAS", "images/inventoryimages/pappfruit.xml"),	
    	Asset("IMAGE", "images/inventoryimages/pappfruit.tex"),
    	
	}
	local assets_cooked=
	{
		Asset("ANIM", "anim/"..name..".zip"),
		--Asset("ANIM", "anim/"..name..".zip"),
		Asset("ATLAS", "images/inventoryimages/pappfcook.xml"),	
    	Asset("IMAGE", "images/inventoryimages/pappfcook.tex")
	}
	
	local assets_seeds =
	{
		Asset("ANIM", "anim/seeds.zip"),
	}

	local prefabs =
	{
		name.."_cooked",
		"spoiled_food",
	}    
	
	if has_seeds then
		table.insert(prefabs, name.."_seeds")
	end

	local function fn_seeds()
		local inst = CreateEntity()
		inst.entity:AddTransform()
		inst.entity:AddAnimState()
		inst.entity:AddNetwork()
	    
		MakeInventoryPhysics(inst)
		inst.AnimState:SetBank("seeds")
		inst.AnimState:SetBuild("seeds")
		inst.AnimState:SetRayTestOnBB(true)
		if not TheWorld.ismastersim then
            return inst
        end

        inst.entity:SetPristine()
	    
		inst:AddComponent("edible")
		inst.components.edible.foodtype = "SEEDS"

		inst:AddComponent("stackable")
		inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

		
		inst:AddComponent("tradable")
		inst:AddComponent("inspectable")
		inst:AddComponent("inventoryitem")
		
	    
		inst.AnimState:PlayAnimation("idle")
		inst.components.edible.healthvalue = TUNING.HEALING_TINY/2
		inst.components.edible.hungervalue = TUNING.CALORIES_TINY

		inst:AddComponent("perishable")
		inst.components.perishable:SetPerishTime(TUNING.PERISH_SUPERSLOW)
		inst.components.perishable:StartPerishing()
		inst.components.perishable.onperishreplacement = "spoiled_food"
		
	    
		inst:AddComponent("cookable")
		inst.components.cookable.product = "seeds_cooked"
	    
		inst:AddComponent("bait")
		inst:AddComponent("plantable")
		inst.components.plantable.growtime = TUNING.SEEDS_GROW_TIME
		inst.components.plantable.product = name
		MakeHauntableLaunchAndPerish(inst)
	    
		return inst
	end

	local function fn()
		local inst = CreateEntity()
		inst.entity:AddTransform()		
		inst.Transform:SetScale(0.5,0.5,0.5)
		inst.entity:AddAnimState()
		inst.entity:AddNetwork()
		MakeInventoryPhysics(inst)
		
		inst.AnimState:SetBank(name)
		inst.AnimState:SetBuild(name)
		inst.AnimState:PlayAnimation("idle")
		if not TheWorld.ismastersim then
            return inst
        end

        inst.entity:SetPristine()
	    
		inst:AddComponent("edible")
		inst.components.edible.healthvalue = 6
		inst.components.edible.hungervalue = 25
		inst.components.edible.sanityvalue = 5
		inst.components.edible.foodtype = FOODTYPE.VEGGIE

		inst:AddComponent("perishable")
		inst.components.perishable:SetPerishTime(TUNING.PERISH_FAST)
		inst.components.perishable:StartPerishing()
		inst.components.perishable.onperishreplacement = "spoiled_food"
		
		inst:AddComponent("stackable")
		
		
		--[[local is_big = name == "pumpkin" or name == "eggplant" or name == "durian" or name == "watermelon"
		if not is_big then
			inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
		end]]

		inst:AddComponent("inspectable")
		inst:AddComponent("inventoryitem")
		if name == "pappfruit" then
			inst.components.inventoryitem.imagename = "pappfruit"	
    		inst.components.inventoryitem.atlasname = "images/inventoryimages/pappfruit.xml"
		end
	    
	    MakeSmallBurnable(inst)
		MakeSmallPropagator(inst)
		---------------------        

		inst:AddComponent("bait")
	    
		------------------------------------------------
		inst:AddComponent("tradable")
	    
		------------------------------------------------  
	    
		inst:AddComponent("cookable")
		inst.components.cookable.product = name.."_cooked"

		MakeHauntableLaunchAndPerish(inst)
		return inst
	end
	
	local function fn_cooked()
		local inst = CreateEntity()
		inst.entity:AddTransform()
		inst.Transform:SetScale(0.5,0.5,0.5)
		inst.entity:AddAnimState()
		inst.entity:AddNetwork()
		MakeInventoryPhysics(inst)
		
		inst.AnimState:SetBank(name)
		inst.AnimState:SetBuild(name)
		inst.AnimState:PlayAnimation("cooked")
	    
		if not TheWorld.ismastersim then
            return inst
        end

        inst.entity:SetPristine()
	    
		inst:AddComponent("perishable")
		inst.components.perishable:SetPerishTime(TUNING.PERISH_SUPERFAST)
		inst.components.perishable:StartPerishing()
		inst.components.perishable.onperishreplacement = "spoiled_food"
	    
		inst:AddComponent("edible")
		inst.components.edible.healthvalue = 9
		inst.components.edible.hungervalue = 28
		inst.components.edible.sanityvalue = 7
		inst.components.edible.foodtype = FOODTYPE.VEGGIE

		inst:AddComponent("stackable")
		inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
		
		inst:AddComponent("inspectable")
		inst:AddComponent("inventoryitem")
		inst.components.inventoryitem.imagename = "pappfcook"	
    	inst.components.inventoryitem.atlasname = "images/inventoryimages/pappfcook.xml"
		
	    MakeSmallBurnable(inst)
		MakeSmallPropagator(inst)
		---------------------        

		inst:AddComponent("bait")
	    
		------------------------------------------------
		inst:AddComponent("tradable")

		MakeHauntableLaunchAndPerish(inst)
		return inst
	end
	AddIngredientValues({name}, {fruit=1}, true)
	local base = Prefab( "common/inventory/"..name, fn, assets, prefabs)
	
	local cooked = Prefab( "common/inventory/"..name.."_cooked", fn_cooked, assets_cooked)
	--local seeds = has_seeds and Prefab( "common/inventory/"..name.."_seeds", fn_seeds, assets_seeds) or nil
	return base, cooked--, seeds
		   
		   
		   
end
	
return MakeBerry("pappfruit", false)
