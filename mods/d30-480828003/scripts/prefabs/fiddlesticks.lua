
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

        Asset( "ANIM", "anim/fiddlesticks.zip" ),
        Asset( "ANIM", "anim/ghost_fiddlesticks_build.zip" ),
}
local prefabs = {}

-- Custom starting items
local start_inv = {
    'scare_scythe'
}


-- This initializes for both the server and client. Tags can be added here.
local common_postinit = function(inst) 
    -- Minimap icon
    inst.MiniMapEntity:SetIcon( "fiddlesticks.tex" )
    inst:AddTag( "scarecrow" )
end

-- This initializes for the server only. Components are added here.
local master_postinit = function(inst)
    -- choose which sounds this character will play
    inst.soundsname = "webber"
    inst.talker_path_override = "dontstarve_DLC001/characters/"
    
    -- Stats    
    inst.components.health:SetMaxHealth(100)
    inst.components.hunger:SetMax(150)
    inst.components.sanity:SetMax(220)
    
    -- Damage multiplier (optional)
    inst.components.combat.damagemultiplier = 1

    -- Souffre de la chaleur
    inst.components.temperature.overheattemp = TUNING.OVERHEAT_TEMP - 10
    inst.components.health.fire_damage_scale = 2

    -- Increase birds spawn
    local birdspawner = TheWorld.components.birdspawner
    if not TheWorld.ismastersim then
            return inst
    end
    if birdspawner ~= nil then
            birdspawner:SetSpawnTimes({min=2, max=5})
            birdspawner:SetMaxBirds(15)
    end
end


return MakePlayerCharacter("fiddlesticks", prefabs, assets, common_postinit, master_postinit, start_inv)
