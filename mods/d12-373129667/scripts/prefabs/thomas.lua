
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
        Asset( "ANIM", "anim/thomas.zip" ),
        Asset( "ANIM", "anim/ghost_thomas_build.zip" ),
}
local prefabs = {

}

local start_inv = {
"diamondmattock"
}

local common_postinit = function(inst) 
	inst.MiniMapEntity:SetIcon( "thomas.tex" )
end

local function crockpotdishsanity(inst, food)
 local eater = inst.components.eater
 local foodtype = food.components.edible.foodtype
 local prefab = food.prefab
	if eater then
		if prefab == "baconeggs" or prefab == "butteryflymuffin" or prefab == "dragonpie" or prefab == "fishtacos" or prefab == "fishsticks" or prefab == "jammypreserves" or prefab == "frogglebunwich" or prefab == "fruitmedley" or prefab == "flowersalad" or prefab == "guacamole" or prefab == "honeyham" or prefab == "honeynuggets" or prefab == "icecream" or prefab == "kabobs" or prefab == "mandrakesoup" or prefab == "meatballs" or prefab == "bonestew" or prefab == "perogies" or prefab == "powcake" or prefab == "pumpkincookie" or prefab == "ratatouille" or prefab == "hotchili" or prefab == "stuffedeggplant" or prefab == "taffy" or prefab == "trailmix" or prefab == "turkeydinner" or prefab == "unagi" or prefab == "waffles" then
	inst.components.sanity:DoDelta(math.random(8,15))
		end
	end
end

local master_postinit = function(inst)

	if thomas_voice ~= "default" then
	inst.soundsname = thomas_voice
	end
	
	inst.components.health:SetMaxHealth(120)
	inst.components.hunger:SetMax(135)
	inst.components.sanity:SetMax(160)
	inst.components.combat.damagemultiplier = 0.85
    inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1.1)
	inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1.15)
	inst.components.sanity.night_drain_mult = -1.0
	inst.components.sanity.dapperness = TUNING.DAPPERNESS_SMALL * (-2.2)
	inst.components.eater:SetOnEatFn(crockpotdishsanity)

	end
	
return MakePlayerCharacter("thomas", prefabs, assets, common_postinit, master_postinit, start_inv)
