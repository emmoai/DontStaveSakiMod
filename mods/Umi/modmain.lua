 -- Import the lib use.
modimport("libs/env.lua")

-- Actions Initialization.
use "data/actions/init"

-- Component Initialization.
use "data/components/init"

PrefabFiles = {
	"umi", "rosebow", "madoka_projectile",
}
Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/umi.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/umi.xml" ),
    Asset( "IMAGE", "images/selectscreen_portraits/umi.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/umi.xml" ),
    Asset( "IMAGE", "images/selectscreen_portraits/umi_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/umi_silho.xml" ),
    Asset( "IMAGE", "bigportraits/umi.tex" ),
    Asset( "ATLAS", "bigportraits/umi.xml" ),	
	Asset( "IMAGE", "images/umi.tex"),
    Asset( "ATLAS", "images/umi.xml"),	
	Asset( "IMAGE", "images/avatars/avatar_umi.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_umi.xml" ),	
	Asset( "IMAGE", "images/avatars/avatar_ghost_umi.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_umi.xml" ),
	Asset( "IMAGE", "images/map_icons/rosebow.tex" ),
	Asset( "ATLAS", "images/map_icons/rosebow.xml" ),

}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
local Recipe = GLOBAL.Recipe
local RECIPETABS = GLOBAL.RECIPETABS
local TECH = GLOBAL.TECH
local resolvefilepath = GLOBAL.resolvefilepath
 
STRINGS.NAMES.ROSEBOW = "Umi's Love Arrow"

AddMinimapAtlas("images/umi.xml")

STRINGS.NAMES.ROSEBOW = "lovearrow"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.ROSEBOW = "Shoot love arrow at you."

-- Quick check if RoG is enabled
local rogEnabled = function()
	return GLOBAL.IsDLCEnabled(GLOBAL.REIGN_OF_GIANTS)
end

--custom recipe
	AddRecipe("rosebow", { Ingredient("feather_crow", 1), Ingredient("feather_robin", 1),Ingredient("twigs", 9) }, RECIPETABS.WAR, TECH.NONE, nil, nil, nil, nil, "umi", "images/inventoryimages/rosebow.xml", "rosebow.tex")
	STRINGS.RECIPE_DESC.rosebow = "Umi's Love Arrow."

GLOBAL.STRINGS.CHARACTER_TITLES.umi = "Sonoda Umi"
GLOBAL.STRINGS.CHARACTER_NAMES.umi = "Sonoda Umi"
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.umi = " Beyond leader of Love Live. \n Love Live School Idol"
GLOBAL.STRINGS.CHARACTER_QUOTES.umi = "\"Love arrow shoot!!!\""


-- The character's name as appears in-game 
STRINGS.NAMES.UMI = "Umi"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.UMI = 
{
	GENERIC = "It's Umi!",
	ATTACKER = "That Umi looks cool...",
	MURDERER = "Murderer!",
	REVIVER = "Umi, friend of ghosts.",
	GHOST = "Umi could use a heart.",
}

-- Let the game know character is male, female, or robot
table.insert(GLOBAL.CHARACTER_GENDERS.FEMALE, "umi")

--
---
------====================================
------====================================
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.UMI = "Umi from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.UMI = "Umi from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.UMI = "Umi from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.UMI = "Umi from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.UMI = "Umi from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.UMI = "Umi from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.UMI = "Umi from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.UMI = "Umi from love live school idol. "
------====================================
------====================================
---
--



STRINGS.CHARACTERS.UMI=require "speech_umi"
GLOBAL.STRINGS.NAMES.UMI = "Umi"
AddModCharacter("umi", "FEMALE")