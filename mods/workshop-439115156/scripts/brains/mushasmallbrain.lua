require "behaviours/chaseandattack"
require "behaviours/wander"
require "behaviours/faceentity"
require "behaviours/follow"
require "behaviours/standstill"
require "behaviours/leash"
require "behaviours/panic"
require "behaviours/runaway"
require "behaviours/doaction"

local MIN_FOLLOW_DIST = 0
local MAX_FOLLOW_DIST = 6
--local TARGET_FOLLOW_DIST = (MAX_FOLLOW_DIST+MIN_FOLLOW_DIST)/2
local TARGET_FOLLOW_DIST = 3
--local GO_HOME_DIST = 1
local GO_HOME_DIST = 0

----
local MIN_FOLLOW_LEADER = 1
local MAX_FOLLOW_LEADER = 4
--local TARGET_FOLLOW_LEADER = (MAX_FOLLOW_LEADER+MIN_FOLLOW_LEADER)/2
local TARGET_FOLLOW_LEADER = 2
local LEASH_RETURN_DIST = 3.5
local LEASH_MAX_DIST = 5
----
local SEE_ENEMY_DIST = 4
----

local MAX_CHASE_TIME = 30

local TRADE_DIST = 20

local MAX_WANDER_DIST = 15

local SEE_ITEM_DIST = 9
local SEE_FOOD_DIST = 15
local TIME_BETWEEN_EATING = 10
local FIND_FOOD_HUNGER_PERCENT = 0.45 
local FIND_FOOD_HUNGER_PERCENT2 = 0.35
--local MAX_WANDER_DIST = 20
--local MAX_CHASE_DIST = 30

local START_RUN_DIST = 4
local STOP_RUN_DIST = 6


local KEEP_WORKING_DIST = 15
local SEE_WORK_DIST = 20

local mushasmallbrain = Class(Brain, function(self, inst)
    Brain._ctor(self, inst)
end)

local function HasStateTags(inst, tags)
    for k,v in pairs(tags) do
        if inst.sg:HasStateTag(v) then
            return true
        end
    end
end

local function KeepWorkingAction(inst, actiontags)
    return inst.components.follower.leader and inst.components.follower.leader:GetDistanceSqToInst(inst) <= KEEP_WORKING_DIST*KEEP_WORKING_DIST and 
    HasStateTags(inst.components.follower.leader, actiontags)
end

local function StartWorkingCondition(inst, actiontags)
    return inst.components.follower.leader and not inst.pick1 and not inst.working_food and HasStateTags(inst.components.follower.leader, actiontags) and not HasStateTags(inst, actiontags)
end

local function FindObjectToWorkAction(inst, action)
    if inst.sg:HasStateTag("working") then
        return 
    end
    local target = FindEntity(inst.components.follower.leader, SEE_WORK_DIST, function(item) return item.components.workable and item.components.workable.action == action end)
    if target then
        --print(GetTime(), target)
        return BufferedAction(inst, target, action)
    end
end

local function IsHungry(inst)
    return inst.components.hunger and inst.components.hunger:GetPercent() < FIND_FOOD_HUNGER_PERCENT
end
local function IsHungry2(inst)
    return inst.components.hunger and inst.components.hunger:GetPercent() < FIND_FOOD_HUNGER_PERCENT2
end
local function Working_yamche(inst)
    return inst.working_food
end
local function Pick1(inst)
    return inst.pick1 
end
local function IsStarving(inst)
    return inst.components.hunger and inst.components.hunger:IsStarving()

end
local function ShouldStandStill(inst)
    return inst.components.hunger and inst.components.hunger:IsStarving() and inst:HasTag("never")
end
local function CanStandStill(inst)
    return inst.components.hunger and inst.components.hunger:IsStarving() and inst.fightn2 and inst:HasTag("never")
end

local function CanStandStill(inst)
    return inst.components.hunger and inst.components.hunger:IsStarving() and inst:HasTag("animals") and inst:HasTag("never")
end
local function CanSeeFood(inst)
    local target = FindEntity(inst, SEE_FOOD_DIST, function(item) return inst.components.eater:CanEat(item) end)
 
    if target then
        --print("CanSeeFood", inst.name, target.name)
    end
    return target
end
local function FindFoodAction(inst)
    local target = CanSeeFood(inst)
    if target then
        return BufferedAction(inst, target, ACTIONS.EAT)
    end
    end

	
local function Item_1(inst)
    local target = FindEntity(inst, SEE_ITEM_DIST, function(item) return item.prefab == "goldnugget" end)
    if target then end
    return target
end
	local function Item_2(inst)
    local target = FindEntity(inst, SEE_ITEM_DIST, function(item) return item.prefab == "rocks" end)
    if target then end
    return target
end
	local function Item_3(inst)
    local target = FindEntity(inst, SEE_ITEM_DIST, function(item) return item.prefab == "nitre" end)
    if target then end
    return target
end
	local function Item_4(inst)
    local target = FindEntity(inst, SEE_ITEM_DIST, function(item) return item.prefab == "flint" end)
    if target then end
    return target
end
	local function Item_5(inst)
    local target = FindEntity(inst, SEE_ITEM_DIST, function(item) return item.prefab == "log" end)
    if target then end
    return target
end	
local function Item_6(inst)
    local target = FindEntity(inst, SEE_ITEM_DIST, function(item) return item.prefab == "cutgrass" end)
    if target then end
    return target
end	
local function Item_7(inst)
    local target = FindEntity(inst, SEE_ITEM_DIST, function(item) return item.prefab == "twigs" end)
    if target then end
    return target
end	
local function Item_8(inst)
    local target = FindEntity(inst, SEE_ITEM_DIST, function(item) return item.prefab == "monstermeat" end)
    if target then end
    return target
end  
local function Item_9(inst)
    local target = FindEntity(inst, SEE_ITEM_DIST, function(item) return item.prefab == "spidergland" end)
    if target then end
    return target
end
local function Item_10(inst)
    local target = FindEntity(inst, SEE_ITEM_DIST, function(item) return item.prefab == "silk" end)
    if target then end
    return target
end
local function Item_11(inst)
    local target = FindEntity(inst, SEE_ITEM_DIST, function(item) return item.prefab == "seeds" end)
    if target then end
    return target
end
local function Item_12(inst)
    local target = FindEntity(inst, SEE_ITEM_DIST, function(item) return item.prefab == "charcoal" end)
    if target then end
    return target
end
local function Item_13(inst)
    local target = FindEntity(inst, SEE_ITEM_DIST, function(item) return item.prefab == "poop" end)
    if target then end
    return target
end
local function Item_14(inst)
    local target = FindEntity(inst, SEE_ITEM_DIST, function(item) return item.prefab == "beefalowool" end)
    if target then end
    return target
end
local function Item_15(inst)
    local target = FindEntity(inst, SEE_ITEM_DIST, function(item) return item.prefab == "bird_egg" end)
    if target then end
    return target
end
local function Find_Item_1(inst)
    local target = Item_1(inst)
	if target and not inst.item_max_1 then
        return BufferedAction(inst,target,ACTIONS.PICKUP)
		end	  end
local function Find_Item_2(inst)
    local target = Item_2(inst)
	if target and not inst.item_max_2 then
        return BufferedAction(inst,target,ACTIONS.PICKUP)
		end	  end
local function Find_Item_3(inst)
    local target = Item_3(inst)
	if target and not inst.item_max_3 then
        return BufferedAction(inst,target,ACTIONS.PICKUP)
		end	  end
local function Find_Item_4(inst)
    local target = Item_4(inst)
	if target and not inst.item_max_4 then
        return BufferedAction(inst,target,ACTIONS.PICKUP)
		end	  end
		local function Find_Item_5(inst)
    local target = Item_5(inst)
	if target and not inst.item_max_5 then
        return BufferedAction(inst,target,ACTIONS.PICKUP)
		end	  end
		local function Find_Item_6(inst)
    local target = Item_6(inst)
	if target and not inst.item_max_6 then
        return BufferedAction(inst,target,ACTIONS.PICKUP)
		end	  end
		local function Find_Item_7(inst)
    local target = Item_7(inst)
	if target and not inst.item_max_7 then
        return BufferedAction(inst,target,ACTIONS.PICKUP)
		end	  end
		local function Find_Item_8(inst)
    local target = Item_8(inst)
	if target and not inst.item_max_8 then
        return BufferedAction(inst,target,ACTIONS.PICKUP)
		end	  end
				local function Find_Item_9(inst)
    local target = Item_9(inst)
	if target and not inst.item_max_9 then
        return BufferedAction(inst,target,ACTIONS.PICKUP)
		end	  end
				local function Find_Item_10(inst)
    local target = Item_10(inst)
	if target and not inst.item_max_10 then
        return BufferedAction(inst,target,ACTIONS.PICKUP)
		end	  end
			local function Find_Item_11(inst)
		    local target = Item_11(inst)
	if target and not inst.item_max_11 then
        return BufferedAction(inst,target,ACTIONS.PICKUP)
		end	  end
			local function Find_Item_12(inst)
		    local target = Item_12(inst)
	if target and not inst.item_max_12 then
        return BufferedAction(inst,target,ACTIONS.PICKUP)
		end	  end
			local function Find_Item_13(inst)
		    local target = Item_13(inst)
	if target and not inst.item_max_13 then
        return BufferedAction(inst,target,ACTIONS.PICKUP)
		end	  end
			local function Find_Item_14(inst)
		    local target = Item_14(inst)
	if target and not inst.item_max_14 then
        return BufferedAction(inst,target,ACTIONS.PICKUP)
		end	  end		
			local function Find_Item_15(inst)
		    local target = Item_15(inst)
	if target and not inst.item_max_15 then
        return BufferedAction(inst,target,ACTIONS.PICKUP)
		end	  end				
local ValidFoodsToPick_f = 
{
    "berries",
    "cave_banana",
    "carrot",   
    "red_cap",
    "blue_cap",
    "green_cap", 
	-------
	"corn",
	"pumpkin",
	"eggplant",
	"durian",
	"pomegranate",
	"dragonfruit",
	"cactus_meat",
	"watermelon",
	"smallmeat",
	"smallmeat_dried",
	"monstermeat",
	"monstermeat_dried",
	"humanmeat_dried",
	"meat",
	"meat_dried",
	---cook
	"dragonpie",
	"waffles",
	"ratatouille",
	"fruitmedley",
	"monsterlasagna",
	"powcake",
	"frogglebunwich",
	"pumpkincookie",
	"pumpkincookie",
	"honeyham",
	"meatballs",
	"wetgoop",
	"stuffedeggplant",
	"taffy",
	"honeynuggets",
	"turkeydinner",
	"fishsticks",
	"jammypreserves",
	"fishtacos",
	"butterflymuffin",
	"perogies",
	"kabobs",
	"bonestew",
	"baconeggs",
	"mandrakesoup",
	}
		
local ValidFoodsToPick = 
{
    "berries",
    "cave_banana",
    "carrot",   
    "red_cap",
    "blue_cap",
    "green_cap", 
	-------
	"corn",
	"pumpkin",
	"eggplant",
	"durian",
	"pomegranate",
	"dragonfruit",
	"cactus_meat",
	"watermelon",
	"smallmeat",
	"smallmeat_dried",
	"monstermeat",
	"monstermeat_dried",
	"humanmeat",
	"humanmeat_dried",
	"meat",
	"meat_dried",
	"cutgrass",
	"twigs",
	---cook
	"dragonpie",
	"waffles",
	"ratatouille",
	"fruitmedley",
	"monsterlasagna",
	"powcake",
	"frogglebunwich",
	"pumpkincookie",
	"pumpkincookie",
	"honeyham",
	"meatballs",
	"wetgoop",
	"stuffedeggplant",
	"taffy",
	"honeynuggets",
	"turkeydinner",
	"fishsticks",
	"jammypreserves",
	"fishtacos",
	"butterflymuffin",
	"perogies",
	"kabobs",
	"bonestew",
	"baconeggs",
	"mandrakesoup",
	}
	
local function ItemIsInList(item, list)
    for k,v in pairs(list) do
        if v == item or k == item then
            return true
        end
    end
end
local function EatFoodAction(inst)

    local target = nil

    if inst.sg:HasStateTag("busy") or 
    (inst.components.inventory and inst.components.inventory:IsFull()) or
    math.random() < 0.75 then
        return
    end

    if inst.components.inventory and inst.components.eater then

        target = inst.components.inventory:FindItem(function(item) return inst.components.eater:CanEat(item) end)
	
        if target then return BufferedAction(inst,target,ACTIONS.EAT) end
    end

    local pt = inst:GetPosition()
    local ents = TheSim:FindEntities(pt.x, pt.y, pt.z, SEE_FOOD_DIST)  

    if not target then
        for k,item in pairs(ents) do
            if item.components.pickable and item.components.pickable.caninteractwith and item.components.pickable:CanBePicked()
            and (ItemIsInList(item.components.pickable.product, ValidFoodsToPick_f) or item.prefab == "worm") then
                target = item
                break
            end
        end
    end

    if target then
        return BufferedAction(inst, target, ACTIONS.PICK)
    end

      if not target then
        for k,item in pairs(ents) do
            if item.components.crop and item.components.crop:IsReadyForHarvest() then
                target = item
                break
            end
        end
    end

    if target then
        return BufferedAction(inst, target, ACTIONS.HARVEST)
    end

    if inst.components.combat.target then
        return
    end
    end

	
local function Working_food(inst)

     local target = nil
    if target and inst.working_food then
        return BufferedAction(inst, target, ACTIONS.PICKUP)
    end
    	
      local pt = inst:GetPosition()
    local ents = TheSim:FindEntities(pt.x, pt.y, pt.z, SEE_FOOD_DIST)  

      if not target then
        for k,item in pairs(ents) do
            if item.components.pickable and item.components.pickable.caninteractwith and item.components.pickable:CanBePicked()
            and (ItemIsInList(item.components.pickable.product, ValidFoodsToPick) or item.prefab == "worm") then
                target = item
                break
            end  end  end

    if target then
        return BufferedAction(inst, target, ACTIONS.PICK)
    end
    
    if not target then
        for k,item in pairs(ents) do
            if item.components.crop and item.components.crop:IsReadyForHarvest() then
                target = item
                break
			elseif item.components.dryer and item.components.dryer:IsDone() then
                target = item
				break
			elseif item.components.stewer and item.components.stewer:IsDone() then
                target = item
				break
            end
        end
    end

    if target then
        return BufferedAction(inst, target, ACTIONS.HARVEST)
    end
	
    if inst.components.combat.target then
        return
    end
end
	

	
local function GetTraderFn(inst)
    return (inst.components.follower.leader and inst.components.trader:IsTryingToTradeWithMe(inst.components.follower.leader)) and inst.components.follower.leader or nil
end

local function KeepTraderFn(inst, target)
    return inst.components.trader:IsTryingToTradeWithMe(target)
end

local function BabyRunAway(inst, target)
    return inst.level1 and not inst.fightn and not inst.components.trader:IsTryingToTradeWithMe(target)
end

local function BattleCommand(inst, target)
    return inst.fightn and not inst.components.trader:IsTryingToTradeWithMe(target)
end

--------------
--local function GetLeader(inst)
--    return inst.components.follower.leader 
--end

local function GetLeader(inst)
    return inst.components.follower ~= nil and inst.components.follower.leader or nil
end

--[[
local function GetStayPos(inst)
	return inst.components.staycommand.locations["stayspot"]
end

local function GetWanderPoint(inst)
	if inst.components.staycommand and inst.components.staycommand:IsCurrentlyStaying() then
		return GetStayPos(inst)
	else
		local target = GetLeader(inst) or GetPlayer()
   		if target then
        		return target:GetPosition()
    		end
	end
end
local function ShouldGoHome(inst)
    local homePos = inst.components.staycommand.locations["stayspot"]
    local myPos = Vector3(inst.Transform:GetWorldPosition() )

    return (homePos and distsq(homePos, myPos) > GO_HOME_DIST)
end

local function GoHomeAction(inst)
    local homePos = inst.components.staycommand.locations["stayspot"]
    if homePos then
        return BufferedAction(inst, nil, ACTIONS.GOHOME, nil, homePos, nil, 2.2)
    end
end
]]
local function GetHome(inst)
    return inst.components.homeseeker ~= nil and inst.components.homeseeker.home or nil
end

local function GetHomePos(inst)
    local home = GetHome(inst)
    return home and home:GetPosition(GetReturnPos)
end

--------------
function mushasmallbrain:OnStart()
    local root = 
-- Panic(self.inst)),
--		
--ChaseAndAttack(self.inst, 10),
--return self.inst.components.health:GetPercent() < 0.15 end,
    PriorityNode(
	{	
	--WhileNode(function() return self.inst.components.health:GetPercent() < 0.2 end, "LowHealth", StandStill(self.inst, CanStandStill, Follow(self.inst, function() return self.inst.components.follower.leader end, 1, 2, 3 ))),
		WhileNode( function() return self.inst.components.health:GetPercent() < 0.5 and self.inst.components.combat.target == nil or not self.inst.components.combat:InCooldown() end, "AttackMomentarily", ChaseAndAttack(self.inst, 8,12)),
              WhileNode( function() return self.inst.components.combat.target and self.inst.components.combat:InCooldown() end, "Dodge",
                    RunAway(self.inst, function() return self.inst.components.combat.target and self.inst.components.health:GetPercent() < 0.5 end, 3, 10) ),
ChaseAndAttack(self.inst, 8,10),
				--Follow( self.inst, GetLeader, MIN_FOLLOW_DIST, TARGET_FOLLOW_DIST, MAX_FOLLOW_DIST),
		 	--WhileNode( function() return self.inst.components.follower.leader and self.inst.follow end, self.inst.components.combat:GiveUp()),
         FaceEntity(self.inst, GetTraderFn, KeepTraderFn),

			 -- when starving prefer finding food over fighting
        SequenceNode{
            ConditionNode(function() return IsStarving(self.inst) and CanSeeFood(self.inst) end, "SeesFoodToEat"),
            ParallelNodeAny {
                WaitNode(math.random()*.4),
                PriorityNode {
                    StandStill(self.inst, ShouldStandStill),
						Follow( self.inst, GetLeader, MIN_FOLLOW_DIST, TARGET_FOLLOW_DIST, MAX_FOLLOW_DIST),
			                },
            },
            DoAction(self.inst, function() return FindFoodAction(self.inst) end),  },
			
  RunAway(self.inst, "epic", 9, 15, function(target) return BattleCommand(self.inst, target) end ),
  RunAway(self.inst, "monster", 6, 9, function(target) return BattleCommand(self.inst, target) end ),
  RunAway(self.inst, "insect", 6, 9, function(target) return BattleCommand(self.inst, target) end ),
  RunAway(self.inst, "frog", 6, 9, function(target) return BattleCommand(self.inst, target) end ),
  RunAway(self.inst, "guard", 6, 9, function(target) return BattleCommand(self.inst, target) end ),
 RunAway(self.inst, "largecreature", 6, 9, function(target) return BattleCommand(self.inst, target) end ),
 RunAway(self.inst, "spider", 6, 9, function(target) return BattleCommand(self.inst, target) end ),
 RunAway(self.inst, "hostile", 6, 9, function(target) return BattleCommand(self.inst, target) end ),
 --RunAway(self.inst, "crazy", 4, 5),
 WhileNode(function() return self.inst.fightn and not self.inst.components.health.takingfiredamage end, Wander(self.inst, GetHomePos, 0) ),
 
              WhileNode(function() return StartWorkingCondition(self.inst, {"chopping", "prechop"}) and 
        KeepWorkingAction(self.inst, {"chopping", "prechop"}) end, "keep chopping",
            DoAction(self.inst, function() return FindObjectToWorkAction(self.inst, ACTIONS.CHOP) end)),

        WhileNode(function() return StartWorkingCondition(self.inst, {"mining", "premine"}) and 
        KeepWorkingAction(self.inst, {"mining", "premine"}) end, "keep mining",                   
            DoAction(self.inst, function() return FindObjectToWorkAction(self.inst, ACTIONS.MINE) end)),  
			
        SequenceNode{
            ConditionNode(function() return IsHungry(self.inst) and CanSeeFood(self.inst) end, "SeesFoodToEat"),
            ParallelNodeAny {
                WaitNode(1 + math.random()*2),
              --[[  PriorityNode {
                    StandStill(self.inst, ShouldStandStill),
                    Follow(self.inst, function() return self.inst.components.follower.leader end, MIN_FOLLOW_DIST, TARGET_FOLLOW_DIST, MAX_FOLLOW_DIST),},]]
            },
            DoAction(self.inst, function() return FindFoodAction(self.inst) end),},

	   WhileNode(function() return IsHungry2(self.inst) end, "Should Eat",
            DoAction(self.inst, EatFoodAction)),
		
		SequenceNode{
		ConditionNode(function() return Working_yamche(self.inst) end, "collect item"),
        ParallelNodeAny { WaitNode(2 + math.random()*2),DoAction(self.inst, function() return Working_food(self.inst) end),},},
		
		SequenceNode{
		ConditionNode(function() return Pick1(self.inst) and Item_1(self.inst) end, "collect item"),
        ParallelNodeAny { WaitNode(0.5),DoAction(self.inst, function() return Find_Item_1(self.inst) end),},},
		SequenceNode{
		ConditionNode(function() return Pick1(self.inst) and Item_2(self.inst) end, "collect item"),
        ParallelNodeAny { WaitNode(0.5),DoAction(self.inst, function() return Find_Item_2(self.inst) end),},},	
		SequenceNode{
		ConditionNode(function() return Pick1(self.inst) and Item_3(self.inst) end, "collect item"),
        ParallelNodeAny { WaitNode(0.5),DoAction(self.inst, function() return Find_Item_3(self.inst) end),},},	
		SequenceNode{
		ConditionNode(function() return Pick1(self.inst) and Item_4(self.inst) end, "collect item"),
        ParallelNodeAny { WaitNode(0.5),DoAction(self.inst, function() return Find_Item_4(self.inst) end),},},
		SequenceNode{
		ConditionNode(function() return Pick1(self.inst) and Item_5(self.inst) end, "collect item"),
        ParallelNodeAny { WaitNode(0.5),DoAction(self.inst, function() return Find_Item_5(self.inst) end),},},
		SequenceNode{
		ConditionNode(function() return Pick1(self.inst) and Item_6(self.inst) end, "collect item"),
        ParallelNodeAny { WaitNode(0.5),DoAction(self.inst, function() return Find_Item_6(self.inst) end),},},
		SequenceNode{
		ConditionNode(function() return Pick1(self.inst) and Item_7(self.inst) end, "collect item"),
        ParallelNodeAny { WaitNode(0.5),DoAction(self.inst, function() return Find_Item_7(self.inst) end),},},
		SequenceNode{
		ConditionNode(function() return Pick1(self.inst) and Item_8(self.inst) end, "collect item"),
        ParallelNodeAny { WaitNode(0.5),DoAction(self.inst, function() return Find_Item_8(self.inst) end),},},	
		SequenceNode{
		ConditionNode(function() return Pick1(self.inst) and Item_9(self.inst) end, "collect item"),
        ParallelNodeAny { WaitNode(0.5),DoAction(self.inst, function() return Find_Item_9(self.inst) end),},},	
		SequenceNode{
		ConditionNode(function() return Pick1(self.inst) and Item_10(self.inst) end, "collect item"),
        ParallelNodeAny { WaitNode(0.5),DoAction(self.inst, function() return Find_Item_10(self.inst) end),},},
		SequenceNode{
		ConditionNode(function() return Pick1(self.inst) and Item_11(self.inst) end, "collect item"),
        ParallelNodeAny { WaitNode(0.5),DoAction(self.inst, function() return Find_Item_11(self.inst) end),},},	
		SequenceNode{
		ConditionNode(function() return Pick1(self.inst) and Item_12(self.inst) end, "collect item"),
        ParallelNodeAny { WaitNode(0.5),DoAction(self.inst, function() return Find_Item_12(self.inst) end),},},			
		SequenceNode{
		ConditionNode(function() return Pick1(self.inst) and Item_13(self.inst) end, "collect item"),
        ParallelNodeAny { WaitNode(0.5),DoAction(self.inst, function() return Find_Item_13(self.inst) end),},},
		SequenceNode{
		ConditionNode(function() return Pick1(self.inst) and Item_14(self.inst) end, "collect item"),
        ParallelNodeAny { WaitNode(0.5),DoAction(self.inst, function() return Find_Item_14(self.inst) end),},},
		SequenceNode{
		ConditionNode(function() return Pick1(self.inst) and Item_15(self.inst) end, "collect item"),
        ParallelNodeAny { WaitNode(0.5),DoAction(self.inst, function() return Find_Item_15(self.inst) end),},},
		
		  Follow(self.inst, GetLeader, 1, 2, MAX_FOLLOW_LEADER),
        FaceEntity(self.inst, GetLeader, GetLeader),		
        Wander(self.inst, function() if self.inst.components.follower.leader then return Vector3(self.inst.components.follower.leader.Transform:GetWorldPosition()) end end, MAX_FOLLOW_DIST- 1, {minwalktime=.5, randwalktime=.5, minwaittime=6, randwaittime=3}),

    },.5)
    self.bt = BT(self.inst, root)
 end

return mushasmallbrain