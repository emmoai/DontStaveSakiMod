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

GLOBAL.STRINGS.NAMES.LAMBENTLIGHT = "��˸֮��"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.LAMBENTLIGHT = "��˿�ȵ�ϸ��."
GLOBAL.STRINGS.NAMES.ASUNAWAND = "������֮��"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.ASUNAWAND = "��˿�ȵ�������֮��."

-- The character select screen lines
STRINGS.CHARACTER_TITLES.asuna = "�񱩲�ʦ"
STRINGS.CHARACTER_NAMES.asuna = "��˿��"
STRINGS.CHARACTER_DESCRIPTIONS.asuna = "*��ɫ��������\n*ӵ�е���ϸ��\n*���ڵ�ͬ��"
STRINGS.CHARACTER_QUOTES.asuna = "\"�Ҳ�������ⳡ��Ϸ..��Ϊ�����ҵ�����!\""

-- Custom speech strings
STRINGS.CHARACTERS.ASUNA = require "speech_asuna"

-- The character's name as appears in-game 
STRINGS.NAMES.ASUNA = "��˿��"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.ASUNA = 
{
	GENERIC = "��˿��!",
	ATTACKER = "��˿�ȿ�������ǿ...",
	MURDERER = "����!",
	REVIVER = "��˿��, ���֮��.",
	GHOST = "��˿�ȿ����þ���֮�ĸ���.",
}


AddMinimapAtlas("images/map_icons/asuna.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("asuna", "FEMALE")


