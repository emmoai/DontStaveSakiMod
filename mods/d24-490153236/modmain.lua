PrefabFiles = {
	"chopper", "chopperhat", "redmedicine", "greenmedicine", "bluemedicine",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/chopper.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/chopper.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/chopper.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/chopper.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/chopper_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/chopper_silho.xml" ),

    Asset( "IMAGE", "bigportraits/chopper.tex" ),
    Asset( "ATLAS", "bigportraits/chopper.xml" ),
	
	Asset( "IMAGE", "images/map_icons/chopper.tex" ),
	Asset( "ATLAS", "images/map_icons/chopper.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_chopper.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_chopper.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_chopper.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_chopper.xml" ),
	
	Asset( "ATLAS", "images/hud/choppertab.xml" ),	
}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

local resolvefilepath = GLOBAL.resolvefilepath

local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local Recipe = GLOBAL.Recipe
local TECH = GLOBAL.TECH
local STRINGS = GLOBAL.STRINGS

STRINGS.NAMES.CHOPPERHAT = "�ǰ͵�ñ��"

STRINGS.CHARACTERS.GENERIC.DESCRIBE.CHOPPERHAT = "A hat cherished by a little reindeer."

STRINGS.RECIPE_DESC.REDMEDICINE = "A red medicine for relieving aches and pains." 
GLOBAL.STRINGS.NAMES.REDMEDICINE = "�첨��"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.REDMEDICINE = "����ԺܺõĻ�����ʹ."

STRINGS.RECIPE_DESC.GREENMEDICINE = "A green medicine for relieving stress." 
GLOBAL.STRINGS.NAMES.GREENMEDICINE = "�̲���"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.GREENMEDICINE = "����Ϊ��Դ����кô�."

STRINGS.RECIPE_DESC.BLUEMEDICINE = "A blue medicine that's good for everything." 
GLOBAL.STRINGS.NAMES.BLUEMEDICINE = "������"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.BLUEMEDICINE = "��������Ҫ��˾ƥ��ʱ,��͸������?"

choppertab = AddRecipeTab("�ǰ�", 998, "images/hud/choppertab.xml", "choppertab.tex", "chopper_builder")

local redmedicine_recipe = AddRecipe("redmedicine",
{GLOBAL.Ingredient("spidergland", 1), GLOBAL.Ingredient("red_cap", 5)},
choppertab, TECH.NONE,
nil, nil, nil, nil, nil,
"images/inventoryimages/redmedicine.xml", "redmedicine.tex")
redmedicine_recipe.tagneeded = false
redmedicine_recipe.builder_tag = "chopper_builder"
redmedicine_recipe.atlas = resolvefilepath("images/inventoryimages/redmedicine.xml")

local greenmedicine_recipe = AddRecipe("greenmedicine",
{GLOBAL.Ingredient("spidergland", 1), GLOBAL.Ingredient("green_cap", 5)},
choppertab, TECH.NONE,
nil, nil, nil, nil, nil,
"images/inventoryimages/greenmedicine.xml", "greenmedicine.tex")
greenmedicine_recipe.tagneeded = false
greenmedicine_recipe.builder_tag = "chopper_builder"
greenmedicine_recipe.atlas = resolvefilepath("images/inventoryimages/greenmedicine.xml")

local bluemedicine_recipe = AddRecipe("bluemedicine",
{GLOBAL.Ingredient("spidergland", 1), GLOBAL.Ingredient("blue_cap", 3)},
choppertab, TECH.NONE,
nil, nil, nil, nil, nil,
"images/inventoryimages/bluemedicine.xml", "bluemedicine.tex")
bluemedicine_recipe.tagneeded = false
bluemedicine_recipe.builder_tag = "chopper_builder"
bluemedicine_recipe.atlas = resolvefilepath("images/inventoryimages/bluemedicine.xml")

-- The character select screen lines
STRINGS.CHARACTER_TITLES.chopper = "�ǰ�."
STRINGS.CHARACTER_NAMES.chopper = "Chopper"
STRINGS.CHARACTER_DESCRIPTIONS.chopper = "*���ƺ�������\n*��ʹ�ø���ҩ��\n*���ᾪ������������г��."
STRINGS.CHARACTER_QUOTES.chopper = "\"��������ɫ.�������Ǹ���ҽ��\""

-- Custom speech strings
STRINGS.CHARACTERS.CHOPPER = require "speech_chopper"

-- The character's name as appears in-game 
STRINGS.NAMES.CHOPPER = "Chopper"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.CHOPPER = 
{
	GENERIC = "It's Chopper!",
	ATTACKER = "Chopper, what are you doing?",
	MURDERER = "Agh! Murderer!",
	REVIVER = "Chopper is such a good guy.",
	GHOST = "Chopper... Are you okay...?",
}


AddMinimapAtlas("images/map_icons/chopper.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("chopper", "MALE")

