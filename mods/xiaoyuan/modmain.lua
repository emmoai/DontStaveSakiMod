PrefabFiles = {
    "madoka", "nightmarerock", "rosebow", "madoka_projectile",
}
 
Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/madoka.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/madoka.xml" ),
 
    Asset( "IMAGE", "images/selectscreen_portraits/madoka.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/madoka.xml" ),
     
    Asset( "IMAGE", "images/selectscreen_portraits/madoka_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/madoka_silho.xml" ),
 
    Asset( "IMAGE", "bigportraits/madoka.tex" ),
    Asset( "ATLAS", "bigportraits/madoka.xml" ),
     
    Asset( "IMAGE", "images/map_icons/madoka.tex" ),
    Asset( "ATLAS", "images/map_icons/madoka.xml" ),
     
    Asset( "IMAGE", "images/avatars/avatar_madoka.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_madoka.xml" ),
     
    Asset( "IMAGE", "images/avatars/avatar_ghost_madoka.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_madoka.xml" ),
 
}
 
local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
 
STRINGS.NAMES.NIGHTMAREROCK = "Soulgem"
STRINGS.NAMES.ROSEBOW = "Madoka's Rose Bow"
 
STRINGS.CHARACTERS.GENERIC.DESCRIBE.NIGHTMAREROCK = {
    VOID = "Looking at it makes me sick.",
    WEAK = "It feels cold.",
    NORM = "It keeps still.",
    GRAY = "It lost some energy.",
    FULL = "It's pulsating."
}

STRINGS.CHARACTERS.GENERIC.DESCRIBE.ROSEBOW = "A Weapon used by a pink little girl."

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



local TUNING = GLOBAL.TUNING
local SpawnPrefab = GLOBAL.SpawnPrefab

AddPrefabPostInit("madoka", function(inst)

	if not GLOBAL.TheWorld.ismastersim then
		return
	end

	local function OnSave(inst, data)
		if inst.SoulStone then
			data.SoulStage = inst.SoulStone.SoulStage
		end
	end

	local function OnLoad(inst, data)
		if data and data.SoulStage then
			inst:DoTaskInTime(1, function()
				inst.SoulStone:UpdateRock(data.SoulStage)
			end)
		end
	end

local function OnDespawn(inst)
    if inst.SoulStone then
        if not inst.SoulStone:HasTag("INLIMBO") then
            SpawnPrefab("collapse_small").Transform:SetPosition(inst.SoulStone.Transform:GetWorldPosition())
        end
        inst.SoulStone:Remove()
    end
end

	local function OnKilledOther(inst, data)
		if inst.SoulBorn == 4 then
			inst.SoulBorn = 0
			local stage = inst.SoulStone.SoulStage
			if stage > 1 then
				inst.SoulStone:UpdateRock(inst.SoulStone.SoulStage - 1)
			end
		else
			inst.SoulBorn = inst.SoulBorn + 1
		end
	end

	local function RockReaction(inst, stage)
		if inst.components.health.regen then
			inst.components.health:StopRegen()
		end
		inst.components.sanity.custom_rate_fn = nil

		if stage == 1 then
			inst.components.health:StartRegen(-1, 1)
			inst.components.sanity.custom_rate_fn = function(inst)
				return (-2) * TUNING.DAPPERNESS_LARGE
			end
		elseif stage == 2 then
		elseif stage == 3 then
		elseif stage == 4 then
		elseif stage == 5 then
		end
	end

	inst:DoTaskInTime(0, function()
		inst.SoulStone = SpawnPrefab("nightmarerock")
		inst.SoulStone.SoulMaster = inst
		inst.components.inventory:GiveItem(inst.SoulStone)
	end)

	if inst.OnSave then
		local old1 = inst.OnSave
		inst.OnSave = function(inst, data)
			old1(inst, data)
			OnSave(inst, data)
		end
	else
		inst.OnSave = OnSave
	end
	if inst.OnLoad then
		local old2 = inst.OnLoad
		inst.OnLoad = function(inst, data)
			old2(inst, data)
			OnLoad(inst, data)
		end
	else
		inst.OnLoad = OnLoad
	end
	if inst.OnDespawn then
		local old3 = inst.OnDespawn
		inst.OnDespawn = function(inst)
			old3(inst)
			OnDespawn(inst)
		end
	else
		inst.OnDespawn = OnDespawn
	end

	inst.SoulBorn = 0
	inst:ListenForEvent("killed", OnKilledOther)
	inst:ListenForEvent("soulchange", RockReaction)
end)



-- The character select screen lines
STRINGS.CHARACTER_TITLES.madoka = "I am the Meguca"
STRINGS.CHARACTER_NAMES.madoka = "Madoka"
STRINGS.CHARACTER_DESCRIPTIONS.madoka = "*An optimistic girl\n*A magical girl\n*limited to her gem"
STRINGS.CHARACTER_QUOTES.madoka = "\"If someone tells me that it's wrong to hope, I will tell them that they're wrong every time.\""
 
-- Custom speech strings
STRINGS.CHARACTERS.MADOKA = require "speech_madoka"
 
-- The character's name as appears in-game 
STRINGS.NAMES.MADOKA = "Madoka"
 
-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MADOKA = 
{
    GENERIC = "It's Madoka!",
    ATTACKER = "That Madoka looks shifty...",
    MURDERER = "Murderer!",
    REVIVER = "Madoka, friend of ghosts.",
    GHOST = "Madoka could use a heart.",
}
 
 
AddMinimapAtlas("images/map_icons/madoka.xml")
 
-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("madoka", "FEMALE")
