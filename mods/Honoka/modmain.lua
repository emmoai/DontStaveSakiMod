PrefabFiles = {
	"ho",
	"jambun",
}
Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/ho.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/ho.xml" ),
    Asset( "IMAGE", "images/selectscreen_portraits/ho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/ho.xml" ),
    Asset( "IMAGE", "images/selectscreen_portraits/ho_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/ho_silho.xml" ),
    Asset( "IMAGE", "bigportraits/ho.tex" ),
    Asset( "ATLAS", "bigportraits/ho.xml" ),	
	Asset( "IMAGE", "images/ho.tex"),
    Asset( "ATLAS", "images/ho.xml"),	
	Asset( "IMAGE", "images/avatars/avatar_ho.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ho.xml" ),	
	Asset( "IMAGE", "images/avatars/avatar_ghost_ho.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_ho.xml" ),
	Asset("IMAGE", "images/inventoryimages/jambun.tex"),
	Asset("ATLAS", "images/inventoryimages/jambun.xml"),


}
AddMinimapAtlas("images/ho.xml")

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local STRINGS = GLOBAL.STRINGS
local TECH = GLOBAL.TECH

-- Custom Items
GLOBAL.STRINGS.NAMES.JAMBUN = "Bread roll with Jam"
GLOBAL.STRINGS.RECIPE_DESC.JAMBUN = "Honoka's favorite food!"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.JAMBUN= "It looks yummy."

--custom recipe
	AddRecipe("jambun", { Ingredient("seeds", 2), Ingredient("berries", 3), }, RECIPETABS.SURVIVAL, TECH.NONE, nil, nil, nil, nil, "ho", "images/inventoryimages/jambun.xml", "jambun.tex")
	STRINGS.RECIPE_DESC.JAMBUN = "Honoka's favorite food!"

GLOBAL.STRINGS.CHARACTER_TITLES.ho = "Kousaka Honoka"
GLOBAL.STRINGS.CHARACTER_NAMES.ho = "Kousaka Honoka"
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.ho = " Leader of Love Live. \n Love Live School Idol"
GLOBAL.STRINGS.CHARACTER_QUOTES.ho = "\"Today breads are delicious.\""
local require = GLOBAL.require 
local STRINGS = GLOBAL.STRINGS


-- The character's name as appears in-game 
STRINGS.NAMES.HO = "Honoka"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.HO = 
{
	GENERIC = "It's Honoka!",
	ATTACKER = "That Honoka looks cool...",
	MURDERER = "Murderer!",
	REVIVER = "Honoka, friend of ghosts.",
	GHOST = "Honoka could use a heart.",
}

-- Let the game know character is male, female, or robot
table.insert(GLOBAL.CHARACTER_GENDERS.FEMALE, "ho")
--
---
------====================================
------====================================
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.HO = "Honoka from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.HO = "Honoka from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.HO = "Honoka from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.HO = "Honoka from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.HO = "Honoka from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.HO = "Honoka from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.HO = "Honoka from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.HO = "Honoka from love live school idol. "
------====================================
------====================================
---
--



STRINGS.CHARACTERS.HO=require "speech_ho"
GLOBAL.STRINGS.NAMES.HO = "Honoka"
AddModCharacter("ho", "FEMALE")