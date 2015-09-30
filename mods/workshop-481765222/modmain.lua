local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local Recipe = GLOBAL.Recipe
local TECH = GLOBAL.TECH
local STRINGS = GLOBAL.STRINGS

PrefabFiles = {
	"altar",
}
local assets=
{
    Asset("ATLAS", "images/inventoryimages/altar.xml"),
    Asset("IMAGE", "images/inventoryimages/altar.tex"),
    Asset("ATLAS", "images/inventoryimages/altar_broken.xml"),
    Asset("IMAGE", "images/inventoryimages/altar_broken.tex"),
}
AddMinimapAtlas("images/inventoryimages/altar.xml")
AddMinimapAtlas("images/inventoryimages/altar_broken.xml")

AddRecipe("altar_broken", {Ingredient("moonrocknugget", 6), Ingredient("purplegem", 2), Ingredient("thulecite_pieces", 6)}, RECIPETABS.SCIENCE, TECH.MAGIC_THREE, 
"altar_broken_placer", -- placer
nil, -- min_spacing
nil, -- nounlock
nil, -- numtogive
nil, -- builder_tag
"images/inventoryimages/altar_broken.xml", -- atlas
"altar_broken.tex") -- image

AddRecipe("thulecite_pieces", { Ingredient("transistor", 1), Ingredient("nightmarefuel", 1)}, RECIPETABS.REFINE,  TECH.MAGIC_THREE)

STRINGS.NAMES.ALTAR = "Ancient Station" --It's name in-game
STRINGS.NAMES.ALTAR_BROKEN = "Small Station" --It's name in-game
STRINGS.RECIPE_DESC.ALTAR = "Build the wonders of a lost age." --recipe description
STRINGS.RECIPE_DESC.ALTAR_BROKEN = "Build some of the wonders of a lost age." --recipe description
STRINGS.RECIPE_DESC.THULECITE_PIECES = "The precious material of the ancients." --recipe description
STRINGS.CHARACTERS.GENERIC.DESCRIBE.ALTAR = "An ancient and mysterious structure."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.ALTAR_BROKEN = "An ancient, mysterious and incomplete structure."