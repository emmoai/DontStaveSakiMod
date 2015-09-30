PrefabFiles = {
	"xenomorph",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/xenomorph.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/xenomorph.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/xenomorph.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/xenomorph.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/xenomorph_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/xenomorph_silho.xml" ),

    Asset( "IMAGE", "bigportraits/xenomorph.tex" ),
    Asset( "ATLAS", "bigportraits/xenomorph.xml" ),
	
	Asset( "IMAGE", "images/map_icons/xenomorph.tex" ),
	Asset( "ATLAS", "images/map_icons/xenomorph.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_xenomorph.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_xenomorph.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_xenomorph.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_xenomorph.xml" ),

}
local function NightVision(inst)
    inst.Light:Enable(GetModConfigData("NightVision"))
end	
AddPrefabPostInit("xenomorph", NightVision)

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

-- The character select screen lines
STRINGS.CHARACTER_TITLES.xenomorph = "异形"
STRINGS.CHARACTER_NAMES.xenomorph = "Xenomorph"
STRINGS.CHARACTER_DESCRIPTIONS.xenomorph = "*速度非常快\n*脑残只有60，但黑夜不掉脑残\n*也是一个只吃肉的东西"
STRINGS.CHARACTER_QUOTES.xenomorph = "\"章凡是神!\""

-- Custom speech strings
STRINGS.CHARACTERS.XENOMORPH = require "speech_xenomorph"

-- The character's name as appears in-game 
STRINGS.NAMES.XENOMORPH = "Xenomorph"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.XENOMORPH = 
{
	GENERIC = "It's Xenomorph!",
	ATTACKER = "That Xenomorph looks shifty...",
	MURDERER = "Murderer!",
	REVIVER = "Xenomorph, friend of ghosts.",
	GHOST = "Xenomorph could use a heart.",
}


AddMinimapAtlas("images/map_icons/xenomorph.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("xenomorph", "FEMALE")

