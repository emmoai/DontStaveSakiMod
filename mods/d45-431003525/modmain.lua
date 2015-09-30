PrefabFiles = {
	"saberlion", "sabermeat", "summonclone",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/saberlion.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/saberlion.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/saberlion.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/saberlion.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/saberlion_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/saberlion_silho.xml" ),

    Asset( "IMAGE", "bigportraits/saberlion.tex" ),
    Asset( "ATLAS", "bigportraits/saberlion.xml" ),
	
	Asset( "IMAGE", "images/map_icons/saberlion.tex" ),
	Asset( "ATLAS", "images/map_icons/saberlion.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_saberlion.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_saberlion.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_saberlion.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_saberlion.xml" ),
}

AddMinimapAtlas("images/inventoryimages/summonclone.xml")

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
local resolvefilepath = GLOBAL.resolvefilepath

local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local Recipe = GLOBAL.Recipe
local TECH = GLOBAL.TECH
local STRINGS = GLOBAL.STRINGS

local SITCOMMAND = GLOBAL.Action(4, true, true, 10,	false, false, nil)
local SITCOMMAND_CANCEL = GLOBAL.Action(4, true, true, 10, false, false, nil)
	
AddComponentPostInit("talker", function(self)
	local old_Say = self.Say
	function self:Say(script, ...)
		if self.inst.prefab == "saberlion" then
			if script and type(script) == "string" then
				script = script:match("^%$%$(.*)$") or "GAO GAO GAO!"
			end
		end
		return old_Say(self, script, ...)
	end
end)

AddReplicableComponent("followersitcommand")

SITCOMMAND.id = "SITCOMMAND"
SITCOMMAND.str = "呆在这"
SITCOMMAND.fn = function(act)
	local targ = act.target
	if targ and targ.components.followersitcommand then
		act.doer.components.locomotor:Stop()
		act.doer.components.talker:Say("坐!")
		targ.components.followersitcommand:SetStaying(true)
		targ.components.followersitcommand:RememberSitPos("currentstaylocation", GLOBAL.Point(targ.Transform:GetWorldPosition())) 
		return true
	end
end
AddAction(SITCOMMAND)

SITCOMMAND_CANCEL.id = "SITCOMMAND_CANCEL"
SITCOMMAND_CANCEL.str = "跟着我"
SITCOMMAND_CANCEL.fn = function(act)
	local targ = act.target
	if targ and targ.components.followersitcommand then
		act.doer.components.locomotor:Stop()
		act.doer.components.talker:Say("跟上!")
		targ.components.followersitcommand:SetStaying(false)
		return true
	end
end
AddAction(SITCOMMAND_CANCEL)

AddComponentAction("SCENE", "followersitcommand", function(inst, doer, actions, rightclick)
	if rightclick and inst.replica.followersitcommand then
		if not inst.replica.followersitcommand:IsCurrentlyStaying() then
			table.insert(actions, GLOBAL.ACTIONS.SITCOMMAND)
		else
			table.insert(actions, GLOBAL.ACTIONS.SITCOMMAND_CANCEL)
		end
	end
end)

STRINGS.RECIPE_DESC.SABERMEAT = "二次元肉·终极武器." 
GLOBAL.STRINGS.NAMES.SABERMEAT = "二次元肉"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SABERMEAT = "肉怎么会呈现这种'状态'."

local sabermeat_recipe = AddRecipe("sabermeat",
{GLOBAL.Ingredient("meat", 2), GLOBAL.Ingredient("twigs", 3), GLOBAL.Ingredient("pigskin", 1)},
RECIPETABS.WAR, TECH.NONE,
nil, nil, nil, nil, nil,
"images/inventoryimages/sabermeat.xml", "sabermeat.tex")
sabermeat_recipe.tagneeded = false
sabermeat_recipe.builder_tag = "sabermeat_builder"
	
local summonclone_recipe = AddRecipe("summonclone",
{GLOBAL.Ingredient("meat", 6), GLOBAL.Ingredient("reviver", 1)},
RECIPETABS.SURVIVAL, TECH.NONE,
nil, nil, nil, nil, nil,
"images/inventoryimages/summonclone.xml", "summonclone.tex")
summonclone_recipe.tagneeded = false
summonclone_recipe.builder_tag = "sabermeat_builder"
	
GLOBAL.STRINGS.SUMMONCLONE_TALK_PANICFIRE = { "Oww!", "我在燃烧!", "它起火了!" }
GLOBAL.STRINGS.SUMMONCLONE_TALK_FIGHT = {"GAO GAO GAO!"} --setup in prefab

GLOBAL.STRINGS.NAMES.SUMMONCLONE = "Saber萌新"
GLOBAL.STRINGS.RECIPE_DESC.SUMMONCLONE = "Gao Gao Gao!"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SUMMONCLONE = {"GAO"}
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SUMMONCLONE.GENERIC = "GAO?"

-- add tradable component to various gear
function HF_addtradablecomponenttoprefab(inst)
	if not inst.components.tradable then
		inst:AddComponent("tradable")
	end
end
AddPrefabPostInit("sabermeat", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("axe", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("goldenaxe", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("armor_sanity", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("umbrella", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("grass_umbrella", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("hambat", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("spear", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("tentaclespike", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("nightsword", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("torch", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("armorwood", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("pickaxe", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("goldenpickaxe", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("blowdart_sleep", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("blowdart_fire", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("blowdart_pipe", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("boomerang", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("ice_projectile", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("fire_projectile", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("fishingrod", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("bugnet", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("hammer", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("shovel", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("goldenshovel", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("pitchfork", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("cane", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("armormarble", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("armorgrass", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("sweatervest", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("trunkvest_summer", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("trunkvest_winter", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("armorsnurtleshell", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("lighter", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("nightlight", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("batbat", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("lucy", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("bluegem", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("redgem", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("armorruins", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("armorslurper", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("multitool_axe_pickaxe", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("ruins_bat", HF_addtradablecomponenttoprefab)
-- DLC
AddPrefabPostInit("spear_wathgrithr", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("beargervest", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("armordragonfly", HF_addtradablecomponenttoprefab)

AddComponentPostInit("moisture", function(self)
	local old = self.GetMoistureRate
	self.GetMoistureRate = function(self)
		local oldvalue = old(self)
		local x, y, z = self.inst.Transform:GetWorldPosition()
		local ents = GLOBAL.TheSim:FindEntities(x, y, z, 4, {'sheltercarrier'})
		for k, v in pairs(ents) do 
			if v.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS) and 
			v.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS).prefab == "umbrella" then
				return 0
			end
			if v.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS) and 
			v.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS).prefab == "grass_umbrella" then
				return oldvalue * 0.5
			end
		end
		return oldvalue
	end
end)

-- The character select screen lines
STRINGS.CHARACTER_TITLES.saberlion = "热带草原之王!"
STRINGS.CHARACTER_NAMES.saberlion = "萌狮Saber"
STRINGS.CHARACTER_DESCRIPTIONS.saberlion = "*肉非常非常好吃!\n*我是草原之王!\n*我的武器就是-'肉'-!"
STRINGS.CHARACTER_QUOTES.saberlion = "\"GAOOOOOOOOOOOOOOO!\""

-- Custom speech strings
STRINGS.CHARACTERS.SABERLION = require "speech_saberlion"
GLOBAL.STRINGS.CHARACTERS.SABERLION.DESCRIBE.SABERMEAT = "GAO! GAO! GAO!"

-- The character's name as appears in-game 
STRINGS.NAMES.SABERLION = "萌狮Saber"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.SABERLION = 
{
	GENERIC = "萌狮Saber!",
	ATTACKER = "萌狮Saber看起来很强...",
	MURDERER = "凶手!",
	REVIVER = "萌狮Saber,鬼魂之友.",
	GHOST = "萌狮Saber可以用救赎之心复活.",
}


AddMinimapAtlas("images/map_icons/saberlion.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("saberlion", "FEMALE")

