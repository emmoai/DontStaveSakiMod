local easing = require("easing")
local MakePlayerCharacter = require "prefabs/player_common"

local assets = {
        Asset( "ANIM", "anim/ho.zip" ),
		Asset("SOUND", "sound/wilson.fsb"),
		Asset( "ANIM", "anim/ghost_ho_build.zip" ),

}
local prefabs = {
	"jambun",
}


local function updatestats(inst)
	local percent = inst.components.hunger:GetPercent()
	local health_max = TUNING.WOLFGANG_HEALTH_WIMPY
	local scale = 1
	
	local moreregen_scale = 1.25
	local minregen_scale = .75
	
	
	if inst.strength == "minregen" then
		local minregen_start = (-.5)	
		local minregen_percent = math.min(minregen_start)
		inst.components.combat.damagemultiplier = .5
		health_max = easing.linear(minregen_percent, TUNING.WOLFGANG_HEALTH_WIMPY,  TUNING.WOLFGANG_HEALTH_MIGHTY - TUNING.WOLFGANG_HEALTH_NORMAL, 1)
		
	elseif inst.strength == "medregen" then
		inst.components.combat.damagemultiplier = 1
	elseif inst.strength == "moreregen" then
		local moreregen_start = (.5)
		local moreregen_percent = math.max(moreregen_start)
		inst.components.combat.damagemultiplier = 2
		health_max = easing.linear(moreregen_percent, TUNING.WOLFGANG_HEALTH_WIMPY, TUNING.WOLFGANG_HEALTH_MIGHTY - TUNING.WOLFGANG_HEALTH_NORMAL, 1)
		
	end

	local health_percent = inst.components.health:GetPercent()
	inst.components.health:SetMaxHealth(health_max)
	inst.components.health:SetPercent(health_percent, true)
end

local function onhungerchange(inst, data)
	if inst.sg:HasStateTag("nomorph") or
        inst:HasTag("playerghost") or
        inst.components.health:IsDead() then
        return
    end
	
	if  inst.components.hunger.current >= 150 then
		if inst.strength == "medregen" then
			inst.strength = "moreregen"
			inst.components.talker:Say("Maximum Attack.")
		elseif inst.strength == "minregen" then
			inst.strength = "moreregen"
			inst.components.talker:Say("Maximum Attack.")
		else
			inst.strength = "moreregen"
		end
		
	
		

	elseif  inst.components.hunger.current >= 50 then
        if inst.strength == "moreregen" then
			inst.strength = "medregen"
			inst.components.talker:Say("Normal.")
		elseif inst.strength == "minregen" then
			inst.strength = "medregen"
			inst.components.talker:Say("Normal.")
		else
			inst.strength = "medregen"
		end
	
	
	else
        if inst.strength == "medregen" then
			inst.strength = "minregen"
			inst.components.talker:Say("I'm so week.")
		elseif inst.strength == "moreregen" then
			inst.strength = "minregen"
			inst.components.talker:Say("I'm so week.")
		else
			inst.strength = "minregen"
		end
	
		
	end
			
	updatestats(inst)
end

local function onnewstate(inst)
    if inst._wasnomorph ~= inst.sg:HasStateTag("nomorph") then
        inst._wasnomorph = not inst._wasnomorph
        if not inst._wasnomorph then
            onhungerchange(inst)
        end
    end
end

local function onbecamehuman(inst)
    if inst._wasnomorph == nil then
        inst.strength = "medregen"
        inst._wasnomorph = inst.sg:HasStateTag("nomorph")
        inst.talksoundoverride = nil
        inst.hurtsoundoverride = nil
        inst:ListenForEvent("hungerdelta", onhungerchange)
        inst:ListenForEvent("newstate", onnewstate)
        onhungerchange(inst, nil, true)
    end
end

local function onbecameghost(inst)
    if inst._wasnomorph ~= nil then
        inst.strength = "medregen"
        inst._wasnomorph = nil
        inst.talksoundoverride = nil
        inst.hurtsoundoverride = nil
        inst:RemoveEventCallback("hungerdelta", onhungerchange)
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
    inst.MiniMapEntity:SetIcon("ho.tex")
	inst:AddTag("ho") 
end

local function master_postinit(inst)
	
	inst.soundsname = "wilson"
	
	inst.strength = "medregen"
	
	inst.components.hunger:SetMax(250)
	inst.components.health:SetMaxHealth(150)
	inst.components.sanity:SetMax(150)
	
	inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 2)
	
	inst:ListenForEvent("hungerdelta", onhungerchange)
	
	
	
    inst.OnLoad = onload
    inst.OnNewSpawn = onload
	
	
end



local start_inv = 
{
	
}


STRINGS.CHARACTER_TITLES.ho = "Kousaka Honoka"
STRINGS.CHARACTER_NAMES.ho = "Honoka"
STRINGS.CHARACTER_DESCRIPTIONS.ho = "*Leader of Love Live. \n Love Live School Idol"
STRINGS.CHARACTER_QUOTES.ho = "\"Today breads are delicious.\""

return MakePlayerCharacter("ho", prefabs, assets, common_postinit, master_postinit, start_inv)
