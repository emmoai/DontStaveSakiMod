PrefabFiles = {
	"law", "lawhat", "lawsword", "lawroom", "lawreviver", 
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/law.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/law.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/law.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/law.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/law_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/law_silho.xml" ),

    Asset( "IMAGE", "bigportraits/law.tex" ),
    Asset( "ATLAS", "bigportraits/law.xml" ),
	
	Asset( "IMAGE", "images/map_icons/law.tex" ),
	Asset( "ATLAS", "images/map_icons/law.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_law.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_law.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_law.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_law.xml" ),
	
	Asset( "ATLAS", "images/hud/lawreviver.xml" ),

}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

local resolvefilepath = GLOBAL.resolvefilepath

local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local Recipe = GLOBAL.Recipe
local TECH = GLOBAL.TECH
local STRINGS = GLOBAL.STRINGS

STRINGS.NAMES.LAWHAT = "罗的帽子"
STRINGS.NAMES.LAWSWORD = "鬼哭"
STRINGS.NAMES.LAWROOM = "Room扫描"

STRINGS.CHARACTERS.GENERIC.DESCRIBE.LAWHAT= "An old hat that holds many memories."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.LAWSWORD= "A sword wielded by a deadly surgeon."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.LAWROOM= "A weird ability to switch agaisnt your enemies."

STRINGS.RECIPE_DESC.LAWREVIVER = "A better telltale heart." 
GLOBAL.STRINGS.NAMES.LAWREVIVER = "Law's Heart Ability"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.LAWREVIVER = "A Certain Surgeons Signature Utensil"

lawstab = AddRecipeTab("Law", 998, "images/hud/lawreviver.xml", "lawreviver.tex", "law_builder")

local lawreviver_recipe = AddRecipe("lawreviver",
{GLOBAL.Ingredient("spidergland", 2), GLOBAL.Ingredient("cutgrass", 6)},
lawstab, TECH.NONE,
nil, nil, nil, nil, nil,
"images/inventoryimages/lawreviver.xml", "lawreviver.tex")
lawreviver_recipe.tagneeded = false
lawreviver_recipe.builder_tag = "law_builder"
lawreviver_recipe.atlas = resolvefilepath("images/inventoryimages/lawreviver.xml")

local function HealthPostInit(self)
	local OldRecalculatePenalty = self.RecalculatePenalty
	local function RecalculatePenalty(self, forceupdatewidget)
		local mult = GLOBAL.TUNING.REVIVE_HEALTH_PENALTY_AS_MULTIPLE_OF_EFFIGY
		mult = mult * GLOBAL.TUNING.EFFIGY_HEALTH_PENALTY
		local maxrevives = (self.maxhealth - 50)/mult
		if self.numrevives > maxrevives then
			self.numrevives = maxrevives
		end
		OldRecalculatePenalty(self, forceupdatewidget)
	end
	self.RecalculatePenalty = RecalculatePenalty
end

AddComponentPostInit('health', HealthPostInit) 

-- The character select screen lines
STRINGS.CHARACTER_TITLES.law = "死亡外科医生"
STRINGS.CHARACTER_NAMES.law = "Law"
STRINGS.CHARACTER_DESCRIPTIONS.law = "*'房间的能力 \n* HP 再生\n*YY89856191汉化"
STRINGS.CHARACTER_QUOTES.law = "\"海贼王人物.特拉法尔加.罗.\""

-- Custom speech strings
STRINGS.CHARACTERS.LAW = require "speech_law"

-- The character's name as appears in-game 
STRINGS.NAMES.LAW = "Law"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.LAW = 
{
	GENERIC = "It's Law!",
	ATTACKER = "That Law looks shifty...",
	MURDERER = "Murderer!",
	REVIVER = "Law, friend of ghosts.",
	GHOST = "Law could use a heart.",
}


AddMinimapAtlas("images/map_icons/law.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("law", "MALE")

