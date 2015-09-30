-- Import the lib use.
modimport("libs/use.lua")
 
-- Import the mod environment as our environment.
env = use "libs/mod_env"
 
 
use "data/widgets/controls"
use "data/screens/chatinputscreen"
use "data/screens/consolescreen"

PrefabFiles = {
	"tamamo",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/tamamo.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/tamamo.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/tamamo.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/tamamo.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/tamamo_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/tamamo_silho.xml" ),

    Asset( "IMAGE", "bigportraits/tamamo.tex" ),
    Asset( "ATLAS", "bigportraits/tamamo.xml" ),
	
	Asset( "IMAGE", "images/map_icons/tamamo.tex" ),
	Asset( "ATLAS", "images/map_icons/tamamo.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_tamamo.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_tamamo.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_tamamo.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_tamamo.xml" ),

}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

GLOBAL.TUNING.TAMAMO = {}
GLOBAL.TUNING.TAMAMO.KEY = GetModConfigData("key") or 122

AddComponentPostInit("follower", function(self)
    local old_AddLoyaltyTime = self.AddLoyaltyTime
    function self:AddLoyaltyTime(time) -- overrides AddLoyaltyTime of follower component
        old_AddLoyaltyTime(self, time)
        if self.leader and self.leader.prefab == "tamamo" then
            self.task:Cancel() -- if leader is your character, stops task telling follower to leave player after a while
            self.task = nil
        end
    end
     
    -- same as above, but with LongUpdate
    local old_LongUpdate = self.LongUpdate
    function self:LongUpdate(dt)
        old_LonhUpdate(self, dt)
        if self.leader and self.leader.prefab == "tamamo" then
            self.task:Cancel()
            self.task = nil
        end
    end

end)

local function RecheckForThreat(inst)
    local busy = inst.sg:HasStateTag("sleeping") or inst.sg:HasStateTag("busy") or inst.sg:HasStateTag("flying")
    if not busy then
        local threat = GLOBAL.FindEntity(inst, 5, nil, nil, {'notarget', 'birdwhisperer'}, {'player', 'monster', 'scarytoprey'})
        return threat ~= nil or GLOBAL.TheWorld.state.isnight
    end
end
 
AddStategraphPostInit("bird", function(sg)
	local old = sg.events.flyaway.fn
	sg.events.flyaway.fn = function(inst)
		if RecheckForThreat(inst) then
			old(inst)
		end
	end
end)

local function BallFn(inst)
if inst:HasTag("playerghost") then return end
if inst.transformed then
inst.AnimState:SetBuild("tamamo")
inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED)
inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED)
inst.components.health.absorb = 0.05
inst.components.combat.damagemultiplier = 0.8
inst.components.temperature.inherentinsulation = 35
inst.components.hunger:SetRate(0.18310)
 
else
inst.AnimState:SetBuild("tamamo_ball")
inst.components.locomotor.walkspeed = (2.5)
inst.components.locomotor.runspeed = (3.5)
inst.components.health.absorb = 0.80
inst.components.combat.damagemultiplier = 0.5
inst.components.temperature.inherentinsulation = 65
inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE)
 
end
 
inst.transformed = not inst.transformed
 
-- inst.components.health:SetCurrentHealth(1)
-- inst.components.health:DoDelta(0)
return true
 
end
 
AddModRPCHandler("Tamamo", "BALL", BallFn)

-- The character select screen lines
STRINGS.CHARACTER_TITLES.tamamo = "����"
STRINGS.CHARACTER_NAMES.tamamo = "Tamamo"
STRINGS.CHARACTER_DESCRIPTIONS.tamamo = "*��������ϲ����!Z������\n*���Ժܼ򵥵�ɱ�����ӣ��񣬻�!\n*���ŵ�ʱ�򣬻���һ������!"
STRINGS.CHARACTER_QUOTES.tamamo = "\"���ߴ�սħ����ĺ���һ���峤!\""

-- Custom speech strings
STRINGS.CHARACTERS.TAMAMO = require "speech_tamamo"

-- The character's name as appears in-game 
STRINGS.NAMES.TAMAMO = "Tamamo"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.TAMAMO = 
{
	GENERIC = "����ħ����������֮һ�ľ�β����!",
	ATTACKER = "���忴�����ܲ����...",
	MURDERER = "����!",
	REVIVER = "���ѵ���һ����̬.",
	GHOST = "�����ҿ��Ծ���.",
}


AddMinimapAtlas("images/map_icons/tamamo.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("tamamo", "FEMALE")

