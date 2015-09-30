
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
	Asset("SOUND", "sound/willow.fsb"),
        Asset( "ANIM", "anim/beard.zip" ),

        Asset( "ANIM", "anim/kotori.zip" ),
		Asset( "ANIM", "anim/ghost_kotori_build.zip" ),

}
local prefabs = {
"idol_suit",
"minalinsky",
"minalinsky_mk2",
"minalinsky_mk3",
}

local start_inv = {
	-- Custom starting items
	"minalinsky",
}

local function common_postinit(inst)

    inst.MiniMapEntity:SetIcon("kotori.tex")
	inst:AddTag("kotori") 
end

local function master_postinit(inst)
	
	inst.components.health:SetMaxHealth(160)
	inst.components.hunger:SetMax(160)
	inst.components.sanity:SetMax(150)
	inst.soundsname = "willow"

end


STRINGS.CHARACTER_TITLES.kotori = "Minami Kotori"
STRINGS.CHARACTER_NAMES.kotori = "Kotori"
STRINGS.CHARACTER_DESCRIPTIONS.kotori = "*School Idol's designer. \n Love Live School Idol"
STRINGS.CHARACTER_QUOTES.kotori = "\"Kotori What.\""

return MakePlayerCharacter("kotori", prefabs, assets, common_postinit, master_postinit, start_inv)
