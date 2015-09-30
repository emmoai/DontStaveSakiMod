
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
        Asset( "ANIM", "anim/reimu.zip" ),
	Asset( "IMAGE", "images/reimutab.tex"),
        Asset( "ATLAS", "images/reimutab.xml"),
	Asset("IMAGE", "images/inventoryimages/lf.tex"),
	Asset("ATLAS", "images/inventoryimages/lf.xml"),
	Asset("IMAGE", "images/inventoryimages/yyy.tex"),
	Asset("ATLAS", "images/inventoryimages/yyy.xml"),
	Asset("IMAGE", "images/inventoryimages/qmb.tex"),
	Asset("ATLAS", "images/inventoryimages/qmb.xml"),
}

local prefabs = 
{
    "lf",
    "qmb",
    "yyy",
}

local start_inv = { "qmb","lf","lf","lf","lf","lf","lf","lf","lf","lf","lf","yyy",}

local common_postinit = function(inst)
    -- choose which sounds this character will play
    inst.soundsname = "wickerbottom"

    -- a minimap icon must be specified
    inst.entity:AddMiniMapEntity()
    inst.MiniMapEntity:SetIcon( "reimu1.tex" ) 

    inst:AddTag("reimubuilder")
    inst.ghostbuild = "ghost_willow_build"
end

local master_postinit = function(inst)
	
	-- todo: Add an example special power here.

	inst.components.health.maxhealth = 100
	inst.components.sanity.max = 120

	inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1.3)
    inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1.3)
	inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.25)

	inst.components.sanity.neg_aura_mult = 0

end

return MakePlayerCharacter("reimu", prefabs, assets, common_postinit, master_postinit, start_inv)
