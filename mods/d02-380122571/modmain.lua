local require = GLOBAL.require
local Ingredient = GLOBAL.Ingredient
local STRINGS = GLOBAL.STRINGS
local ACTIONS = GLOBAL.ACTIONS
local Action = GLOBAL.Action

PrefabFiles = {
	"reaper",
	"scythe",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/reaper.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/reaper.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/reaper.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/reaper.xml" ),

    Asset( "IMAGE", "bigportraits/reaper.tex" ),
    Asset( "ATLAS", "bigportraits/reaper.xml" ),
	
	Asset( "IMAGE", "images/map_icons/reaper.tex" ),
	Asset( "ATLAS", "images/map_icons/reaper.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_reaper.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_reaper.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_reaper.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_reaper.xml" ),
	
	Asset("ANIM", "anim/scythe.zip"),
	Asset("ANIM", "anim/swap_scythe.zip"),
	Asset("IMAGE", "images/inventoryimages/scythe.tex"),
	Asset("ATLAS", "images/inventoryimages/scythe.xml"),
}

-- The character select screen lines
STRINGS.CHARACTER_TITLES.reaper = "死神"
STRINGS.CHARACTER_NAMES.reaper = "Reaper"
STRINGS.CHARACTER_DESCRIPTIONS.reaper = "*自带死神镰刀 \n*黑暗的主宰 "
STRINGS.CHARACTER_QUOTES.reaper = "\"yy89856191频道汉化.\""

-- Custom speech strings
STRINGS.CHARACTERS.REAPER = require "speech_reaper"

-- The character's name as appears in-game 
STRINGS.NAMES.REAPER = "死神"

STRINGS.NAMES.SCYTHE = "神器镰刀"
STRINGS.RECIPE_DESC.SCYTHE = "我感受了它的饥渴"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.SCYTHE = "感受我的力量!"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.REAPER = 
{
	GENERIC = "看起来很奇怪",
	ATTACKER = "看起来很可疑...",
	MURDERER = "刽子手!",
	REVIVER = "死神的灵魂.",
	GHOST = "放屁",
}

-- Let the game know character is male, female, or robot
table.insert(GLOBAL.CHARACTER_GENDERS.MALE, "reaper")

AddMinimapAtlas("images/map_icons/reaper.xml")
AddModCharacter("reaper")