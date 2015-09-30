PrefabFiles = {
	"ni",
}
Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/ni.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/ni.xml" ),
    Asset( "IMAGE", "images/selectscreen_portraits/ni.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/ni.xml" ),
    Asset( "IMAGE", "images/selectscreen_portraits/ni_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/ni_silho.xml" ),
    Asset( "IMAGE", "bigportraits/ni.tex" ),
    Asset( "ATLAS", "bigportraits/ni.xml" ),	
	Asset("IMAGE", "images/ni.tex"),
    Asset("ATLAS", "images/ni.xml"),	
	Asset( "IMAGE", "images/avatars/avatar_ni.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ni.xml" ),	
	Asset( "IMAGE", "images/avatars/avatar_ghost_ni.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_ni.xml" ),


}
AddMinimapAtlas("images/ni.xml")

local COOK = GLOBAL.ACTIONS.COOK
local old_cook_fn = COOK.fn

COOK.fn = function(act, ...)
    local result = old_cook_fn(act)
    local stewer = act.target.components.stewer
    if result and stewer ~= nil and act.doer.prefab == "ni" then
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
        if harvester and harvester.prefab == "ni" then
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

-- The character select screen lines
GLOBAL.STRINGS.CHARACTER_TITLES.ni = "妮可"
GLOBAL.STRINGS.CHARACTER_NAMES.ni = "矢泽妮可"
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.ni = "*速度很快\n*厨艺天赋高 能秒做双倍食物"
GLOBAL.STRINGS.CHARACTER_QUOTES.ni = "\"妮可 妮可 妮!\""
local require = GLOBAL.require 
local STRINGS = GLOBAL.STRINGS

-- The character's name as appears in-game 
STRINGS.NAMES.NI = "矢泽妮可"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.NI = 
{
	GENERIC = "矢泽妮可!",
	ATTACKER = "nico看起来很萌",
	MURDERER = "Murderer!",
	REVIVER = "Nico, friend of ghosts.",
	GHOST = "Nico could use a heart.",
}

-- Let the game know character is male, female, or robot
table.insert(GLOBAL.CHARACTER_GENDERS.FEMALE, "ni")
--
---
------====================================
------====================================
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.NI = "Nico from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WILLOW.DESCRIBE.NI = "Nico from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.NI = "Nico from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WENDY.DESCRIBE.NI = "Nico from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WX78.DESCRIBE.NI = "Nico from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.NI = "Nico from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WOODIE.DESCRIBE.NI = "Nico from love live school idol. "
GLOBAL.STRINGS.CHARACTERS.WAXWELL.DESCRIBE.NI = "Nico from love live school idol. "
------====================================
------====================================
---
--



STRINGS.CHARACTERS.NI=require "speech_ni"
GLOBAL.STRINGS.NAMES.NI = "矢泽妮可"
AddModCharacter("ni", "FEMALE")