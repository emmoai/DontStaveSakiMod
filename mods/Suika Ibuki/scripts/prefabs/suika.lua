local easing = require("easing")
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

        Asset( "ANIM", "anim/suika.zip" ),
        Asset( "ANIM", "anim/ghost_suika_build.zip" ),
}
local prefabs = {}

-- Custom starting items
local start_inv = {
}

local function applymightiness(inst)
	local percent = inst.components.sanity:GetPercent()
	
	local damage_mult = 1.1
	local health_max = 250
	local scale = 1
	
	local hunger_rate = 1.25;
	local hunger_rate_min = 1;
	local hunger_rate_max = 1.5;

	local mighty_scale = 1.3
	local wimpy_scale = .75
	local normal_speed = 1.1
	
	local wimpy_attack = .5
	local wimpy_attack_min = .75
	local wimpy_health = 100
	local wimpy_speed = .8
	
	local mighty_attack = 2
	local mighty_attack_min = 1.25
	local mighty_health = 400
	local mighty_speed = 1.3

	if inst.strength == "mighty" then
		local mighty_start = .333
		local mighty_percent = math.max(0, 1 - percent/mighty_start)
		damage_mult = easing.linear(mighty_percent, mighty_attack_min, mighty_attack - mighty_attack_min, 1)
		health_max = easing.linear(mighty_percent, health_max, mighty_health - health_max, 1)	
		hunger_rate = easing.linear(mighty_percent, hunger_rate, hunger_rate_max - hunger_rate, 1)	
		normal_speed = easing.linear(mighty_percent, normal_speed, mighty_speed - normal_speed, 1)	
		scale = easing.linear(mighty_percent, 1, mighty_scale - 1, 1)	
	elseif inst.strength == "wimpy" then
		local wimpy_start = .667
		local wimpy_percent = math.min(1, (percent - wimpy_start) / (1 - wimpy_start))
		damage_mult = easing.linear(wimpy_percent, wimpy_attack_min, wimpy_attack - wimpy_attack_min, 1)
		health_max = easing.linear(wimpy_percent, health_max, wimpy_health - health_max, 1)	
		hunger_rate = easing.linear(wimpy_percent, hunger_rate_min, hunger_rate - hunger_rate_min, 1)	
		normal_speed = easing.linear(wimpy_percent, normal_speed, wimpy_speed - normal_speed, 1)	
		scale = easing.linear(wimpy_percent, 1, wimpy_scale - 1, 1)	
	end

    inst:ApplyScale("mightiness", scale)
	inst.components.hunger:SetRate(hunger_rate*TUNING.WILSON_HUNGER_RATE)
	inst.components.combat.damagemultiplier = damage_mult
	inst.components.combat:SetAttackPeriod(TUNING.WILSON_ATTACK_PERIOD * scale)

	local health_percent = inst.components.health:GetPercent()
	inst.components.health:SetMaxHealth(health_max)
	inst.components.health:SetPercent(health_percent, true)
	
	inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * normal_speed)
	inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * normal_speed)
end

local function becomewimpy(inst, silent)
	if inst:HasTag("drunk") then
		inst:RemoveTag("drunk")
	end
	if not inst:HasTag("sober") then
		inst:AddTag("sober")
	end
    if inst.strength == "wimpy" then
        return
    end

    if not silent then
        inst.sg:PushEvent("powerdown")
        inst.components.talker:Say(GetString(inst, "ANNOUNCE_NORMALTOWIMPY"))
        inst.SoundEmitter:PlaySound("dontstarve/characters/wolfgang/shrink_medtosml")
    end

    inst.talksoundoverride = "dontstarve/characters/wendy/talk_LP"
    inst.hurtsoundoverride = "dontstarve/characters/wendy/hurt"
    inst.strength = "wimpy"
end

local function becomenormal(inst, silent)
	if inst:HasTag("drunk") then
		inst:RemoveTag("drunk")
	end
	if inst:HasTag("sober") then
		inst:RemoveTag("sober")
	end
    if inst.strength == "normal" then
        return
    end

    if not silent then
        if inst.strength == "mighty" then
            inst.components.talker:Say(GetString(inst, "ANNOUNCE_MIGHTYTONORMAL"))
            inst.sg:PushEvent("powerdown")
            inst.SoundEmitter:PlaySound("dontstarve/characters/wolfgang/shrink_lrgtomed")
        elseif inst.strength == "wimpy" then
            inst.components.talker:Say(GetString(inst, "ANNOUNCE_WIMPYTONORMAL"))
            inst.sg:PushEvent("powerup")
            inst.SoundEmitter:PlaySound("dontstarve/characters/wolfgang/grow_smtomed")
        end
    end

    inst.talksoundoverride = nil
    inst.hurtsoundoverride = nil
    inst.strength = "normal"
end

local function becomemighty(inst, silent)
	if not inst:HasTag("drunk") then
		inst:AddTag("drunk")
	end
	if inst:HasTag("sober") then
		inst:RemoveTag("sober")
	end
    if inst.strength == "mighty" then
        return
    end

    if not silent then
        inst.components.talker:Say(GetString(inst, "ANNOUNCE_NORMALTOMIGHTY"))
        inst.sg:PushEvent("powerup")
        inst.SoundEmitter:PlaySound("dontstarve/characters/wolfgang/grow_medtolrg")
    end

    inst.talksoundoverride = "dontstarve/characters/wolfgang/talk_large_LP"
    inst.hurtsoundoverride = "dontstarve/characters/wolfgang/hurt_large"
    inst.strength = "mighty"
end

-- Part of a protection system to prevent infinite drunk-undrunk loops
local lastsanity = 90;


local function onsanitychange(inst, data, forcesilent)
    if inst.sg:HasStateTag("nomorph") or
        inst:HasTag("playerghost") or
        inst.components.health:IsDead() then
        return
    end

    local silent = inst.sg:HasStateTag("silentmorph") or not inst.entity:IsVisible() or forcesilent

	if not inst:HasTag("huge")
	and inst.components.sanity.current > lastsanity + 10 or inst.components.sanity.current < lastsanity - 10 then	
		if not inst:HasTag("suikasleep") then
			if inst.strength == "wimpy" then
				if inst.components.sanity.current < 100 then
					if silent and inst.components.sanity.current < 50 then
						becomemighty(inst, true)
						lastsanity = inst.components.sanity.current
					else
						becomenormal(inst, silent)
						lastsanity = inst.components.sanity.current
					end
				end
			elseif inst.strength == "mighty" then
				if inst.components.sanity.current > 50 then
					if silent and inst.components.sanity.current > 100 then
						becomewimpy(inst, true)
						lastsanity = inst.components.sanity.current
					else
						becomenormal(inst, silent)
						lastsanity = inst.components.sanity.current
					end
				end
			elseif inst.components.sanity.current < 50 then
				becomemighty(inst, silent)
				lastsanity = inst.components.sanity.current
			elseif inst.components.sanity.current > 100 then
				becomewimpy(inst, silent)
				lastsanity = inst.components.sanity.current
			end
			



			applymightiness(inst)
		end
	end
end

local function onnewstate(inst)
    if inst._wasnomorph ~= inst.sg:HasStateTag("nomorph") then
        inst._wasnomorph = not inst._wasnomorph
        if not inst._wasnomorph then
            onsanitychange(inst)
        end
    end
end

local function onbecamehuman(inst)
    if inst._wasnomorph == nil then
        inst.strength = "normal"
        inst._wasnomorph = inst.sg:HasStateTag("nomorph")
        inst.talksoundoverride = nil
        inst.hurtsoundoverride = nil
        inst:ListenForEvent("sanitydelta", onsanitychange)
        inst:ListenForEvent("newstate", onnewstate)
        onsanitychange(inst, nil, true)
    end
end

local function onbecameghost(inst)
    if inst._wasnomorph ~= nil then
        inst.strength = "normal"
        inst._wasnomorph = nil
        inst.talksoundoverride = nil
        inst.hurtsoundoverride = nil
        inst:RemoveEventCallback("sanitydelta", onsanitychange)
        inst:RemoveEventCallback("newstate", onnewstate)
    end
end

local function onload(inst)
    inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
    inst:ListenForEvent("ms_becameghost", onbecameghost)

    if inst:HasTag("playerghost") then
        onbecameghost(inst)
    else
        onbecamehuman(inst)
    end
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
	inst.MiniMapEntity:SetIcon( "suika.tex" )
end

local timerbackup = 0

local function sanityfn(inst)
	local delta = 0;
	if inst.strength == "mighty" then
		delta = 0.25
	elseif inst.strength == "normal" then
		delta = 0.15
	elseif inst.strength == "wimpy" then
		delta = 0
	end
	
	if inst.components.sanity.current < 1 and not inst:HasTag("suikasleep") then 
		lastsanity = inst.components.sanity.current
		inst:AddTag("suikasleep")
		if inst.components.grogginess ~= nil then
			inst.components.grogginess:AddGrogginess(10, 3)
			inst:DoTaskInTime(3, function(inst)
				timerbackup = 100
			end)
		end
	end
		
	if inst:HasTag("suikasleep") then 
		if inst.components.sanity.current < 150 and timerbackup < 10 then 
			delta = 20
		else
			inst.strength = "wimpy"
			inst.components.sanity:SetPercent(1, 1)
			inst.components.grogginess:ComeTo()
			inst:RemoveTag("suikasleep")
			timerbackup = 0
		end
	end
	return delta
end
local function healthfn(inst)
	local delta = 0;
	if inst.strength == "mighty" then
		delta = .25
	elseif inst.strength == "normal" then
		delta = 0
	elseif inst.strength == "wimpy" then
		delta = 0
	end

	return delta
end


local function OnEat(inst, food)
	
end
 
-- This initializes for the server only. Components are added here.
local master_postinit = function(inst)
    inst:AddTag("cardbuilder")
	inst:AddComponent("divine")

	inst.strength = "normal"
    inst._wasnomorph = nil
    inst.talksoundoverride = nil
    inst.hurtsoundoverride = nil

	-- choose which sounds this character will play
	inst.soundsname = "wilson"
	
	-- Uncomment if "wathgrithr"(Wigfrid) or "webber" voice is used
    --inst.talker_path_override = "dontstarve_DLC001/characters/"
	
	-- Stats	
	inst.components.health:SetMaxHealth(250)
	inst.components.hunger:SetMax(200)
	inst.components.sanity:SetMax(150)
	inst.components.sanity.current = 90
	inst.components.combat.defaultdamage = 20
	-- Gets sober
	inst.components.sanity.custom_rate_fn = sanityfn
	inst.components.health.custom_rate_fn = healthfn
		
	-- Damage multiplier (optional)
    inst.components.combat.damagemultiplier = 1.1
	
	-- Hunger rate (optional)
	inst.components.hunger.hungerrate = 1 * TUNING.WILSON_HUNGER_RATE
	
	inst.components.eater:SetOnEatFn(OnEat)
		
	inst.OnLoad = onload
    inst.OnNewSpawn = onload
end

local start_inv =
{
    "papyrus",
    "nightmarefuel",
}

return MakePlayerCharacter("suika", prefabs, assets, common_postinit, master_postinit, start_inv)
