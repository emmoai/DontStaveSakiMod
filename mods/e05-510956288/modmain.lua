PrefabFiles = 
{
"rotbox",
}

Assets = 
{

	Asset("ATLAS", "images/inventoryimages/rotbox.xml"),
	Asset("IMAGE", "images/inventoryimages/rotbox.tex"),
	Asset("ANIM", "anim/rotbox.zip"),

}

local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local STRINGS = GLOBAL.STRINGS
local TECH = GLOBAL.TECH

STRINGS.NAMES.ROTBOX = "腐烂箱"
STRINGS.RECIPE_DESC.ROTBOX = "使食物迅速变质."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.ROTBOX = "Oh,正是令人惊讶!"

STRINGS.RECIPE_DESC.POOP = "用腐烂物制作肥料."

  local rotbox = AddRecipe("rotbox",
    { 
    Ingredient("goldnugget", 2), 
    Ingredient("cutstone", 1),
    Ingredient("wetgoop",1)
    },  
    GLOBAL.RECIPETABS.SCIENCE, GLOBAL.TECH.SCIENCE_TWO, "rotbox_placer", 1, nil, nil, nil, "images/inventoryimages/rotbox.xml" )

AddMinimapAtlas("images/inventoryimages/rotbox.xml")

AddRecipe("poop",  {Ingredient("spoiled_food", GetModConfigData("spoiled_food"))}, RECIPETABS.FARM, TECH.SCIENCE_TWO)