local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
local RECIPETABS = GLOBAL.RECIPETABS
local Ingredient = GLOBAL.Ingredient
local resolvefilepath = GLOBAL.resolvefilepath
local Recipe = GLOBAL.Recipe
local TECH = GLOBAL.TECH
local containers = require("containers")
------
--modimport("libs/env.lua")
--use "data/actions/init"
--use "data/components/init"
------
local oldwidgetsetup = containers.widgetsetup
containers.widgetsetup = function(container, prefab)
    if not prefab and container.inst.prefab == "eardress" then prefab = "icepack" end
    oldwidgetsetup(container, prefab)
end

PrefabFiles = {
	"ear",
	"earpop",
	"eardress",
	"earhat",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/ear.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/ear.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/ear.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/ear.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/ear_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/ear_silho.xml" ),

    Asset( "IMAGE", "bigportraits/ear.tex" ),
    Asset( "ATLAS", "bigportraits/ear.xml" ),
	
	Asset( "IMAGE", "images/map_icons/ear.tex" ),
	Asset( "ATLAS", "images/map_icons/ear.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ear.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ear.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_ear.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_ear.xml" ),

    Asset( "IMAGE", "images/inventoryimages/earpop.tex" ),
	Asset( "ATLAS", "images/inventoryimages/earpop.xml" ),

	Asset( "IMAGE", "images/inventoryimages/eardress.tex" ),
	Asset( "ATLAS", "images/inventoryimages/eardress.xml" ),

	Asset( "IMAGE", "images/inventoryimages/earhat.tex" ),
	Asset( "ATLAS", "images/inventoryimages/eardress.xml" ),

}

-- The character select screen lines
STRINGS.CHARACTER_TITLES.ear = "萌萌的耳朵"
STRINGS.CHARACTER_NAMES.ear = "耳朵"
STRINGS.CHARACTER_DESCRIPTIONS.ear = "*20%几率吃肉升级,吃任何食物有9%几率恢复满精神和血量 \n*有着可爱衣服帽子和好吃的棒棒糖 \n*逃跑快 害怕黑暗"
STRINGS.CHARACTER_QUOTES.ear = "\"萌萌的耳朵!\""

GLOBAL.STRINGS.NAMES.EARPOP = "耳朵的美味食物"
GLOBAL.STRINGS.RECIPE_DESC.EARPOP = "真赞！"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.EARPOP = "抱歉！我需要一些东西"

GLOBAL.STRINGS.NAMES.EARDRESS = "耳朵萌萌达衣服"
GLOBAL.STRINGS.RECIPE_DESC.EARDRESS = "萌萌达衣服"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.EARDRESS = "抱歉！我需要一些东西"

GLOBAL.STRINGS.NAMES.EARHAT = "耳朵的魔法帽子"
GLOBAL.STRINGS.RECIPE_DESC.EARHAT = "神奇的魔法！"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.EARHAT = "抱歉！我需要一些东西"

-- Custom speech strings
STRINGS.CHARACTERS.EAR = require "speech_ear"

-- The character's name as appears in-game 
STRINGS.NAMES.EAR = "Ear"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.EAR = 
{
	GENERIC = "It's Ear!",
	ATTACKER = "That Ear looks shifty...",
	MURDERER = "Murderer!",
	REVIVER = "Ear, friend of ghosts.",
	GHOST = "Ear could use a heart.",
}

local earpop_recipe = AddRecipe("earpop", 
{GLOBAL.Ingredient("butterflywings", 2), GLOBAL.Ingredient("twigs", 2), GLOBAL.Ingredient("honey", 2)}, 
RECIPETABS.SURVIVAL, TECH.NONE, 
nil, nil, nil, nil, nil, 
"images/inventoryimages/earpop.xml", "earpop.tex")
earpop_recipe.tagneeded = false
earpop_recipe.builder_tag = "ear_builder"
earpop_recipe.atlas = resolvefilepath("images/inventoryimages/earpop.xml")

local eardress_recipe = AddRecipe("eardress", 
{GLOBAL.Ingredient("beefalowool", 2), GLOBAL.Ingredient("ice", 2), GLOBAL.Ingredient("feather_crow", 2)}, 
RECIPETABS.DRESS, TECH.NONE, 
nil, nil, nil, nil, nil, 
"images/inventoryimages/eardress.xml", "eardress.tex")
eardress_recipe.tagneeded = false
eardress_recipe.builder_tag = "ear_builder"
eardress_recipe.atlas = resolvefilepath("images/inventoryimages/eardress.xml")

local earhat_recipe = AddRecipe("earhat", 
{GLOBAL.Ingredient("tentaclespots", 2), GLOBAL.Ingredient("livinglog", 2), GLOBAL.Ingredient("nightmarefuel", 2)}, 
RECIPETABS.MAGIC, TECH.MAGIC_TWO, 
nil, nil,nil, nil, nil, 
"images/inventoryimages/earhat.xml", "earhat.tex")
earhat_recipe.tagneeded = false
earhat_recipe.builder_tag = "ear_builder"
earhat_recipe.atlas = resolvefilepath("images/inventoryimages/earhat.xml")

function AddMap(inst)
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon( inst.prefab .. ".tex" )
end
AddPrefabPostInit("eardress", AddMap)
AddMinimapAtlas("images/inventoryimages/eardress.xml")
AddPrefabPostInit("earpop", AddMap)
AddMinimapAtlas("images/inventoryimages/earpop.xml")
AddPrefabPostInit("earhat", AddMap)
AddMinimapAtlas("images/inventoryimages/earhat.xml")

AddMinimapAtlas("images/map_icons/ear.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("ear", "FEMALE")

