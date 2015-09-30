
local MakePlayerCharacter = require "prefabs/player_common"

local assets = {
        Asset( "ANIM", "anim/eli.zip" ),
		Asset("SOUND", "sound/willow.fsb"),
		Asset( "ANIM", "anim/ghost_eli_build.zip" ),
		
}
local prefabs = {}


local function applyupgrades(inst)

	local max_upgrades = 20
	local upgrades = math.min(inst.level, max_upgrades)

	local hunger_percent = inst.components.hunger:GetPercent()
	local health_percent = inst.components.health:GetPercent()
	local sanity_percent = inst.components.sanity:GetPercent()

	inst.components.hunger.max = math.ceil (150 + upgrades * 5)
	inst.components.health.maxhealth = math.ceil (150 + upgrades * 5)
	inst.components.sanity.max = math.ceil (150 + upgrades * 5)
	
	inst.components.talker:Say("Level : ".. (inst.level))
	
	if inst.level >19 then
		inst.components.talker:Say("Level : Max!")
	end

	inst.components.hunger:SetPercent(hunger_percent)
	inst.components.health:SetPercent(health_percent)
	inst.components.sanity:SetPercent(sanity_percent)
end

local function oneat(inst, food)
	
	--if food and food.components.edible and food.components.edible.foodtype == "HELLO" then
	if food and food.components.edible and food.prefab == "dragonpie"  then
		--give an upgrade!
		inst.level = inst.level + 1
		applyupgrades(inst)	
		inst.SoundEmitter:PlaySound("dontstarve/characters/wx78/levelup")
		--inst.HUD.controls.status.heart:PulseGreen()
		--inst.HUD.controls.status.stomach:PulseGreen()
		--inst.HUD.controls.status.brain:PulseGreen()
		
		--inst.HUD.controls.status.brain:ScaleTo(1.3,1,.7)
		--inst.HUD.controls.status.heart:ScaleTo(1.3,1,.7)
		--inst.HUD.controls.status.stomach:ScaleTo(1.3,1,.7)
	end
end

local function ondeath(inst)
    
    inst.level = 0
    applyupgrades(inst)
   
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

local function updatestats(inst)
	if inst.strength == "medregen" then
		inst.components.combat.damagemultiplier = 1
	elseif inst.strength == "moreregen" then
		inst.components.combat.damagemultiplier = 2
	end
end

local function onsanitychange(inst, data)
	if inst.sg:HasStateTag("nomorph") or
        inst:HasTag("playerghost") or
        inst.components.health:IsDead() then
        return
    end
	
	if  inst.components.sanity.current < 30 then
		if inst.strength == "medregen" then
			inst.strength = "moreregen"
			inst.components.talker:Say("Maximum Attack.")
		else
			inst.strength = "moreregen"
		end
		
	else
        if inst.strength == "moreregen" then
			inst.strength = "medregen"
			inst.components.talker:Say("Normal.")
		else
			inst.strength = "medregen"
		end
	
	end
			
	updatestats(inst)
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
        inst.strength = "medregen"
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
        inst.strength = "medregen"
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

local function common_postinit(inst)
    inst.MiniMapEntity:SetIcon("eli.tex")
end

local function master_postinit(inst)

	inst.soundsname = "willow"
	
	inst.level = 0
	inst.strength = "medregen"
	inst.components.eater:SetOnEatFn(oneat)
	applyupgrades(inst)
	
	
	inst.components.health:SetMaxHealth(150)
	inst.components.hunger:SetMax(150)
	inst.components.sanity:SetMax(150)
	
	inst.components.sanity.night_drain_mult = 3
    
	inst:ListenForEvent("death", ondeath)
	inst.OnSave = onsave
	inst.OnPreLoad = onpreload
	
	inst:ListenForEvent("sanitydelta", onsanitychange)
	
	inst.OnLoad = onload
    inst.OnNewSpawn = onload
	
end



local start_inv = 
{
	
}


STRINGS.CHARACTER_TITLES.eli = "Ayase Eli"
STRINGS.CHARACTER_NAMES.eli = "Eli"
STRINGS.CHARACTER_DESCRIPTIONS.eli = "*Student Council President. \n Love Live School Idol"
STRINGS.CHARACTER_QUOTES.eli = "\"Harasho\""

return MakePlayerCharacter("eli", prefabs, assets, common_postinit, master_postinit, start_inv)
