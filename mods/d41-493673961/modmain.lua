-- Import the lib use.
modimport("libs/use.lua")
 
-- Import the mod environment as our environment.
env = use "libs/mod_env"
 
 
use "data/widgets/controls"
use "data/screens/chatinputscreen"
use "data/screens/consolescreen"

PrefabFiles = {
	"broccoli", "gemma",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/broccoli.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/broccoli.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/broccoli.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/broccoli.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/broccoli_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/broccoli_silho.xml" ),

    Asset( "IMAGE", "bigportraits/broccoli.tex" ),
    Asset( "ATLAS", "bigportraits/broccoli.xml" ),
	
	Asset( "IMAGE", "images/map_icons/broccoli.tex" ),
	Asset( "ATLAS", "images/map_icons/broccoli.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_broccoli.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_broccoli.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_broccoli.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_broccoli.xml" ),
	
    Asset("SOUNDPACKAGE", "sound/broccoli.fev"),
	Asset("SOUND", "sound/broccoli.fsb"),
}

RemapSoundEvent( "dontstarve/characters/broccoli/death_voice", "broccoli/sound/death_voice" )
RemapSoundEvent( "dontstarve/characters/broccoli/hurt", "broccoli/sound/hurt" )
RemapSoundEvent( "dontstarve/characters/broccoli/talk_LP", "broccoli/sound/talk_LP" )

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

GLOBAL.TUNING.BROCCOLI = {}
GLOBAL.TUNING.BROCCOLI.KEYFOUR = GetModConfigData("key4") or 122

local function BroccoliballFn(inst)
if inst:HasTag("playerghost") then return end
if inst.transformed then
inst.AnimState:SetBuild("broccoli")
	inst.SoundEmitter:PlaySound("dontstarve_DLC001/creatures/catcoon/pounce")
inst.components.locomotor.walkspeed = (6.5)
inst.components.locomotor.runspeed = (8)
inst.components.health.absorb = 0.50
inst.components.combat.damagemultiplier = 0.75

	inst.Transform:SetScale(0.7, 0.7, 0.7)
 
else
inst.AnimState:SetBuild("broccoliball")
	inst.SoundEmitter:PlaySound("dontstarve_DLC001/creatures/catcoon/pounce")
inst.components.locomotor.walkspeed = (6.5 * 1.5)
inst.components.locomotor.runspeed = (8 * 1.5)
inst.components.health.absorb = 0.10
inst.components.combat.damagemultiplier = 0

	inst.Transform:SetScale(0.7, 0.7, 0.7)
 
end
 
inst.transformed = not inst.transformed
 
-- inst.components.health:SetCurrentHealth(1)
-- inst.components.health:DoDelta(0)
return true
 
end
 
AddModRPCHandler("Broccoli", "BROCCOLIBALL", BroccoliballFn)
 
local myspeech = require "speech_broccoli"
 
local function EditSpeech(val)
    if type(val) == "table" then
        for k, v in pairs(val) do
            if type(v) == "table" then
                EditSpeech(v)
            elseif type(v) == "string" then
                val[k] = val[k].." Nyu."
            end
        end
    end
end

EditSpeech(myspeech)

local my_auras = {}
  
AddPrefabPostInit("broccoli", function(inst)
    if not GLOBAL.TheWorld.ismastersim then
        return
    end
    my_auras[inst.GUID] = { range = 10, mult_bonus = 1.25, absorb_per = 0.25 }
    inst.OnDespawn = function(inst)
        my_auras[inst.GUID] = nil
    end
end)
  
AddPlayerPostInit(function(inst)
    if inst.components.combat == nil then
        return
	end
    if not GLOBAL.TheWorld.ismastersim then
        return
    end
    local old_cd = inst.components.combat.CalcDamage
    inst.components.combat.CalcDamage = function(self, target, weapon, multiplier)
        for k, v in pairs(my_auras) do
            local p = GLOBAL.Ents[k]
            if p ~= self.inst and p:IsNear(self.inst, v.range) then
                multiplier = (multiplier or 1) * v.mult_bonus
                break
            end
        end
        return old_cd(self, target, weapon, multiplier)
    end
    local old_ga = inst.components.combat.GetAttacked
    inst.components.combat.GetAttacked = function(self, attacker, damage, weapon, stimuli)
        if damage ~= nil then
            for k, v in pairs(my_auras) do
                local p = GLOBAL.Ents[k]
                if p ~= self.inst and p:IsNear(self.inst, v.range) then
                    damage = damage * (1 - v.absorb_per)
                    break
                end
            end
        end
        return old_ga(self, attacker, damage, weapon, stimuli)
    end
end)

STRINGS.NAMES.GEMMA = "保母加玛"

STRINGS.CHARACTERS.GENERIC.DESCRIBE.GEMMA = "看他是多么黄的加玛啊."

-- The character select screen lines
STRINGS.CHARACTER_TITLES.broccoli = "布子"
STRINGS.CHARACTER_NAMES.broccoli = "Brocolli"
STRINGS.CHARACTER_DESCRIPTIONS.broccoli = "*自带团队增益效果,无耐久保姆加玛\n*在她附近,队友增加25%伤害\n*在她附近,队友帮她吸收25%伤害?"
STRINGS.CHARACTER_QUOTES.broccoli = "\"Z建变形,来自.超次元海王星.\""

-- Custom speech strings
STRINGS.CHARACTERS.BROCCOLI = require "speech_broccoli"

-- The character's name as appears in-game 
STRINGS.NAMES.BROCCOLI = "Puchi-..Brocolli"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BROCCOLI = 
{
	GENERIC = "It's Puchi-..Brocolli!",
	ATTACKER = "That Brocolli looks shifty...",
	MURDERER = "Murderer!",
	REVIVER = "Brocolli, friend of ghosts.",
	GHOST = "Brocolli could use a heart.",
}


AddMinimapAtlas("images/map_icons/broccoli.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("broccoli", "FEMALE")

