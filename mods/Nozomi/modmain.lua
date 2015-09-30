PrefabFiles = {
	"no", "abigail", "abigail_flower",
}
Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/no.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/no.xml" ),
    Asset( "IMAGE", "images/selectscreen_portraits/no.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/no.xml" ),
    Asset( "IMAGE", "images/selectscreen_portraits/no_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/no_silho.xml" ),
    Asset( "IMAGE", "bigportraits/no.tex" ),
    Asset( "ATLAS", "bigportraits/no.xml" ),	
	Asset("IMAGE", "images/no.tex"),
    Asset("ATLAS", "images/no.xml"),	
	Asset( "IMAGE", "images/avatars/avatar_no.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_no.xml" ),	
	Asset( "IMAGE", "images/avatars/avatar_ghost_no.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_no.xml" ),


}
AddMinimapAtlas("images/no.xml")


GLOBAL.STRINGS.CHARACTER_TITLES.no = "Toujou Nozomi"
GLOBAL.STRINGS.CHARACTER_NAMES.no = "Toujou Nozomi"
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.no = " . \n Love Live School Idol"
GLOBAL.STRINGS.CHARACTER_QUOTES.no = "\".\""
local require = GLOBAL.require 
local STRINGS = GLOBAL.STRINGS

-- The character's name as appears in-game 
STRINGS.NAMES.NO = "Nozomi"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.NO = 
{
	GENERIC = "It's Nozomi!",
	ATTACKER = "That Nozomi looks cool...",
	MURDERER = "Murderer!",
	REVIVER = "Nozomi, friend of ghosts.",
	GHOST = "Nozomi could use a heart.",
}

-- Let the game know character is male, female, or robot
table.insert(GLOBAL.CHARACTER_GENDERS.FEMALE, "no")

--
---
------====================================
------====================================
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.NO = "Nozomi from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.NO = "Nozomi from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.NO = "Nozomi from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.NO = "Nozomi from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.NO = "Nozomi from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.NO = "Nozomi from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.NO = "Nozomi from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.NO = "Nozomi from love live school idol. "
------====================================
------====================================
---
--



STRINGS.CHARACTERS.NO=require "speech_no"
GLOBAL.STRINGS.NAMES.NO = "Nozomi"
AddModCharacter("no", "FEMALE")