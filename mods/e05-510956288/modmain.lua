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

STRINGS.NAMES.ROTBOX = "������"
STRINGS.RECIPE_DESC.ROTBOX = "ʹʳ��Ѹ�ٱ���."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.ROTBOX = "Oh,�������˾���!"

STRINGS.RECIPE_DESC.POOP = "�ø�������������."

  local rotbox = AddRecipe("rotbox",
    { 
    Ingredient("goldnugget", 2), 
    Ingredient("cutstone", 1),
    Ingredient("wetgoop",1)
    },  
    GLOBAL.RECIPETABS.SCIENCE, GLOBAL.TECH.SCIENCE_TWO, "rotbox_placer", 1, nil, nil, nil, "images/inventoryimages/rotbox.xml" )

AddMinimapAtlas("images/inventoryimages/rotbox.xml")

AddRecipe("poop",  {Ingredient("spoiled_food", GetModConfigData("spoiled_food"))}, RECIPETABS.FARM, TECH.SCIENCE_TWO)