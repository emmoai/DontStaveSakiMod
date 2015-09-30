PrefabFiles = {
	"asuna",
	"lambentlight",
	"asunawand",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/asuna.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/asuna.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/asuna.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/asuna.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/asuna_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/asuna_silho.xml" ),

    Asset( "IMAGE", "bigportraits/asuna.tex" ),
    Asset( "ATLAS", "bigportraits/asuna.xml" ),
	
	Asset( "IMAGE", "images/map_icons/asuna.tex" ),
	Asset( "ATLAS", "images/map_icons/asuna.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_asuna.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_asuna.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_asuna.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_asuna.xml" ),

}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

if GLOBAL.TheNet:GetIsServer() then


	AddPrefabPostInit("birdcage", function(inst)
		inst:AddComponent("sanityaura")
		inst.components.sanityaura.aura = 0
	end)
	AddComponentPostInit("sanityaura", function(self)
		local old = self.GetAura 
		function self:GetAura(observer) 
			if observer.prefab == "asuna" and self.inst.prefab == "birdcage" then 
				return -1
			end
			return old(self,observer) 
		end
	end)		
	
	AddComponentPostInit("sanityaura", function(self)
		local old = self.GetAura 
		function self:GetAura(observer) 
			if observer.prefab == "asuna" and self.inst.prefab == "tentacle" then 
				return -10
			end
			return old(self,observer) 
		end
	end)	

end

GLOBAL.STRINGS.NAMES.LAMBENTLIGHT = "闪烁之光"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.LAMBENTLIGHT = "亚丝娜的细剑."
GLOBAL.STRINGS.NAMES.ASUNAWAND = "世界树之杖"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.ASUNAWAND = "亚丝娜的世界树之杖."

-- The character select screen lines
STRINGS.CHARACTER_TITLES.asuna = "狂暴补师"
STRINGS.CHARACTER_NAMES.asuna = "亚丝娜"
STRINGS.CHARACTER_DESCRIPTIONS.asuna = "*出色的治疗者\n*拥有单手细剑\n*出众的同伴"
STRINGS.CHARACTER_QUOTES.asuna = "\"我不想输掉这场游戏..因为这是我的生命!\""

-- Custom speech strings
STRINGS.CHARACTERS.ASUNA = require "speech_asuna"

-- The character's name as appears in-game 
STRINGS.NAMES.ASUNA = "亚丝娜"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.ASUNA = 
{
	GENERIC = "亚丝娜!",
	ATTACKER = "亚丝娜看起来很强...",
	MURDERER = "凶手!",
	REVIVER = "亚丝娜, 鬼魂之友.",
	GHOST = "亚丝娜可以用救赎之心复活.",
}


AddMinimapAtlas("images/map_icons/asuna.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("asuna", "FEMALE")


