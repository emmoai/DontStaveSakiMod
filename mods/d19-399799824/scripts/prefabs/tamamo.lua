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

        Asset( "ANIM", "anim/tamamo.zip" ),
        Asset( "ANIM", "anim/ghost_tamamo_build.zip" ),
		Asset( "ANIM", "anim/tamamo_ball.zip" )
}
local prefabs = {}
local start_inv = {
	-- Custom starting items
}


 
-- This initializes for both clients and the host
local common_postinit = function(inst) 
	-- Minimap icon
	inst.MiniMapEntity:SetIcon( "tamamo.tex" )
	inst.transformed = false 
	inst:AddComponent("keyhandler")
    inst.components.keyhandler:AddActionListener("Tamamo", TUNING.TAMAMO.KEY, "BALL")
end

-- This initializes for the host only
local master_postinit = function(inst)
	-- choose which sounds this character will play
	inst.soundsname = "willow"
	-- Stats	
	inst.components.health:SetMaxHealth(150)
	inst.components.hunger:SetMax(150)
	inst.components.sanity:SetMax(150)
	inst.components.sanity.dapperness = (TUNING.DAPPERNESS_SMALL)
	inst:AddTag("birdwhisperer")
	
	local eater = inst.components.eater
	eater.ignoresspoilage = true
	
		inst.components.eater.Eat_orig = inst.components.eater.Eat
function inst.components.eater:Eat( food )
	if self:CanEat(food) then
		if food.components.edible.sanityvalue < 0 then
		food.components.edible.sanityvalue = 1
	end
		if food.components.edible.healthvalue < 0 then
		food.components.edible.healthvalue = 3
	end
end
return inst.components.eater:Eat_orig(food)
end
	inst:RemoveTag("scarytoprey")
	inst:ListenForEvent("equip", function(inst, data)
        print("I'm wearing something.")
        inst.AnimState:ClearOverrideSymbol("swap_body")
    end)
	
end

return MakePlayerCharacter("tamamo", prefabs, assets, common_postinit, master_postinit, start_inv)
