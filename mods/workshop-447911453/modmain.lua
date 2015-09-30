PrefabFiles = 
{
    "catcoonden_placer",
}

Assets = 
{
    Asset("ATLAS", "images/inventoryimages/catcoonden.xml"),
    Asset("IMAGE", "images/inventoryimages/catcoonden.tex"),
}

local LogsRequiredCount = GetModConfigData("Logs") or 0
local RopeRequiredCount = GetModConfigData("Rope") or 0
local GrassRequiredCount = GetModConfigData("Grass") or 0
local FishRequiredCount = GetModConfigData("Fish") or 0
local WoolRequiredCount = GetModConfigData("Beefalo Wool") or 0
local TailsRequiredCount = GetModConfigData("Cat Tails") or 0

GLOBAL.STRINGS.RECIPE_DESC.CATCOONDEN = "A natural artificial habitat for a catcoon."

local recipeIngredients = {}
if LogsRequiredCount > 0 then
	recipeIngredients[#recipeIngredients + 1]= GLOBAL.Ingredient("log", LogsRequiredCount);
end
if RopeRequiredCount > 0 then
	recipeIngredients[#recipeIngredients + 1] = GLOBAL.Ingredient("rope", RopeRequiredCount);
end
if GrassRequiredCount > 0 then
	recipeIngredients[#recipeIngredients + 1] = GLOBAL.Ingredient("cutgrass", GrassRequiredCount);
end
if FishRequiredCount > 0 then
	recipeIngredients[#recipeIngredients + 1] = GLOBAL.Ingredient("fish", FishRequiredCount);
end
if WoolRequiredCount > 0 then
	recipeIngredients[#recipeIngredients + 1] = GLOBAL.Ingredient("beefalowool", WoolRequiredCount);
end
if TailsRequiredCount > 0 then
	recipeIngredients[#recipeIngredients + 1] = GLOBAL.Ingredient("coontail", TailsRequiredCount);
end

local recipe = GLOBAL.Recipe("catcoonden", recipeIngredients, GLOBAL.RECIPETABS.TOWN, GLOBAL.TECH.SCIENCE_ONE, "catcoonden_placer")
recipe.atlas = "images/inventoryimages/catcoonden.xml"
