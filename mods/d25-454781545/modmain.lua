PrefabFiles = {
	"sanji", "sanjihat",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/sanji.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/sanji.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/sanji.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/sanji.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/sanji_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/sanji_silho.xml" ),

    Asset( "IMAGE", "bigportraits/sanji.tex" ),
    Asset( "ATLAS", "bigportraits/sanji.xml" ),
	
	Asset( "IMAGE", "images/map_icons/sanji.tex" ),
	Asset( "ATLAS", "images/map_icons/sanji.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_sanji.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_sanji.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_sanji.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_sanji.xml" ),
	
	Asset( "IMAGE", "images/inventoryimages/sanjihat.tex" ),
	Asset( "ATLAS", "images/inventoryimages/sanjihat.xml" ),

}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

local COOK = GLOBAL.ACTIONS.COOK
local old_cook_fn = COOK.fn

local resolvefilepath = GLOBAL.resolvefilepath

local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local Recipe = GLOBAL.Recipe
local TECH = GLOBAL.TECH
local STRINGS = GLOBAL.STRINGS

local sanjihat_recipe = AddRecipe("sanjihat",
{GLOBAL.Ingredient("papyrus", 2), GLOBAL.Ingredient("gunpowder", 1)},
RECIPETABS.SURVIVAL, TECH.NONE,
nil, nil, nil, nil, nil,
"images/inventoryimages/sanjihat.xml", "sanjihat.tex")
sanjihat_recipe.tagneeded = false
sanjihat_recipe.builder_tag = "sanji_builder"

COOK.fn = function(act, ...)
    local result = old_cook_fn(act)
    local stewer = act.target.components.stewer
    if result and stewer ~= nil and act.doer.prefab == "sanji" then
        local fn = stewer.task.fn
        stewer.task:Cancel()
        fn(act.target, stewer)
    end
end

AddPrefabPostInit("cookpot", function(inst)
    if inst.components.stewer == nil then
        return
    end
    -- using the same harvest logic and repeat the item giving step once
    local old_harvest = inst.components.stewer.Harvest
    inst.components.stewer.Harvest = function(self, harvester)
        if harvester and harvester.prefab == "sanji" then
            if self.done and self.product and harvester.components.inventory then
                local loot = GLOBAL.SpawnPrefab(self.product)
                if loot ~= nil then
                    if self.spoiltime ~= nil and loot.components.perishable ~= nil then
                        local spoilpercent = self:GetTimeToSpoil() / self.spoiltime
                        loot.components.perishable:SetPercent(self.product_spoilage * spoilpercent)
                        loot.components.perishable:StartPerishing()
                    end
                    harvester.components.inventory:GiveItem(loot, nil, self.inst:GetPosition())
                end
            end
        end
        return old_harvest(self, harvester)
    end
end)



local function isWoman(name)
    for k, v in ipairs(GLOBAL.CHARACTER_GENDERS.FEMALE) do
        if v == name then
            return true
        end
    end
    return false
end
 
AddPlayerPostInit(function(inst)
    if isWoman(inst.prefab) then
        if not inst.components.sanityaura then
            inst:AddComponent("sanityaura")
        end
        local old = inst.components.sanityaura.aurafn
        inst.components.sanityaura.aurafn = function(inst, observer)
            local ret = 0
            if old ~= nil then
                ret = old(inst, observer)
            end
            if observer.prefab == "sanji" then
                return GLOBAL.TUNING.SANITYAURA_SMALL + ret
            end
            return ret
        end
    end
end)

GLOBAL.STRINGS.NAMES.SANJIHAT = "香烟"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SANJIHAT = "Unhealthy yet relaxing."
STRINGS.RECIPE_DESC.SANJIHAT = "A standard cigarette."

-- The character select screen lines
STRINGS.CHARACTER_TITLES.sanji = "香吉士"
STRINGS.CHARACTER_NAMES.sanji = "Sanji"
STRINGS.CHARACTER_DESCRIPTIONS.sanji = "*快速烹调,2倍盛菜,不吃腐物\n*周围有女士增加理智\n*制作香烟增加理智"
STRINGS.CHARACTER_QUOTES.sanji = "\"失去理智比他人快30%!!!!\""

-- Custom speech strings
STRINGS.CHARACTERS.SANJI = require "speech_sanji"

-- The character's name as appears in-game 
STRINGS.NAMES.SANJI = "Sanji"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.SANJI = 
{
	GENERIC = "It's Sanji!",
	ATTACKER = "That Sanji looks shifty...",
	MURDERER = "Murderer!",
	REVIVER = "Sanji, friend of ghosts.",
	GHOST = "Sanji could use a heart.",
}


AddMinimapAtlas("images/map_icons/sanji.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("sanji", "MALE")

