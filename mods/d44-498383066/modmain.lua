PrefabFiles = {
	"annie", "summontibber", "anniepack", "armor_littleredannie", "armor_sweetheartannie", "armor_frostannie", "tibberdoll", "anniebearhat", "tibbersword", "anniefire"
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/annie.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/annie.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/annie.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/annie.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/annie_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/annie_silho.xml" ),

    Asset( "IMAGE", "bigportraits/annie.tex" ),
    Asset( "ATLAS", "bigportraits/annie.xml" ),
	
	Asset( "IMAGE", "images/map_icons/annie.tex" ),
	Asset( "ATLAS", "images/map_icons/annie.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_annie.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_annie.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_annie.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_annie.xml" ),
	
	Asset( "ATLAS", "images/hud/annietab.xml" ),

}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

local SITCOMMAND = GLOBAL.Action(4, true, true, 10,	false, false, nil)
local SITCOMMAND_CANCEL = GLOBAL.Action(4, true, true, 10, false, false, nil)

local resolvefilepath = GLOBAL.resolvefilepath
local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local Recipe = GLOBAL.Recipe
local TECH = GLOBAL.TECH

--Annie Tab

anniestab = AddRecipeTab("Annie", 998, "images/hud/annietab.xml", "annietab.tex", "anniebuilder")

--Recipe

--Plutia Recipes

local anniebearhat_recipe = AddRecipe("anniebearhat",
{GLOBAL.Ingredient("beefalowool", 6), GLOBAL.Ingredient("silk", 6), GLOBAL.Ingredient("houndstooth", 2)},
anniestab, TECH.NONE,
nil, nil, nil, nil, nil,
"images/inventoryimages/anniebearhat.xml", "anniebearhat.tex")
anniebearhat_recipe.tagneeded = false
anniebearhat_recipe.builder_tag = "anniebuilder"

local armor_frostannie_recipe = AddRecipe("armor_frostannie",
{GLOBAL.Ingredient("beefalowool", 6), GLOBAL.Ingredient("silk", 6), GLOBAL.Ingredient("winterhat", 1)},
anniestab, TECH.NONE,
nil, nil, nil, nil, nil,
"images/inventoryimages/armor_frostannie.xml", "armor_frostannie.tex")
armor_frostannie_recipe.tagneeded = false
armor_frostannie_recipe.builder_tag = "anniebuilder"

local armor_littleredannie_recipe = AddRecipe("armor_littleredannie",
{GLOBAL.Ingredient("beefalowool", 4), GLOBAL.Ingredient("silk", 6), GLOBAL.Ingredient("feather_robin", 2)},
anniestab, TECH.NONE,
nil, nil, nil, nil, nil,
"images/inventoryimages/armor_littleredannie.xml", "armor_littleredannie.tex")
armor_littleredannie_recipe.tagneeded = false
armor_littleredannie_recipe.builder_tag = "anniebuilder"

local armor_sweetheartannie_recipe = AddRecipe("armor_sweetheartannie",
{GLOBAL.Ingredient("beefalowool", 4), GLOBAL.Ingredient("silk", 6), GLOBAL.Ingredient("goldnugget", 3)},
anniestab, TECH.NONE,
nil, nil, nil, nil, nil,
"images/inventoryimages/armor_sweetheartannie.xml", "armor_sweetheartannie.tex")
armor_sweetheartannie_recipe.tagneeded = false
armor_sweetheartannie_recipe.builder_tag = "anniebuilder"

local summontibber_recipe = AddRecipe("summontibber",
{GLOBAL.Ingredient("tibberdoll", 1, "images/inventoryimages/tibberdoll.xml")},
anniestab, TECH.NONE,
nil, nil, nil, nil, nil,
"images/inventoryimages/summontibber.xml", "summontibber.tex")
summontibber_recipe.tagneeded = false
summontibber_recipe.builder_tag ="anniebuilder"
summontibber_recipe.atlas = resolvefilepath("images/inventoryimages/summontibber.xml")

---Names/Recipe Desc/Character Description

GLOBAL.STRINGS.NAMES.ANNIEPACK = "安妮的背包"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.ANNIEPACK = "可爱的背包,黑暗的女儿."

GLOBAL.STRINGS.NAMES.ANNIEFIRE = "碎裂之火"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.ANNIEFIRE = "小小安妮,巨大火球."

GLOBAL.STRINGS.NAMES.ANNIEBEARHAT = "泰迪熊帽"
GLOBAL.STRINGS.RECIPE_DESC.ANNIEBEARHAT = "我只喜欢泰迪!"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.ANNIEBEARHAT= "多么让人沮丧的帽子."
GLOBAL.STRINGS.NAMES.ARMOR_FROSTANNIE = "冰霜烈焰"
GLOBAL.STRINGS.RECIPE_DESC.ARMOR_FROSTANNIE = "天气冷起来了!"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.ARMOR_FROSTANNIE = "看起来可真舒服啊!"

GLOBAL.STRINGS.NAMES.ARMOR_LITTLEREDANNIE = "小红帽套装"
GLOBAL.STRINGS.RECIPE_DESC.ARMOR_LITTLEREDANNIE = "我要去看奶奶!"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.ARMOR_LITTLEREDANNIE = "今天带来了奶奶做的甜点,你要尝尝吗?"

GLOBAL.STRINGS.NAMES.ARMOR_SWEETHEARTANNIE = "甜心宝贝"
GLOBAL.STRINGS.RECIPE_DESC.ARMOR_SWEETHEARTANNIE = "炽热的爱."
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.ARMOR_SWEETHEARTANNIE = "丘比特到来 或者..?"

GLOBAL.STRINGS.NAMES.TIBBERDOLL = "安妮的泰迪熊玩偶"
GLOBAL.STRINGS.RECIPE_DESC.TIBBERDOLL = "我最最最喜欢你!"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.TIBBERDOLL = "捡起它,一种毛骨悚然的感觉..."

GLOBAL.STRINGS.NAMES.SUMMONTIBBER = "泰迪"
GLOBAL.STRINGS.RECIPE_DESC.SUMMONTIBBER = "提伯斯! 呀呼!"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.SUMMONTIBBER = "就是个泰迪熊..不..什么..见鬼?!"

AddMinimapAtlas("images/inventoryimages/summontibber.xml")
AddMinimapAtlas("images/inventoryimages/anniepack.xml")

AddReplicableComponent("followersitcommand")

SITCOMMAND.id = "SITCOMMAND"
SITCOMMAND.str = "呆在这"
SITCOMMAND.fn = function(act)
	local targ = act.target
	if targ and targ.components.followersitcommand then
		act.doer.components.locomotor:Stop()
		act.doer.components.talker:Say("停下,泰迪!!")
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
		act.doer.components.talker:Say("泰迪快来!")
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

-- add tradable component to various gear
function HF_addtradablecomponenttoprefab(inst)
	if not inst.components.tradable then
		inst:AddComponent("tradable")
	end
end

AddPrefabPostInit("tibbersword", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("armor_sanity", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("umbrella", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("grass_umbrella", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("torch", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("armorwood", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("armormarble", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("armorgrass", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("armorruins", HF_addtradablecomponenttoprefab)
-- DLC
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

local containers = require("containers")
 
local oldwidgetsetup = containers.widgetsetup
containers.widgetsetup = function(container, prefab)
    if not prefab and container.inst.prefab == "anniepack" then
        prefab = "backpack"
    end
    oldwidgetsetup(container, prefab)
end 

-- The character select screen lines
STRINGS.CHARACTER_TITLES.annie = "黑暗之女"
STRINGS.CHARACTER_NAMES.annie = "安妮"
STRINGS.CHARACTER_DESCRIPTIONS.annie = "*扔火球\n*泰迪:提伯斯!\n*燃烧!"
STRINGS.CHARACTER_QUOTES.annie = "\"你有看见我的小熊吗?\""

-- Custom speech strings
STRINGS.CHARACTERS.ANNIE = require "speech_annie"

-- The character's name as appears in-game 
STRINGS.NAMES.ANNIE = "安妮"
GLOBAL.STRINGS.CHARACTERS.ANNIE.DESCRIBE.SUMMONTIBBER = "耶! 泰迪!"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.ANNIE = 
{
	GENERIC = "那是安妮!",
	ATTACKER = "安妮看起来很强...",
	MURDERER = "凶手!",
	REVIVER = "安妮,鬼魂之友.",
	GHOST = "安妮可以用救赎之心复活.",
}


AddMinimapAtlas("images/map_icons/annie.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("annie", "FEMALE")

