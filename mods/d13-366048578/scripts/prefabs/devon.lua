local MakePlayerCharacter = require "prefabs/player_common"


local assets = {

        Asset( "ANIM", "anim/player_basic.zip" ),
        Asset( "ANIM", "anim/player_idles_shiver.zip" ),
        Asset( "ANIM", "anim/player_actions.zip" ),
        Asset( "ANIM", "anim/player_actions_axe.zip" ),
        Asset( "ANIM", "anim/player_actions_pickaxe.zip" ),
        Asset( "ANIM", "anim/player_actions_shovel.zip" ),
        Asset( "ANIM", "anim/player_actions_blowdart.zip" ),
        Asset( "ANIM", "anim/player_actions_eat.zip" ),
        Asset( "ANIM", "anim/player_actions_item.zip" ),
        Asset( "ANIM", "anim/player_actions_uniqueitem.zip" ),
        Asset( "ANIM", "anim/player_actions_bugnet.zip" ),
        Asset( "ANIM", "anim/player_actions_fishing.zip" ),
        Asset( "ANIM", "anim/player_actions_boomerang.zip" ),
        Asset( "ANIM", "anim/player_bush_hat.zip" ),
        Asset( "ANIM", "anim/player_attacks.zip" ),
        Asset( "ANIM", "anim/player_idles.zip" ),
        Asset( "ANIM", "anim/player_rebirth.zip" ),
        Asset( "ANIM", "anim/player_jump.zip" ),
        Asset( "ANIM", "anim/player_amulet_resurrect.zip" ),
        Asset( "ANIM", "anim/player_teleport.zip" ),
        Asset( "ANIM", "anim/wilson_fx.zip" ),
        Asset( "ANIM", "anim/player_one_man_band.zip" ),
        Asset( "ANIM", "anim/shadow_hands.zip" ),
        Asset( "SOUND", "sound/sfx.fsb" ),
        Asset( "SOUND", "sound/wilson.fsb" ),
        Asset( "ANIM", "anim/beard.zip" ),

        Asset( "ANIM", "anim/devon.zip" ),
        Asset( "ANIM", "anim/ghost_devon_build.zip" ),
		Asset( "ANIM", "anim/birdy.zip"),
}
local prefabs = {"birdy"}

local start_inv = {
	    "birdy", 
}

local function RestoreSpeed(inst)
	inst:DoTaskInTime(3, function(inst)
	inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1.4)
	inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1.5)
	inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 0.5)
	inst.components.combat.min_attack_period = 0.25
	inst.components.sanity.night_drain_mult = 1
	inst.components.temperature.maxtemp = 20
	end, inst)
	
end


local function devonrain(inst, israining)
    if israining then
		inst.components.sanity.dapperness = (1 * TUNING.DAPPERNESS_MED * TheWorld.state.precipitationrate)
    else
        if inst.rain_task ~= nil then inst.rain_task:Cancel() end
    end
end
 
local function onbecamealive(inst)
    inst:WatchWorldState("israining", devonrain)
end
 
local function onbecameghost(inst)
    inst:StopWatchingWorldState("israining", devonrain)
end


local common_postinit = function(inst) 
	inst.soundsname = "devon"
	inst.MiniMapEntity:SetIcon( "devon.tex" )
	
	inst:AddTag("bestbirdfriends")
end

-- This initializes for the host only
local master_postinit = function(inst)
	-- Stats	
	inst.components.temperature.maxtemp = 92
	inst.components.temperature.mintemp = -5
	inst.components.temperature.overheattemp = 80
	inst.components.health:SetMaxHealth(150)
	inst.components.hunger:SetMax(100)
	inst.components.sanity:SetMax(200)
	inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 0.5)
	inst.components.combat.min_attack_period = 0.25
	inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1.4)
	inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1.5)
	inst.components.sanity.night_drain_mult = 1
	inst.components.sanity.ghost_drain_mult = 1
	
	
	inst:ListenForEvent("respawnfromghost", RestoreSpeed)
	inst:ListenForEvent("ms_respawnedfromghost", onbecamealive)
    inst:ListenForEvent("ms_becameghost", onbecameghost)
end



return MakePlayerCharacter("devon", prefabs, assets, common_postinit, master_postinit, start_inv)
