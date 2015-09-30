PrefabFiles = {
	"eli",
}
Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/eli.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/eli.xml" ),
    Asset( "IMAGE", "images/selectscreen_portraits/eli.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/eli.xml" ),
    Asset( "IMAGE", "images/selectscreen_portraits/eli_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/eli_silho.xml" ),
    Asset( "IMAGE", "bigportraits/eli.tex" ),
    Asset( "ATLAS", "bigportraits/eli.xml" ),	
	Asset("IMAGE", "images/eli.tex"),
    Asset("ATLAS", "images/eli.xml"),	
	Asset( "IMAGE", "images/avatars/avatar_eli.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_eli.xml" ),	
	Asset( "IMAGE", "images/avatars/avatar_ghost_eli.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_eli.xml" ),


}
AddMinimapAtlas("images/eli.xml")


GLOBAL.STRINGS.CHARACTER_TITLES.eli = "Ayase Eli"
GLOBAL.STRINGS.CHARACTER_NAMES.eli = "Ayase Eli"
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.eli = " Student Council President. \n Love Live School Idol"
GLOBAL.STRINGS.CHARACTER_QUOTES.eli = "\"Harasho\""
local require = GLOBAL.require 
local STRINGS = GLOBAL.STRINGS

-- The character's name as appears in-game 
STRINGS.NAMES.ELI = "Eli"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.ELI = 
{
	GENERIC = "It's Eli!",
	ATTACKER = "That Eli looks cool...",
	MURDERER = "Murderer!",
	REVIVER = "Eli, friend of ghosts.",
	GHOST = "Eli could use a heart.",
}

-- Let the game know character is male, female, or robot
table.insert(GLOBAL.CHARACTER_GENDERS.FEMALE, "eli")

--
---
------====================================
------====================================
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.ELI = "Eli from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.ELI = "Eli from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.ELI = "Eli from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.ELI = "Eli from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.ELI = "Eli from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.ELI = "Eli from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.ELI = "Eli from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.ELI = "Eli from love live school idol. "
------====================================
------====================================
---
--



STRINGS.CHARACTERS.ELI=require "speech_eli"
GLOBAL.STRINGS.NAMES.ELI = "Eli"
AddModCharacter("eli", "FEMALE")