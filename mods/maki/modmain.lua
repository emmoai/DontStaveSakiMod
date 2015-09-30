PrefabFiles = {
	"ma",
}
Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/ma.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/ma.xml" ),
    Asset( "IMAGE", "images/selectscreen_portraits/ma.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/ma.xml" ),
    Asset( "IMAGE", "images/selectscreen_portraits/ma_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/ma_silho.xml" ),
    Asset( "IMAGE", "bigportraits/ma.tex" ),
    Asset( "ATLAS", "bigportraits/ma.xml" ),	
	Asset("IMAGE", "images/ma.tex"),
    Asset("ATLAS", "images/ma.xml"),	
	Asset( "IMAGE", "images/avatars/avatar_ma.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ma.xml" ),	
	Asset( "IMAGE", "images/avatars/avatar_ghost_ma.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_ma.xml" ),


}
AddMinimapAtlas("images/ma.xml")


GLOBAL.STRINGS.CHARACTER_TITLES.ma = "Nishikino Maki"
GLOBAL.STRINGS.CHARACTER_NAMES.ma = "Nishikino Maki"
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.ma = " Tsundere Ojou-sama. \n Love Live School Idol"
GLOBAL.STRINGS.CHARACTER_QUOTES.ma = "\"I don't know.\""
local require = GLOBAL.require 
local STRINGS = GLOBAL.STRINGS


-- The character's name as appears in-game 
STRINGS.NAMES.MA = "Maki"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MA = 
{
	GENERIC = "It's Maki!",
	ATTACKER = "That Maki looks cool...",
	MURDERER = "Murderer!",
	REVIVER = "Maki, friend of ghosts.",
	GHOST = "Maki could use a heart.",
}

-- Let the game know character is male, female, or robot
table.insert(GLOBAL.CHARACTER_GENDERS.FEMALE, "ma")
--
---
------====================================
------====================================
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.MA = "Maki from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.MA = "Maki from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.MA = "Maki from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.MA = "Maki from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.MA = "Maki from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.MA = "Maki from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.MA = "Maki from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.MA = "Maki from love live school idol. "
------====================================
------====================================
---
--



STRINGS.CHARACTERS.MA=require "speech_ma"
GLOBAL.STRINGS.NAMES.MA = "Maki"
AddModCharacter("ma", "FEMALE")