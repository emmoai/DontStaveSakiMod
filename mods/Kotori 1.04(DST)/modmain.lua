 -- Import the lib use.
modimport("libs/env.lua")

-- Actions Initialization.
use "data/actions/init"

-- Component Initialization.
use "data/components/init"

PrefabFiles = {
	"kotori", "idol_suit", "hime_suit", "minalinsky", "minalinsky_mk2", "minalinsky_mk3",
}
Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/kotori.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/kotori.xml" ),
    Asset( "IMAGE", "images/selectscreen_portraits/kotori.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/kotori.xml" ),
    Asset( "IMAGE", "images/selectscreen_portraits/kotori_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/kotori_silho.xml" ),
    Asset( "IMAGE", "bigportraits/kotori.tex" ),
    Asset( "ATLAS", "bigportraits/kotori.xml" ),	
	Asset("IMAGE", "images/kotori.tex"),
    Asset("ATLAS", "images/kotori.xml"),	
	Asset( "IMAGE", "images/avatars/avatar_kotori.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_kotori.xml" ),	
	Asset( "IMAGE", "images/avatars/avatar_ghost_kotori.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_kotori.xml" ),
	Asset( "IMAGE", "images/inventoryimages/idol_suit.tex" ),
	Asset( "ATLAS", "images/inventoryimages/idol_suit.xml" ),
	Asset( "IMAGE", "images/inventoryimages/hime_suit.tex" ),
	Asset( "ATLAS", "images/inventoryimages/hime_suit.xml" ),
	Asset( "IMAGE", "images/inventoryimages/minalinsky.tex" ),
	Asset( "ATLAS", "images/inventoryimages/minalinsky.xml" ),
	Asset( "IMAGE", "images/inventoryimages/minalinsky_mk2.tex" ),
	Asset( "ATLAS", "images/inventoryimages/minalinsky_mk2.xml" ),
	Asset( "IMAGE", "images/inventoryimages/minalinsky_mk3.tex" ),
	Asset( "ATLAS", "images/inventoryimages/minalinsky_mk3.xml" ),

}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local STRINGS = GLOBAL.STRINGS
local TECH = GLOBAL.TECH

local containers = GLOBAL.require("containers")
local oldwidgetsetup = containers.widgetsetup
containers.widgetsetup = function(container, prefab)
    if not prefab and container.inst.prefab == "minalinsky" then
        prefab = "backpack"
    end
    oldwidgetsetup(container, prefab)
end

local containers = GLOBAL.require("containers")
local oldwidgetsetup = containers.widgetsetup
containers.widgetsetup = function(container, prefab)
    if not prefab and container.inst.prefab == "minalinsky_mk2" then
        prefab = "piggyback"
    end
    oldwidgetsetup(container, prefab)
end

local containers = GLOBAL.require("containers")
local oldwidgetsetup = containers.widgetsetup
containers.widgetsetup = function(container, prefab)
    if not prefab and container.inst.prefab == "minalinsky_mk3" then
        prefab = "krampus_sack"
    end
    oldwidgetsetup(container, prefab)
end

-- Custom speech strings
local require = GLOBAL.require
GLOBAL.STRINGS.CHARACTERS.KOTORI = require "speech_kotori"

-- Custom Items
STRINGS.NAMES.IDOL_SUIT = "Snow Halation Idol"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.IDOL_SUIT = "School Idol Festival!."
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.IDOL_SUIT = "School Idol Festival!."
STRINGS.CHARACTERS.WX78.DESCRIBE.IDOL_SUIT = "School Idol Festival!."
STRINGS.RECIPE_DESC.IDOL_SUIT = "Snow Halation Idol Costume!."

STRINGS.NAMES.HIME_SUIT = "Hime Idol"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.HIME_SUIT = "School Idol Festival!."
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.HIME_SUIT = "School Idol Festival!."
STRINGS.CHARACTERS.WX78.DESCRIBE.HIME_SUIT = "School Idol Festival!."
STRINGS.RECIPE_DESC.HIME_SUIT = "Hime Idol Costume!."

STRINGS.NAMES.MINALINSKY = "Minalinsky's Maid Costume!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MINALINSKY = "Legendary Maid in Akihabara!."
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.MINALINSKY = "Legendary Maid in Akihabara!."
STRINGS.CHARACTERS.WX78.DESCRIBE.MINALINSKY = "Legendary Maid in Akihabara!."
STRINGS.RECIPE_DESC.MINALINSKY = "Legendary Maid in Akihabara!."


STRINGS.NAMES.MINALINSKY_MK2 = "Minalinsky with Piggyback!."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MINALINSKY_MK2 = "Legendary Maid in Akihabara!."
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.MINALINSKY_MK2 = "Legendary Maid in Akihabara!."
STRINGS.CHARACTERS.WX78.DESCRIBE.MINALINSKY_MK2 = "Legendary Maid in Akihabara!."

STRINGS.NAMES.MINALINSKY_MK3 = "Minalinsky Maid Ultimate version!."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MINALINSKY_MK3 = "Legendary Maid in Akihabara!."
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.MINALINSKY_MK3 = "Legendary Maid in Akihabara!."
STRINGS.CHARACTERS.WX78.DESCRIBE.MINALINSKY_MK3 = "Legendary Maid in Akihabara!."

AddMinimapAtlas("images/kotori.xml")

--custom recipe
	AddRecipe("idol_suit", { Ingredient("beefalowool", 5), Ingredient("goldnugget", 3) }, RECIPETABS.DRESS, TECH.NONE, nil, nil, nil, nil, "kotori", "images/inventoryimages/idol_suit.xml", "idol_suit.tex")
	STRINGS.RECIPE_DESC.IDOL_SUIT = "Snow Halation Idol Costume!."

--custom recipe
	AddRecipe("hime_suit", { Ingredient("deerclops_eyeball", 1), Ingredient("bearger_fur", 1), Ingredient("dragon_scales", 3) }, RECIPETABS.DRESS, TECH.NONE, nil, nil, nil, nil, "kotori", "images/inventoryimages/hime_suit.xml", "hime_suit.tex")
	STRINGS.RECIPE_DESC.HIME_SUIT = "Hime Idol Costume!."

--custom recipe
	AddRecipe("minalinsky_mk2", { Ingredient("minalinsky", 1, "images/inventoryimages/minalinsky.xml"), Ingredient("pigskin", 5) , Ingredient("silk", 5), }, RECIPETABS.DRESS, TECH.NONE, nil, nil, nil, nil, "kotori", "images/inventoryimages/minalinsky_mk2.xml", "minalinsky_mk2.tex")
	STRINGS.RECIPE_DESC.MINALINSKY_MK2 = "Minalinsky with Piggyback!."

--custom recipe
	AddRecipe("minalinsky_mk3", { Ingredient("minalinsky_mk2", 1, "images/inventoryimages/minalinsky_mk2.xml"), Ingredient("goose_feather", 10), Ingredient("glommerwings", 2), }, RECIPETABS.DRESS, TECH.NONE, nil, nil, nil, nil, "kotori", "images/inventoryimages/minalinsky_mk3.xml", "minalinsky_mk3.tex")
	STRINGS.RECIPE_DESC.MINALINSKY_MK3 = "Minalinsky Maid Ultimate version!."

-- The character's name as appears in-game 
STRINGS.NAMES.KOTORI = "Kotori"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.KOTORI = 
{
	GENERIC = "It's Kotori!",
	ATTACKER = "That Kotori looks cool...",
	MURDERER = "Murderer!",
	REVIVER = "Kotori, friend of ghosts.",
	GHOST = "Kotori could use a heart.",
}

GLOBAL.STRINGS.CHARACTER_TITLES.kotori = "Minami Kotori"
GLOBAL.STRINGS.CHARACTER_NAMES.kotori = "Kotori"
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.kotori = "*School Idol's designer. \n Love Live School Idol"
GLOBAL.STRINGS.CHARACTER_QUOTES.kotori = "\"Kotori What!.\""
local require = GLOBAL.require 
local STRINGS = GLOBAL.STRINGS

-- Let the game know character is male, female, or robot
table.insert(GLOBAL.CHARACTER_GENDERS.FEMALE, "kotori")

--
---
------====================================
------====================================
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.KOTORI = "Kotori from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.KOTORI = "Kotori from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.KOTORI = "Kotori from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.KOTORI = "Kotori from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.KOTORI = "Kotori from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.KOTORI = "Kotori from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.KOTORI = "Kotori from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.KOTORI = "Kotori from love live school idol. "
------====================================
------====================================
---
--



STRINGS.CHARACTERS.kotori=require "speech_kotori"
GLOBAL.STRINGS.NAMES.KOTORI = "Kotori"
AddModCharacter("kotori", "FEMALE")