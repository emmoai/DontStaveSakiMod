local MakePlayerCharacter = require "prefabs/player_common"

local assets = {
	Asset("ANIM", "anim/saberlion.zip"),
	Asset("ANIM", "anim/ghost_saberlion_build.zip")
}

local prefabs = {}

local start_inv = {
	-- Custom starting items
	"sabermeat",
	"meat",
	"meat",
	"meat",
	"meat",
	"reviver",
}

-- This initializes for both clients and the host
local common_postinit = function(inst) 
	-- Minimap icon
	inst.MiniMapEntity:SetIcon("saberlion.tex")
	inst:AddTag("sabermeat_builder")
end

-- This initializes for the host only
local master_postinit = function(inst)
	-- choose which sounds this character will play
	inst.soundsname = "willow"
	-- Stats	
	inst.components.health:SetMaxHealth(160)
	inst.components.hunger:SetMax(200)
	inst.components.sanity:SetMax(160)
	inst.components.locomotor.walkspeed = 8
	inst.components.locomotor.runspeed = 11
	inst.components.sanity.night_drain_mult = 1
	inst.components.sanity.neg_aura_mult = 0
	inst.components.combat.damagemultiplier = 1
	inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.2)
	inst.components.hunger.hurtrate = 1.4
	inst.components.temperature.maxtemp = 60
	
	inst:RemoveTag("scarytoprey")
	
	inst.components.combat.onhitotherfn = function(attacker, target, damage, stimuli)
		if target.prefab == "beefalo" then
			local x, y, z = target.Transform:GetWorldPosition()
			local ents = TheSim:FindEntities(x, y, z, SpringCombatMod(33), { "_combat" })
			for i, v in ipairs(ents) do
				if v ~= target and v.prefab == "beefalo" then
					v.components.combat:SetTarget(nil)
					v.components.hauntable:Panic(10)
				end
			end
		end
	end

	inst:ListenForEvent("equip", function()
		inst.AnimState:ClearOverrideSymbol("swap_hat")
		inst.AnimState:Show("hair")
		inst.AnimState:ClearOverrideSymbol("swap_body")
	end)

	local selfeater = inst.components.eater
	selfeater.ignoresspoilage = true
	selfeater:SetDiet({FOODGROUP.OMNI}, {FOODTYPE.MEAT})

	local old = selfeater.Eat
	function inst.components.eater:Eat(food)
		if selfeater:CanEat(food) then
			if food.components.edible.sanityvalue < 0 then
				food.components.edible.sanityvalue = 9
			end
			if food.components.edible.healthvalue < 0 then
				food.components.edible.healthvalue = 9
			end
		end
		return old(selfeater, food)
	end
end

return MakePlayerCharacter("saberlion", prefabs, assets, common_postinit, master_postinit, start_inv)
