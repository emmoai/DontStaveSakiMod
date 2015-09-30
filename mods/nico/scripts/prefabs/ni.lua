
local MakePlayerCharacter = require "prefabs/player_common"

local assets = {
        Asset( "ANIM", "anim/ni.zip" ),
		Asset("SOUND", "sound/wilson.fsb"),
		Asset( "ANIM", "anim/ghost_ni_build.zip" ),

}
local prefabs = {}




local function common_postinit(inst)
	
    inst.MiniMapEntity:SetIcon("ni.tex")
end



local function applyupgrades(inst)

	local max_upgrades = 30
	local upgrades = math.min(inst.level, max_upgrades)

	local hunger_percent = inst.components.hunger:GetPercent()
	local health_percent = inst.components.health:GetPercent()
	local sanity_percent = inst.components.sanity:GetPercent()

	inst.components.hunger.max = math.ceil (110 + upgrades * 3) --200
	inst.components.health.maxhealth = math.ceil (70 + upgrades * 3) --160
	inst.components.sanity.max = math.ceil (130 + upgrades * 1) --160
	
	inst.components.locomotor.walkspeed =  math.ceil (9 + upgrades / 6) --14
	inst.components.locomotor.runspeed = math.ceil (11 + upgrades / 6) --16

	
	inst.components.talker:Say("Level : ".. (inst.level))
	
	if inst.level >29 then
		inst.components.talker:Say("Level : Max!Nico nico ni nico是最强的")
	end

	inst.components.hunger:SetPercent(hunger_percent)
	inst.components.health:SetPercent(health_percent)
	inst.components.sanity:SetPercent(sanity_percent)

end

local function oneat(inst, food)
	
	--if food and food.components.edible and food.components.edible.foodtype == "Maki" then
	if food and food.components.edible and food.prefab == "butterflymuffin" or food.prefab == "honeynuggets" or food.prefab == "jammypreserves" then
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
	inst.soundsname = "willow"

	-- Minimap icon
	inst.MiniMapEntity:SetIcon( "ni.tex" )
end

-- This initializes for the host only
local master_postinit = function(inst)

	inst.level = 0
	inst.components.eater:SetOnEatFn(oneat)
	applyupgrades(inst)
	-- Stats	
	inst.components.health:SetMaxHealth(70)
	inst.components.hunger:SetMax(110)
	inst.components.sanity:SetMax(130)
	inst.components.locomotor.walkspeed = 9
	inst.components.locomotor.runspeed = 11
	inst.components.combat.damagemultiplier = 1.5
	--inst.components.sanity.dapperness = 1
	
	inst.OnSave = onsave
	inst.OnPreLoad = onpreload
end


local start_inv = 
{
	
}


STRINGS.CHARACTER_TITLES.ni = "nico"
STRINGS.CHARACTER_NAMES.ni = "Nico"
STRINGS.CHARACTER_DESCRIPTIONS.ni = "*nico吃喜欢的食物能够升级 \n 一手好厨艺秒做双倍食物 \n nico是学院偶像"
STRINGS.CHARACTER_QUOTES.ni = "\"大家一起来 nico nico ni.\""

return MakePlayerCharacter("ni", prefabs, assets, common_postinit, master_postinit, start_inv)
