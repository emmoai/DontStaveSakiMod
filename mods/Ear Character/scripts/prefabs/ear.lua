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

        Asset( "ANIM", "anim/ear.zip" ),
        Asset( "ANIM", "anim/ghost_ear_build.zip" ),
}
local prefabs = {}

-- Custom starting items
local start_inv = 
{
    "eardress",
    "earpop",
    --"earhat",
}

-- When the character is revived from human
local function onbecamehuman(inst)
	-- Set speed when loading or reviving from ghost (optional)
	--inst.components.locomotor.walkspeed = 9
	--inst.components.locomotor.runspeed = 12
end

-- When loading or spawning the character
local function onload(inst)
    inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)

    if not inst:HasTag("playerghost") then
        onbecamehuman(inst)
    end
end

local function applyupgrades(inst)

    local max_upgrades = 20
    local upgrades = math.min(inst.level, max_upgrades)

    local hunger_percent = inst.components.hunger:GetPercent()
    local health_percent = inst.components.health:GetPercent()
    local sanity_percent = inst.components.sanity:GetPercent()

    inst.components.hunger.max = math.ceil (150 + upgrades * 5)
    inst.components.sanity.max = math.ceil (100 + upgrades * 7.5)
    inst.components.health.maxhealth = math.ceil (100 + upgrades * 7.5)
    inst.components.talker:Say(" Level Up!你确定你洗脸了？ : ".. (inst.level))
    
    if inst.level >19 then
        inst.components.talker:Say("Level : Max!这个看脸的世界orz")
    end

    inst.components.hunger:SetPercent(hunger_percent)
    inst.components.health:SetPercent(health_percent)
    inst.components.sanity:SetPercent(sanity_percent)
end

local function oneat(inst, food)
    local summonchance1 = 0.2  
    local summonchance2 = 0.09
    if math.random() < summonchance1 and food and food.components.edible.foodtype == "MEAT" then
        inst.level = inst.level + 1
        applyupgrades(inst) 
        inst.components.sanity:DoDelta(inst.components.sanity.max*0.5)
        inst.components.health:DoDelta(inst.components.health.maxhealth*0.5)
        inst.SoundEmitter:PlaySound("dontstarve/characters/wx78/levelup")
        
        --inst.HUD.controls.status.heart:PulseGreen()
        --inst.HUD.controls.status.stomach:PulseGreen()
        --inst.HUD.controls.status.brain:PulseGreen()
        
        --inst.HUD.controls.status.brain:ScaleTo(1.3,1,.7)
        --inst.HUD.controls.status.heart:ScaleTo(1.3,1,.7)
        --inst.HUD.controls.status.stomach:ScaleTo(1.3,1,.7)
    end
    
    if math.random() < summonchance2 and food then
        inst.components.sanity:DoDelta(inst.components.sanity.max)
        inst.components.health:DoDelta(inst.components.health.maxhealth)
        inst.components.talker:Say("WoW 我是幸运的耳朵 !")
    end
end

local function updatestats(inst)
    if TheWorld.state.isday then
        --inst.components.hunger:DoDelta(-inst.components.hunger.max*0.33)
        --inst.components.sanity:DoDelta(-inst.components.sanity.max*0.15)
        inst.components.combat.damagemultiplier = 1
        inst.components.locomotor.walkspeed = 9*0.9
        inst.components.locomotor.runspeed = 12*0.9
    elseif TheWorld.state.isdusk then
        inst.components.combat.damagemultiplier = 1.1
        inst.components.locomotor.walkspeed = 9
        inst.components.locomotor.runspeed = 12
    elseif TheWorld.state.isnight then
        inst.components.combat.damagemultiplier = 1.2
        inst.components.locomotor.walkspeed = 9*1.1
        inst.components.locomotor.runspeed = 12*1.1
    end
end

local function onpreload(inst, data)
    if data then
        if data.level then
            inst.level = data.level
            applyupgrades(inst)
            --re-set these from the save data, because of load-order clipping issues
            if data.health and data.health.health then inst.components.health.currenthealth = data.health.health end
            if data.hunger and data.hunger.hunger then inst.components.hunger.current = data.hunger.hunger end
            if data.sanity and data.sanity.current then inst.components.sanity.current = data.sanity.current end
            inst.components.health:DoDelta(0)
            inst.components.hunger:DoDelta(0)
            inst.components.sanity:DoDelta(0)
        end
    end
end

local function onsave(inst, data)
    data.level = inst.level
end

-- This initializes for both the server and client. Tags can be added here.
local common_postinit = function(inst) 
	-- Minimap icon
	inst.MiniMapEntity:SetIcon("ear.tex")
    inst:AddTag("ear_builder")
end

-- This initializes for the server only. Components are added here.
local master_postinit = function(inst)
	-- choose which sounds this character will play
	inst.soundsname = "willow"
	
	-- Uncomment if "wathgrithr"(Wigfrid) or "webber" voice is used
    --inst.talker_path_override = "dontstarve_DLC001/characters/"
		
    inst.level = 0
    inst.components.eater:SetOnEatFn(oneat)
    applyupgrades(inst) 
    -- Stats
    inst.components.hunger:SetMax(150)
    inst.components.sanity:SetMax(100)
    inst.components.health:SetMaxHealth(100)
    --speed 
	inst.components.locomotor.walkspeed = 9
	inst.components.locomotor.runspeed = 12

    -- damage
    inst.components.combat.damagemultiplier = 1.1

    inst.components.sanity.night_drain_mult = 1.2
    inst.components.sanity.neg_aura_mult = 1.2
    inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE)

    inst.OnSave = onsave
    inst.OnPreLoad = onpreload
    
    inst.OnLoad = onload
    inst.OnNewSpawn = onload
    inst:ListenForEvent("death", function(inst) inst.transformed = not inst.transformed end)
    inst:ListenForEvent( "dusktime", function() updatestats(inst) end , GetWorld())
    inst:ListenForEvent( "daytime", function() updatestats(inst) end , GetWorld())
    inst:ListenForEvent( "nighttime", function() updatestats(inst) end , GetWorld())
    inst:ListenForEvent("phasechanged",function() updatestats(inst) end,TheWorld)
    updatestats(inst)

    TheInput:AddKeyUpHandler(KEY_F11, function()
        inst.components.talker:Say(" - -b  你对这个看脸的世界绝望了么？".. (inst.level))
    end)
end

return MakePlayerCharacter("ear", prefabs, assets, common_postinit, master_postinit, start_inv)