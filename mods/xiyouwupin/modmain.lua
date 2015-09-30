local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local Recipe = GLOBAL.Recipe
local TECH = GLOBAL.TECH
local CBATILISKWING = GetModConfigData("BatiliskWing")
local CBERRYBUSH = GetModConfigData("BerryBush")
local CBUNNYPUFF = GetModConfigData("BunnyPuff")
local CBUTTER = GetModConfigData("Butter")
local CGEARS = GetModConfigData("Gears")
local CGRASSTUFT = GetModConfigData("GrassTuft")
local CKRAMPUSSACK = GetModConfigData("KrampusSack")
local CLIGHTBULB = GetModConfigData("LightBulb")
local CMARBLE = GetModConfigData("Marble")
local CSAPLING = GetModConfigData("Sapling")
local CSLURPERPELT = GetModConfigData("SlurperPelt")
local CSPIDERHAT = GetModConfigData("SpiderHat")
local CTAMOSHANTER = GetModConfigData("Tamo'Shanter")
local CTENTACLESPIKE = GetModConfigData("TentacleSpike")

if CBATILISKWING ~= "disabled" then
	STRINGS.RECIPE_DESC.BATWING = " Sadly you can't fly with it. "
	if CBATILISKWING == "easy" then
		AddRecipe("batwing", { Ingredient("feather_crow", 1), Ingredient("smallmeat", 1)}, RECIPETABS.MAGIC,  TECH.SCIENCE_TWO)
	elseif CBATILISKWING == "normal" then
		AddRecipe("batwing", { Ingredient("feather_crow", 1), Ingredient("smallmeat", 1), Ingredient("nightmarefuel", 1)}, RECIPETABS.MAGIC,  TECH.MAGIC_TWO)
	else
		AddRecipe("batwing", { Ingredient("feather_crow", 4), Ingredient("meat", 2), Ingredient("nightmarefuel", 4)}, RECIPETABS.MAGIC,  TECH.MAGIC_THREE)
	end
end
if CBERRYBUSH ~= "disabled" then
	STRINGS.RECIPE_DESC.DUG_BERRYBUSH = " Make your own bush farm "
	if CBERRYBUSH == "easy" then
		AddRecipe("dug_berrybush", { Ingredient("berries", 1), Ingredient("poop", 1)}, RECIPETABS.FARM,  TECH.NONE)
	elseif CBERRYBUSH == "normal" then
		AddRecipe("dug_berrybush", { Ingredient("cutgrass", 4), Ingredient("poop", 2), Ingredient("berries", 2)}, RECIPETABS.FARM,  TECH.SCIENCE_ONE)
	else
		AddRecipe("dug_berrybush", { Ingredient("cutgrass", 8), Ingredient("poop", 4), Ingredient("berries", 4)}, RECIPETABS.FARM,  TECH.SCIENCE_TWO)
	end
end
if CBUNNYPUFF ~= "disabled" then
	STRINGS.RECIPE_DESC.MANRABBIT_TAIL = " So cuddly. "
	if CBUNNYPUFF == "easy" then
		AddRecipe("manrabbit_tail", { Ingredient("rabbit", 2)}, RECIPETABS.MAGIC,  TECH.SCIENCE_ONE)
	elseif CBUNNYPUFF == "normal" then
		AddRecipe("manrabbit_tail", { Ingredient("rabbit", 4), Ingredient("razor", 1)}, RECIPETABS.MAGIC,  TECH.SCIENCE_TWO)
	else
		AddRecipe("manrabbit_tail", { Ingredient("rabbit", 8), Ingredient("beardhair", 2), Ingredient("nightmarefuel", 2)}, RECIPETABS.MAGIC,  TECH.MAGIC_TWO)
	end
end
if CBUTTER ~= "disabled" then
	STRINGS.RECIPE_DESC.BUTTER = " Rich in fat. "
	if CBUTTER == "easy" then
		AddRecipe("butter", { Ingredient("butterflywings", 9), Ingredient("rocks", 1)}, RECIPETABS.FARM,  TECH.SCIENCE_ONE,nil,nil,nil,3)
	elseif CBUTTER == "normal" then
		AddRecipe("butter", { Ingredient("butterflywings", 12), Ingredient("hammer", 1)}, RECIPETABS.FARM,  TECH.SCIENCE_TWO,nil,nil,nil,3)
	else
		AddRecipe("butter", { Ingredient("butterflywings", 15), Ingredient("hammer", 3)}, RECIPETABS.FARM,  TECH.SCIENCE_TWO,nil,nil,nil,3)
	end
end
if CGEARS ~= "disabled" then
	STRINGS.RECIPE_DESC.GEARS = " Little bits of science. "
	if CGEARS == "easy" then
		AddRecipe("gears", { Ingredient("rocks", 4), Ingredient("flint", 4)}, RECIPETABS.SCIENCE,  TECH.SCIENCE_ONE)
	elseif CGEARS == "normal" then
		AddRecipe("gears", { Ingredient("goldnugget", 5), Ingredient("charcoal", 10), Ingredient("hammer", 1)}, RECIPETABS.SCIENCE,  TECH.SCIENCE_TWO)
	else
		AddRecipe("gears", { Ingredient("goldnugget", 10), Ingredient("heatrock", 5), Ingredient("hammer", 3)}, RECIPETABS.SCIENCE,  TECH.SCIENCE_TWO)
	end
end
if CGRASSTUFT ~= "disabled" then
	STRINGS.RECIPE_DESC.DUG_GRASS = " Why dig if you can craft? "
	if CGRASSTUFT == "easy" then
		AddRecipe("dug_grass", { Ingredient("cutgrass", 2), Ingredient("poop", 1)}, RECIPETABS.TOWN,  TECH.SCIENCE_ONE)
	elseif CGRASSTUFT == "normal" then
		AddRecipe("dug_grass", { Ingredient("cutgrass", 4), Ingredient("poop", 2), Ingredient("ash", 2)}, RECIPETABS.TOWN,  TECH.SCIENCE_TWO)
	else
		AddRecipe("dug_grass", { Ingredient("cutgrass", 8), Ingredient("poop", 4), Ingredient("shovel", 1)}, RECIPETABS.TOWN,  TECH.SCIENCE_TWO)
	end
end
if CKRAMPUSSACK ~= "disabled" then
	STRINGS.RECIPE_DESC.KRAMPUS_SACK = " More space for your loot. "
	if CKRAMPUSSACK == "easy" then
		AddRecipe("krampus_sack", { Ingredient("gears", 1),Ingredient("papyrus", 4), Ingredient("rope", 2)}, RECIPETABS.SURVIVAL,  TECH.MAGIC_TWO)
	elseif CKRAMPUSSACK == "normal" then
		AddRecipe("krampus_sack", { Ingredient("gears", 4), Ingredient("tentaclespots", 6), Ingredient("rope", 4)}, RECIPETABS.SURVIVAL,  TECH.MAGIC_THREE)
	else
		AddRecipe("krampus_sack", { Ingredient("gears", 10), Ingredient("lureplantbulb",6), Ingredient("rope", 6)}, RECIPETABS.SURVIVAL,  TECH.MAGIC_THREE)
	end
end
if CLIGHTBULB ~= "disabled" then
	STRINGS.RECIPE_DESC.LIGHTBULB = " Shiny orb. "
	if CLIGHTBULB == "easy" then
		AddRecipe("lightbulb", { Ingredient("cutgrass", 4), Ingredient("twigs", 2)}, RECIPETABS.LIGHT,  TECH.SCIENCE_ONE,nil,nil,nil,2)
	elseif CLIGHTBULB == "normal" then
		AddRecipe("lightbulb", { Ingredient("wetgoop", 1), Ingredient("torch", 1)}, RECIPETABS.LIGHT,  TECH.SCIENCE_TWO,nil,nil,nil,2)
	else
		AddRecipe("lightbulb", { Ingredient("wetgoop", 1), Ingredient("redgem", 1)}, RECIPETABS.LIGHT,  TECH.MAGIC_TWO,nil,nil,nil,2)
	end
end
if CMARBLE ~= "disabled" then
	STRINGS.RECIPE_DESC.MARBLE = " Fancy rocks. "
	if CMARBLE == "easy" then
		AddRecipe("marble", { Ingredient("rocks", 3), Ingredient("hammer", 1)}, RECIPETABS.REFINE,  TECH.SCIENCE_ONE,nil,nil,nil,3)
	elseif CMARBLE == "normal" then
		AddRecipe("marble", { Ingredient("cutstone", 3), Ingredient("charcoal", 6), Ingredient("hammer", 1)}, RECIPETABS.REFINE,  TECH.SCIENCE_TWO,nil,nil,nil,3)
	else
		AddRecipe("marble", { Ingredient("cutstone", 6), Ingredient("redgem", 1), Ingredient("hammer", 3)}, RECIPETABS.REFINE,  TECH.SCIENCE_TWO,nil,nil,nil,3)
	end
end
if CSAPLING ~= "disabled" then
	STRINGS.RECIPE_DESC.DUG_SAPLING = " They actually never grow into trees. "
	if CSAPLING == "easy" then
		AddRecipe("dug_sapling", { Ingredient("twigs", 2), Ingredient("poop", 1)}, RECIPETABS.TOWN,  TECH.SCIENCE_ONE)
	elseif CSAPLING == "normal" then
		AddRecipe("dug_sapling", { Ingredient("twigs", 4), Ingredient("poop", 2), Ingredient("ash", 2)}, RECIPETABS.TOWN,  TECH.SCIENCE_TWO)
	else
		AddRecipe("dug_sapling", { Ingredient("twigs", 8), Ingredient("poop", 4), Ingredient("shovel", 1)}, RECIPETABS.TOWN,  TECH.SCIENCE_TWO)
	end
end
if CSLURPERPELT ~= "disabled" then
	STRINGS.RECIPE_DESC.SLURPER_PELT = " Kind of itchy. "
	if CSLURPERPELT == "easy" then
		AddRecipe("slurper_pelt", { Ingredient("pigskin", 1), Ingredient("ash", 3)}, RECIPETABS.MAGIC,  TECH.MAGIC_TWO)
	elseif CSLURPERPELT == "normal" then
		AddRecipe("slurper_pelt", { Ingredient("pigskin", 1), Ingredient("nightmarefuel", 1), Ingredient("beardhair", 1)}, RECIPETABS.MAGIC,  TECH.MAGIC_THREE)
	else
		AddRecipe("slurper_pelt", { Ingredient("beefalowool", 1), Ingredient("nightmarefuel", 2), Ingredient("tentaclespots", 1)}, RECIPETABS.MAGIC,  TECH.MAGIC_THREE)
	end
end
if CSPIDERHAT ~= "disabled" then
	if CSPIDERHAT == "easy" then
		AddRecipe("spiderhat", { Ingredient("silk", 4), Ingredient("monstermeat", 2)}, RECIPETABS.DRESS,  TECH.SCIENCE_ONE)
	elseif CSPIDERHAT == "normal" then
		AddRecipe("spiderhat", { Ingredient("strawhat", 1), Ingredient("spidereggsack", 1), Ingredient("monstermeat", 4)}, RECIPETABS.DRESS,  TECH.SCIENCE_TWO)
	else
		AddRecipe("spiderhat", { Ingredient("tophat", 1), Ingredient("spidereggsack", 2), Ingredient("monstermeat", 8)}, RECIPETABS.DRESS,  TECH.MAGIC_TWO)
	end
end
if CTAMOSHANTER ~= "disabled" then
	STRINGS.RECIPE_DESC.WALRUSHAT = "  The most civilized of all hats. "
	if CTAMOSHANTER == "easy" then
		AddRecipe("walrushat", { Ingredient("silk", 6), Ingredient("fish", 1)}, RECIPETABS.DRESS,  TECH.SCIENCE_ONE)
	elseif CTAMOSHANTER == "normal" then
		AddRecipe("walrushat", { Ingredient("silk", 10), Ingredient("beefalowool", 10), Ingredient("fish", 6)}, RECIPETABS.DRESS,  TECH.SCIENCE_TWO)
	else
		AddRecipe("walrushat", { Ingredient("silk", 20), Ingredient("beefalohat", 1), Ingredient("fish", 18)}, RECIPETABS.DRESS,  TECH.MAGIC_THREE)
	end
end
if CTENTACLESPIKE ~= "disabled" then
	STRINGS.RECIPE_DESC.TENTACLESPIKE = " The closest thing to a nail board. "
	if CTENTACLESPIKE == "easy" then
		AddRecipe("tentaclespike", { Ingredient("log", 1), Ingredient("stinger", 1)}, RECIPETABS.WAR,  TECH.SCIENCE_ONE)
	elseif CTENTACLESPIKE == "normal" then
		AddRecipe("tentaclespike", { Ingredient("boards", 1), Ingredient("houndstooth", 1)}, RECIPETABS.WAR,  TECH.SCIENCE_TWO)
	else
		AddRecipe("tentaclespike", { Ingredient("boards", 2), Ingredient("houndstooth", 3), Ingredient("cookedmonstermeat", 2)}, RECIPETABS.WAR,  TECH.MAGIC_TWO)
	end
end
