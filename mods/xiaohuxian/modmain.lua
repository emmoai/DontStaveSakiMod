Recipe = GLOBAL.Recipe
local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
PrefabFiles = {
	"ear",
	"earpop",
	"eardress",
	"earhat",
	"icebee"
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/ear.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/ear.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/ear.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/ear.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/ear_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/ear_silho.xml" ),

    Asset( "IMAGE", "bigportraits/ear.tex" ),
    Asset( "ATLAS", "bigportraits/ear.xml" ),
	
	Asset( "IMAGE", "images/map_icons/ear.tex" ),
	Asset( "ATLAS", "images/map_icons/ear.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ear.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ear.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_ear.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_ear.xml" ),

    Asset( "IMAGE", "images/inventoryimages/earpop.tex" ),
	Asset( "ATLAS", "images/inventoryimages/earpop.xml" ),

	Asset( "IMAGE", "images/inventoryimages/eardress.tex" ),
	Asset( "ATLAS", "images/inventoryimages/eardress.xml" ),

	Asset( "IMAGE", "images/inventoryimages/earhat.tex" ),
	Asset( "ATLAS", "images/inventoryimages/eardress.xml" ),

}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

-- The character select screen lines
STRINGS.CHARACTER_TITLES.ear = "The Millennium Fox"
STRINGS.CHARACTER_NAMES.ear = "Wharang"
STRINGS.CHARACTER_DESCRIPTIONS.ear = "*no Pet fox Miho follow you.\n*Upgrade to eat meat, Get to the  Soul Heart!\n*no Fox tail and full moon gives you the power."
STRINGS.CHARACTER_QUOTES.ear = "\"Will you play with me?\""

GLOBAL.STRINGS.NAMES.EARPOP = "Ear's Delicious Food"
GLOBAL.STRINGS.RECIPE_DESC.EARPOP = "So good!"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.EARPOP = "sorry! need some items!"

GLOBAL.STRINGS.NAMES.EARDRESS = "Ear's Pretty Dress"
GLOBAL.STRINGS.RECIPE_DESC.EARDRESS = "What a pretty dress"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.EARDRESS = "sorry! need some items!"

GLOBAL.STRINGS.NAMES.EARHAT = "Ear's Magic Hat"
GLOBAL.STRINGS.RECIPE_DESC.EARHAT = "Power Magic!"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.EARHAT = "sorry! need some items!"

-- Custom speech strings
STRINGS.CHARACTERS.EAR = require "speech_ear"

-- The character's name as appears in-game 
STRINGS.NAMES.EAR = "Ear"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.EAR = 
{
	GENERIC = "It's Ear!",
	ATTACKER = "That Ear looks shifty...",
	MURDERER = "Murderer!",
	REVIVER = "Ear, friend of ghosts.",
	GHOST = "Ear could use a heart.",
}

-- function AddMap(inst)
-- 	local minimap = inst.entity:AddMiniMapEntity()
-- 	minimap:SetIcon( inst.prefab .. ".tex" )
-- end
-- AddPrefabPostInit("eardress", AddMap)
-- AddMinimapAtlas("images/inventoryimages/eardress.xml")
-- AddPrefabPostInit("earpop", AddMap)
-- AddMinimapAtlas("images/inventoryimages/earpop.xml")
-- AddPrefabPostInit("earhat", AddMap)
-- AddMinimapAtlas("images/inventoryimages/earhat.xml")
-- AddPrefabPostInit("icebee")
local function charm()
    if GLOBAL.ThePlayer and GLOBAL.ThePlayer.prefab == "ear" then
        GLOBAL.TheNet:SendSlashCmdToServer("/wave", true)
    end
end
GLOBAL.TheInput:AddKeyUpHandler(GetModConfigData("CHARMKEY"), charm)

local function disenchant()
    if GLOBAL.ThePlayer and GLOBAL.ThePlayer.prefab == "ear" then
        GLOBAL.TheNet:SendSlashCmdToServer("/goaway", true)
    end
end

function AddMap(inst)
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon( inst.prefab .. ".tex" )
end

AddMinimapAtlas("images/map_icons/ear.xml")

--recipe--

local earpop = AddRecipe("earpop", {GLOBAL.Ingredient("ice", 2), GLOBAL.Ingredient("twigs", 2), GLOBAL.Ingredient("honey", 2)}, RECIPETABS.FARM, {SCIENCE = 0})
earpop.atlas = "images/inventoryimages/earpop.xml"
earpop.sortkey = 1

local eardress = AddRecipe("eardress", {GLOBAL.Ingredient("feather_robin", 3), GLOBAL.Ingredient("feather_robin_winter", 9),GLOBAL.Ingredient("papyrus", 3)}, RECIPETABS.DRESS, {SCIENCE = 0})
eardress.atlas = "images/inventoryimages/eardress.xml"
eardress.sortkey = 2

local earhat = AddRecipe("earhat", {GLOBAL.Ingredient("tophat", 1), GLOBAL.Ingredient("nightmarefuel", 6), GLOBAL.Ingredient("pigskin", 1)}, RECIPETABS.DRESS, {SCIENCE = 0})
earhat.atlas = "images/inventoryimages/earhat.xml"
earhat.sortkey = 1

AddModCharacter("ear", "FEMALE")

GLOBAL.TheInput:AddKeyUpHandler(GetModConfigData("DISENCHANTKEY"), disenchant)

