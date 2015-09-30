PrefabFiles = {
	"fiddlesticks",
	"scare_scythe"
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/fiddlesticks.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/fiddlesticks.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/fiddlesticks.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/fiddlesticks.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/fiddlesticks_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/fiddlesticks_silho.xml" ),

    Asset( "IMAGE", "bigportraits/fiddlesticks.tex" ),
    Asset( "ATLAS", "bigportraits/fiddlesticks.xml" ),
	
	Asset( "IMAGE", "images/map_icons/fiddlesticks.tex" ),
	Asset( "ATLAS", "images/map_icons/fiddlesticks.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_fiddlesticks.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_fiddlesticks.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_fiddlesticks.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_fiddlesticks.xml" ),

}

local function HealthPostInit(self)
	local OldRecalculatePenalty = self.RecalculatePenalty
	local function RecalculatePenalty(self, forceupdatewidget)
		local mult = GLOBAL.TUNING.REVIVE_HEALTH_PENALTY_AS_MULTIPLE_OF_EFFIGY
		mult = mult * GLOBAL.TUNING.EFFIGY_HEALTH_PENALTY
		local maxrevives = (self.maxhealth - 40)/mult
		if self.numrevives > maxrevives then
			self.numrevives = maxrevives
		end
		OldRecalculatePenalty(self, forceupdatewidget)
	end
	self.RecalculatePenalty = RecalculatePenalty
end

AddComponentPostInit('health', HealthPostInit) 



local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS


-- The character select screen lines
STRINGS.CHARACTER_TITLES.fiddlesticks = "ĩ��ʹ��"
STRINGS.CHARACTER_NAMES.fiddlesticks = "Fiddlesticks"
STRINGS.CHARACTER_DESCRIPTIONS.fiddlesticks = "*��������LOL���֮��,�˺�40\n*������λ�ø���һ�����������\n*��ϲ��������죬Ӧ�þ��ǲ�ϲ���Ȱ�"
STRINGS.CHARACTER_QUOTES.fiddlesticks = "\"����.Ӣ������.�ķѵ����\""

-- Custom speech strings
STRINGS.CHARACTERS.FIDDLESTICKS = require "speech_fiddlesticks"

-- The character's name as appears in-game 
STRINGS.NAMES.FIDDLESTICKS = "Fiddlesticks"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.FIDDLESTICKS = 
{
	GENERIC = "Awh.. A scarecrow ?",
	ATTACKER = "That Fiddlesticks looks shifty...",
	MURDERER = "Murderer!",
	REVIVER = "Fiddlesticks, friend of ghosts.",
	GHOST = "Fiddlesticks looks scarier.",
}

-- Spawn des oiseaux 


-- Recette Faux
local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local STRINGS = GLOBAL.STRINGS
local TECH = GLOBAL.TECH

STRINGS.NAMES.SCARE_SCYTHE = "���֮��"
STRINGS.RECIPE_DESC.SCARE_SCYTHE = "A mysterious scarecrow scythe."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.SCARE_SCYTHE = "A little scary.. no ?"

AddRecipe("scare_scythe", { Ingredient("log", 2), Ingredient("rope", 1), Ingredient("razor", 1)}, RECIPETABS.WAR,  TECH.NONE, nil, nil, nil, nil, "scarecrow", "images/inventoryimages/scare_scythe.xml", "scare_scythe.tex")

AddMinimapAtlas("images/map_icons/fiddlesticks.xml")
-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("fiddlesticks", "MALE")

