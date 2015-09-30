PrefabFiles = {
	"horo",
	"horofire",
	"wheatpouch",
}

Assets = {
	Asset( "IMAGE", "images/saveslot_portraits/horo.tex" ),
	Asset( "ATLAS", "images/saveslot_portraits/horo.xml" ),

	Asset( "IMAGE", "images/selectscreen_portraits/horo.tex" ),
	Asset( "ATLAS", "images/selectscreen_portraits/horo.xml" ),

	Asset( "IMAGE", "images/selectscreen_portraits/horo_silho.tex" ),
	Asset( "ATLAS", "images/selectscreen_portraits/horo_silho.xml" ),

	Asset( "IMAGE", "bigportraits/horo.tex" ),
	Asset( "ATLAS", "bigportraits/horo.xml" ),

	Asset( "IMAGE", "images/map_icons/horo.tex" ),
	Asset( "ATLAS", "images/map_icons/horo.xml" ),

	Asset( "IMAGE", "images/avatars/avatar_horo.tex" ),
	Asset( "ATLAS", "images/avatars/avatar_horo.xml" ),

	Asset( "IMAGE", "images/avatars/avatar_ghost_horo.tex" ),
	Asset( "ATLAS", "images/avatars/avatar_ghost_horo.xml" ),
}

-- Begin operation Spice & Wolf
-- This library function allows us to use a file in a specified location.
-- Allows use to call global environment variables without initializing them in our files.
modimport("libs/env.lua")

-- Actions Initialization.
use "data/actions/init"

-- Component Initialization.
use "data/components/init"

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
local ACTIONS = GLOBAL.ACTIONS
local TECH = GLOBAL.TECH

-- The character select screen lines
STRINGS.CHARACTER_TITLES.horo = "The Wise Wolf"
STRINGS.CHARACTER_NAMES.horo = "Horo"
STRINGS.CHARACTER_DESCRIPTIONS.horo = "-Natural born Hunter \n-Has high standards \n-Has natural regeneration"
STRINGS.CHARACTER_QUOTES.horo = "Loneliness is a fatal disease."
GLOBAL.STRINGS.NAMES.WHEATPOUCH = "Wheatpouch"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.WHEATPOUCH = "This is probably important to someone."
-- Custom speech strings
STRINGS.CHARACTERS.HORO = require "speech_horo"

-- The character's name as appears in-game 
STRINGS.NAMES.HORO = "Horo"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.HORO = 
{
	GENERIC = "It's Horo!",
	ATTACKER = "Horo looks angry",
	MURDERER = "The wrath of Horo!",
	REVIVER = "Horo is indeed a wise wolf.",
	GHOST = "Can Horo not revive herself?",
}
local function HealthPostInit(self)
	self.RecalculatePenalty = function(self, forceupdatewidget)
        self.numrevives = self.numrevives > 3 and 3 or self.numrevives
        self.penalty = self.numrevives * ((self.maxhealth * 0.25) / 40)
        
        self:DoDelta(0, nil, "resurrection_penalty", forceupdatewidget)
	end
end
AddComponentPostInit("health", HealthPostInit)

local function WheatpouchPostInit(inst)

	if not inst.components.characterspecific then
		inst:AddComponent("characterspecific")
	end

	-- Prefab name of character.
	inst.components.characterspecific:SetOwner("horo")

	-- Determine if we want to allow this item to be stored in a chest or backpack.
	inst.components.characterspecific:SetStorable(false)

	-- Set the speech which will be played for all characters who can't pick up this item.
	inst.components.characterspecific:SetComment("I should leave this alone.")

	return inst
end
AddPrefabPostInit("wheatpouch", WheatpouchPostInit)
-- Collision destruction starts here

local SpawnPrefab = GLOBAL.SpawnPrefab
 
local function onothercollide(inst, other)
    if not other:IsValid() then
        return
    elseif other:HasTag("smashable") then
        other.components.health:Kill()
    elseif other.components.workable ~= nil and other.components.workable.workleft > 0 then
        SpawnPrefab("collapse_small").Transform:SetPosition(other.Transform:GetWorldPosition())
        other.components.workable:Destroy(inst)
    end
end
 
local Vector3 = GLOBAL.Vector3
AllPlayers = GLOBAL.AllPlayers
local CAMERASHAKE = GLOBAL.CAMERASHAKE
local FRAMES = GLOBAL.FRAMES
 
local function oncollide(inst, other)
    if not (other ~= nil and other:IsValid() and inst:IsValid())
    or other:HasTag("player")
    or Vector3(inst.Physics:GetVelocity()):LengthSq() < 2 then
        return
    end
 
    for i, v in ipairs(AllPlayers) do
        if not (v == inst) then
            v:ShakeCamera(CAMERASHAKE.SIDE, .5, .05, .1, inst, 40)
        end
    end
 
    inst:DoTaskInTime(2 * FRAMES, onothercollide, other)
end
 
TheInput = GLOBAL.TheInput
local KEY_R = GLOBAL.KEY_R
local KEY_H = GLOBAL.KEY_H

-- Collision works for 3 seconds after activation
-- Cooldown resets 20 secs after activation, so the effective cooldown is 17 seconds

AddModRPCHandler(modname, "HOROCHARGE", function(player)
	if not player:HasTag("playerghost") and player.prefab == "horo" then
		if not player.chargeincooldown then
			player.components.talker:Say("I will you show my true strength!")
			player.chargeincooldown = true
			player.Physics:SetCollisionCallback(oncollide)
			player.components.hunger:DoDelta(-5)
		    player.components.health:DoDelta(-2)
			player:DoTaskInTime(3, function()
				player.components.talker:Say("I should take it easy for a while.")
				player.Physics:SetCollisionCallback(nil)
			end)
			player:DoTaskInTime(30, function()
				player.components.talker:Say("I'm ready for another go!")
				player.chargeincooldown = false
			end)
		else
			player.components.talker:Say("I'm tired for now.")
		end
	end
end)

-- Hunting time is 15 sec enough to stalk 1-2 prey
AddModRPCHandler(modname, "HOROHUNT", function(player)
	if not player:HasTag("playerghost") and player.prefab == "horo" then
		if not player.huntincooldown then
			player.components.talker:Say("No prey can escape from me.")
			player.huntincooldown = true
			-- For rabbits
			player:RemoveTag("scarytoprey")
			-- For birds
			player:AddTag("notarget")
			player:DoTaskInTime(15, function()
				player.components.talker:Say("I'm bored of sneaking around.")
				player:AddTag("scarytoprey")
				player:RemoveTag("notarget")
			end)
			player:DoTaskInTime(120, function()
				player.components.talker:Say("Who shall be my next prey?")
				player.huntincooldown = false
			end)
		else
			player.components.talker:Say("I'll hunt when I am ready.")
		end
	end
end)


 local horohandlers = {}

-- After a player gets created
AddPlayerPostInit(function(inst)
	-- We hack
	inst:DoTaskInTime(0, function()
		-- We check if the character is ourselves
		-- So if another horo player joins, we don't get the handlers
		if inst == GLOBAL.ThePlayer then
			-- If we are horo
			if inst.prefab == "horo" then
				-- We create and store the key handlers
				horohandlers[1] = TheInput:AddKeyDownHandler(KEY_R, function()
					SendModRPCToServer(MOD_RPC[modname]["HOROCHARGE"])
				end)
				horohandlers[2] = TheInput:AddKeyDownHandler(KEY_H, function()
					SendModRPCToServer(MOD_RPC[modname]["HOROHUNT"])
				end)		
			else
				-- If not, we go to the handlerslist and empty it
				-- This is to avoid having the handlers if we switch characters in wilderness
				-- If it's already empty, nothing changes
				for k, v in pairs(horohandlers) do
					horohandlers[k] = nil
				end
			end
		end
	end)
end)

-- Active abilities end here

-- Backpack dig action when pouch is worn begins here

local EQUIPSLOTS = GLOBAL.EQUIPSLOTS

-- Custom dig for custom ActionHandler
AddAction("CUSTOMDIG", "Dig", function(act)
	local val = ACTIONS.DIG.fn(act)
	if val then
		return true
	end
end)

local ActionHandler = GLOBAL.ActionHandler
local FRAMES = GLOBAL.FRAMES

-- I take away the tool anims and I give them back when the dig anim ends
-- So always you dig with the pouch, you get an invisible dig
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.CUSTOMDIG, function(inst)
	inst.AnimState:ClearOverrideSymbol("swap_object")
	inst.AnimState:Hide("swap_object")
	inst:DoTaskInTime(50 * FRAMES, function()
		local handitem = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
		if handitem then
			handitem.components.equippable.onequipfn(handitem, inst)
			
		end
	end)
	return "dig_start"
end))

-- When the wheatpouch is equipped you get a right click action for diggable things
AddComponentPostInit("playeractionpicker", function(self)
	if self.inst.prefab == "horo" then
		local old = self.GetRightClickActions
		self.GetRightClickActions = function(self, position, target)
			local bodyitem = self.inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.BODY)
			if bodyitem and bodyitem.prefab == "wheatpouch" then
				if target and target:HasTag(ACTIONS.DIG.id.."_workable") then
					return self:SortActionList({ ACTIONS.CUSTOMDIG }, target)
				end
			end
			return old(self, position, target)
		end
	end
end)

-- Backpack dig action when pouch is worn ends here

AddMinimapAtlas("images/map_icons/horo.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("horo", "FEMALE")
