
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

        Asset( "ANIM", "anim/xenomorph.zip" ),
        Asset( "ANIM", "anim/ghost_xenomorph_build.zip" ),
}
local prefabs = {}

-- Custom starting items
local start_inv = {
}

-- When the character is revived from human
local function onbecamehuman(inst)
	-- Set speed when loading or reviving from ghost (optional)
	inst.components.locomotor.walkspeed = 9
	inst.components.locomotor.runspeed = 10
end

-- When loading or spawning the character
local function onload(inst)
    inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)

    if not inst:HasTag("playerghost") then
        onbecamehuman(inst)
    end
end


-- This initializes for both the server and client. Tags can be added here.
local common_postinit = function(inst) 
	-- Minimap icon
	inst.MiniMapEntity:SetIcon( "xenomorph.tex" )
end

-- This initializes for the server only. Components are added here.
local master_postinit = function(inst)
	-- choose which sounds this character will play
	inst.soundsname = "willow"
	
	-- Uncomment if "wathgrithr"(Wigfrid) or "webber" voice is used
    --inst.talker_path_override = "dontstarve_DLC001/characters/"
	
	-- Stats	
	inst.components.health:SetMaxHealth(250)
	inst.components.hunger:SetMax(100)
	inst.components.sanity:SetMax(60)
	inst.components.sanity.night_drain_mult = 0
	inst.components.sanity.neg_aura_mult = 0
	inst.components.temperature.maxtemp = 40
	inst.components.health.fire_damage_scale = 5
	inst.entity:AddLight()
    --inst.Light:Enable(true)
    inst.Light:SetRadius(40)
    inst.Light:SetFalloff(.5)
    inst.Light:SetIntensity(0.9)
    inst.Light:SetColour(245/255,255/255,245/255)
	
	-- Damage multiplier (optional)
    inst.components.combat.damagemultiplier = 1.8
	
	-- Hunger rate (optional)
	inst.components.hunger.hungerrate = 0.8 * TUNING.WILSON_HUNGER_RATE
	
	inst.OnLoad = onload
    inst.OnNewSpawn = onload
	inst:ListenForEvent("equip", function()
		inst.AnimState:ClearOverrideSymbol("swap_hat")
		inst.AnimState:Show("hair")
		inst.AnimState:ClearOverrideSymbol("swap_body")
	end)

	local selfeater = inst.components.eater
	selfeater.ignoresspoilage = true
	selfeater:SetDiet({FOODGROUP.OMNI}, {FOODTYPE.MEAT})

	local old = selfeater.Eat
	function inst.components.eater:Eat(food)
		if selfeater:CanEat(food) then
			if food.components.edible.sanityvalue < 0 then
				food.components.edible.sanityvalue = 10
			end
			if food.components.edible.healthvalue < 0 then
				food.components.edible.healthvalue = 10
			end
		end
		return old(selfeater, food)
	end
end

return MakePlayerCharacter("xenomorph", prefabs, assets, common_postinit, master_postinit, start_inv)