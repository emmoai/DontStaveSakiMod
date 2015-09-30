
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

        Asset( "ANIM", "anim/wukong.zip" ),
        Asset( "ANIM", "anim/ghost_wukong_build.zip" ),
}
local prefabs = {}
local start_inv = {
	-- Custom starting items
		"ruyibang",		--Wukong's staff
}

-- This initializes for both clients and the host
local common_postinit = function(inst) 
	-- Minimap icon
	inst.MiniMapEntity:SetIcon( "wukong.tex" )
end


local function oneat(inst, food)

	if food and food.components.edible and food.components.edible.foodtype == "MEAT" then
		inst.components.sanity:DoDelta(-TUNING.SANITY_MED) -- Eating meat will cause wukong to lose a lot more sanity
	end
end

-- This initializes for the host only
local master_postinit = function(inst)
	-- choose which sounds this character will play
	inst.soundsname = "wolfgang"
	-- Stats	
	-- inst.components.eater:SetVegetarian(true)				
    inst.components.combat.damagemultiplier = 1.2
	inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1.3)
	inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1.3)
	inst.components.temperature.inherentinsulation = 30
	inst.components.health:SetMaxHealth(170)
	inst.components.hunger:SetMax(170)
	inst.components.sanity:SetMax(150)
	inst.components.health:StartRegen(1, 30)
	inst.components.eater:SetOnEatFn(oneat)
	
	inst.components.eater.Eat_orig = inst.components.eater.Eat
	function inst.components.eater:Eat( food )
	if self:CanEat(food) then
		if food.components.edible.sanityvalue > 0 and food.components.edible.foodtype == "MEAT" then
		food.components.edible.sanityvalue = 0
	end
		if food.components.edible.healthvalue > 0 and food.components.edible.foodtype == "MEAT" then
		food.components.edible.healthvalue = 0
	end
end
return inst.components.eater:Eat_orig(food)
end

end
return MakePlayerCharacter("wukong", prefabs, assets, common_postinit, master_postinit, start_inv)
