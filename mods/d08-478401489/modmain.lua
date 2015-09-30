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
STRINGS.CHARACTER_TITLES.grom = "格罗姆·地狱咆哮"
STRINGS.CHARACTER_NAMES.grom = "Grom"
STRINGS.CHARACTER_DESCRIPTIONS.grom = "*来自魔兽世界的人物\n*酋长的战歌\n*格罗姆才是神"
STRINGS.CHARACTER_QUOTES.grom = "\"我们是奴隶但终将征服他们\""

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

STRINGS.NAMES.WAND = "血吼"

