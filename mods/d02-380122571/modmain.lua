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
STRINGS.CHARACTER_TITLES.reaper = "����"
STRINGS.CHARACTER_NAMES.reaper = "Reaper"
STRINGS.CHARACTER_DESCRIPTIONS.reaper = "*�Դ��������� \n*�ڰ������� "
STRINGS.CHARACTER_QUOTES.reaper = "\"yy89856191Ƶ������.\""

-- Custom speech strings
STRINGS.CHARACTERS.REAPER = require "speech_reaper"

-- The character's name as appears in-game 
STRINGS.NAMES.REAPER = "����"

STRINGS.NAMES.SCYTHE = "��������"
STRINGS.RECIPE_DESC.SCYTHE = "�Ҹ��������ļ���"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.SCYTHE = "�����ҵ�����!"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.REAPER = 
{
	GENERIC = "�����������",
	ATTACKER = "�������ܿ���...",
	MURDERER = "������!",
	REVIVER = "��������.",
	GHOST = "��ƨ",
}

-- Let the game know character is male, female, or robot
table.insert(GLOBAL.CHARACTER_GENDERS.MALE, "reaper")

AddMinimapAtlas("images/map_icons/reaper.xml")
AddModCharacter("reaper")