PrefabFiles = {
	"suika",
	"spellcards"
}

Assets = {
    Asset("ANIM", "anim/spellcard.zip"),

    Asset( "IMAGE", "images/saveslot_portraits/suika.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/suika.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/suika.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/suika.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/suika_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/suika_silho.xml" ),

    Asset( "IMAGE", "bigportraits/suika.tex" ),
    Asset( "ATLAS", "bigportraits/suika.xml" ),
	
	Asset( "IMAGE", "images/map_icons/suika.tex" ),
	Asset( "ATLAS", "images/map_icons/suika.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_suika.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_suika.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_suika.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_suika.xml" ),
	
	Asset( "IMAGE", "images/inventoryimages/card_missingpower.tex" ),
	Asset( "ATLAS", "images/inventoryimages/card_missingpower.xml" ),
	Asset( "IMAGE", "images/inventoryimages/card_missingppower.tex" ),
	Asset( "ATLAS", "images/inventoryimages/card_missingppower.xml" ),
	Asset( "IMAGE", "images/inventoryimages/card_throwingmt.tex" ),
	Asset( "ATLAS", "images/inventoryimages/card_throwingmt.xml" ),
	
	Asset( "IMAGE", "images/hud/tab_cards.tex" ),
	Asset( "ATLAS", "images/hud/tab_cards.xml" ),
		
	Asset( "ANIM", "anim/suika.zip" ),

}

local Action = GLOBAL.Action
local ActionHandler = GLOBAL.ActionHandler    
local READCARD = Action(3)
    READCARD.str = "Activate Spell Card"
    READCARD.id = "READCARD"
    READCARD.fn = function(act)
        local targ = act.invobject or act.target
        if targ.components.spellcard then
            return act.doer.components.divine:Read(targ)
        end
    end
 
AddAction(READCARD)
AddStategraphActionHandler("wilson", ActionHandler(READCARD, "doshortaction"))
     
--local function spellcardactivate(inst, doer, actions, right)
--        if doer:HasTag("divine") then
--            table.insert(actions, GLOBAL.ACTIONS.READCARD)
--        end
--end
--AddComponentAction("SCENE", "spellcard", spellcardactivate)
 
local function spellcardactivate_inv(inst, doer, actions, right)
        if doer:HasTag("divine") then
            table.insert(actions, GLOBAL.ACTIONS.READCARD)
        end
end
AddComponentAction("INVENTORY", "spellcard", spellcardactivate_inv)

 
--AddAction("THROWMT", "Obliterate", function(act)
--	local pvp = GLOBAL.TheNet:GetPVPEnabled()
--	local target = act.target
--	if act.doer ~= nil and target ~= nil and target.components.combat
--		and (pvp or ((not pvp)
--			and (not (act.doer:HasTag("player") and target:HasTag("player")))))
--			then
--		local success = act.doer.components.throwmt.ThrowRocks(act.doer, target)
--		if success == true then
--			act.doer:RemoveComponent("throwmt")
--			return true
--		else
--			return false
--		end
--	else
--		return false
--	end
--end)
--GLOBAL.ACTIONS.THROWMT.distance = 40

--AddStategraphActionHandler("wilson", ActionHandler(GLOBAL.ACTIONS.THROWMT, "doshortaction"))
     
--AddComponentAction("SCENE", "combat", function(inst, doer, actions, right)
--	if doer.components.throwmt then
--		table.insert(actions, GLOBAL.ACTIONS.THROWMT)
--	end
--end)




local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

-- The character select screen lines
STRINGS.CHARACTER_TITLES.suika = "Little Pandemonium"
STRINGS.CHARACTER_NAMES.suika = "Suika Ibuki"
STRINGS.CHARACTER_DESCRIPTIONS.suika = "*Easily gets sober\n*Stronger when insane\n*Voracious eater"
STRINGS.CHARACTER_QUOTES.suika = "\"Let's drink sake!\""


-- Custom speech strings
STRINGS.CHARACTERS.SUIKA = require "speech_suika"

-- The character's name as appears in-game 
STRINGS.NAMES.SUIKA = "Suika"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.SUIKA = 
{
	GENERIC = "It's Suika!",
	ATTACKER = "That Suika looks shifty...",
	MURDERER = "Murderer!",
	REVIVER = "Suika, friend of ghosts.",
	GHOST = "Suika had too much to drink.",
}


AddMinimapAtlas("images/map_icons/suika.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("suika", "FEMALE")


local resolvefilepath = GLOBAL.resolvefilepath
local TECH = GLOBAL.TECH

local CUSTOM_RECIPETABS = GLOBAL.CUSTOM_RECIPETABS
GLOBAL.CUSTOM_RECIPETABS.CARDS = { str = "CARDS", sort = 998, icon = "tab_cards.tex", icon_atlas = resolvefilepath("images/hud/tab_cards.xml")}
STRINGS.TABS.CARDS = "Spell Cards"

	local missingpower_recipe = Recipe("card_missingpower", {Ingredient("papyrus", 1), Ingredient("nightmarefuel", 1), Ingredient("meat", 1)}, CUSTOM_RECIPETABS.CARDS, {SCIENCE = 0, MAGIC = 0, ANCIENT = 0}, nil, nil, nil, nil, "cardbuilder", "images/inventoryimages/card_missingpower.xml", "card_missingpower.tex")
	local missingppower_recipe = Recipe("card_missingppower", {Ingredient("papyrus", 1), Ingredient("nightmarefuel", 1), Ingredient("meat", 1)}, CUSTOM_RECIPETABS.CARDS, {SCIENCE = 0, MAGIC = 0, ANCIENT = 0}, nil, nil, nil, nil, "cardbuilder", "images/inventoryimages/card_missingppower.xml", "card_missingppower.tex")
	--local throwingmt_recipe = Recipe("card_throwingmt", {Ingredient("papyrus", 1), Ingredient("nightmarefuel", 1), Ingredient("rocks", 5)}, CUSTOM_RECIPETABS.CARDS, {SCIENCE = 0, MAGIC = 0, ANCIENT = 0}, nil, nil, nil, nil, "cardbuilder", "images/inventoryimages/card_throwingmt.xml", "card_throwingmt.tex")

missingpower_recipe.sortkey = 9891
missingppower_recipe.sortkey = 9892
--throwingmt_recipe.sortkey = 9893
	

	
	
GLOBAL.STRINGS.NAMES.CARD_MISSINGPOWER = "Missing Power"
GLOBAL.STRINGS.RECIPE_DESC.CARD_MISSINGPOWER = "Crush things around you!"
GLOBAL.STRINGS.NAMES.CARD_MISSINGPPOWER = "Miss. Purple Power"
GLOBAL.STRINGS.RECIPE_DESC.CARD_MISSINGPPOWER = "Become a giant for a while!"
GLOBAL.STRINGS.NAMES.CARD_THROWINGMT = "Throwing Mt. Toga."
GLOBAL.STRINGS.RECIPE_DESC.CARD_THROWINGMT = "Throw tons of rocks!"

-- Credits
--AllMetalRacket (from forums) (http://forums.kleientertainment.com/topic/48046-font/?p=630987)
--Firiella (http://firiella.deviantart.com/art/Suika-Ibuki-Touhou-131897406)
--I actually got the pic from a different deviantart, but the link is now dead
--Dleowolf http://forums.kleientertainment.com/topic/46849-tutorial-using-extended-sample-character-template/
