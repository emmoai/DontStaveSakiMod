local MakePlayerCharacter = require "prefabs/player_common"

local assets = {
	Asset( "ANIM", "anim/horo.zip" ),
	Asset( "ANIM", "anim/ghost_horo_build.zip" ),
}

local prefabs = {
}

-- Custom starting items (Temporary force start until item summoning has been resolved)
local start_inv = {
	"monsterlasagna",
	"monsterlasagna",
	"wheatpouch"
}

-- Horo is a natural born hunter (She is a wolf after all)
local function updatedamage(inst, phase)
	if phase == "day" then
		inst.components.combat.damagemultiplier = 0.75
		inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1.1)
		inst.components.locomotor.runspeed = (TUNING.WILSON_WALK_SPEED * 1.1)
		if inst.horofire then
			inst.horofire:Remove()
			inst.horofire = nil
		end
	elseif phase == "night" then
		inst.components.combat.damagemultiplier = 1.8
		inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1.85)
		inst.components.locomotor.runspeed = (TUNING.WILSON_WALK_SPEED * 1.85)
		inst.components.sanity.neg_aura_mult = 0
		inst.components.sanity.dapperness = TUNING.DAPPERNESS_MED * (1)
		if not inst.horofire then
			inst.horofire = SpawnPrefab("horofire")
			local follower = inst.horofire.entity:AddFollower()
			follower:FollowSymbol(inst.GUID, "swap_body", 0, 0, 0)
		end
	elseif phase == "dusk" then
		inst.components.combat.damagemultiplier = 1.2
		inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1.85)
		inst.components.locomotor.runspeed = (TUNING.WILSON_WALK_SPEED * 1.85)
		inst.components.sanity.neg_aura_mult = 0.2
		inst.components.sanity.dapperness = TUNING.DAPPERNESS_MED * (0.8)
	end
end	

 


-- This initializes for both clients and the host
local common_postinit = function(inst) 
	-- Minimap icon
	inst.MiniMapEntity:SetIcon( "horo.tex" )
	inst:AddTag("horo")
    
	inst.entity:AddLight()
	inst.lightlevel = net_tinybyte(inst.GUID, "hdll", "updatelight")
	inst:ListenForEvent("updatelight", function()
		updatelightstatus(inst, inst.lightlevel:value())
	end)
	inst.lightlevel:set(0)
end

-- Summoning code unavailable until I figure out what i'm doing

-- This initializes for the host only
local master_postinit = function(inst)
	-- choose which sounds this character will play
	inst.soundsname = "willow"
	-- Stats	
	inst.components.health:SetMaxHealth(30)
	inst.components.hunger:SetMax(250)
	inst.components.sanity:SetMax(150)
	inst.components.builder.science_bonus = 1
   	inst:WatchWorldState("phase", updatedamage)
	updatedamage(inst, TheWorld.state.phase)
   
	inst.components.eater.strongstomach = true --Allows Horo to eat monster lasagna
 
    local old_pte = inst.components.eater.PrefersToEat  --Horo only eats fresh food
    inst.components.eater.PrefersToEat = function(self, inst)
    if inst.components.perishable then
        if inst.components.perishable:IsStale() or inst.components.perishable:IsSpoiled() then
            return
        end
    end
    if inst.prefab == "spoiled_food" then
        return
    end
    return old_pte(self, inst)
end

-- No tools for Horo
local tools = {
		axe = true,
		pickaxe = true,
		shovel = true,
		hammer = true
	}
	inst:ListenForEvent("equip", function(inst, data) 
		if tools[data.item.prefab] then 
			inst:DoTaskInTime(0, function(inst)
				inst.components.inventory:GiveItem(data.item)
			end)
			inst.components.talker:Say("I should leave that to Lawrence", 2.5)
		end
	end)
end
	
return MakePlayerCharacter("horo", prefabs, assets, common_postinit, master_postinit, start_inv)
