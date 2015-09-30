-- Import the lib use.
modimport("libs/use.lua")

-- Import the mod environment as our environment.
env = use "libs/mod_env"

use "data/widgets/controls"
use "data/screens/chatinputscreen"
use "data/screens/consolescreen"

PrefabFiles = {
	"luffy", "luffyhat",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/luffy.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/luffy.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/luffy.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/luffy.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/luffy_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/luffy_silho.xml" ),

    Asset( "IMAGE", "bigportraits/luffy.tex" ),
    Asset( "ATLAS", "bigportraits/luffy.xml" ),
	
	Asset( "IMAGE", "images/map_icons/luffy.tex" ),
	Asset( "ATLAS", "images/map_icons/luffy.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_luffy.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_luffy.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_luffy.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_luffy.xml" ),

}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
GLOBAL.STRINGS.NAMES.LUFFYHAT = "路飞的帽子"

GLOBAL.TUNING.LUFFY = {}
GLOBAL.TUNING.LUFFY.KEYTWO = GetModConfigData("key2") or 122

local function SecondFn(inst)
if inst:HasTag("playerghost") then return end
if inst.transformed then
inst.AnimState:SetBuild("luffy")
inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED)
inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED)
inst.components.health.absorb = 0.10
inst.components.temperature.inherentinsulation = 35
inst.components.hunger:SetRate(0.18310)
inst.components.combat.damagemultiplier = 1

 
else
inst.AnimState:SetBuild("luffysecondgear")
inst.components.locomotor.walkspeed = (6)
inst.components.locomotor.runspeed = (8.5)
inst.components.health.absorb = 0.50
inst.components.temperature.inherentinsulation = 35
inst.components.hunger:SetRate(2)
inst.components.combat.damagemultiplier = 1.8
 
end
 
inst.transformed = not inst.transformed
 
-- inst.components.health:SetCurrentHealth(1)
-- inst.components.health:DoDelta(0)
return true
 
end
 
AddModRPCHandler("Luffy", "SECOND", SecondFn)

-- The character select screen lines
STRINGS.CHARACTER_TITLES.luffy = "吃货 路飞"
STRINGS.CHARACTER_NAMES.luffy = "Luffy"
STRINGS.CHARACTER_DESCRIPTIONS.luffy = "**可以吃所有的肉\n*伤害会增加\n*容易饿,Z键变形"
STRINGS.CHARACTER_QUOTES.luffy = "\"yy89856191频道汉化!\""

-- Custom speech strings
STRINGS.CHARACTERS.LUFFY = require "speech_luffy"

-- The character's name as appears in-game 
STRINGS.NAMES.LUFFY = "Luffy"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.LUFFY = 
{
	GENERIC = "It's the upcoming pirate king Luffy!",
	ATTACKER = "That Luffy looks shifty...",
	MURDERER = "Murderer!",
	REVIVER = "Luffy, friend of ghosts.",
	GHOST = "Luffy could use a heart.",
}

-- Let the game know character is male, female, or robot
table.insert(GLOBAL.CHARACTER_GENDERS.MALE, "luffy")


AddMinimapAtlas("images/map_icons/luffy.xml")
AddModCharacter("luffy")

