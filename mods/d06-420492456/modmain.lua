-- Import the lib use.
modimport("libs/env.lua")

-- Actions Initialization.
use "data/actions/init"

-- Component Initialization.
use "data/components/init"

PrefabFiles = {
	"sasuke","wand","hat_bee_bw",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/sasuke.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/sasuke.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/sasuke.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/sasuke.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/sasuke_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/sasuke_silho.xml" ),

    Asset( "IMAGE", "bigportraits/sasuke.tex" ),
    Asset( "ATLAS", "bigportraits/sasuke.xml" ),
	
	Asset( "IMAGE", "images/map_icons/sasuke.tex" ),
	Asset( "ATLAS", "images/map_icons/sasuke.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_sasuke.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_sasuke.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_sasuke.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_sasuke.xml" ),

}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

-- The character select screen lines
STRINGS.CHARACTER_TITLES.sasuke = "左助"
STRINGS.CHARACTER_NAMES.sasuke = "Sasuke"
STRINGS.CHARACTER_DESCRIPTIONS.sasuke = "*自带武器，伤害50!\n*自带写轮眼，装备上无比强大!"
STRINGS.CHARACTER_QUOTES.sasuke = "\"我要复仇，这是一定的!\""

-- Custom speech strings
STRINGS.CHARACTERS.SASUKE = require "speech_sasuke"

-- The character's name as appears in-game 
STRINGS.NAMES.SASUKE = "Sasuke"

STRINGS.NAMES.WAND = "草薙剑"
STRINGS.RECIPE_DESC.WAND = "Looks very sharp"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.WADN = "Feel my power!"

STRINGS.NAMES.HAT_BEE_BW = "写轮眼"
STRINGS.RECIPE_DESC.HAT_BEE_BW = "Looks very strong!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.HAT_BEE_BW = "Feel my power!"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.SASUKE = 
{
	GENERIC = "It's Sasuke!",
	ATTACKER = "That Sasuke looks mad...",
	MURDERER = "Murderer!",
	REVIVER = "Sasuke, friend of ghosts.",
	GHOST = "Sasuke could use a heart.",
}


AddMinimapAtlas("images/map_icons/sasuke.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("sasuke", "MALE")

