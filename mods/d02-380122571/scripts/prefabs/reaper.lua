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

		-- Don't forget to include your character's custom assets!
        Asset( "ANIM", "anim/reaper.zip" ),
	Asset( "ANIM", "anim/ghost_reaper_build.zip" ),
}

local prefabs = 

{
        "scythe",
}

local start_inv =
{
		"scythe",
}

local function common_postinit(inst)

	inst.soundsname = "wolfgang"

	inst.MiniMapEntity:SetIcon( "reaper.tex" )
	
--- recipes
end
	
local function lighton(inst, data)
if TheWorld.state.isnight then
	local light = inst.entity:AddLight()
	inst.Light:Enable(true)
	inst.Light:SetRadius(10)
	inst.Light:SetFalloff(.4)
	inst.Light:SetIntensity(.5)
	inst.Light:SetColour(0/255,185/255,255/255)
	
elseif TheWorld.state.isday then
	local light = inst.entity:AddLight()
	light:SetIntensity(0)
	light:SetRadius(0)
	light:SetFalloff(0)
	light:Enable(false)
	light:SetColour(0/255, 0/255, 0/255)
elseif TheWorld.state.isdusk then
	local light = inst.entity:AddLight()
	light:SetIntensity(0)
	light:SetRadius(0)
	light:SetFalloff(0)
	light:Enable(false)
	light:SetColour(0/255, 0/255, 0/255)
	end
end
	
local function master_postinit(inst)

	inst.components.eater.strongstomach = true
	
	inst.components.health:SetMaxHealth(120)
	inst.components.hunger:SetMax(130)
	inst.components.sanity:SetMax(100)
	inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1.2)
	inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1.2)
	inst.components.combat.damagemultiplier = 1.6
	inst.components.sanity.night_drain_mult = 0	
	
	
	local light = inst.entity:AddLight()
	light:SetIntensity(0)
	light:SetRadius(0)
	light:SetFalloff(0)
	light:Enable(false)
	light:SetColour(0/255, 0/255, 0/255)
	
	inst:ListenForEvent("sanitydelta", lighton)
	inst:ListenForEvent("respawnfromghost")


inst.components.sanity.custom_rate_fn = function() 
		if TheWorld.state.isnight then
	return 0/60
	elseif TheWorld.state.isday then
		return -4/60
	elseif TheWorld.state.isdusk then
		return 0/60
	end
end
	end
	
			
return MakePlayerCharacter("reaper", prefabs, assets, common_postinit, master_postinit, start_inv)