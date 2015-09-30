
local MakePlayerCharacter = require "prefabs/player_common"

local assets = {
        Asset( "ANIM", "anim/ma.zip" ),
		Asset("SOUND", "sound/wickerbottom.fsb"),
		Asset( "ANIM", "anim/ghost_ma_build.zip" ),

}
local prefabs = {}



local function applyupgrades(inst)

	local max_upgrades = 30
	local upgrades = math.min(inst.level, max_upgrades)

	local hunger_percent = inst.components.hunger:GetPercent()
	local health_percent = inst.components.health:GetPercent()
	local sanity_percent = inst.components.sanity:GetPercent()
	inst.components.hunger.max = math.ceil (70 + upgrades * 3) --160
	inst.components.health.maxhealth = math.ceil (70 + upgrades * 3) --160
	inst.components.sanity.max = math.ceil (140 + upgrades * 2) --200
	
	inst.components.locomotor.walkspeed =  math.ceil (6 + upgrades / 10) --9
	inst.components.locomotor.runspeed = math.ceil (9 + upgrades / 10) --13
	
	
	inst.components.talker:Say("Level : ".. (inst.level))
	
	if inst.level >29 then
		inst.components.talker:Say("Level : Max!Maki大法好")
	end

	inst.components.hunger:SetPercent(hunger_percent)
	inst.components.health:SetPercent(health_percent)
	inst.components.sanity:SetPercent(sanity_percent)

end

local function oneat(inst, food)
	
	--if food and food.components.edible and food.components.edible.foodtype == "Maki" then
	if food and food.components.edible and  food.prefab == "eggplant" or food.prefab == "cookedsmallmeat"  then
		--give an upgrade!
		inst.level = inst.level + 1
		applyupgrades(inst)	
		inst.SoundEmitter:PlaySound("dontstarve/characters/wx78/levelup")

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
	data.charge_time = inst.charge_time
end

-- This initializes for both clients and the host
local common_postinit = function(inst) 
	-- choose which sounds this character will play
	inst.soundsname = "wickerbottom"
        inst:AddComponent("reader")

	-- Minimap icon
        inst:AddTag("bookbuilder")
	inst.MiniMapEntity:SetIcon( "ma.tex" )
end

local start_inv = 
{
	
}

-- This initializes for the host only
local master_postinit = function(inst)

	inst.level = 0
	inst.components.eater:SetOnEatFn(oneat)
	applyupgrades(inst)
	-- Stats	
	inst.components.health:SetMaxHealth(70)
	inst.components.hunger:SetMax(70)
	inst.components.sanity:SetMax(140)
	inst.components.locomotor.walkspeed = 6
	inst.components.locomotor.runspeed = 9
	inst.components.combat.damagemultiplier = 1
	--inst.components.sanity.dapperness = 1
	
	inst.OnSave = onsave
	inst.OnPreLoad = onpreload

	

	inst.components.eater.stale_hunger = TUNING.WICKERBOTTOM_STALE_FOOD_HUNGER
    inst.components.eater.stale_health = TUNING.WICKERBOTTOM_STALE_FOOD_HEALTH
    inst.components.eater.spoiled_hunger = TUNING.WICKERBOTTOM_SPOILED_FOOD_HUNGER
    inst.components.eater.spoiled_health = TUNING.WICKERBOTTOM_SPOILED_FOOD_HEALTH
    
	inst.components.builder.science_bonus = 1
end

local start_inv = 
{
	
}


STRINGS.CHARACTER_TITLES.ma = " Maki"
STRINGS.CHARACTER_NAMES.ma = "Maki"
STRINGS.CHARACTER_DESCRIPTIONS.ma = " maki吃喜欢的食物可以升级 \n maki是学院偶像 \n 自带一级科技且可以发行书籍"
STRINGS.CHARACTER_QUOTES.ma = "\"傲娇sama\""

return MakePlayerCharacter("ma", prefabs, assets, common_postinit, master_postinit, start_inv)
