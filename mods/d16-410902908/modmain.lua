PrefabFiles = {
	"wukong",
	"ruyibang"
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/wukong.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/wukong.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/wukong.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/wukong.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/wukong_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/wukong_silho.xml" ),

    Asset( "IMAGE", "bigportraits/wukong.tex" ),
    Asset( "ATLAS", "bigportraits/wukong.xml" ),
	
	Asset( "IMAGE", "images/map_icons/wukong.tex" ),
	Asset( "ATLAS", "images/map_icons/wukong.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_wukong.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_wukong.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_wukong.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_wukong.xml" ),

}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

GLOBAL.STRINGS.NAMES.RUYIBANG = "�𹿰�"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.RUYIBANG= "���Ƕ�������"

local untouchables = {
    rabbit = true,
    perd = true,
    crow = true,
    robin = true,
    robin_winter = true,
	babybeefalo = true, 
	butterfly = true,
	smallbird = true,
}

AddComponentPostInit("playeractionpicker", function(self)
    local old = self.SortActionList
    function self:SortActionList(actions, target, useitem)
        if #actions == 0 then
            return actions
        end
        local c = 0
        for k, v in pairs(actions) do
            if v == GLOBAL.ACTIONS.ATTACK and
            self.inst.prefab == "wukong" and
            untouchables[target.prefab] then
                c = 1
                break
            end
        end
        if c == 1 then
            return {}
        else
            return old(self, actions, target, useitem)
        end
    end
end)

-- The character select screen lines
STRINGS.CHARACTER_TITLES.wukong = "���"
STRINGS.CHARACTER_NAMES.wukong = "Wukong"
STRINGS.CHARACTER_DESCRIPTIONS.wukong = "*�Դ��𹿰������������Զ \n*����ɮ�� (������ԲУ�����Ѫ)\n*��Ҫ����������"
STRINGS.CHARACTER_QUOTES.wukong = "\"�·�����\""

-- Custom speech strings
STRINGS.CHARACTERS.WUKONG = require "speech_wukong"

-- The character's name as appears in-game 
STRINGS.NAMES.WUKONG = "Wukong"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.WUKONG = 
{
	GENERIC = "���!",
	ATTACKER = "������ӿ�����������...",
	MURDERER = "����!",
	REVIVER = "��յ�����һ����̬.",
	GHOST = "�����Ҫ����.",
}


AddMinimapAtlas("images/map_icons/wukong.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("wukong", "MALE")

