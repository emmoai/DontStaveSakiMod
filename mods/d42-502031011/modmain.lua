PrefabFiles = {
	"brs", "blue_shot", "energy_particle", "blue_shot_impact", "rockcannon", "dud", "dud_impact", "blackblade", "critical_impact", 
    "slash_impact", "bladeclaw", "cannonlance", "cannon_shot", "cannon_shot_impact", "giantsoul",
}

Assets = {

    Asset( "IMAGE", "images/saveslot_portraits/brs.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/brs.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/brs.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/brs.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/brs_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/brs_silho.xml" ),

    Asset( "IMAGE", "bigportraits/brs.tex" ),
    Asset( "ATLAS", "bigportraits/brs.xml" ),
	
	Asset( "IMAGE", "images/map_icons/brs.tex" ),
	Asset( "ATLAS", "images/map_icons/brs.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_brs.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_brs.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_brs.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_brs.xml" ),

    Asset( "IMAGE", "images/inventoryimages/rockcannon.tex"),
    Asset( "ATLAS", "images/inventoryimages/rockcannon.xml"),

    Asset( "IMAGE", "images/inventoryimages/cannonlance.tex"),
    Asset( "ATLAS", "images/inventoryimages/cannonlance.xml"),
}

local wpchance = GetModConfigData("workparticledropchance")
local kpchance = GetModConfigData("killparticledropchance")
local souldrop = GetModConfigData("souldropchance")
local equips = GetModConfigData("customequips")

modimport("libs/env.lua")

-- Actions Initialization.
use "data/actions/init"

-- Component Initialization.
use "data/components/init"

--local combat = GLOBAL.combat
local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local Recipe = GLOBAL.Recipe
local TECH = GLOBAL.TECH


STRINGS.CHARACTERS.GENERIC.DESCRIBE.ROCKCANNON = {
    EMPTY = "没有子弹了!",
    FEW = "还有几发子弹.",
    HALF = "还有半个弹夹.",
    PLENTY = "还有大量子弹.",
    FULL = "子弹满满的!"

}

STRINGS.CHARACTERS.GENERIC.DESCRIBE.CANNONLANCE = {
    EMPTY = "没有子弹了!",
    FEW = "还有几发子弹.",
    HALF = "还有半个弹夹.",
    PLENTY = "还有大量子弹.",
    FULL = "子弹满满的!"

}


STRINGS.NAMES.ENERGY_PARTICLE = "精神微粒"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.ENERGY_PARTICLE = "看起来很有用."

STRINGS.NAMES.BLUE_SHOT = "能量弹"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BLUE_SHOT = "有一种奇异的能量在里面."

STRINGS.NAMES.GIANTSOUL = "灵魂精粹"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.GIANTSOUL = "我能感到一种强烈的力量在里面咆哮."

STRINGS.NAMES.ROCKCANNON = "黑岩巨炮"
--STRINGS.CHARACTERS.GENERIC.DESCRIBE.ROCKCANNON = "超级阿姆斯特朗回旋喷气式加速阿姆斯特朗究极泯灭炮."

STRINGS.NAMES.BLACKBLADE = "黑刃"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BLACKBLADE = "漂亮的后面是锋利."

STRINGS.NAMES.BLADECLAW = "黑切"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BLADECLAW = "怖."

STRINGS.NAMES.CANNONLANCE = "黑岩枪矛巨炮"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.CANNONLANCE = "超级阿姆斯特朗回旋喷气式加速阿姆斯特朗究极泯灭炮."

--Recipe Descriptions--

STRINGS.RECIPE_DESC.BLUE_SHOT = "魔力弹."
STRINGS.RECIPE_DESC.ROCKCANNON = "万物俱灭!"
STRINGS.RECIPE_DESC.BLACKBLADE = "千刀万剐."
STRINGS.RECIPE_DESC.BLADECLAW = "粉身碎骨."
STRINGS.RECIPE_DESC.CANNONLANCE = "一骑当千."

--End Descriptions--

local myingredient = GLOBAL.Ingredient( "energy_particle", 2)
myingredient.atlas = "images/inventoryimages/energy_particle.xml"
local giantsoul = GLOBAL.Ingredient("giantsoul",1)
giantsoul.atlas = "images/inventoryimages/giantsoul.xml"

-- CUSTOM RECIPES --
local blue_shot_recipe = AddRecipe("blue_shot",
    {GLOBAL.Ingredient("charcoal", 1), myingredient},
    RECIPETABS.REFINE, TECH.SCIENCE_ONE,
    nil, nil, nil, 2, nil,
    "images/inventoryimages/blue_shot.xml", "blue_shot.tex")
    blue_shot_recipe.tagneeded = false
    blue_shot_recipe.builder_tag = "blue_shot_builder"     

local rockcannon_recipe = AddRecipe("rockcannon",
    {GLOBAL.Ingredient("rocks", 8), GLOBAL.Ingredient("transistor", 1), GLOBAL.Ingredient("gunpowder", 3)},
    RECIPETABS.WAR, TECH.SCIENCE_ONE,
    nil, nil, nil, nil, nil,
    "images/inventoryimages/rockcannon.xml", "rockcannon.tex")
    blue_shot_recipe.tagneeded = false
    blue_shot_recipe.builder_tag = "rockcannon_builder"

local rockcannon_recipe = AddRecipe("blackblade",
    {GLOBAL.Ingredient("feather_crow", 1), GLOBAL.Ingredient("flint", 1), GLOBAL.Ingredient("cutstone", 1)},
    RECIPETABS.WAR, TECH.SCIENCE_ONE,
    nil, nil, nil, nil, nil,
    "images/inventoryimages/blackblade.xml", "blackblade.tex")
    blue_shot_recipe.tagneeded = false
    blue_shot_recipe.builder_tag = "blackblade_builder"

local rockcannon_recipe = AddRecipe("bladeclaw",
    {giantsoul, GLOBAL.Ingredient("purplegem", 1), GLOBAL.Ingredient("flint", 3)},
    RECIPETABS.MAGIC, TECH.MAGIC_TWO,
    nil, nil, nil, nil, nil,
    "images/inventoryimages/bladeclaw.xml", "bladeclaw.tex")
    blue_shot_recipe.tagneeded = false
    blue_shot_recipe.builder_tag = "bladeclaw_builder"

local rockcannon_recipe = AddRecipe("cannonlance",
    {giantsoul, GLOBAL.Ingredient("purplegem", 1), GLOBAL.Ingredient("nightmarefuel", 3)},
    RECIPETABS.MAGIC, TECH.MAGIC_TWO,
    nil, nil, nil, nil, nil,
    "images/inventoryimages/cannonlance.xml", "cannonlance.tex")
    blue_shot_recipe.tagneeded = false
    blue_shot_recipe.builder_tag = "cannonlance_builder"

    --END CUSTOM RECIPES--


local function ShooterPostInit(inst)
    if not GLOBAL.TheWorld.ismastersim then
        return inst
    end

    if equips == "false" then
        if inst.components.characterspecific then
        inst:RemoveComponent("characterspecific")
        return inst
        end
    elseif equips == "true" then
        if not inst.components.characterspecific then
        inst:AddComponent("characterspecific")
        end
    -- Prefab name of character.
    inst.components.characterspecific:SetOwner("brs")

    -- Determine if we want to allow this item to be stored in a chest or backpack.
    inst.components.characterspecific:SetStorable(false)
    -- Set the speech which will be played for all characters who can't pick up this item.
    inst.components.characterspecific:SetComment("That looks dangerous.")

    end

    return inst
end

local function BlackBladePostInit(inst)
    if not GLOBAL.TheWorld.ismastersim then
        return inst
    end
    if equips == "false" then
        if inst.components.characterspecific then
        inst:RemoveComponent("characterspecific")
        return inst
        end

    elseif equips == "true" then
    if not inst.components.characterspecific then
        inst:AddComponent("characterspecific")
    end
    -- Prefab name of character.
    inst.components.characterspecific:SetOwner("brs")

    -- Determine if we want to allow this item to be stored in a chest or backpack.
    inst.components.characterspecific:SetStorable(false)
    -- Set the speech which will be played for all characters who can't pick up this item.
    inst.components.characterspecific:SetComment("That looks dangerous.")

    end
    return inst
end

local function BladeClawPostInit(inst)
    if not GLOBAL.TheWorld.ismastersim then
        return inst
    end
    if equips == "false" then
        if inst.components.characterspecific then
        inst:RemoveComponent("characterspecific")
        return inst
        end
    elseif equips == "true" then
        if not inst.components.characterspecific then
        inst:AddComponent("characterspecific")
        end
    -- Prefab name of character.
    inst.components.characterspecific:SetOwner("brs")

    -- Determine if we want to allow this item to be stored in a chest or backpack.
    inst.components.characterspecific:SetStorable(false)
    -- Set the speech which will be played for all characters who can't pick up this item.
    inst.components.characterspecific:SetComment("That looks dangerous.")

    end
    return inst
end

local function CannonLancePostInit(inst)
    if not GLOBAL.TheWorld.ismastersim then
        return inst
    end
    if equips == "false" then
        if inst.components.characterspecific then
        inst:RemoveComponent("characterspecific")
        return inst
        end
    elseif equips == "true" then
        if not inst.components.characterspecific then
        inst:AddComponent("characterspecific")
        end
    -- Prefab name of character.
    inst.components.characterspecific:SetOwner("brs")

    -- Determine if we want to allow this item to be stored in a chest or backpack.
    inst.components.characterspecific:SetStorable(false)
    -- Set the speech which will be played for all characters who can't pick up this item.
    inst.components.characterspecific:SetComment("That looks dangerous.")
    end
    return inst
end

AllPlayers = GLOBAL.AllPlayers
local CAMERASHAKE = GLOBAL.CAMERASHAKE

AddPrefabPostInit("brs", function(inst)

	if not GLOBAL.TheWorld.ismastersim then
		return
	end

	local function onkilledother(inst, data)
	local victim = data.victim
	local x, y, z = victim.Transform:GetWorldPosition() 
		if victim.components.freezable or victim:HasTag("monster") then
			if math.random() <= kpchance then
                victim.components.lootdropper:SpawnLootPrefab("energy_particle")
			end
		end
	end

	local function onworked(inst, data)
			local x, y, z = inst.Transform:GetWorldPosition() 
			if math.random() <= wpchance then
				SpawnPrefab("energy_particle").Transform:SetPosition(x+math.random(),y+math.random(),z+math.random())
			end
	end

	inst:ListenForEvent("finishedwork", onworked)
	inst:ListenForEvent("killed", onkilledother)
end)


AddPlayerPostInit(function(player)
    if not GLOBAL.TheWorld.ismastersim then
        return
    end
    local critchance = 0.15
    local clawcrit = 0.30
    local combat = player.components.combat
    if not combat then return end
    local oldCalcDamage = combat.CalcDamage
    combat.CalcDamage = function(self, target, weapon, multiplier)
        if not weapon and weapon == nil then
            return oldCalcDamage(self, target, nil, multiplier)
        end
        local x, y, z = target.Transform:GetWorldPosition()
        multiplier = multiplier or self.damagemultiplier or 1
    
        if weapon.prefab == "blackblade" and target and not target:HasTag("wall") and not target:HasTag("structure") then
            local fx = SpawnPrefab("slash_impact")
            fx.Transform:SetPosition(x, y, z)
            if math.random() <= critchance then
            target.SoundEmitter:PlaySound("brs/brs/critical")
            fx = SpawnPrefab("critical_impact")
            fx.Transform:SetPosition(x, y+2, z)
            multiplier = multiplier*2
            end
        elseif weapon.prefab == "bladeclaw" and target and not target:HasTag("wall") and not target:HasTag("structure") then
            local fx = SpawnPrefab("slash_impact")
            fx.Transform:SetPosition(x, y, z)
            if math.random() <= clawcrit then
            target.SoundEmitter:PlaySound("brs/brs/critical")
            fx = SpawnPrefab("critical_impact")
            fx.Transform:SetPosition(x, y+2, z)
            multiplier = multiplier*2
            end
        end
        return oldCalcDamage(self, target, weapon, multiplier)
        end
        
end)

--For Bearger

function beargerpostinit(inst)
    if not GLOBAL.TheWorld.ismastersim then
        return inst
    end
    inst:RemoveComponent("lootdropper")
    inst:AddComponent("lootdropper")
    inst.components.lootdropper:SetLoot({"meat", "meat", "meat", "meat", "meat", "meat", "meat", "meat", "bearger_fur", "energy_particle"})
    inst.components.lootdropper:AddChanceLoot("giantsoul", souldrop)
    inst.components.lootdropper:AddChanceLoot("energy_particle", 0.4)
    inst.components.lootdropper:AddChanceLoot("energy_particle", 0.4)
end

--For Deerclops
GLOBAL.SetSharedLootTable('deerclops',
{
    {"giantsoul", souldrop},
    {"energy_particle", 1.00},
    {"energy_particle", 0.4},
    {"energy_particle", 0.4},
})

function deerclopspostinit(inst)
    if not GLOBAL.TheWorld.ismastersim then
        return inst
    end
    inst.components.lootdropper:SetChanceLootTable('deerclops')
    inst.components.lootdropper.numrandomloot = 0
end



function moosepostinit(inst)
    if not GLOBAL.TheWorld.ismastersim then
        return inst
    end
    inst:RemoveComponent("lootdropper")
    inst:AddComponent("lootdropper")
    inst.components.lootdropper:SetLoot({"meat", "meat", "meat", "meat", "meat", "meat", "drumstick", "drumstick", "goose_feather", "goose_feather", "goose_feather","energy_particle"})
    inst.components.lootdropper:AddChanceLoot("giantsoul", souldrop)
    inst.components.lootdropper:AddChanceLoot("goose_feather", 0.33)
    inst.components.lootdropper:AddChanceLoot("goose_feather", 0.33)
    inst.components.lootdropper:AddChanceLoot("energy_particle", 0.4)
    inst.components.lootdropper:AddChanceLoot("energy_particle", 0.4)
end

AddPrefabPostInit("dragonfly", function(inst)
    if not GLOBAL.TheWorld.ismastersim then
        return inst
    end
    local function DropSpecialLoot(inst)
    inst.components.lootdropper:SpawnLootPrefab("dragon_scales")
    inst.components.lootdropper:SpawnLootPrefab("energy_particle")
    end

    inst.components.damagetracker.damage_threshold_fn = DropSpecialLoot

    inst:RemoveComponent("lootdropper")
    inst:AddComponent("lootdropper")
    inst.components.lootdropper:SetLoot(
        {"dragonscales", "meat", "meat", "meat", "meat", "meat", "meat", 
        "goldnugget", "goldnugget", "goldnugget", "goldnugget", 
        "redgem","redgem", "bluegem", "blugem", "purplegem", "orangegem", "yellowgem", "greengem", "energy_particle"})
    inst.components.lootdropper:AddChanceLoot("giantsoul", souldrop)
    inst.components.lootdropper:AddChanceLoot("lavae_egg", 0.33)
    inst.components.lootdropper:AddChanceLoot("goldnugget", 0.5)
    inst.components.lootdropper:AddChanceLoot("goldnugget", 0.5)
    inst.components.lootdropper:AddChanceLoot("goldnugget", 0.5)
    inst.components.lootdropper:AddChanceLoot("goldnugget", 0.5)
    inst.components.lootdropper:AddChanceLoot("purplegem", 0.5)
    inst.components.lootdropper:AddChanceLoot("orangegem", 0.5)
    inst.components.lootdropper:AddChanceLoot("yellowgem", 0.5)
    inst.components.lootdropper:AddChanceLoot("greengem", 0.5)
    inst.components.lootdropper:AddChanceLoot("energyparticle", 0.4)
    inst.components.lootdropper:AddChanceLoot("energyparticle", 0.4)
end)

AddPrefabPostInit("rockcannon", ShooterPostInit)
AddPrefabPostInit("blackblade", BlackBladePostInit)
AddPrefabPostInit("bladeclaw", BladeClawPostInit)
AddPrefabPostInit("cannonlance", CannonLancePostInit)

AddPrefabPostInit("deerclops", deerclopspostinit)
AddPrefabPostInit("bearger", beargerpostinit)
AddPrefabPostInit("moose", moosepostinit)


-- The character select screen lines
STRINGS.CHARACTER_TITLES.brs = "BLACK ★ ROCK SHOOTER"
STRINGS.CHARACTER_NAMES.brs = "黑岩射手"
STRINGS.CHARACTER_DESCRIPTIONS.brs = "*拥有专属装备\n*低SAN变身狂暴黑岩射手\n*晚上感到孤独(SAN下降快)"
STRINGS.CHARACTER_QUOTES.brs = "\"小鸟和彩虹\""

-- Custom speech strings
STRINGS.CHARACTERS.BRS = require "speech_brs"

-- The character's name as appears in-game 
STRINGS.NAMES.BRS = "黑岩射手"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BRS = 
{
	GENERIC = "BLACK ★ ROCK SHOOTER",
	ATTACKER = "那个黑岩射手看起来非常凶悍...",
	MURDERER = "凶手!",
	REVIVER = "黑岩射手,鬼魂之友.",
	GHOST = "黑岩射手,需要一颗救赎之心.",
}


AddMinimapAtlas("images/map_icons/brs.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("brs", "FEMALE")

