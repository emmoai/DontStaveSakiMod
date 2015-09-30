PrefabFiles = {
	"grom",
	"wand",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/grom.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/grom.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/grom.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/grom.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/grom_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/grom_silho.xml" ),

    Asset( "IMAGE", "bigportraits/grom.tex" ),
    Asset( "ATLAS", "bigportraits/grom.xml" ),
	
	Asset( "IMAGE", "images/map_icons/grom.tex" ),
	Asset( "ATLAS", "images/map_icons/grom.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_grom.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_grom.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_grom.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_grom.xml" ),

}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

-- The character select screen lines
STRINGS.CHARACTER_TITLES.grom = "����ķ����������"
STRINGS.CHARACTER_NAMES.grom = "Grom"
STRINGS.CHARACTER_DESCRIPTIONS.grom = "*����ħ�����������\n*������ս��\n*����ķ������"
STRINGS.CHARACTER_QUOTES.grom = "\"������ū�����ս���������\""

-- Custom speech strings
STRINGS.CHARACTERS.GROM = require "speech_grom"

-- The character's name as appears in-game 
STRINGS.NAMES.GROM = "Grom"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.GROM = 
{
	GENERIC = "It's Grom!",
	ATTACKER = "That Grom looks shifty...",
	MURDERER = "Murderer!",
	REVIVER = "Grom, friend of ghosts.",
	GHOST = "Grom could use a heart.",
}


AddMinimapAtlas("images/map_icons/grom.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("grom", "MALE")

STRINGS.NAMES.WAND = "Ѫ��"

