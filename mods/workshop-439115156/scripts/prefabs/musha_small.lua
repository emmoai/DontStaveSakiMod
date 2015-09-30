require "prefabutil"
require "brains/mushasmallbrain"
local brain = require "brains/mushasmallbrain"
require "stategraphs/SGmusha_small"
require "stategraphs/SGmusha_teen"
require "stategraphs/SGmusha_tall"
require "stategraphs/SGmusha_tall2"
require "stategraphs/SGmusha_tall3"
require "stategraphs/SGmusha_tall4"
require "stategraphs/SGmusha_tall5"
require "stategraphs/SGmusha_tall6"

local WAKE_TO_FOLLOW_DISTANCE = 5
local SLEEP_NEAR_LEADER_DISTANCE = 2
local CRY_NEAR_LEADER_DISTANCE = 20
local MONSTER_DISTANCE = 10
--local BACK_DISTANCE = 9

local assets =
{
	Asset("ANIM", "anim/musha_small.zip"),
    Asset("ANIM", "anim/hat_yamche.zip"),
	Asset("ATLAS", "images/inventoryimages/musha_small.xml"),
	Asset("IMAGE", "images/inventoryimages/musha_small.tex"),
	Asset("SOUND", "sound/tallbird.fsb"),
}

local prefabs=
{	"hat_yamche",
    "musha_small",
    "musha_teen",
    "musha_tall",
    "musha_tall2",
    "musha_tall3",
    "musha_tall4",
    "musha_tall5",
    "musha_rp1",
    "musha_rp2",
    "musha_rp3",
    "musha_rp4",
    "musha_rp5",
    "musha_rp6",
    "campfirefire",
}

local teen_assets =
{
	Asset("ANIM", "anim/musha_teen.zip"),
	Asset("ATLAS", "images/inventoryimages/musha_teen.xml"),
}

local tall_assets =
{
	Asset("ANIM", "anim/musha_tall.zip"),
	Asset("ATLAS", "images/inventoryimages/musha_tall.xml"),
}

local tall2_assets =
{
	Asset("ANIM", "anim/musha_tall2.zip"),
}
local tall3_assets =
{
	Asset("ANIM", "anim/musha_tall3.zip"),
}
local tall4_assets =
{
	Asset("ANIM", "anim/musha_tall4.zip"),
}
local tall5_assets =
{
	Asset("ANIM", "anim/musha_tall5.zip"),
}
local rp1_assets =
{
	Asset("ANIM", "anim/musha_small.zip"),
}
local rp2_assets =
{
	Asset("ANIM", "anim/musha_teen.zip"),
}
local rp3_assets =
{
	Asset("ANIM", "anim/musha_tall.zip"),
}
local rp4_assets =
{
	Asset("ANIM", "anim/musha_tall2.zip"),
}
local rp5_assets =
{
	Asset("ANIM", "anim/musha_tall3.zip"),
}
local rp6_assets =
{
	Asset("ANIM", "anim/musha_tall3.zip"),
}
local ice_assets =
{
	Asset("ANIM", "anim/musha_ice.zip"),
}


----------------
local function UpdatePositionYamche(inst)
	if inst and inst.owner then
		local x, y, z = inst.Transform:GetWorldPosition()
	
		inst.net_x:set(x)
		inst.net_y:set(z)
	end
end

local function ondeath(inst)
local dark2 = SpawnPrefab("statue_transition_2")
local pos = Vector3(inst.Transform:GetWorldPosition())
dark2.Transform:SetPosition(pos:Get())
if inst.components.container and not inst.level1 then
inst.components.container:DropEverything() 
	end
 if  inst.level1 and not inst.ndie then
local poo = SpawnPrefab("musha_egg")
poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
 elseif  inst.level2 and not inst.ndie then
local poo = SpawnPrefab("musha_egg")
poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
 elseif  inst.level3 and not inst.ndie then
local poo = SpawnPrefab("musha_eggs1")
poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
 elseif  inst.level4 and not inst.ndie then
local poo = SpawnPrefab("musha_eggs2")
poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
 elseif  inst.level5 and not inst.ndie then
local poo = SpawnPrefab("musha_eggs3")
poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
 elseif  inst.level6 and not inst.ndie then
local poo = SpawnPrefab("musha_egg1")
poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
 elseif  inst.level7 and not inst.ndie then
local poo = SpawnPrefab("musha_egg2")
poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
 elseif  inst.level8 and not inst.ndie then
local poo = SpawnPrefab("musha_egg3")
poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
elseif inst.ndie then
inst.ndie = false
end 
end 

local function die(inst)
	inst.components.health:Kill()
end
local function ndie(inst)
	inst.ndie = true
	inst.components.health:Kill()
end
---------------------------
local function levelexp(inst,data)

	local max_exp = 99999999999999993000
	local exp = math.min(inst.level, max_exp)
	local hunger_percent = inst.components.hunger:GetPercent()
	local health_percent = inst.components.health:GetPercent()

--
inst.components.talker:Say("下一级:[升级]")
if inst.level8 then
	--inst.components.hunger.max = math.ceil (130 + exp* 1)
	inst.components.health.maxhealth = math.ceil (800 + exp* 1)
inst.components.talker:Say("Health +".. (inst.level))
	elseif not inst.level8 then
	
 if inst.level >0 and inst.level <2 and inst.level1 and not inst.baby then
inst.components.talker:Say("下一级 :EXP[3]\n[EXP] ".. (inst.level))
	elseif inst.level >2 and inst.level1 and not inst.baby then
    		inst.components.growable:StartGrowing()
	inst.components.talker:Say("[升级]")
elseif inst.level >0 and inst.level <19 and inst.level2 then
inst.components.talker:Say("下一级 :EXP[20]\n[EXP] ".. (inst.level))
	elseif inst.level >19 and inst.level2 then
    		inst.components.growable:StartGrowing()
	inst.components.talker:Say("[升级]")
elseif inst.level >0 and inst.level <49 and inst.level3 then
inst.components.talker:Say("下一级 :EXP[50]\n[EXP] ".. (inst.level))
	elseif inst.level >49 and inst.level3 then
    		inst.components.growable:StartGrowing()
	inst.components.talker:Say("[升级]")
elseif inst.level >0 and inst.level <99 and inst.level4 then
inst.components.talker:Say("下一级 :EXP[100]\n[EXP] ".. (inst.level))
	elseif inst.level >99 and inst.level4 then
    		inst.components.growable:StartGrowing()
	inst.components.talker:Say("[升级]")
elseif inst.level >0 and inst.level <299 and inst.level5 then
inst.components.talker:Say("下一级 :EXP[300]\n[EXP] ".. (inst.level))
	elseif inst.level >299 and inst.level5 then
    		inst.components.growable:StartGrowing()
	inst.components.talker:Say("[升级]")
elseif inst.level >0 and inst.level <399 and inst.level6 then
inst.components.talker:Say("下一级 :EXP[400]\n[EXP] ".. (inst.level))
	elseif inst.level >399 and inst.level6 then
    		inst.components.growable:StartGrowing()
	inst.components.talker:Say("[升级]")
elseif inst.level >0 and inst.level <499 and inst.level7 then
inst.components.talker:Say("下一级 :EXP[500]\n[EXP] ".. (inst.level))
	elseif inst.level >499 and inst.level7 then
    		inst.components.growable:StartGrowing()
	inst.components.talker:Say("[升级]")
--elseif inst.level8 then
--inst.components.talker:Say("[EXP] ".. (inst.level))
	----inst:AddTag("cure1")
end
	end
	inst.components.hunger:SetPercent(hunger_percent)
	inst.components.health:SetPercent(health_percent)
	end

local smallllchance = 0.4
local normalchance = 0.75
local largechance = 1

local function onkilll(inst, data)
	local victim = data.victim
	   if not (victim:HasTag("prey") or
            victim:HasTag("veggie") or
            victim:HasTag("eyeplant") or
            victim:HasTag("insect") or			
            victim:HasTag("structure")) then
    local delta = victim.components.combat.defaultdamage * 0.25
		   if math.random() < normalchance then
    				inst.level = inst.level + 1
 			levelexp(inst)					
  					end					
				end
		  if (victim:HasTag("prey") or
              victim:HasTag("insect") or			
            victim:HasTag("frog")) then
    local delta = victim.components.combat.defaultdamage * 0.1
		   if math.random() < smallllchance then
    				inst.level = inst.level + 1
 			levelexp(inst)					
  
					end					
				end
			end


local function onpreload(inst, data)
	if data then
		if data.level then
		inst.level = data.level
			levelexp(inst)
end
	end
		end

local function onsave(inst, data)
	data.level = inst.level
end


------------

local function GetStatus(inst)
    --print("smallbird - GetStatus")
    if inst.components.hunger then
        if inst.components.hunger:IsStarving(inst) then
            --print("STARVING")
            return "STARVING"
        elseif inst.components.hunger:GetPercent() < .2 then
            --print("HUNGRY")
            return "HUNGRY"
        end
	end
end


------------
local function on_Lshield_1(inst, attacked)
    if inst.components.health:GetPercent() <= .5 and not inst.components.health:IsDead() then
	SpawnPrefab("shock_fx").Transform:SetPosition(inst:GetPosition():Get())
	inst.SoundEmitter:PlaySound("dontstarve/common/lightningrod")
        inst.components.health:DoDelta(10)
        inst:RemoveEventCallback("attacked", on_Lshield_1)
	end end
------------------   
	
local function ystarve(inst, data)
if not inst.fightn and inst.light_on then
		if not inst.level1 and inst.components.hunger:GetPercent() > .9 then
    inst.entity:AddLight()
	inst.Light:SetRadius(4)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.5)
    inst.Light:SetColour(180/255,180/255,180/255)
		elseif not inst.level1 and inst.components.hunger:GetPercent() <= .9 and inst.components.health:GetPercent() > .8  then
    inst.entity:AddLight()
	inst.Light:SetRadius(3)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.5)
    inst.Light:SetColour(180/255,180/255,180/255)
		elseif not inst.level1 and inst.components.hunger:GetPercent() <= .8 and inst.components.health:GetPercent() > .7  then
    inst.entity:AddLight()
	inst.Light:SetRadius(2.5)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.5)
    inst.Light:SetColour(180/255,180/255,180/255)
		elseif not inst.level1 and inst.components.hunger:GetPercent() <= .7 and inst.components.health:GetPercent() > .5  then
    inst.entity:AddLight()
	inst.Light:SetRadius(2)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.5)
    inst.Light:SetColour(180/255,180/255,180/255)
		elseif not inst.level1 and inst.components.hunger:GetPercent() <= .5 and inst.components.health:GetPercent() > .25  then
    inst.entity:AddLight()
	inst.Light:SetRadius(1.5)
    inst.Light:SetFalloff(.4)
    inst.Light:SetIntensity(.5)
    inst.Light:SetColour(180/255,180/255,180/255)
		elseif not inst.level1 and inst.components.hunger:GetPercent() <= .25 and inst.components.health:GetPercent() > .1 then
      inst.entity:AddLight()
	inst.Light:SetRadius(1)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.5)
    inst.Light:SetColour(180/255,180/255,180/255)
		elseif not inst.level1 and inst.components.hunger:GetPercent() <= .1 then
  		   inst.entity:AddLight()
	   	inst.Light:SetRadius(0.5)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.5)
    inst.Light:SetColour(180/255,180/255,180/255)
	end
	---baby
	if inst.level1 and inst.hat then
	if not inst.fightn then
	inst.components.hunger:SetRate(20/TUNING.TEENBIRD_STARVE_TIME)

	elseif inst.fightn then
	inst.components.hunger:SetRate(0/TUNING.TEENBIRD_STARVE_TIME)

			end
			if inst.components.hunger.current >= 15 then
 		   inst.entity:AddLight()
	   	inst.Light:SetRadius(2.5)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.5)
    inst.Light:SetColour(180/255,180/255,180/255)
	
				elseif inst.components.hunger.current < 15 and inst.components.hunger.current >= 7 then
 		   inst.entity:AddLight()
	   	inst.Light:SetRadius(1.5)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.5)
    inst.Light:SetColour(180/255,180/255,180/255)
	
				elseif inst.components.hunger.current < 7 and inst.components.hunger.current >3 then
				--inst.SoundEmitter:PlaySound("dontstarve/creatures/smallbird/chirp") 
 		   inst.entity:AddLight()
	   	inst.Light:SetRadius(0.75)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.5)
    inst.Light:SetColour(180/255,180/255,180/255)
	
					elseif inst.components.hunger.current <=3 then
		    inst.SoundEmitter:PlaySound("dontstarve/creatures/smallbird/chirp") 
			inst.components.talker:Say("[Foo Foo Food !]")
 		   inst.entity:AddLight()
	   	inst.Light:SetRadius(0.25)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.5)
    inst.Light:SetColour(180/255,180/255,180/255)
	end
	end
elseif not inst.fightn and not inst.light_on then
inst.components.hunger:SetRate(15/TUNING.TEENBIRD_STARVE_TIME)
elseif inst.fightn and inst.light_on then
inst.components.hunger:SetRate(0/TUNING.TEENBIRD_STARVE_TIME)
inst.entity:AddLight()
inst.Light:SetRadius(0.2)
inst.Light:SetFalloff(.8)
inst.Light:SetIntensity(.5)
inst.Light:SetColour(180/255,180/255,180/255)
elseif inst.fightn and not inst.light_on then
inst.components.hunger:SetRate(0/TUNING.TEENBIRD_STARVE_TIME)
end 
if inst.components.health:GetPercent() >= .5 and inst.components.health:GetPercent() <= 1 and inst.light_on and not inst.iceyamche and inst.open then
inst.SoundEmitter:PlaySound("dontstarve/common/fireAddFuel")
  inst.components.heater.heat = 80
  inst.components.talker:Say("[Heater]-On\nCost:[Health]")
  inst.components.health:StartRegen(-8, 1)
  inst.components.heater:SetThermics(true, false)
elseif not inst.light_on and not inst.iceyamche and inst.open then  
  inst.components.heater.heat = 0
  inst.components.talker:Say("[Heater]-Off")  
  inst.components.health:StartRegen(1, 10)
  inst.components.heater:SetThermics(true, false)
elseif inst.components.health:GetPercent() >= .5 and inst.components.health:GetPercent() <= 1 and inst.light_on and inst.iceyamche and inst.open then
inst.SoundEmitter:PlaySound("dontstarve/common/fireAddFuel")
  inst.components.heater.heat = 80
  inst.components.talker:Say("[Heater]-On\nCost:[Health]\n[ice-box]")  
  inst.components.health:StartRegen(-8, 1)
  --inst.components.heater:SetThermics(false, true)
  inst.components.heater:SetThermics(true, false)
elseif not inst.light_on and inst.iceyamche and inst.open then
  inst.components.heater.heat = 0
  inst.components.talker:Say("[Heater]-Off\n[ice-box]") 
  inst.components.health:StartRegen(1, 10)
  inst.components.heater:SetThermics(true, false)  
  
elseif inst.components.health:GetPercent() >= 0 and inst.components.health:GetPercent() < 5 and inst.light_on and not inst.iceyamche and inst.open then
  inst.components.heater.heat = 0
  inst.components.talker:Say("[Heater]-Off\n(Not enough Cost)")
  inst.components.health:StartRegen(1, 10)
  inst.components.heater:SetThermics(true, false)
elseif inst.components.health:GetPercent() >= 0 and inst.components.health:GetPercent() < 5 and inst.light_on and inst.iceyamche and inst.open then
  inst.components.heater.heat = 0
  inst.components.talker:Say("[Heater]-Off\n(Not enough Cost)\n[ice-box]") 
  inst.components.health:StartRegen(1, 10)
  inst.components.heater:SetThermics(true, false)

elseif not inst.open then
  inst.components.heater.heat = 0
  inst.components.heater:SetThermics(true, false)
   end end  
  
 local function onuseyamche(inst, data)
 inst.SoundEmitter:PlaySound("dontstarve/common/minerhatAddFuel")
  if not inst.fightn and not inst.pick1 and not inst.working_food then
inst.Light:Enable(true)
inst.light_on = true
ystarve(inst)
inst.sg:GoToState("taunt")
inst.components.hunger:SetRate(120/TUNING.TEENBIRD_STARVE_TIME)
inst.components.talker:Say("Light(On)\nHungry-rate(x8)")
 
elseif not inst.fightn and inst.pick1 and not inst.working_food then
inst.Light:Enable(true)
inst.light_on = true
ystarve(inst)
inst.sg:GoToState("taunt")
inst.components.hunger:SetRate(165/TUNING.TEENBIRD_STARVE_TIME)
inst.components.talker:Say("Light(On)\nHungry-rate(x11)")

elseif not inst.fightn and not inst.pick1 and inst.working_food then
inst.Light:Enable(true)
inst.light_on = true
ystarve(inst)
inst.sg:GoToState("taunt")
inst.components.hunger:SetRate(210/TUNING.TEENBIRD_STARVE_TIME)
inst.components.talker:Say("Light(On)\nHungry-rate(x14)")

elseif inst.fightn then
inst.components.talker:Say("Myuu Myuu\nHungry-rate(0)")
inst.sg:GoToState("close")
inst.Light:Enable(true)
inst.light_on = true
inst.components.hunger:SetRate(0/TUNING.TEENBIRD_STARVE_TIME)
inst.components.heater.heat = 0
end end 
-----------
local function offuseyamche(inst, data)
inst.components.heater.heat = 0
inst.SoundEmitter:PlaySound("dontstarve/common/minerhatOut")
 if not inst.fightn and not inst.pick1 and not inst.working_food then
inst.Light:Enable(false)
inst.light_on = false
inst.components.talker:Say("Light(Off)\nHungry-rate(x1)")
inst.components.hunger:SetRate(15/TUNING.TEENBIRD_STARVE_TIME)
elseif not inst.fightn and inst.pick1 and not inst.working_food then
inst.Light:Enable(false)
inst.light_on = false
inst.components.talker:Say("Light(Off)\n[Collect Items]\nHungry-rate(x3)")
inst.components.hunger:SetRate(45/TUNING.TEENBIRD_STARVE_TIME)
elseif not inst.fightn and not inst.pick1 and inst.working_food then
inst.Light:Enable(false)
inst.light_on = false
inst.components.talker:Say("Light(Off)\n[Harvest Items]\nHungry-rate(x6)")
inst.components.hunger:SetRate(90/TUNING.TEENBIRD_STARVE_TIME)
if not inst.baby then
inst.sg:GoToState("command")
end
elseif inst.fightn then
inst.components.talker:Say("Myuu Myuu\nHungry-rate(0)")
inst.light_on = false
inst.Light:Enable(false)
inst.components.hunger:SetRate(0/TUNING.TEENBIRD_STARVE_TIME)
inst.components.heater.heat = 0
--inst.components.heater.carriedheat = 100
if not inst.baby then
inst.sg:GoToState("close")
 end end end
---------hat

local function baby_light(inst)
if inst.baby_light_on then
inst.components.talker:Say("Light on\nHungry-rate(x2)")
inst.baby_light_on = false
elseif inst.baby_light_off then
inst.components.talker:Say("Light off\nHungry-rate(0)")
inst.baby_light_off = false
    end end

local function OnDropped(inst,data)
 --  inst.level1 = true
   inst.baby = false
   inst.light_on = false
   inst.Light:Enable(false)
   inst.hat = false
   inst:SetBrain(brain)
   ystarve(inst)
   inst.components.talker:Say("Light Off\nHungry-rate(x1)")
    end

	local function OnPutInInventory(inst)
   inst.baby = true
   inst.light_on = false
   inst.Light:Enable(false)
 	inst:StopBrain()
	inst.hat = false
	--ystarve(inst)
	inst.baby_light_off = true
	baby_light(inst)
end
	
    local function onyamche(inst, owner)
    inst.components.growable:StopGrowing()
	inst:StopBrain()
   --  inst.level1 = false
    inst.baby = true
	inst.light_on = true
	inst.Light:Enable(true)
	inst.hat = true
	ystarve(inst)
	inst.baby_light_on = true
	baby_light(inst)
	    owner.AnimState:OverrideSymbol("swap_hat", "hat_yamche", "swap_hat")
        owner.AnimState:Show("HAT")
       -- owner.AnimState:Show("HAT_HAIR")
        owner.AnimState:Hide("HAIR_NOHAT")
        owner.AnimState:Show("HAIR")
		    end 

    local function offyamche(inst, owner)
	 inst.baby = false
   inst.light_on = false
   inst.Light:Enable(false)
         owner.AnimState:Hide("HAT")
        owner.AnimState:Hide("HAT_HAIR")
        owner.AnimState:Show("HAIR_NOHAT")
        owner.AnimState:Show("HAIR")
     end

local function GetReturnPos(inst)
    local rad = 2
    local pos = inst:GetPosition()
    --print("GetReturnPos", inst, pos)
    local angle = math.random()*2*PI
    pos = pos + Point(rad*math.cos(angle), 0, -rad*math.sin(angle))
    --print("    ", pos)
    return pos:Get()
end
	
local function yamche_flower(inst)
end 	
local function BattleCommand(inst, data)
if inst.yamche then
inst.sg:GoToState("command")
inst.yamche = false
if inst.components.sleeper:IsAsleep() then
inst.components.sleeper:WakeUp() end
elseif inst.fightn then
inst.components.health:SetAbsorptionAmount(1)
 inst.components.combat:GiveUp()
 GetReturnPos(inst)
 inst.pick1 = false
 inst.working_food = false
 inst.drop = true
elseif not inst.fightn and not inst.shield_on then
inst.components.health:SetAbsorptionAmount(0.5)
   end
end
--level?
local function Checklevel(inst, data)
    if inst.yamcheinfo and inst.level1 then
inst.components.talker:Say("Level 1\n下一级:[Exp 3]\nCurrent[EXP] ".. (inst.level))
    inst.yamcheinfo = false 
    elseif inst.yamcheinfo and inst.level2 then
inst.components.talker:Say("Level 2\n下一级:[Exp 20]\nCurrent[EXP] ".. (inst.level))
    inst.yamcheinfo = false 
    elseif inst.yamcheinfo and inst.level3 then
inst.components.talker:Say("Level 3\n下一级:[Exp 50]\nCurrent[EXP] ".. (inst.level))
    inst.yamcheinfo = false 
    elseif inst.yamcheinfo and inst.level4 then
inst.components.talker:Say("Level 4\n下一级:[Exp 100]\nCurrent[EXP] ".. (inst.level))
    inst.yamcheinfo = false 
    elseif inst.yamcheinfo and inst.level5 then
inst.components.talker:Say("Level 5\n下一级:[Exp 300]\nCurrent[EXP] ".. (inst.level))
    inst.yamcheinfo = false 
    elseif inst.yamcheinfo and inst.level6 then
inst.components.talker:Say("Level 6\n下一级:[Exp 400]\nCurrent[EXP] ".. (inst.level))
    inst.yamcheinfo = false 
    elseif inst.yamcheinfo and inst.level7 then
inst.components.talker:Say("Level 7\n下一级:[Exp 500]\nCurrent[EXP] ".. (inst.level))
    inst.yamcheinfo = false 
    elseif inst.yamcheinfo and inst.level8 then
inst.components.talker:Say("Level 8\nHealth +".. (inst.level))
    inst.yamcheinfo = false 
end
end


local function OnPower(inst, data)
local other = data.target
local misschance = 0.7
local misschance2 = 1
 if other and not inst.baby and inst.level1 and inst.ranger2 then
           SpawnPrefab("lightning").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-20)
		inst.components.health:DoDelta(-4)
		inst.components.talker:Say("[Health] Cost: -4")
            SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
	inst.AnimState:SetBloomEffectHandle( "" )
	inst.ranger2 = false inst.yamche_lightning = false 
    elseif other and inst.level2 and inst.ranger2 then
            SpawnPrefab("lightning").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-30)
		inst.components.health:DoDelta(-5)
				inst.components.talker:Say("[Health] Cost: -5")
            SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
	inst.AnimState:SetBloomEffectHandle( "" )
inst.ranger2 = false inst.yamche_lightning = false 
 inst.components.combat:SetRange(3)
    elseif other and inst.level3 and inst.ranger2 then
            SpawnPrefab("lightning").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-40)
		inst.components.health:DoDelta(-6)
				inst.components.talker:Say("[Health] Cost: -6")
            SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
	inst.AnimState:SetBloomEffectHandle( "" )
inst.ranger2 = false inst.yamche_lightning = false 
 inst.components.combat:SetRange(3)
    elseif other and inst.level4 and inst.ranger2 then
            SpawnPrefab("lightning").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-50)
		inst.components.health:DoDelta(-7)
				inst.components.talker:Say("[Health] Cost: -7")
            SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
	inst.AnimState:SetBloomEffectHandle( "" )
inst.ranger2 = false inst.yamche_lightning = false 
 inst.components.combat:SetRange(3)
    elseif other and inst.level5 and inst.ranger2 then
            SpawnPrefab("lightning").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-60)
		inst.components.health:DoDelta(-8)
				inst.components.talker:Say("[Health] Cost: -8")
            SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
	inst.AnimState:SetBloomEffectHandle( "" )
inst.ranger2 = false inst.yamche_lightning = false 
 inst.components.combat:SetRange(3)
    elseif other and inst.level6 and inst.ranger2 then
            SpawnPrefab("lightning").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-70)
		inst.components.health:DoDelta(-9)
				inst.components.talker:Say("[Health] Cost: -9")
            SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
	inst.AnimState:SetBloomEffectHandle( "" )
inst.ranger2 = false inst.yamche_lightning = false 
 inst.components.combat:SetRange(3)
    elseif other and inst.level7 and inst.ranger2 then
            SpawnPrefab("lightning").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-80)
		inst.components.health:DoDelta(-10)
				inst.components.talker:Say("[Health] Cost: -10")
            SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
	inst.AnimState:SetBloomEffectHandle( "" )
inst.ranger2 = false inst.yamche_lightning = false 
 inst.components.combat:SetRange(3)
    elseif other and inst.level8 and inst.ranger2 then
            SpawnPrefab("lightning").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-90)
		inst.components.health:DoDelta(-12)
				inst.components.talker:Say("[Health] Cost: -11")
            SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
	inst.AnimState:SetBloomEffectHandle( "" )
inst.ranger2 = false inst.yamche_lightning = false 
 inst.components.combat:SetRange(3)
  
    end	end 

function Power_check(inst, data)
if inst.yamche_lightning and inst.components.health:GetPercent() >=0.5 then 
inst.ranger2 = true
inst.bloom2 = true
inst.components.combat:SetRange(8)
if inst.bloom then
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
inst.components.talker:Say("[Lightning -On]")
inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
inst.bloom = false
end
elseif not inst.yamche_lightning then
inst.ranger2 = false inst.yamche_lightning = false
inst.components.combat:SetRange(3)
inst.bloom = true
if inst.bloom2 then
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
inst.AnimState:SetBloomEffectHandle( "" )
inst.bloom2 = false
end
elseif inst.yamche_lightning and inst.components.health:GetPercent() <0.5 then
scheduler:ExecuteInTime(2, function() inst.components.talker:Say("[Not enough health]")
end)
end end
 
local function OnAttacked(inst, data)
if not inst.fightn then
    inst.components.combat:SuggestTarget(data.attacker)
    inst.components.combat:ShareTarget(data.attacker, 3, function(dude) return dude:HasTag("companion") and not dude.components.health:IsDead() end, 5)
end
end

local function OnRanger(inst, data)
local rangechance = 0.1
local other = data.target
    if other and not inst.baby and not inst.ranger and math.random() < rangechance and not inst.ranger3 then
inst.ranger = true 
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
	inst.components.talker:Say("Full charged\n[Shadow Strike]")
	inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
 inst.components.combat:SetRange(8)
 
    elseif other and inst.level1 and inst.ranger then
            SpawnPrefab("statue_transition").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-5)
            SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
	inst.AnimState:SetBloomEffectHandle( "" )
inst.ranger = false 
 inst.components.combat:SetRange(3)
    elseif other and inst.level2 and inst.ranger then
            SpawnPrefab("statue_transition").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-10)
            SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
	inst.AnimState:SetBloomEffectHandle( "" )
inst.ranger = false 
 inst.components.combat:SetRange(3)
    elseif other and inst.level3 and inst.ranger then
            SpawnPrefab("statue_transition").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-15)
            SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
	inst.AnimState:SetBloomEffectHandle( "" )
inst.ranger = false 
 inst.components.combat:SetRange(3)
    elseif other and inst.level4 and inst.ranger then
            SpawnPrefab("statue_transition").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-20)
            SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
	inst.AnimState:SetBloomEffectHandle( "" )
inst.ranger = false 
 inst.components.combat:SetRange(3)
    elseif other and inst.level5 and inst.ranger then
            SpawnPrefab("statue_transition").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-25)
            SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
	inst.AnimState:SetBloomEffectHandle( "" )
inst.ranger = false 
 inst.components.combat:SetRange(3)
    elseif other and inst.level6 and inst.ranger then
            SpawnPrefab("statue_transition").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-30)
            SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
	inst.AnimState:SetBloomEffectHandle( "" )
inst.ranger = false 
 inst.components.combat:SetRange(3)
    elseif other and inst.level7 and inst.ranger then
            SpawnPrefab("statue_transition").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-35)
            SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
	inst.AnimState:SetBloomEffectHandle( "" )
inst.ranger = false 
 inst.components.combat:SetRange(3)
    elseif other and inst.level8 and inst.ranger then
            SpawnPrefab("statue_transition").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-40)
            SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
	inst.AnimState:SetBloomEffectHandle( "" )
inst.ranger = false 
 inst.components.combat:SetRange(3)

    end
end 

local function hit_Ranger(inst, data)
local other = data.target
if other and not inst.baby and inst.level1 and inst.components.health:GetPercent() < .5 and inst.ranger3 then
             SpawnPrefab("statue_transition").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-5)
            SpawnPrefab("sparks").Transform:SetPosition(other:GetPosition():Get())
	inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
   elseif other and inst.level2 and inst.components.health:GetPercent() < .5 and inst.ranger3 then
            SpawnPrefab("statue_transition").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-10)
            SpawnPrefab("sparks").Transform:SetPosition(other:GetPosition():Get())
	inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
inst.ranger = false 
 
    elseif other and inst.level3 and inst.components.health:GetPercent() < .5 and inst.ranger3 then
            SpawnPrefab("statue_transition").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-15)
            SpawnPrefab("sparks").Transform:SetPosition(other:GetPosition():Get())
	inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
inst.ranger = false 
 
    elseif other and inst.level4 and inst.components.health:GetPercent() < .5 and inst.ranger3 then
            SpawnPrefab("statue_transition").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-20)
            SpawnPrefab("sparks").Transform:SetPosition(other:GetPosition():Get())
	inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
inst.ranger = false 
 
    elseif other and inst.level5 and inst.components.health:GetPercent() < .5 and inst.ranger3 then
            SpawnPrefab("statue_transition").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-25)
            SpawnPrefab("sparks").Transform:SetPosition(other:GetPosition():Get())
	inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
inst.ranger = false 
 
    elseif other and inst.level6 and inst.components.health:GetPercent() < .5 and inst.ranger3 then
            SpawnPrefab("statue_transition").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-30)
            SpawnPrefab("sparks").Transform:SetPosition(other:GetPosition():Get())
	inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
inst.ranger = false 
 
    elseif other and inst.level7 and inst.components.health:GetPercent() < .5 and inst.ranger3 then
            SpawnPrefab("statue_transition").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-35)
            SpawnPrefab("sparks").Transform:SetPosition(other:GetPosition():Get())
	inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
inst.ranger = false 

    elseif other and inst.level8 and inst.components.health:GetPercent() < .5 and inst.ranger3 then
            SpawnPrefab("statue_transition").Transform:SetPosition(other:GetPosition():Get())
        other.components.health:DoDelta(-40)
            SpawnPrefab("sparks").Transform:SetPosition(other:GetPosition():Get())
	inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
inst.ranger = false 

    end end


local function continue_Ranger(inst, data)
local other = data.target
    if not inst.baby and inst.components.health:GetPercent() < .5 and not inst.ranger2 then
inst.ranger3 = true 
inst.components.combat:SetRange(12)
inst.AnimState:SetBloomEffectHandle( "" )
    elseif not inst.baby and inst.components.health:GetPercent() >= .5 and not inst.ranger2 then
inst.ranger3 = false	
inst.components.combat:SetRange(3)
    end
end

local function OnHitfire(inst, data)
local other = data.target
   local pos = other:GetPosition()
    if other and other.components.burnable and not other:HasTag("structure") and not inst.iceyamche and inst.level1 and inst.doctor then
        other.components.burnable:Ignite()
		other.components.health:DoDelta(-5)
   elseif other and other.components.burnable and not other:HasTag("structure") and not inst.iceyamche and inst.level2 and not inst.doctor then
        other.components.burnable:Ignite()
		other.components.health:DoDelta(-20)		
   elseif other and other.components.burnable and not other:HasTag("structure") and not inst.iceyamche and inst.level3 and not inst.doctor then
        other.components.burnable:Ignite()
		other.components.health:DoDelta(-30)	
   elseif other and other.components.burnable and not other:HasTag("structure") and not inst.iceyamche and inst.level4 and not inst.doctor then
        other.components.burnable:Ignite()
		other.components.health:DoDelta(-40)	
   elseif other and other.components.burnable and not other:HasTag("structure") and not inst.iceyamche and inst.level5 and not inst.doctor then
        other.components.burnable:Ignite()
		other.components.health:DoDelta(-50)	
   elseif other and other.components.burnable and not other:HasTag("structure") and not inst.iceyamche and inst.level6 and not inst.doctor then
        other.components.burnable:Ignite()
		other.components.health:DoDelta(-60)	
   elseif other and other.components.burnable and not other:HasTag("structure") and not inst.iceyamche and inst.level7 and not inst.doctor then
        other.components.burnable:Ignite()
		other.components.health:DoDelta(-70)	
   elseif other and other.components.burnable and not other:HasTag("structure") and not inst.iceyamche and inst.level8 and not inst.doctor then
        other.components.burnable:Ignite()
		other.components.health:DoDelta(-80)	

   elseif other and other.components.burnable and not other:HasTag("structure") and not inst.iceyamche and inst.level2 and inst.doctor then
        other.components.burnable:Ignite()
		other.components.health:DoDelta(-10)		
   elseif other and other.components.burnable and not other:HasTag("structure") and not inst.iceyamche and inst.level3 and inst.doctor then
        other.components.burnable:Ignite()
		other.components.health:DoDelta(-15)	
   elseif other and other.components.burnable and not other:HasTag("structure") and not inst.iceyamche and inst.level4 and inst.doctor then
        other.components.burnable:Ignite()
		other.components.health:DoDelta(-20)	
   elseif other and other.components.burnable and not other:HasTag("structure") and not inst.iceyamche and inst.level5 and inst.doctor then
        other.components.burnable:Ignite()
		other.components.health:DoDelta(-25)	
   elseif other and other.components.burnable and not other:HasTag("structure") and not inst.iceyamche and inst.level6 and inst.doctor then
        other.components.burnable:Ignite()
		other.components.health:DoDelta(-30)	
   elseif other and other.components.burnable and not other:HasTag("structure") and not inst.iceyamche and inst.level7 and inst.doctor then
        other.components.burnable:Ignite()
		other.components.health:DoDelta(-35)	
   elseif other and other.components.burnable and not other:HasTag("structure") and not inst.iceyamche and inst.level8 and inst.doctor then
        other.components.burnable:Ignite()
		other.components.health:DoDelta(-40)	
		
elseif other and other:HasTag("musha") then
	inst.components.combat:SetTarget(nil)
inst.components.combat:GiveUp()
    end
    if other.components.burnable and other.components.burnable:IsBurning() then
        other.components.burnable:Extinguish()
    end
end

local function OnHitfreeze(inst, data)
local other = data.target
   local pos = other:GetPosition()
	  if other and other.components.freezable and inst.iceyamche and not other:HasTag("structure") and inst.level2 and not inst.ranger2 then
        other.components.freezable:AddColdness(0.2)
        other.components.freezable:SpawnShatterFX()
  elseif other and other.components.freezable and inst.iceyamche and not other:HasTag("structure") and inst.level3 and not inst.ranger2 then
        other.components.freezable:AddColdness(0.3)
        other.components.freezable:SpawnShatterFX()
  elseif other and other.components.freezable and inst.iceyamche and not other:HasTag("structure") and inst.level4 and not inst.ranger2 then
        other.components.freezable:AddColdness(0.7)
        other.components.freezable:SpawnShatterFX()
  elseif other and other.components.freezable and inst.iceyamche and not other:HasTag("structure") and inst.level5 and not inst.ranger2 then
        other.components.freezable:AddColdness(0.5)
        other.components.freezable:SpawnShatterFX()
  elseif other and other.components.freezable and inst.iceyamche and not other:HasTag("structure") and inst.level6 and not inst.ranger2 then
        other.components.freezable:AddColdness(0.6)
        other.components.freezable:SpawnShatterFX()
  elseif other and other.components.freezable and inst.iceyamche and not other:HasTag("structure") and inst.level7 and not inst.ranger2 then
        other.components.freezable:AddColdness(0.7)
        other.components.freezable:SpawnShatterFX()
  elseif other and other.components.freezable and inst.iceyamche and not other:HasTag("structure") and inst.level8 and not inst.ranger2 then
        other.components.freezable:AddColdness(0.8)
        other.components.freezable:SpawnShatterFX()  		
 elseif other and other.components.freezable and inst.iceyamche and not other:HasTag("structure") and inst.ranger2 then
        other.components.freezable:AddColdness(10)
        other.components.freezable:SpawnShatterFX() 
		
elseif other and other:HasTag("musha") then
	inst.components.combat:SetTarget(nil)
inst.components.combat:GiveUp()

    end

    if other.components.burnable and other.components.burnable:IsBurning() then
        other.components.burnable:Extinguish()
    end
end

local function OnHitvampire(inst, data)
--local vampirechance = 0.2
local other = data.target
   local pos = other:GetPosition()
if other and inst.darkyamche then
            SpawnPrefab("statue_transition").Transform:SetPosition(other:GetPosition():Get())
        inst.components.health:DoDelta(20)

    end
end


local function Onfreeze(attacked, data)
        if data and data.attacker and data.attacker.components.freezable then
            data.attacker.components.freezable:AddColdness(0.25)
           -- data.attacker.components.freezable:SpawnShatterFX()
        end 
    if data.attacker.components.burnable and data.attacker.components.burnable:IsBurning() then
        data.attacker.components.burnable:Extinguish()
    end
    end


local function OnFire(attacked, data)
        if data and data.attacker and data.attacker.components.burnable then
            data.attacker.components.burnable:IsBurning()
            data.attacker.components.health:DoDelta(-25)
            data.attacker.components.burnable:Ignite(true)
            end 
		if data.attacker.components.burnable and data.attacker.components.burnable:IsBurning() then
      	data.attacker.components.burnable:Extinguish()
	end
    end

	-----------

    local function cure1_proc(inst, data)
inst.components.health:SetAbsorptionAmount(1)
inst.components.health:DoDelta(100)
inst:ListenForEvent("attacked", OnFire)
local fx = SpawnPrefab("forcefieldfxx")
inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
fx.entity:SetParent(inst.entity)
fx.Transform:SetScale(0.7, 0.7, 0.7)
fx.Transform:SetPosition(0, 0.2, 0)
local fx_hitanim = function()
fx.AnimState:PlayAnimation("hit")
fx.AnimState:PushAnimation("idle_loop")
end
fx:ListenForEvent("blocked", fx_hitanim, inst)
inst.shield_on = true
inst:DoTaskInTime(--[[Duration]] 12, function()
fx:RemoveEventCallback("blocked", fx_hitanim, inst)
if inst:IsValid() then
fx.kill_fx(fx)
inst.components.health:SetAbsorptionAmount(0.5)
inst.components.talker:Say("[Shield] cooldown -[300sec]")
inst:RemoveEventCallback("attacked", OnFire)
inst:DoTaskInTime(--[[Cooldown]] 300, function() inst.shield_on = false end)
end end) 
 end 

local function tryproc(inst)
if not inst.shield_on and inst.components.health:GetPercent() < .2  then
            cure1_proc(inst)
elseif inst.shield_on and inst.components.health:GetPercent() < .2  and inst.components.health:GetPercent() > .1 then
 inst.components.talker:Say("[Health:below(20%)]")			
elseif inst.shield_on and inst.components.health:GetPercent() <= .1 then 
  inst.components.talker:Say("[Health:below(10%)]")			
    end end

--[[local function FollowPlayer(inst)
    --print("smallbird - FollowPlayer")
	local player = ThePlayer
	if player and player.components.leader then
        --print("   adding follower")
		player.components.leader:AddFollower(inst)
	end
	end]]
local function FollowPlayer(inst)
 	--local player = ThePlayer
	--if player and player.components.leader then
        --print("   adding follower")
		--player.components.leader:AddFollower(inst)
	--end	
	end

local function on_close(inst)
inst.follow = false
local leader = inst.components.follower.leader
if inst.components.follower.leader and inst.components.health:GetPercent() > .5 then
inst.components.locomotor.walkspeed = 4
elseif inst.components.follower.leader and inst.components.health:GetPercent() <= .5 then
inst.components.locomotor.walkspeed = 6
elseif not inst.components.follower.leader then
inst.components.locomotor.walkspeed = 6
end  end
local function on_far(inst)
inst.follow = true
local leader = inst.components.follower.leader
if inst.components.follower.leader and leader:HasTag("musha") then
inst.components.locomotor.walkspeed = 12
inst.components.combat:GiveUp()
elseif not inst.components.follower.leader then
inst.components.locomotor.walkspeed = 12
end  end

-----------------------

local function OnOpen(inst)
    if not inst.components.health:IsDead() then
 	inst.open = true
        inst.sg:GoToState("open")
		end
	if not inst.light_on and not inst.iceyamche then	
	inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
	elseif not inst.light_on and inst.iceyamche then	
	inst.SoundEmitter:PlaySound("dontstarve/common/gem_shatter")
	elseif inst.light_on then	
	inst.SoundEmitter:PlaySound("dontstarve/common/fireAddFuel")
end
if inst.components.burnable:IsBurning() then
        inst.components.burnable:Extinguish()
end
if inst.components.freezable:IsFrozen() then
        inst.components.freezable:Unfreeze()
    end
end 

local function OnClose(inst) 
inst.open = false
  inst.components.heater.heat = 0
  inst.components.heater:SetThermics(true, false)
    if not inst.components.health:IsDead() then
	inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")
	        inst.sg:GoToState("close")
    end
end 

----------
local function PhoenixSanityAura(inst, observer)
	if inst.components.hunger:GetPercent() < .5 then
		return 0
	elseif inst.components.hunger:GetPercent() > .5 then
			return TUNING.SANITYAURA_TINY

	elseif inst.components.hunger:GetPercent() > .9 then
			return TUNING.SANITYAURA_SMALL
	end

	if inst.components.follower and inst.components.follower.leader == observer then
		--return TUNING.SANITYAURA_TINY
		return 0
	end
		return 0
	end

local function ShouldWakeUp(inst)
--DefaultWakeTest(inst)
--inst.light_on
    return not inst.fightn 
end

local function ShouldSleep(inst)
--DefaultSleepTest(inst)
    return inst.fightn and not inst.components.hunger:IsStarving(inst)
end
--[[
local function CanEatTest(inst, item)
    --print("smallbird - CanEatTest", inst.name, item.components.edible.foodtype, item, item.prefab)
	    --local canEat = (item.components.edible.foodtype == "SEEDS") or (item.prefab == "berries")
    --print("   canEat?", canEat)

	if not item:HasTag("spoiled") or not item:HasTag("flower") then
			return true
-- return canEat

end 
end]]

 	
local function ShouldAcceptItem(inst, item)

    if item.components.edible then
        return inst.components.eater:CanEat(item) and inst.components.hunger:GetPercent() <= 0.9
    end 
	if inst.components.sleeper:IsAsleep() then
        inst.components.sleeper:WakeUp()
	end end
	
local function OnGetItemFromPlayer(inst, giver, item)
      
		   if inst.components.sleeper:IsAsleep() then
        inst.components.sleeper:WakeUp()
    end
    --I eat food
    if item.components.edible then
	        if inst.components.combat.target and inst.components.combat.target == giver then
            inst.components.combat:SetTarget(nil)
elseif giver.components.leader then
inst.SoundEmitter:PlaySound("dontstarve/creatures/smallbird/scratch_ground")
--giver.components.leader:AddFollower(inst)
        end
        if inst.components.eater:Eat(item) then
		--inst.components.talker:Say("Zzu zu")
            --print("   yummy!")
       -- end
    end end
end
local poopchance2 = 0.6
local poopchance = 0.4
local rebackchance = 0.2
local tynychance = 0.1
local tynyychance = 0.05
local eggchance = 1.0

local function OnEat(inst, food, item)
 
--[[if food.components.edible and food.components.edible.hungervalue == TUNING.SPOILED_HUNGER then 
inst.sg:GoToState("refuse")
inst.components.talker:Say("foo? food?")
inst.components.hunger:DoDelta(15)]]
if not inst.hat and food.components.edible and food.components.edible.hungervalue >= 0 and math.random() < tynyychance then 
inst.level = inst.level + 1
levelexp(inst)
end 

if not inst.hat and food.components.edible and food.components.edible.hungervalue <= 0 then 
inst.sg:GoToState("refuse")
inst.components.talker:Say("foo? food?")
inst.components.hunger:DoDelta(18)
inst.sg:GoToState("refuse")
end

if food.components.edible.hungervalue == 150 and food.components.edible.healthvalue == 100 then 
	inst.level = inst.level + 80
	levelexp(inst)
inst.components.hunger:DoDelta(150)
inst.components.talker:Say(" !!!!!!!!!! \nEXP + 80 ")

end

    -- food heal
    if inst:HasTag("companion") then
        inst.components.health:DoDelta(inst.components.health.maxhealth * .05, nil, food.prefab)
        inst.components.combat:SetTarget(nil)
    else
        inst.components.health:DoDelta(inst.components.health.maxhealth, nil, food.prefab)
    end
    -- VEGGIE -- MEAT -- SEEDS
    if food.components.edible and food.components.edible.foodtype == "MEAT" then
	local fx = SpawnPrefab("poopcloud")
	fx.Transform:SetScale(0.7, 0.7, 0.7)
	fx.Transform:SetPosition(inst:GetPosition():Get())
   	
    if math.random() < poopchance then
		local poo = SpawnPrefab("guano")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < rebackchance then
		local poo = SpawnPrefab("poop")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("spoiled_food")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("wetgoop")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("ash")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < tynyychance then
		local poo = SpawnPrefab("glowdust")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
	end
	end

    if food.components.edible and food.components.edible.hungervalue > 141 and food.components.edible.healthvalue > 91 then
inst.components.health:DoDelta(400)
inst.level = inst.level + 1
levelexp(inst)
    if math.random() < poopchance then
		local poo = SpawnPrefab("orangegem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("greengem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("yellowgem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("purplegem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < tynychance then
		local poo = SpawnPrefab("redgem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < tynychance then
		local poo = SpawnPrefab("bluegem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < tynychance then
		local poo = SpawnPrefab("purplegem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < tynychance then
		local poo = SpawnPrefab("thulecite")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
	end
	end

    if food.components.edible and food.components.edible.hungervalue > 145 or food.components.edible.healthvalue > 39 then
inst.components.health:DoDelta(500)
    if math.random() < rebackchance then
		local poo = SpawnPrefab("goldnugget")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
		inst.level = inst.level + 1		
		levelexp(inst)
    elseif math.random() < tynychance then
		local poo = SpawnPrefab("redgem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
		inst.level = inst.level + 1
		levelexp(inst)
    elseif math.random() < tynychance then
		local poo = SpawnPrefab("bluegem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
		inst.level = inst.level + 1		
		levelexp(inst)
    elseif math.random() < tynychance then
		local poo = SpawnPrefab("purplegem")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
		inst.level = inst.level + 1
		levelexp(inst)
    elseif math.random() < tynychance then
		local poo = SpawnPrefab("thulecite")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
		inst.level = inst.level + 1
		levelexp(inst)

	end
	end

    if food.components.edible and food.components.edible.hungervalue > 59 or food.components.edible.healthvalue > 29 or food.components.edible.sanityvalue > 14 then
inst.components.health:DoDelta(300)
    if math.random() < rebackchance then
		local poo = SpawnPrefab("goldnugget")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
    elseif math.random() < rebackchance then
		local poo = SpawnPrefab("nitre")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < rebackchance then
		local poo = SpawnPrefab("lightbulb")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < rebackchance then
		local poo = SpawnPrefab("lightbulb")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < rebackchance then
		local poo = SpawnPrefab("thulecite_pieces")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
    elseif math.random() < tynyychance then
		local poo = SpawnPrefab("redgem")
		inst.level = inst.level + 1		
		levelexp(inst)
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < tynyychance then
		local poo = SpawnPrefab("bluegem")
		inst.level = inst.level + 1
		levelexp(inst)
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())			
  elseif math.random() < tynychance then
		local poo = SpawnPrefab("purplegem")
		inst.level = inst.level + 1
		levelexp(inst)
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
	end
	end

    if food.components.edible and food.components.edible.hungervalue > 24 or food.components.edible.healthvalue > 9 or food.components.edible.sanityvalue > 4 then
inst.components.health:DoDelta(100)
    if math.random() < rebackchance then
		local poo = SpawnPrefab("poop")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < rebackchance then
		local poo = SpawnPrefab("Charcoal")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < rebackchance then
		local poo = SpawnPrefab("rottenegg")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
    elseif math.random() < tynychance then
		local poo = SpawnPrefab("lightbulb")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < tynychance then
		local poo = SpawnPrefab("poop")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < rebackchance then
		local poo = SpawnPrefab("houndstooth")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		

	end
	end

    if food.components.edible and food.components.edible.foodtype == "VEGGIE" then
	local fx = SpawnPrefab("poopcloud")
	fx.Transform:SetScale(0.5, 0.5, 0.5)
	fx.Transform:SetPosition(inst:GetPosition():Get())
    if math.random() < poopchance then
		local poo = SpawnPrefab("seeds")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("carrot_seeds")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("pumpkin_seeds")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("dragonfruit_seeds")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("watermelon_seeds")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())			
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("pomegranate_seeds")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("corn_seeds")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("eggplant_seeds")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())			
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("eggplant_seeds")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
    elseif math.random() < tynychance then
		local poo = SpawnPrefab("lightbulb")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("ash")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
	end
	end

    if food.components.edible and food.components.edible.foodtype == "SEEDS" then
	local fx = SpawnPrefab("poopcloud")
	fx.Transform:SetScale(0.2, 0.2, 0.2)
	fx.Transform:SetPosition(inst:GetPosition():Get())
    if math.random() < poopchance then
		local poo = SpawnPrefab("ash")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())		
	end
	end
if food and food.components.edible and food.components.edible.hungervalue == 2 and food.components.edible.sanityvalue == 2 and food.components.edible.healthvalue == 1000 and inst.level1 then
		local poo = SpawnPrefab("musha_egg")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
            ndie(inst)
    inst:Remove()

end
if food and food.components.edible and food.components.edible.hungervalue == 2 and food.components.edible.sanityvalue == 2 and food.components.edible.healthvalue == 1000 and inst.level2 then
	if inst.components.container then
	inst.components.container:DropEverything() 
		local poo = SpawnPrefab("musha_eggs1")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
            ndie(inst)
    inst:Remove()
    end
end
if food and food.components.edible and food.components.edible.hungervalue == 2 and food.components.edible.sanityvalue == 2 and food.components.edible.healthvalue == 1000 and inst.level3 then
	if inst.components.container then
	inst.components.container:DropEverything() 
		local poo = SpawnPrefab("musha_eggs2")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
            ndie(inst)
    inst:Remove()
end
end
if food and food.components.edible and food.components.edible.hungervalue == 2 and food.components.edible.sanityvalue == 2 and food.components.edible.healthvalue == 1000 and inst.level4 then
	if inst.components.container then
	inst.components.container:DropEverything() 
		local poo = SpawnPrefab("musha_eggs3")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
            ndie(inst)
    inst:Remove()
    end
end
if food and food.components.edible and food.components.edible.hungervalue == 2 and food.components.edible.sanityvalue == 2 and food.components.edible.healthvalue == 1000 and inst.level5 then
	if inst.components.container then
	inst.components.container:DropEverything() 
		local poo = SpawnPrefab("musha_egg1")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
            ndie(inst)
    inst:Remove()
    end
end
if food and food.components.edible and food.components.edible.hungervalue == 2 and food.components.edible.sanityvalue == 2 and food.components.edible.healthvalue == 1000 and inst.level6 then
	if inst.components.container then
	inst.components.container:DropEverything() 
		local poo = SpawnPrefab("musha_egg2")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
            ndie(inst)
    inst:Remove()
    end
end
if food and food.components.edible and food.components.edible.hungervalue == 2 and food.components.edible.sanityvalue == 2 and food.components.edible.healthvalue == 1000 and inst.level7 then
	if inst.components.container then
	inst.components.container:DropEverything() 
		local poo = SpawnPrefab("musha_egg3")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
            ndie(inst)
    inst:Remove()
    end
end
if food and food.components.edible and food.components.edible.hungervalue == 2 and food.components.edible.sanityvalue == 2 and food.components.edible.healthvalue == 1000 and inst.level8 then
	if inst.components.container then
	inst.components.container:DropEverything() 
		local poo = SpawnPrefab("musha_egg8")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
            ndie(inst)
    inst:Remove()
    end
end

if food and food.components.edible and food.components.edible.hungervalue == 2 and food.components.edible.sanityvalue == 2 and food.components.edible.healthvalue == 1000 then
	local dark2 = SpawnPrefab("statue_transition_2")
	dark2.Transform:SetPosition(inst:GetPosition():Get())
    if math.random() < poopchance then
		local poo = SpawnPrefab("flower_cave")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("flower_cave")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("flower_cave_double")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("flower_cave_double")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
    elseif math.random() < rebackchance then
		local poo = SpawnPrefab("flower_cave_triple")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	
    elseif math.random() < eggchance then
		local poo = SpawnPrefab("flower_cave")
		poo.Transform:SetPosition(inst.Transform:GetWorldPosition())	

	end
	end
	end

local function OnRefuseItem(inst, item)
    inst.sg:GoToState("refuse")
    if inst.components.sleeper:IsAsleep() then
        inst.components.sleeper:WakeUp()
end
end

local function OnNewTarget(inst, data)
    --print("teenbird - OnNewTarget", data.target, inst.components.follower.leader)
    if data.target and data.target:HasTag("player") then
	return 
end end

local function SetTeen(inst)
    --print("smallbird - SetTeen")
	inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
    inst.sg:GoToState("growup") -- calls back to SpawnTeen
end

local function SpawnTeen(inst)
    --print("smallbird - SpawnTeen")
local random = 0.2
local last = 1.0

    if math.random() < random then
    local musha_0 = SpawnPrefab("musha_teen")
    musha_0.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_0.sg:GoToState("idle")
musha_0.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_5 = SpawnPrefab("musha_teenice")
    musha_5.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_5.sg:GoToState("idle")
musha_5.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_1 = SpawnPrefab("musha_teenr1")
    musha_1.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_1.sg:GoToState("idle")
musha_1.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_2 = SpawnPrefab("musha_teenr2")
    musha_2.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_2.sg:GoToState("idle")
musha_2.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_3 = SpawnPrefab("musha_teenr3")
    musha_3.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_3.sg:GoToState("idle")
musha_3.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_4 = SpawnPrefab("musha_teenr4")
    musha_4.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_4.sg:GoToState("idle")
musha_4.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_5 = SpawnPrefab("musha_teenice")
    musha_5.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_5.sg:GoToState("idle")
musha_5.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_3 = SpawnPrefab("musha_teenr3")
    musha_3.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_3.sg:GoToState("idle")
musha_3.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_2 = SpawnPrefab("musha_teenr2")
    musha_2.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_2.sg:GoToState("idle")
musha_2.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_1 = SpawnPrefab("musha_teenr1")
    musha_1.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_1.sg:GoToState("idle")
musha_1.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_0 = SpawnPrefab("musha_teen")
    musha_0.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_0.sg:GoToState("idle")
musha_0.components.follower:SetLeader(inst.components.follower.leader)

    elseif math.random() < random then
    local musha_0 = SpawnPrefab("musha_teen")
    musha_0.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_0.sg:GoToState("idle")
musha_0.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_1 = SpawnPrefab("musha_teenr1")
    musha_1.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_1.sg:GoToState("idle")
musha_1.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_2 = SpawnPrefab("musha_teenr2")
    musha_2.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_2.sg:GoToState("idle")
musha_2.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_3 = SpawnPrefab("musha_teenr3")
    musha_3.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_3.sg:GoToState("idle")
musha_3.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_4 = SpawnPrefab("musha_teenr4")
    musha_4.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_4.sg:GoToState("idle")
musha_4.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_5 = SpawnPrefab("musha_teenice")
    musha_5.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_5.sg:GoToState("idle")
musha_5.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_3 = SpawnPrefab("musha_teenr3")
    musha_3.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_3.sg:GoToState("idle")
musha_3.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_2 = SpawnPrefab("musha_teenr2")
    musha_2.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_2.sg:GoToState("idle")
musha_2.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_1 = SpawnPrefab("musha_teenr1")
    musha_1.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_1.sg:GoToState("idle")
musha_1.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < last then
    local musha_0 = SpawnPrefab("musha_teen")
    musha_0.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_0.sg:GoToState("idle")
musha_0.components.follower:SetLeader(inst.components.follower.leader)

    end
inst.AnimState:SetBloomEffectHandle( "" )
            die(inst)
    inst:Remove()

    end

local function SetAdult(inst)
    --print("smallbird - SetAdult")
inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )

    inst.sg:GoToState("growup") -- calls back to SpawnAdult
end

local function SpawnAdult(inst)
    --print("smallbird - SpawnAdult")
local random = 0.2
local last = 1.0

    if math.random() < random then
 local musha_0 = SpawnPrefab("musha_tall")
    musha_0.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_0.sg:GoToState("idle")
musha_0.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_5 = SpawnPrefab("musha_tallrice")
    musha_5.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_5.sg:GoToState("idle")
musha_5.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_1 = SpawnPrefab("musha_tallr1")
    musha_1.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_1.sg:GoToState("idle")
musha_1.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_2 = SpawnPrefab("musha_tallr2")
    musha_2.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_2.sg:GoToState("idle")
musha_2.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_3 = SpawnPrefab("musha_tallr3")
    musha_3.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_3.sg:GoToState("idle")
musha_3.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_4 = SpawnPrefab("musha_tallr4")
    musha_4.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_4.sg:GoToState("idle")
musha_4.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_5 = SpawnPrefab("musha_tallrice")
    musha_5.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_5.sg:GoToState("idle")
musha_5.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_3 = SpawnPrefab("musha_tallr3")
    musha_3.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_3.sg:GoToState("idle")
musha_3.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_2 = SpawnPrefab("musha_tallr2")
    musha_2.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_2.sg:GoToState("idle")
musha_2.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_1 = SpawnPrefab("musha_tallr1")
    musha_1.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_1.sg:GoToState("idle")
musha_1.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
 local musha_0 = SpawnPrefab("musha_tall")
    musha_0.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_0.sg:GoToState("idle")
musha_0.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_1 = SpawnPrefab("musha_tallr1")
    musha_1.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_1.sg:GoToState("idle")
musha_1.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_2 = SpawnPrefab("musha_tallr2")
    musha_2.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_2.sg:GoToState("idle")
musha_2.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_3 = SpawnPrefab("musha_tallr3")
    musha_3.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_3.sg:GoToState("idle")
musha_3.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_4 = SpawnPrefab("musha_tallr4")
    musha_4.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_4.sg:GoToState("idle")
musha_4.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_5 = SpawnPrefab("musha_tallrice")
    musha_5.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_5.sg:GoToState("idle")
musha_5.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_3 = SpawnPrefab("musha_tallr3")
    musha_3.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_3.sg:GoToState("idle")
musha_3.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_2 = SpawnPrefab("musha_tallr2")
    musha_2.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_2.sg:GoToState("idle")
musha_2.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_1 = SpawnPrefab("musha_tallr1")
    musha_1.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_1.sg:GoToState("idle")
musha_1.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
 local musha_0 = SpawnPrefab("musha_tall")
    musha_0.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_0.sg:GoToState("idle")
musha_0.components.follower:SetLeader(inst.components.follower.leader)

    elseif math.random() < last then
 local musha_0 = SpawnPrefab("musha_tall")
    musha_0.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_0.sg:GoToState("idle")
musha_0.components.follower:SetLeader(inst.components.follower.leader)
end

if inst.components.container then
inst.components.container:DropEverything() 
end
inst.AnimState:SetBloomEffectHandle( "" )
            die(inst)
    inst:Remove()

    end

local function SetAdult2(inst)
    --print("smallbird - SetAdult")
inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )

    inst.sg:GoToState("growup") -- calls back to SpawnAdult
end

local function SpawnAdult2(inst)

local random = 0.2
local last = 1.0

    if math.random() < random then
    local musha_0 = SpawnPrefab("musha_tall2")
    musha_0.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_0.sg:GoToState("idle")
musha_0.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_6 = SpawnPrefab("musha_tallrrice")
    musha_6.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_6.sg:GoToState("idle")
musha_6.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_1 = SpawnPrefab("musha_tallrr1")
    musha_1.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_1.sg:GoToState("idle")
musha_1.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_2 = SpawnPrefab("musha_tallrr2")
    musha_2.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_2.sg:GoToState("idle")
musha_2.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_3 = SpawnPrefab("musha_tallrr3")
    musha_3.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_3.sg:GoToState("idle")
musha_3.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_4 = SpawnPrefab("musha_tallrr4")
    musha_4.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_4.sg:GoToState("idle")
musha_4.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_5 = SpawnPrefab("musha_tallrr5")
    musha_5.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_5.sg:GoToState("idle")
musha_5.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_6 = SpawnPrefab("musha_tallrrice")
    musha_6.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_6.sg:GoToState("idle")
musha_6.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_0 = SpawnPrefab("musha_tall2")
    musha_0.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_0.sg:GoToState("idle")
musha_0.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_1 = SpawnPrefab("musha_tallrr1")
    musha_1.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_1.sg:GoToState("idle")
musha_1.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_2 = SpawnPrefab("musha_tallrr2")
    musha_2.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_2.sg:GoToState("idle")
musha_2.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_3 = SpawnPrefab("musha_tallrr3")
    musha_3.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_3.sg:GoToState("idle")
musha_3.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_4 = SpawnPrefab("musha_tallrr4")
    musha_4.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_4.sg:GoToState("idle")
musha_4.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_5 = SpawnPrefab("musha_tallrr5")
    musha_5.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_5.sg:GoToState("idle")
musha_5.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_6 = SpawnPrefab("musha_tallrrice")
    musha_6.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_6.sg:GoToState("idle")
musha_6.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < last then
    local musha_0 = SpawnPrefab("musha_tall2")
    musha_0.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_0.sg:GoToState("idle")
musha_0.components.follower:SetLeader(inst.components.follower.leader)
end

if inst.components.container then
inst.components.container:DropEverything() 
end
inst.AnimState:SetBloomEffectHandle( "" )
            die(inst)
    inst:Remove()

    end
local function SetAdult3(inst)
    --print("smallbird - SetAdult")
inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )

    inst.sg:GoToState("growup") -- calls back to SpawnAdult
end

local function SpawnAdult3(inst)

local random = 0.2
local last = 1.0

    if math.random() < random then
    local musha_0 = SpawnPrefab("musha_tall3")
    musha_0.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_0.sg:GoToState("idle")
musha_0.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_6 = SpawnPrefab("musha_tallrrrice")
    musha_6.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_6.sg:GoToState("idle")
musha_6.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_1 = SpawnPrefab("musha_tallrrr1")
    musha_1.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_1.sg:GoToState("idle")
musha_1.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_2 = SpawnPrefab("musha_tallrrr2")
    musha_2.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_2.sg:GoToState("idle")
musha_2.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_3 = SpawnPrefab("musha_tallrrr3")
    musha_3.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_3.sg:GoToState("idle")
musha_3.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_4 = SpawnPrefab("musha_tallrrr4")
    musha_4.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_4.sg:GoToState("idle")
musha_4.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_5 = SpawnPrefab("musha_tallrrr5")
    musha_5.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_5.sg:GoToState("idle")
musha_5.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_6 = SpawnPrefab("musha_tallrrrice")
    musha_6.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_6.sg:GoToState("idle")
musha_6.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < last then
    local musha_0 = SpawnPrefab("musha_tall3")
    musha_0.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_0.sg:GoToState("idle")
musha_0.components.follower:SetLeader(inst.components.follower.leader)
end

if inst.components.container then
inst.components.container:DropEverything() 
end
inst.AnimState:SetBloomEffectHandle( "" )
            die(inst)
    inst:Remove()

    end
local function SetAdult4(inst)
    --print("smallbird - SetAdult")
inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )

    inst.sg:GoToState("growup") -- calls back to SpawnAdult
end

local function SpawnAdult4(inst)
local random = 0.2
local last = 1.0

    if math.random() < random then
    local musha_0 = SpawnPrefab("musha_tall4")
    musha_0.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_0.sg:GoToState("idle")
musha_0.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_7 = SpawnPrefab("musha_tallrrrrice")
    musha_7.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_7.sg:GoToState("idle")
musha_7.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_1 = SpawnPrefab("musha_tallrrrr1")
    musha_1.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_1.sg:GoToState("idle")
musha_1.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_2 = SpawnPrefab("musha_tallrrrr2")
    musha_2.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_2.sg:GoToState("idle")
musha_2.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_3 = SpawnPrefab("musha_tallrrrr3")
    musha_3.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_3.sg:GoToState("idle")
musha_3.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_4 = SpawnPrefab("musha_tallrrrr4")
    musha_4.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_4.sg:GoToState("idle")
musha_4.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_5 = SpawnPrefab("musha_tallrrrr5")
    musha_5.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_5.sg:GoToState("idle")
musha_5.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_6 = SpawnPrefab("musha_tallrrrr6")
    musha_6.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_6.sg:GoToState("idle")
musha_6.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_7 = SpawnPrefab("musha_tallrrrrice")
    musha_7.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_7.sg:GoToState("idle")
musha_7.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_0 = SpawnPrefab("musha_tall4")
    musha_0.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_0.sg:GoToState("idle")
musha_0.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_1 = SpawnPrefab("musha_tallrrrr1")
    musha_1.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_1.sg:GoToState("idle")
musha_1.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_2 = SpawnPrefab("musha_tallrrrr2")
    musha_2.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_2.sg:GoToState("idle")
musha_2.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_3 = SpawnPrefab("musha_tallrrrr3")
    musha_3.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_3.sg:GoToState("idle")
musha_3.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_4 = SpawnPrefab("musha_tallrrrr4")
    musha_4.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_4.sg:GoToState("idle")
musha_4.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_5 = SpawnPrefab("musha_tallrrrr5")
    musha_5.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_5.sg:GoToState("idle")
musha_5.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_6 = SpawnPrefab("musha_tallrrrr6")
    musha_6.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_6.sg:GoToState("idle")
musha_6.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_7 = SpawnPrefab("musha_tallrrrrice")
    musha_7.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_7.sg:GoToState("idle")
musha_7.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < last then
    local musha_0 = SpawnPrefab("musha_tall4")
    musha_0.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_0.sg:GoToState("idle")
musha_0.components.follower:SetLeader(inst.components.follower.leader)
end

	if inst.components.container then
	inst.components.container:DropEverything() 
end
inst.AnimState:SetBloomEffectHandle( "" )
            die(inst)
    inst:Remove()

    end
local function SetAdult5(inst)
    --print("smallbird - SetAdult")
inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )

   inst.sg:GoToState("growup") -- calls back to SpawnAdult
end


local function SpawnAdult5(inst)
local random = 0.2
local last = 1.0
    if math.random() < random then
    local musha_0 = SpawnPrefab("musha_tall5")
    musha_0.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_0.sg:GoToState("idle")
musha_0.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_7 = SpawnPrefab("musha_tallrrrrrice")
    musha_7.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_7.sg:GoToState("idle")
musha_7.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_1 = SpawnPrefab("musha_tallrrrrr1")
    musha_1.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_1.sg:GoToState("idle")
musha_1.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_2 = SpawnPrefab("musha_tallrrrrr2")
    musha_2.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_2.sg:GoToState("idle")
musha_2.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_3 = SpawnPrefab("musha_tallrrrrr3")
    musha_3.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_3.sg:GoToState("idle")
musha_3.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_4 = SpawnPrefab("musha_tallrrrrr4")
    musha_4.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_4.sg:GoToState("idle")
musha_4.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_5 = SpawnPrefab("musha_tallrrrrr5")
    musha_5.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_5.sg:GoToState("idle")
musha_5.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_6 = SpawnPrefab("musha_tallrrrrr6")
    musha_6.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_6.sg:GoToState("idle")
musha_6.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < random then
    local musha_7 = SpawnPrefab("musha_tallrrrrrice")
    musha_7.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_7.sg:GoToState("idle")
musha_7.components.follower:SetLeader(inst.components.follower.leader)
    elseif math.random() < last then
    local musha_0 = SpawnPrefab("musha_tall5")
    musha_0.Transform:SetPosition(inst.Transform:GetWorldPosition())
    musha_0.sg:GoToState("idle")
musha_0.components.follower:SetLeader(inst.components.follower.leader)
end

	if inst.components.container then
	inst.components.container:DropEverything() 
end
inst.AnimState:SetBloomEffectHandle( "" )
            die(inst)
    inst:Remove()

    end

local function SetAdult6(inst)
    --print("smallbird - SetAdult")
inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )

   inst.sg:GoToState("growup") -- calls back to SpawnAdult
end

local function SpawnAdult6(inst)
	local dark1 = SpawnPrefab("statue_transition")
	local dark2 = SpawnPrefab("statue_transition_2")
	local pos = Vector3(inst.Transform:GetWorldPosition())

    local musha_tall6= SpawnPrefab("musha_egg8")
    musha_tall6.Transform:SetPosition(inst.Transform:GetWorldPosition())
dark1.Transform:SetPosition(pos:Get())
dark2.Transform:SetPosition(pos:Get())
    --musha_tall6.sg:GoToState("idle")

	if inst.components.container then
	inst.components.container:DropEverything() 
end
inst.AnimState:SetBloomEffectHandle( "" )
            die(inst)
    inst:Remove()

    end


	
local function resist(inst, data)
local leader = inst.components.follower.leader
if inst.components.follower.leader and inst.follow then
inst.components.combat:GiveUp()
end 
if inst.components.health:GetPercent() <= 1 and  inst.components.health:GetPercent() > 0.7 then
        inst.components.freezable.wearofftime = 1.5

elseif inst.components.health:GetPercent() <= 0.7 and  inst.components.health:GetPercent() > 0.5 then
        inst.components.freezable.wearofftime = 0.5

elseif inst.components.health:GetPercent() <= 0.5 and  inst.components.health:GetPercent() > 0.2 then
        inst.components.freezable.wearofftime = 0.25

elseif inst.components.health:GetPercent() <= 0.2 then
        inst.components.freezable.wearofftime = 0
end end


local function on_sleep(inst, data)
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 9, {"monster"})
for k,v in pairs(ents) do
inst.components.sleeper:WakeUp() 
if inst.sleepn then
	 	inst.components.talker:Say("[Sleepy..]\nHungry-rate(0))\n")
		inst.sleepn = false		
    inst.components.hunger:SetRate(0)
end end end

local function updatestats(inst, data)

	if inst.components.health:GetPercent() >= .5 and not inst.iceyamche and not inst.open then

    			inst.components.health:StartRegen(1, 10)
    inst:RemoveEventCallback("attacked", Onfreeze)
    inst.components.combat:SetAttackPeriod(0.9)

		elseif inst.components.health:GetPercent() >= .5 and inst.iceyamche and not inst.open then
    			inst.components.health:StartRegen(1, 10)
    
    inst.components.combat:SetAttackPeriod(0.9)

		elseif inst.components.health:GetPercent() < .5 and not inst.iceyamche and not inst.open then
    			inst.components.health:StartRegen(1, 1)

    inst:ListenForEvent("attacked", Onfreeze)

    inst.components.combat:SetAttackPeriod(2)
	
		elseif inst.components.health:GetPercent() < .5 and inst.iceyamche and not inst.open then
    			inst.components.health:StartRegen(1, 1)
	    
    inst.components.combat:SetAttackPeriod(2)
end
end
 
local function Take_order(inst)
local item_max = 20
local itemstack_1 = inst.components.inventory:FindItem(function(item) return item.prefab == "goldnugget" end )
local itemstack_2 = inst.components.inventory:FindItem(function(item) return item.prefab == "rocks" end )
local itemstack_3 = inst.components.inventory:FindItem(function(item) return item.prefab == "nitre" end )
local itemstack_4 = inst.components.inventory:FindItem(function(item) return item.prefab =="flint" end)
local itemstack_5 = inst.components.inventory:FindItem(function(item) return item.prefab =="log" end)
local itemstack_6 = inst.components.inventory:FindItem(function(item) return item.prefab =="cutgrass" end)
local itemstack_7 = inst.components.inventory:FindItem(function(item) return item.prefab =="twigs" end)
local itemstack_8 = inst.components.inventory:FindItem(function(item) return item.prefab =="monstermeat" end)
local itemstack_9 = inst.components.inventory:FindItem(function(item) return item.prefab =="spidergland" end)
local itemstack_10 = inst.components.inventory:FindItem(function(item) return item.prefab =="silk" end)
local itemstack_11 = inst.components.inventory:FindItem(function(item) return item.prefab =="seeds" end)
local itemstack_12 = inst.components.inventory:FindItem(function(item) return item.prefab =="charcoal" end)
local itemstack_13 = inst.components.inventory:FindItem(function(item) return item.prefab =="poop" end)
local itemstack_14 = inst.components.inventory:FindItem(function(item) return item.prefab =="beefalowool" end)
local itemstack_15 = inst.components.inventory:FindItem(function(item) return item.prefab =="bird_egg" end)
if inst.pick1 then
inst.droping = false	
if itemstack_1 and itemstack_1.components.stackable.stacksize >= item_max then
inst.item_max_1 = true
inst.components.hunger:SetRate(45/TUNING.TEENBIRD_STARVE_TIME)
if not inst.item_1 then 
inst.sg:GoToState("command")
inst.components.talker:Say("Collect:[Rock]\n[Max]")
inst.item_1 = true
end end
if itemstack_2 and itemstack_2.components.stackable.stacksize >= item_max then
inst.item_max_2 = true
if not inst.item_2 then 
inst.sg:GoToState("command")
inst.components.talker:Say("Collect:[Flint]\n[Max]")
inst.item_2 = true
end end
if itemstack_3 and itemstack_3.components.stackable.stacksize >= item_max then
inst.item_max_3 = true
if not inst.item_3 then 
inst.sg:GoToState("command")
inst.components.talker:Say("Collect:[Nitre]\n[Max]")
inst.item_3 = true
end end
if itemstack_4 and itemstack_4.components.stackable.stacksize >= item_max then
inst.item_max_4 = true
if not inst.item_4 then 
inst.sg:GoToState("command")
inst.components.talker:Say("Collect:[Gold]\n[Max]")
inst.item_4 = true
end end
if itemstack_5 and itemstack_5.components.stackable.stacksize >= item_max then
inst.item_max_5 = true
if not inst.item_5 then 
inst.sg:GoToState("command")
inst.components.talker:Say("Collect:[Wood]\n[Max]")
inst.item_5 = true
end end
if itemstack_6 and itemstack_6.components.stackable.stacksize >= item_max then
inst.item_max_6 = true
if not inst.item_6 then 
inst.sg:GoToState("command")
inst.components.talker:Say("Collect:[Grass]\n[Max]")
inst.item_6 = true
end end
if itemstack_7 and itemstack_7.components.stackable.stacksize >= item_max then
inst.item_max_7 = true
if not inst.item_7 then 
inst.sg:GoToState("command")
inst.components.talker:Say("Collect:[Twigs]\n[Max]")
inst.item_7 = true
end end
if itemstack_8 and itemstack_8.components.stackable.stacksize >= item_max then
inst.item_max_8 = true
if not inst.item_8 then 
inst.sg:GoToState("command")
inst.components.talker:Say("Collect:[Monster meat]\n[Max]")
inst.item_8 = true
end end
if itemstack_9 and itemstack_9.components.stackable.stacksize >= item_max then
inst.item_max_9 = true
if not inst.item_9 then 
inst.sg:GoToState("command")
inst.components.talker:Say("Collect:[Spider gland]\n[Max]")
inst.item_9 = true
end end
if itemstack_10 and itemstack_10.components.stackable.stacksize >= item_max then
inst.item_max_10 = true
if not inst.item_10 then 
inst.sg:GoToState("command")
inst.components.talker:Say("Collect:[Silk]\n[Max]")
inst.item_10 = true
end end
if itemstack_11 and itemstack_11.components.stackable.stacksize >= item_max then
inst.item_max_11 = true
if not inst.item_11 then 
inst.sg:GoToState("command")
inst.components.talker:Say("Collect:[acorn]\n[Max]")
inst.item_11 = true
end end
if itemstack_12 and itemstack_12.components.stackable.stacksize >= item_max then
inst.item_max_12 = true
if not inst.item_12 then 
inst.sg:GoToState("command")
inst.components.talker:Say("Collect:[charcoal]\n[Max]")
inst.item_12 = true
end end 
if itemstack_13 and itemstack_13.components.stackable.stacksize >= item_max then
inst.item_max_13 = true
if not inst.item_13 then 
inst.sg:GoToState("command")
inst.components.talker:Say("Collect:[Poop]\n[Max]")
inst.item_13 = true
end end
if itemstack_14 and itemstack_14.components.stackable.stacksize >= item_max then
inst.item_max_14 = true
if not inst.item_14 then 
inst.sg:GoToState("command")
inst.components.talker:Say("Collect:[beefalo wool]\n[Max]")
inst.item_14 = true
end end
if itemstack_15 and itemstack_15.components.stackable.stacksize >= item_max then
inst.item_max_15 = true
if not inst.item_15 then 
inst.sg:GoToState("command")
inst.components.talker:Say("Collect:[egg]\n[Max]")
inst.item_15 = true
end end
end 
if inst.working_food then
inst.droping = false	
inst.components.hunger:SetRate(90/TUNING.TEENBIRD_STARVE_TIME)
end
if not inst.hat and inst.drop then
inst.components.hunger:SetRate(15/TUNING.TEENBIRD_STARVE_TIME)
	inst.components.inventory:DropEverything(true)
inst.item_max_1 = false
inst.item_max_2 = false
inst.item_max_3 = false
inst.item_max_4 = false
inst.item_max_5 = false
inst.item_max_6 = false
inst.item_max_7 = false
inst.item_max_8 = false
inst.item_max_9 = false
inst.item_max_10 = false
inst.item_max_11 = false
inst.item_max_12 = false
inst.item_max_13 = false
inst.item_1 = false inst.item_2 = false
inst.item_3 = false inst.item_4 = false
inst.item_5 = false inst.item_6 = false
inst.item_7 = false inst.item_8 = false
inst.item_9 = false inst.item_10 = false
inst.item_11 = false inst.item_12 = false
inst.item_13 = false
if not inst.droping then
inst.sg:GoToState("taunt")
--inst.components.talker:Say("[Drop all collected items]")
SpawnPrefab("small_puff").Transform:SetPosition(inst:GetPosition():Get())
inst.droping = true
end	end end

	
local function GetPeepChance(inst)
    local peep_percent = 0
   if inst.components.hunger:IsStarving() then
            peep_percent = 0.5
	inst.components.talker:Say("[foooood!]")
	elseif inst.components.hunger:GetPercent() <= .1 then
            peep_percent = 0.5
	inst.components.talker:Say("[foo! foood]")
    elseif inst.components.hunger:GetPercent() < .5 then
	inst.components.talker:Say("[fo fo]")
		 peep_percent = 0.25
       end
    return peep_percent
end

local function GetCryChance(inst, data)
local cry_percent = 0
local leader = inst.components.follower.leader
if inst.components.follower:IsNearLeader(CRY_NEAR_LEADER_DISTANCE) then
        if inst.components.health:GetPercent() < .15 then
            cry_percent = 0.5
	inst.components.talker:Say("Kkuure!")
	        leader.components.health:DoDelta(50)
			           inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
		SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
	end
if leader.components.health:GetPercent() <= 0.7 and inst.components.hunger:GetPercent() >= .9 then
            cry_percent = 0.05
	    leader.components.health:DoDelta(15)
        leader.components.sanity:DoDelta(2)
        inst.components.health:DoDelta(20)
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
		SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
		SpawnPrefab("sparks").Transform:SetPosition(leader:GetPosition():Get())
		if not inst.doctor then
		inst.components.hunger:DoDelta(-5)
		inst.components.talker:Say("Ccuure!!!\n[Hunger] Cost:-5")
		elseif inst.doctor then
		inst.components.talker:Say("Ccuure!!!\n[Green Yamche]\nCost: 0")
		end
elseif leader.components.health:GetPercent() <= 0.6 and inst.components.hunger:GetPercent() >= .7 then
            cry_percent = 0.1
        leader.components.health:DoDelta(15)
        leader.components.sanity:DoDelta(2)
        inst.components.health:DoDelta(20)
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
		SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
		SpawnPrefab("sparks").Transform:SetPosition(leader:GetPosition():Get())
				if not inst.doctor then
		inst.components.hunger:DoDelta(-5)
		inst.components.talker:Say("Ccuure!!!\n[Hunger] Cost:-5")
		elseif inst.doctor then
		inst.components.talker:Say("Ccuure!!!\n[Green Yamche]\nCost: 0")
		end
elseif leader.components.health:GetPercent() <= 0.5 and inst.components.hunger.current >= 30 then
            cry_percent = 0.4
        leader.components.health:DoDelta(15)
        leader.components.sanity:DoDelta(2)
        inst.components.health:DoDelta(20)
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
		SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
		SpawnPrefab("sparks").Transform:SetPosition(leader:GetPosition():Get())
				if not inst.doctor then
		inst.components.hunger:DoDelta(-5)
		inst.components.talker:Say("Ccuure!!!\n[Hunger] Cost:-5")
		elseif inst.doctor then
		inst.components.talker:Say("Ccuure!!!\n[Green Yamche]\nCost: 0")
		end
elseif leader.components.health:GetPercent() <= 0.2 and inst.components.hunger.current >= 20 then
            cry_percent = 0.6
        leader.components.health:DoDelta(15)
        leader.components.sanity:DoDelta(2)
        inst.components.health:DoDelta(20)
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
		SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
		SpawnPrefab("sparks").Transform:SetPosition(leader:GetPosition():Get())
				if not inst.doctor then
		inst.components.hunger:DoDelta(-5)
		inst.components.talker:Say("Ccuure!!!\n[Hunger] Cost:-5")
		elseif inst.doctor then
		inst.components.talker:Say("Ccuure!!!\n[Green Yamche]\nCost: 0")
		end
elseif leader.components.health:GetPercent() <= 0.1 and inst.components.hunger:GetPercent() >= 10 then
            cry_percent = 1
        leader.components.health:DoDelta(15)
        leader.components.sanity:DoDelta(2)
        inst.components.health:DoDelta(20)
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
		SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
		SpawnPrefab("sparks").Transform:SetPosition(leader:GetPosition():Get())	
				if not inst.doctor then
		inst.components.hunger:DoDelta(-5)
		inst.components.talker:Say("Ccuure!!!\n[Hunger] Cost:-5")
		elseif inst.doctor then
		inst.components.talker:Say("Ccuure!!!\n[Green Yamche]\nCost: 0")
		end
elseif leader.components.health:GetPercent() <= 5 and inst.doctor then
            cry_percent = 0.5
        leader.components.health:DoDelta(15)
        leader.components.sanity:DoDelta(2)
        inst.components.health:DoDelta(20)
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
		SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
		SpawnPrefab("sparks").Transform:SetPosition(leader:GetPosition():Get())	
		inst.components.talker:Say("Ccuure!!!\n[Green Yamche]\nCost: 0")
				
    end end
    return cry_percent
	end 
--[[    local cry_percent = 0
	local player = ThePlayer
if inst.components.follower:IsNearLeader(CRY_NEAR_LEADER_DISTANCE) then

if not inst:HasTag("fightn") and inst.components.hunger:GetPercent() > .2 and player.components.health:GetPercent() <= .2 then
            cry_percent = .05
	inst.components.talker:Say("Ccuure!!!\n[Hunger] Cost:-5")
        player.components.health:DoDelta(20)
        player.components.sanity:DoDelta(2)
        inst.components.health:DoDelta(5)
        inst.components.hunger:DoDelta(-20)
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
        local fx = SpawnPrefab("sparklefx")
        local fx2 = SpawnPrefab("sparklefx")
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(1, 2, 1)
        fx.Transform:SetPosition(0.3, 0, 0)
        fx2.entity:SetParent(player.entity)
	fx2.Transform:SetScale(1, 2, 1)
        fx2.Transform:SetPosition(0.3, 0, 0)
		
elseif not inst:HasTag("fightn") and inst.components.hunger:GetPercent() > .3 and player.components.health:GetPercent() > .2 and player.components.health:GetPercent() <= .3 then
            cry_percent = .04
	inst.components.talker:Say("Ccuure!!")
        player.components.health:DoDelta(10)
        player.components.sanity:DoDelta(2)
        inst.components.health:DoDelta(5)
        inst.components.hunger:DoDelta(-10)
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
        local fx = SpawnPrefab("sparklefx")
        local fx2 = SpawnPrefab("sparklefx")
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(1, 2, 1)
        fx.Transform:SetPosition(0.3, 0, 0)
        fx2.entity:SetParent(player.entity)
	fx2.Transform:SetScale(1, 2, 1)
        fx2.Transform:SetPosition(0.3, 0, 0)

		
elseif not inst:HasTag("fightn") and inst.components.hunger:GetPercent() > .5 and player.components.health:GetPercent() > .3 and player.components.health:GetPercent() <= .5 then
            cry_percent = .01
	inst.components.talker:Say("Ccuure!")
        player.components.health:DoDelta(5)
        player.components.sanity:DoDelta(2)
        inst.components.health:DoDelta(5)
        inst.components.hunger:DoDelta(-5)
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
        local fx = SpawnPrefab("sparklefx")
        local fx2 = SpawnPrefab("sparklefx")
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(1, 2, 1)
        fx.Transform:SetPosition(0.3, 0, 0)
        fx2.entity:SetParent(player.entity)
	fx2.Transform:SetScale(1, 2, 1)
        fx2.Transform:SetPosition(0.3, 0, 0)	

elseif inst:HasTag("fightn") and inst.components.hunger:GetPercent() > .2 and player.components.health:GetPercent() <= .2 then
            cry_percent = 1
	inst.components.talker:Say("Ccuure!!!\n[Hunger] Cost:-5")
        player.components.health:DoDelta(20)
        player.components.sanity:DoDelta(2)
        inst.components.health:DoDelta(5)
        inst.components.hunger:DoDelta(-20)
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
        local fx = SpawnPrefab("sparklefx")
        local fx2 = SpawnPrefab("sparklefx")
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(1, 2, 1)
        fx.Transform:SetPosition(0.3, 0, 0)
        fx2.entity:SetParent(player.entity)
	fx2.Transform:SetScale(1, 2, 1)
        fx2.Transform:SetPosition(0.3, 0, 0)
		
elseif inst:HasTag("fightn") and inst.components.hunger:GetPercent() > .3 and player.components.health:GetPercent() > .2 and player.components.health:GetPercent() <= .5 then
            cry_percent = .95
	inst.components.talker:Say("Ccuure!!")
        player.components.health:DoDelta(10)
        player.components.sanity:DoDelta(2)
        inst.components.health:DoDelta(5)
        inst.components.hunger:DoDelta(-10)
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
        local fx = SpawnPrefab("sparklefx")
        local fx2 = SpawnPrefab("sparklefx")
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(1, 2, 1)
        fx.Transform:SetPosition(0.3, 0, 0)
        fx2.entity:SetParent(player.entity)
	fx2.Transform:SetScale(1, 2, 1)
        fx2.Transform:SetPosition(0.3, 0, 0)

		
elseif inst:HasTag("fightn") and inst.components.hunger:GetPercent() > .5 and player.components.health:GetPercent() > .5 and player.components.health:GetPercent() <= .8 then
            cry_percent = .9
	inst.components.talker:Say("Ccuure!")
        player.components.health:DoDelta(5)
        player.components.sanity:DoDelta(2)
        inst.components.health:DoDelta(5)
        inst.components.hunger:DoDelta(-5)
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
        local fx = SpawnPrefab("sparklefx")
        local fx2 = SpawnPrefab("sparklefx")
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(1, 2, 1)
        fx.Transform:SetPosition(0.3, 0, 0)
        fx2.entity:SetParent(player.entity)
	fx2.Transform:SetScale(1, 2, 1)
        fx2.Transform:SetPosition(0.3, 0, 0)	
	
elseif inst:HasTag("fightn") and inst.components.hunger:GetPercent() > .8 and player.components.health:GetPercent() > .8 and player.components.health:GetPercent() < 1 then
            cry_percent = .5
	inst.components.talker:Say("Ccuure!")
        player.components.health:DoDelta(5)
        player.components.sanity:DoDelta(2)
        inst.components.health:DoDelta(5)
        inst.components.hunger:DoDelta(-5)
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
        local fx = SpawnPrefab("sparklefx")
        local fx2 = SpawnPrefab("sparklefx")
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(1, 2, 1)
        fx.Transform:SetPosition(0.3, 0, 0)
        fx2.entity:SetParent(player.entity)
	fx2.Transform:SetScale(1, 2, 1)
        fx2.Transform:SetPosition(0.3, 0, 0)		
		
		elseif inst:HasTag("fightn") and inst.components.hunger:GetPercent() > .2 and inst.components.health:GetPercent() < .3 then
            cry_percent = .9
	inst.components.talker:Say("Kkuure!")
        --player.components.health:DoDelta(5)
        --player.components.sanity:DoDelta(2)
        inst.components.health:DoDelta(30)
        inst.components.hunger:DoDelta(-5)
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
        local fx = SpawnPrefab("sparklefx")
        fx.entity:SetParent(inst.entity)
	fx.Transform:SetScale(1, 2, 1)
        fx.Transform:SetPosition(0.3, 0, 0)
   			
    end
    end
    return cry_percent
end]]

--time
--(lv2)
local function GetTeenGrowTime(inst)
	return 1
end
--(lv3)
local function GetTallGrowTime(inst)
	return 1
	--return 1400
end
--(lv4)
local function GetTall2GrowTime(inst)
	return 1
	--return 2200
end
--(lv5)
local function GetTall3GrowTime(inst)
	return 1
	--return 3000
end
--(lv6)
local function GetTall4GrowTime(inst)
	return 1
	--return 3800
end
--(lv7)
local function GetTall5GrowTime(inst)
	return 1
	--return 4600
end
--(RP)
local function GetTall6GrowTime(inst)
	return 1
	--return 4600
end

--[[
local function GetTallGrowTime(inst)
	return TUNING.TEENBIRD_GROW_TIME
end
]]--
local function OnHealthDelta(inst, data)
    if data.cause == "hunger" and data.newpercent < 0.1 and inst.components.follower.leader then
        --print("teenbird - STARVING i'm blowing this popsicle stand!", data.newpercent)

        if inst.components.combat.target == inst.components.follower.leader then
            inst.components.combat:SetTarget(nil)
        end

        inst.components.follower:SetLeader(nil)
    end
end

local function create_base(inst, physicscylinder)

    inst:AddTag("animal")
    inst:AddTag("yamche")
    inst:AddTag("yamcheb")
    inst:AddTag("companion")
    inst:AddTag("character")
    inst:AddTag("musha_small")
    inst:AddTag("scarytoprey")
    inst:AddTag("noauradamage")
	inst:AddTag("peck_attack")
	inst:AddTag("notraptrigger")
	inst:AddTag("trader")

	 inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "musha_small.tex" )
	inst.MiniMapEntity:SetPriority(10)
	inst.MiniMapEntity:SetCanUseCache(false)
	inst.MiniMapEntity:SetDrawOverFogOfWar(true)
   
	--inst.MiniMapEntity:SetIcon( "musha_small.tex" )
	--inst.MiniMapEntity:SetIcon( "musha_teen.tex" )

	inst.entity:AddSoundEmitter()
	inst.entity:AddDynamicShadow()

	MakeCharacterPhysics(inst, 20, .25)
	
    inst.Physics:SetCollisionGroup(COLLISION.CHARACTERS)
    inst.Physics:ClearCollisionMask()
    inst.Physics:CollidesWith(COLLISION.WORLD)
    inst.Physics:CollidesWith(COLLISION.OBSTACLES)
    inst.Physics:CollidesWith(COLLISION.CHARACTERS)
    if physicscylinder then
        inst.Physics:SetCylinder(.5, 1)
    end

    inst.Transform:SetFourFaced()
		
   inst.entity:AddLight()
	inst.Light:SetRadius(4)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.5)
    inst.Light:SetColour(180/255,180/255,180/255)
	
	    inst:AddComponent("talker")
    inst.components.talker.fontsize = 22
    inst.components.talker.colour = Vector3(1, 0.85, 0.75, 1)
-------
	
		   inst:AddComponent("trader")
    inst.components.trader:SetAcceptTest(ShouldAcceptItem)
    inst.components.trader.onaccept = OnGetItemFromPlayer
    inst.components.trader.onrefuse = OnRefuseItem
	

    inst:AddComponent("eater")
    inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI } )
	inst.components.eater.strongstomach = true
   -- inst.components.eater:SetCanEatRaw()
    inst.components.eater:SetOnEatFn(OnEat)
	 
     inst:AddComponent("machine")
    inst.components.machine.turnonfn = onuseyamche
    inst.components.machine.turnofffn = offuseyamche
    inst.components.machine.cooldowntime = 0
		
	inst.Light:Enable(false)
	inst.light_on = false
	inst.UpdatePositionYamche = UpdatePositionYamche		
  
end
local function create_common(inst)
    --print("smallbird - create_common")
	--inst = inst or CreateEntity()

	inst:SetBrain(brain)	

    inst.userfunctions = 
    {
        FollowPlayer = FollowPlayer,
        GetPeepChance = GetPeepChance,
        GetCryChance = GetCryChance,
        SpawnTeen = SpawnTeen,
        SpawnAdult = SpawnAdult,
        SpawnAdult2 = SpawnAdult2,
        SpawnAdult3 = SpawnAdult3,
        SpawnAdult4 = SpawnAdult4,
        SpawnAdult5 = SpawnAdult5,
        SpawnAdult6 = SpawnAdult6,

	updatestats = updatestats
    }
    --("   order")
--
---name
--
    inst:AddComponent("named")
    inst.components.named.possiblenames = STRINGS.PHOENIXS
    inst.components.named:PickNewName()

    inst:AddComponent("sanityaura")
    inst.components.sanityaura.aurafn = PhoenixSanityAura

--------------------
        inst:AddComponent("playerprox")
    inst.components.playerprox:SetDist(6, 7)
    inst.components.playerprox:SetOnPlayerNear(on_close)
    inst.components.playerprox:SetOnPlayerFar(on_far)

    ------------------------------------------
    inst:AddComponent("health")
	inst.components.health.fire_damage_scale = 0
	inst.components.health.canmurder = false
inst.components.health:SetAbsorptionAmount(0.5)

    inst:AddComponent("hunger")

inst.components.hunger:SetRate(15/TUNING.TEENBIRD_STARVE_TIME)

    inst:AddComponent("combat")
    
    inst.components.combat.playerdamagepercent = 0
	inst:ListenForEvent("attacked", OnAttacked)
---    inst:ListenForEvent("attacked", OnFire)
        inst.procfn = function() tryproc(inst) end
        inst:ListenForEvent("attacked", inst.procfn)
--inst.updatetask = inst:DoPeriodicTask(0.5, yamche_flower, 1)

inst:ListenForEvent("hungerdelta", BattleCommand)
inst:ListenForEvent("hungerdelta", Checklevel)
inst:ListenForEvent("healthdelta", resist)
inst:ListenForEvent("hungerdelta", ystarve)
inst:ListenForEvent("hungerdelta", on_sleep)
inst:ListenForEvent("attacked", on_Lshield_1)
  
    inst:ListenForEvent("onhitother", OnHitfire)
    inst:ListenForEvent("onhitother", OnHitfreeze)
    inst:ListenForEvent("onhitother", OnHitvampire)
    inst:ListenForEvent("onhitother", OnRanger)
	inst:ListenForEvent("onhitother", hit_Ranger)
	inst:ListenForEvent("healthdelta", continue_Ranger)
	inst:ListenForEvent("hungerdelta", Power_check)
	inst:ListenForEvent("onhitother", OnPower)
 inst:ListenForEvent("death", ondeath)
	   
    inst.Take_order = inst:DoPeriodicTask(0.25, Take_order)   
	
	 inst:AddComponent("inventory")
	 
	 inst.components.inventory.maxslots = 30
   inst:AddComponent("inspectable") 
    inst.components.inspectable.getstatus = GetStatus
	inst:AddComponent("thief")


    inst:AddComponent("locomotor") -- locomotor must be constructed before the stategraph
    inst.components.locomotor.walkspeed = 8
     
    inst:AddComponent("follower")
	--inst:AddComponent("leader")

    inst:AddComponent("lootdropper")

      inst:AddComponent("sleeper")
    inst.components.sleeper:SetResistance(20)
    inst.components.sleeper.testperiod = GetRandomWithVariance(8, 4)
    inst.components.sleeper:SetSleepTest(ShouldSleep)
    inst.components.sleeper:SetWakeTest(ShouldWakeUp)
    inst:AddComponent("freezable")
    inst.components.freezable:SetResistance(8)

    inst:AddComponent("periodicspawner")
    inst.components.periodicspawner:SetPrefab("glowdust")
    inst.components.periodicspawner:SetRandomTimes(180, 600)
    inst.components.periodicspawner:SetDensityInRange(20, 2)
    inst.components.periodicspawner:SetMinimumSpacing(4)
    inst.components.periodicspawner:Start()
 
    inst:AddComponent("heater")
    inst.components.heater.heat = 0
	
inst:ListenForEvent( "healthdelta", updatestats)

	inst.level = 0
    --inst:ListenForEvent("entity_death", function(wrld, data) onkilll(inst, data) end, GetWorld())
	inst:ListenForEvent("killed", onkilll)
inst:ListenForEvent("levelup", levelexp)
	inst.OnSave = onsave
	inst.OnPreLoad = onpreload
	
	inst:DoPeriodicTask(0.1, function() inst:UpdatePositionYamche() end)
    return inst
end
local function create_chester(inst)
	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chester")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
   return inst
end
-----------start create birds grow

local function create_smallbird()
    --print("smallbird - create_smallbird")

	local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()
    inst.entity:AddMiniMapEntity()
	--inst.MiniMapEntity:SetIcon( "musha_small.tex" )

    MakeInventoryPhysics(inst, 1,1)
    create_base(inst)
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_small")
    inst.AnimState:PlayAnimation("idle")
	------------------------
    --inst.entity:AddLight()
	--inst.Light:SetRadius(.3)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(10/255,125/255,125/255)
	-----inst.Light:Enable(true)
-----------------------
	 
   if not TheWorld.ismastersim then
        return inst
    end
	inst.entity:SetPristine()
	
	--[[if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche0")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche0")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose]]
-------------------------------------
    --create_base(inst)
    --inst:AddTag("musha_small")
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_small.xml"
    inst.components.inventoryitem:SetOnDroppedFn(OnDropped)
    inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)
   -- inst.components.inventoryitem.cangoincontainer = false

-----------------------------equip--hat

   --inst:AddTag("light")
   inst.level1 = true
	inst.doctor = true
 
	inst:AddComponent("equippable")
    inst:AddComponent("insulator")
    inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.insulator.insulation = TUNING.INSULATION_LARGE

    inst.components.equippable:SetOnEquip(onyamche)
    inst.components.equippable:SetOnUnequip(offyamche)
    inst.components.equippable.walkspeedmult = 1.25
    inst.components.equippable.runspeedmult = 1.25

    create_common(inst)

    inst:SetStateGraph("SGmusha_small")
    inst.Transform:SetScale(0.4, 0.4, 0.4)

	inst.DynamicShadow:SetSize( 0.8, .3 )
    --MakeSmallBurnableCharacter(inst, "head")
    MakeMediumBurnableCharacter(inst, "pig_torso")

        inst.components.burnable:SetBurnTime(1)

    --MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(100)

    inst.components.hunger:SetMax(30)
 
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(TUNING.SMALLBIRD_DAMAGE)

    inst.components.lootdropper:SetLoot({"glowdust"})

   
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP", }

    local growth_stages = {
        {name="small", time = GetTeenGrowTime, fn = function() end },
        {name="tall", fn = SetTeen}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_smallbird END")
	return inst
end

-----musha_teen
local function create_teen_smallbird()
    --print("smallbird - create_teen_smallbird")

    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "musha_small" )
--[[
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_small.xml"
    inst.components.inventoryitem:SetOnDroppedFn(OnDropped)
    inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)
]]--
    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_1)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_1
    inst.components.container.widgetanimbank = "ui_chest_3x2"
    inst.components.container.widgetanimbuild = "ui_chest_yamche0"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]

    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_teen")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")


-------------------------------------
    create_base(inst)

    --inst.entity:AddLight()
	--inst.Light:SetRadius(.6)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(15/255,125/255,125/255)
	--inst.Light:Enable(true)
	
		inst.entity:SetPristine()

  	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche0")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche0")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
   	
-----------------------
    
 
-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_teen")
   inst.baby = false
inst.level1 = false
inst.level2 = true
inst.iceyamche = false
--inst:RemoveTag("fridge")

    inst:SetStateGraph("SGmusha_teen")


    inst.Transform:SetScale(0.5, 0.5, 0.5)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 0.9, .4 )
    --MakeSmallBurnableCharacter(inst, "head")
    MakeMediumBurnableCharacter(inst, "pig_torso")

    inst.components.burnable:SetBurnTime(1)
  --  MakeSmallPropagator(inst)
    MakeMediumFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(200)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(60)
   -- inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER/TUNING.TEENBIRD_STARVE_TIME)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(15)

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})

    
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall", time = GetTallGrowTime, fn = function() end },
        {name="adult", fn = SetAdult}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end
-------------

-----musha_teenr1
local function create_teenr1_smallbird()
    --print("smallbird - create_teen_smallbird")

   local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "musha_small" )
--[[
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_small.xml"
    inst.components.inventoryitem:SetOnDroppedFn(OnDropped)
    inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)
]]--

    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_1)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_1
    inst.components.container.widgetanimbank = "ui_chest_3x2"
    inst.components.container.widgetanimbuild = "ui_chest_yamche0"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]

    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_small")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")


-------------------------------------
    create_base(inst)

    --inst.entity:AddLight()
	--inst.Light:SetRadius(.6)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(15/255,125/255,125/255)
	--inst.Light:Enable(true)
	
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche0")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche0")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    inst.doctor = true
    -----------------------
  
    create_common(inst)
	
    --inst:AddTag("musha_teen")
   inst.baby = false
inst.level1 = false
inst.level2 = true
inst.iceyamche = false
--inst:RemoveTag("fridge")

    inst:SetStateGraph("SGmusha_teen")


    inst.Transform:SetScale(0.5, 0.5, 0.5)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 0.9, .4 )
    --MakeSmallBurnableCharacter(inst, "head")
    MakeMediumBurnableCharacter(inst, "pig_torso")

    inst.components.burnable:SetBurnTime(1)
  --  MakeSmallPropagator(inst)
    MakeMediumFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(200)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(60)
   -- inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER/TUNING.TEENBIRD_STARVE_TIME)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(15)

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})

    
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall", time = GetTallGrowTime, fn = function() end },
        {name="adult", fn = SetAdult}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end


-----musha_teenr2
local function create_teenr2_smallbird()
    --print("smallbird - create_teen_smallbird")

  local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "musha_small" )
--[[
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_small.xml"
    inst.components.inventoryitem:SetOnDroppedFn(OnDropped)
    inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)
]]--

    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_1)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_1
    inst.components.container.widgetanimbank = "ui_chest_3x2"
    inst.components.container.widgetanimbuild = "ui_chest_yamche0"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]

    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")


-------------------------------------
    create_base(inst)

    --inst.entity:AddLight()
	--inst.Light:SetRadius(.6)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(15/255,125/255,125/255)
	--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche0")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche0")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
 
-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_teen")
   inst.baby = false
inst.level1 = false
inst.level2 = true
inst.iceyamche = false
--inst:RemoveTag("fridge")

    inst:SetStateGraph("SGmusha_teen")


    inst.Transform:SetScale(0.5, 0.5, 0.5)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 0.9, .4 )
    --MakeSmallBurnableCharacter(inst, "head")
    MakeMediumBurnableCharacter(inst, "pig_torso")

    inst.components.burnable:SetBurnTime(1)
  --  MakeSmallPropagator(inst)
    MakeMediumFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(200)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(60)
   -- inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER/TUNING.TEENBIRD_STARVE_TIME)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(15)

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})

    
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall", time = GetTallGrowTime, fn = function() end },
        {name="adult", fn = SetAdult}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end


-----musha_teenr3
local function create_teenr3_smallbird()
    --print("smallbird - create_teen_smallbird")

    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "musha_small" )
--[[
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_small.xml"
    inst.components.inventoryitem:SetOnDroppedFn(OnDropped)
    inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)
]]--

    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_1)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_1
    inst.components.container.widgetanimbank = "ui_chest_3x2"
    inst.components.container.widgetanimbuild = "ui_chest_yamche0"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]

    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall2")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")


-------------------------------------
    create_base(inst)

    --inst.entity:AddLight()
	--inst.Light:SetRadius(.6)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(15/255,125/255,125/255)
	--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche0")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche0")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
    -----------------------
 

    create_common(inst)
	
    --inst:AddTag("musha_teen")
   inst.baby = false
inst.level1 = false
inst.level2 = true
inst.iceyamche = false
--inst:RemoveTag("fridge")

    inst:SetStateGraph("SGmusha_teen")


    inst.Transform:SetScale(0.5, 0.5, 0.5)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 0.9, .4 )
    --MakeSmallBurnableCharacter(inst, "head")
    MakeMediumBurnableCharacter(inst, "pig_torso")

    inst.components.burnable:SetBurnTime(1)
  --  MakeSmallPropagator(inst)
    MakeMediumFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(200)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(60)
   -- inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER/TUNING.TEENBIRD_STARVE_TIME)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(15)

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})

    
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall", time = GetTallGrowTime, fn = function() end },
        {name="adult", fn = SetAdult}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end


-----musha_teenr4
local function create_teenr4_smallbird()
    --print("smallbird - create_teen_smallbird")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "musha_small" )
--[[
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_small.xml"
    inst.components.inventoryitem:SetOnDroppedFn(OnDropped)
    inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)
]]--

    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_1)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_1
    inst.components.container.widgetanimbank = "ui_chest_3x2"
    inst.components.container.widgetanimbuild = "ui_chest_yamche0"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]

    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall3")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")


-------------------------------------
    create_base(inst)

    --inst.entity:AddLight()
	--inst.Light:SetRadius(.6)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(15/255,125/255,125/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche0")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche0")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
 
-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_teen")
   inst.baby = false
inst.level1 = false
inst.level2 = true
inst.iceyamche = false
--inst:RemoveTag("fridge")

    inst:SetStateGraph("SGmusha_teen")


    inst.Transform:SetScale(0.5, 0.5, 0.5)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 0.9, .4 )
    --MakeSmallBurnableCharacter(inst, "head")
    MakeMediumBurnableCharacter(inst, "pig_torso")

    inst.components.burnable:SetBurnTime(1)
  --  MakeSmallPropagator(inst)
    MakeMediumFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(200)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(60)
   -- inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER/TUNING.TEENBIRD_STARVE_TIME)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(15)

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})

    
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall", time = GetTallGrowTime, fn = function() end },
        {name="adult", fn = SetAdult}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end

-----musha_teenr5
local function create_teenice_smallbird()
    --print("smallbird - create_teen_smallbird")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "musha_small" )
--[[
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_small.xml"
    inst.components.inventoryitem:SetOnDroppedFn(OnDropped)
    inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)
]]--

    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_1)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_1
    inst.components.container.widgetanimbank = "ui_chest_3x2"
    inst.components.container.widgetanimbuild = "ui_chest_yamche0"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]

    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_ice")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")


-------------------------------------
    create_base(inst)

    --inst.entity:AddLight()
	--inst.Light:SetRadius(.6)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(15/255,125/255,125/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche0")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche0")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
 
-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_teen")
   inst.baby = false
inst.level1 = false
inst.level2 = true
inst.iceyamche = true
inst:AddTag("fridge")
inst:ListenForEvent("attacked", Onfreeze)
    inst:SetStateGraph("SGmusha_teen")


    inst.Transform:SetScale(0.5, 0.5, 0.5)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 0.9, .4 )
    --MakeSmallBurnableCharacter(inst, "head")
    MakeMediumBurnableCharacter(inst, "pig_torso")

    inst.components.burnable:SetBurnTime(1)
  --  MakeSmallPropagator(inst)
    MakeMediumFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(200)
 

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(60)
   -- inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER/TUNING.TEENBIRD_STARVE_TIME)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(15)

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})

    
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall", time = GetTallGrowTime, fn = function() end },
        {name="adult", fn = SetAdult}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end




-----musha tall

local function create_tall_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "musha_tall.tex" )

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")


-------------------------------------
    create_base(inst)


--[[
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall.xml"
    inst.components.inventoryitem:SetOnDroppedFn(OnDropped)
    inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)
]]--

    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_2)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_2
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_yamche1"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]
----------

    --inst.entity:AddLight()
	--inst.Light:SetRadius(1)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(25/255,125/255,125/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche1")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche1")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
 
-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall")
   --inst:RemoveTag("musha_teen")
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = true
inst.iceyamche = false
--inst:RemoveTag("fridge")


    inst:SetStateGraph("SGmusha_tall")


    inst.Transform:SetScale(0.6, 0.6, 0.6)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.0, .5 )
  --  MakeSmallBurnableCharacter(inst, "head")
    MakeMediumBurnableCharacter(inst, "pig_torso")

        inst.components.burnable:SetBurnTime(1)

 --   MakeSmallPropagator(inst)
    --MakeMediumFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(300)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(70)
    --inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER * 1.15 /TUNING.TEENBIRD_STARVE_TIME)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(20)

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})

    
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall", time = GetTall2GrowTime, fn = function() end },
        {name="adult", fn = SetAdult}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end

local function create_tallr1_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "musha_tall.tex" )

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_small")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")


-------------------------------------
    create_base(inst)


--[[
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall.xml"
    inst.components.inventoryitem:SetOnDroppedFn(OnDropped)
    inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)
]]--

    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_2)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_2
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_yamche1"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]
----------

    --inst.entity:AddLight()
	--inst.Light:SetRadius(1)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(25/255,125/255,125/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche1")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche1")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
inst.doctor = true
-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall")
   --inst:RemoveTag("musha_teen")
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = true
inst.iceyamche = false
--inst:RemoveTag("fridge")


    inst:SetStateGraph("SGmusha_tall")


    inst.Transform:SetScale(0.6, 0.6, 0.6)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.0, .5 )
  --  MakeSmallBurnableCharacter(inst, "head")
    MakeMediumBurnableCharacter(inst, "pig_torso")

        inst.components.burnable:SetBurnTime(1)

 --   MakeSmallPropagator(inst)
    --MakeMediumFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(300)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(70)
    --inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER * 1.15 /TUNING.TEENBIRD_STARVE_TIME)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(20)

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})

    
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall", time = GetTall2GrowTime, fn = function() end },
        {name="adult", fn = SetAdult}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end
local function create_tallr2_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "musha_tall.tex" )

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_teen")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")


-------------------------------------
    create_base(inst)


--[[
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall.xml"
    inst.components.inventoryitem:SetOnDroppedFn(OnDropped)
    inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)
]]--

    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_2)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_2
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_yamche1"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]
----------

    --inst.entity:AddLight()
	--inst.Light:SetRadius(1)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(25/255,125/255,125/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche1")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche1")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
 
-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall")
   --inst:RemoveTag("musha_teen")
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = true
inst.iceyamche = false
--inst:RemoveTag("fridge")


    inst:SetStateGraph("SGmusha_tall")


    inst.Transform:SetScale(0.6, 0.6, 0.6)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.0, .5 )
  --  MakeSmallBurnableCharacter(inst, "head")
    MakeMediumBurnableCharacter(inst, "pig_torso")

        inst.components.burnable:SetBurnTime(1)

 --   MakeSmallPropagator(inst)
    --MakeMediumFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(300)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(70)
    --inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER * 1.15 /TUNING.TEENBIRD_STARVE_TIME)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(20)

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})

    
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall", time = GetTall2GrowTime, fn = function() end },
        {name="adult", fn = SetAdult}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end
local function create_tallr3_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "musha_tall.tex" )

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall2")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")


-------------------------------------
    create_base(inst)


--[[
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall.xml"
    inst.components.inventoryitem:SetOnDroppedFn(OnDropped)
    inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)
]]--

    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_2)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_2
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_yamche1"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]
----------

    --inst.entity:AddLight()
	--inst.Light:SetRadius(1)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(25/255,125/255,125/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche1")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche1")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
 
-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall")
   --inst:RemoveTag("musha_teen")
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = true
inst.iceyamche = false
--inst:RemoveTag("fridge")


    inst:SetStateGraph("SGmusha_tall")


    inst.Transform:SetScale(0.6, 0.6, 0.6)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.0, .5 )
  --  MakeSmallBurnableCharacter(inst, "head")
    MakeMediumBurnableCharacter(inst, "pig_torso")

        inst.components.burnable:SetBurnTime(1)

 --   MakeSmallPropagator(inst)
    --MakeMediumFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(300)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(70)
    --inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER * 1.15 /TUNING.TEENBIRD_STARVE_TIME)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(20)

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})

    
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall", time = GetTall2GrowTime, fn = function() end },
        {name="adult", fn = SetAdult}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end
local function create_tallr4_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "musha_tall.tex" )

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall3")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")


-------------------------------------
    create_base(inst)


--[[
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall.xml"
    inst.components.inventoryitem:SetOnDroppedFn(OnDropped)
    inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)
]]--

    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_2)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_2
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_yamche1"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]
----------

    --inst.entity:AddLight()
	--inst.Light:SetRadius(1)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(25/255,125/255,125/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche1")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche1")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
  
-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall")
   --inst:RemoveTag("musha_teen")
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = true
inst.iceyamche = false
--inst:RemoveTag("fridge")


    inst:SetStateGraph("SGmusha_tall")


    inst.Transform:SetScale(0.6, 0.6, 0.6)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.0, .5 )
  --  MakeSmallBurnableCharacter(inst, "head")
    MakeMediumBurnableCharacter(inst, "pig_torso")

        inst.components.burnable:SetBurnTime(1)

 --   MakeSmallPropagator(inst)
    --MakeMediumFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(300)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(70)
    --inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER * 1.15 /TUNING.TEENBIRD_STARVE_TIME)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(20)

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})

    
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall", time = GetTall2GrowTime, fn = function() end },
        {name="adult", fn = SetAdult}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end
local function create_tallrice_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "musha_tall.tex" )

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_ice")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")


-------------------------------------
    create_base(inst)


--[[
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall.xml"
    inst.components.inventoryitem:SetOnDroppedFn(OnDropped)
    inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)
]]--

    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_2)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_2
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_yamche1"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]
----------

    --inst.entity:AddLight()
	--inst.Light:SetRadius(1)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(25/255,125/255,125/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche1")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche1")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    

-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall")
   --inst:RemoveTag("musha_teen")
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = true
inst.iceyamche = true
inst:AddTag("fridge")
inst:ListenForEvent("attacked", Onfreeze)

    inst:SetStateGraph("SGmusha_tall")


    inst.Transform:SetScale(0.6, 0.6, 0.6)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.0, .5 )
  --  MakeSmallBurnableCharacter(inst, "head")
    MakeMediumBurnableCharacter(inst, "pig_torso")

        inst.components.burnable:SetBurnTime(1)

 --   MakeSmallPropagator(inst)
    --MakeMediumFreezableCharacter(inst, "head")
        

    inst.components.health:SetMaxHealth(300)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(70)
    --inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER * 1.15 /TUNING.TEENBIRD_STARVE_TIME)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(20)

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})

    
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall", time = GetTall2GrowTime, fn = function() end },
        {name="adult", fn = SetAdult}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end

--------musha_tall2

local function create_tall2_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall2")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    create_base(inst)


   -- inst:AddComponent("inventoryitem")
--	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall2.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(1.3)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(100/255,25/255,25/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche2")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche2")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
 -------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall2")
   --inst:RemoveTag("musha_teen")
   --inst:RemoveTag("musha_tall")
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = true
inst.iceyamche = false
--inst:RemoveTag("fridge")

    inst:SetStateGraph("SGmusha_tall2")


    inst.Transform:SetScale(0.7, 0.7, 0.7)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.1, .6 )
    MakeMediumBurnableCharacter(inst, "pig_torso")

    inst.components.burnable:SetBurnTime(1)
 --   MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(400)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(80)
    --inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER * 1.3 /TUNING.TEENBIRD_STARVE_TIME)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(25)

    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_3)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_3
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_yamche2"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]
----------

---
    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})

    
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall2", time = GetTall3GrowTime, fn = function() end },
        {name="adult2", fn = SetAdult2}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end


local function create_tallrr1_teen()
    --print("tallbird -  create_tall2_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_small")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    create_base(inst)


   -- inst:AddComponent("inventoryitem")
--	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall2.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(1.3)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(100/255,25/255,25/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche2")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche2")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
 inst.doctor = true
-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall2")
   --inst:RemoveTag("musha_teen")
   --inst:RemoveTag("musha_tall")
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = true
inst.iceyamche = false
--inst:RemoveTag("fridge")

    inst:SetStateGraph("SGmusha_tall2")


    inst.Transform:SetScale(0.7, 0.7, 0.7)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.1, .6 )
    MakeMediumBurnableCharacter(inst, "pig_torso")

    inst.components.burnable:SetBurnTime(1)
 --   MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(400)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(80)
    --inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER * 1.3 /TUNING.TEENBIRD_STARVE_TIME)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(25)

    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_3)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_3
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_yamche2"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]
----------

---
    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})

    
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall2", time = GetTall3GrowTime, fn = function() end },
        {name="adult2", fn = SetAdult2}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end

local function create_tallrr2_teen()
    --print("tallbird -  create_tall2_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_teen")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    create_base(inst)


   -- inst:AddComponent("inventoryitem")
--	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall2.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(1.3)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(100/255,25/255,25/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche2")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche2")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
 
-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall2")
   --inst:RemoveTag("musha_teen")
   --inst:RemoveTag("musha_tall")
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = true
inst.iceyamche = false
--inst:RemoveTag("fridge")

    inst:SetStateGraph("SGmusha_tall2")


    inst.Transform:SetScale(0.7, 0.7, 0.7)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.1, .6 )
    MakeMediumBurnableCharacter(inst, "pig_torso")

    inst.components.burnable:SetBurnTime(1)
 --   MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(400)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(80)
    --inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER * 1.3 /TUNING.TEENBIRD_STARVE_TIME)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(25)

    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_3)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_3
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_yamche2"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]
----------

---
    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})

    
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall2", time = GetTall3GrowTime, fn = function() end },
        {name="adult2", fn = SetAdult2}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end

local function create_tallrr3_teen()
    --print("tallbird -  create_tall2_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    create_base(inst)


   -- inst:AddComponent("inventoryitem")
--	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall2.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(1.3)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(100/255,25/255,25/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche2")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche2")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
    -----------------------
  
-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall2")
   --inst:RemoveTag("musha_teen")
   --inst:RemoveTag("musha_tall")
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = true
inst.iceyamche = false
--inst:RemoveTag("fridge")

    inst:SetStateGraph("SGmusha_tall2")


    inst.Transform:SetScale(0.7, 0.7, 0.7)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.1, .6 )
    MakeMediumBurnableCharacter(inst, "pig_torso")

    inst.components.burnable:SetBurnTime(1)
 --   MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(400)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(80)
    --inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER * 1.3 /TUNING.TEENBIRD_STARVE_TIME)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(25)

    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_3)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_3
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_yamche2"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]
----------

---
    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})

    
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall2", time = GetTall3GrowTime, fn = function() end },
        {name="adult2", fn = SetAdult2}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end

local function create_tallrr4_teen()
    --print("tallbird -  create_tall2_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall3")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    create_base(inst)


   -- inst:AddComponent("inventoryitem")
--	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall2.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(1.3)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(100/255,25/255,25/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche2")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche2")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
    -----------------------
 -------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall2")
   --inst:RemoveTag("musha_teen")
   --inst:RemoveTag("musha_tall")
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = true
inst.iceyamche = false
--inst:RemoveTag("fridge")

    inst:SetStateGraph("SGmusha_tall2")


    inst.Transform:SetScale(0.7, 0.7, 0.7)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.1, .6 )
    MakeMediumBurnableCharacter(inst, "pig_torso")

    inst.components.burnable:SetBurnTime(1)
 --   MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(400)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(80)
    --inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER * 1.3 /TUNING.TEENBIRD_STARVE_TIME)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(25)

    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_3)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_3
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_yamche2"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]
----------

---
    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})

    
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall2", time = GetTall3GrowTime, fn = function() end },
        {name="adult2", fn = SetAdult2}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end


local function create_tallrrice_teen()
    --print("tallbird -  create_tall2_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_ice")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    create_base(inst)


   -- inst:AddComponent("inventoryitem")
--	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall2.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(1.3)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(100/255,25/255,25/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche2")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche2")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
    -----------------------
  -------------------------------------

    create_common(inst)
	create_chester(inst)
	
    --inst:AddTag("musha_tall2")
   --inst:RemoveTag("musha_teen")
   --inst:RemoveTag("musha_tall")
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = true
inst.iceyamche = true
inst:AddTag("fridge")
inst:ListenForEvent("attacked", Onfreeze)
    inst:SetStateGraph("SGmusha_tall2")


    inst.Transform:SetScale(0.7, 0.7, 0.7)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.1, .6 )
    MakeMediumBurnableCharacter(inst, "pig_torso")

    inst.components.burnable:SetBurnTime(1)
 --   MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
        

    inst.components.health:SetMaxHealth(400)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(80)
    --inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER * 1.3 /TUNING.TEENBIRD_STARVE_TIME)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(25)

    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_3)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_3
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_yamche2"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]
----------

---
    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})

    
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall2", time = GetTall3GrowTime, fn = function() end },
        {name="adult2", fn = SetAdult2}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end



local function create_tallrr5_teen()
   --print("tallbird -  create_tall2_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall4")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    create_base(inst)


   -- inst:AddComponent("inventoryitem")
--	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall2.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(1.3)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(100/255,25/255,25/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche2")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche2")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
    -----------------------
 -------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall2")
   --inst:RemoveTag("musha_teen")
   --inst:RemoveTag("musha_tall")
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = true
inst.iceyamche = false
--inst:RemoveTag("fridge")

    inst:SetStateGraph("SGmusha_tall2")


    inst.Transform:SetScale(0.7, 0.7, 0.7)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.1, .6 )
    MakeMediumBurnableCharacter(inst, "pig_torso")

    inst.components.burnable:SetBurnTime(1)
 --   MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(400)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(80)
    --inst.components.hunger:SetRate(TUNING.TEENBIRD_HUNGER * 1.3 /TUNING.TEENBIRD_STARVE_TIME)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(25)

    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_3)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_3
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_yamche2"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]
----------

---
    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})

    
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    local growth_stages = {
        {name="tall2", time = GetTall3GrowTime, fn = function() end },
        {name="adult2", fn = SetAdult2}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end


------musha tall3

local function create_tall3_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall3")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    create_base(inst)


    --inst:AddComponent("inventoryitem")
	--inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall3.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(1.7)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(120/255,120/255,20/255)
		--inst.Light:Enable(true)
		inst.entity:SetPristine()

  if not TheWorld.ismastersim then
        return inst
    end
-----------------------
    
 
-------------------------------------

    create_common(inst)
	create_chester(inst)
    --inst:AddTag("musha_tall3")
   --inst:RemoveTag("musha_tall")
   --inst:RemoveTag("musha_tall2")
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
inst.level5 = true
inst.iceyamche = false
--inst:RemoveTag("fridge")

    inst:SetStateGraph("SGmusha_tall3")


    inst.Transform:SetScale(0.8, 0.8, 0.8)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.15, .7 )
    MakeMediumBurnableCharacter(inst, "pig_torso")

    inst.components.burnable:SetBurnTime(1)
  --  MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(500)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(90)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(30)

    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_4)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_4
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]
---
    --inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI })
	--inst.components.eater:SetElemental()
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})

    

    local growth_stages = {
        {name="tall3", time = GetTall4GrowTime, fn = function() end },
        {name="adult3", fn = SetAdult3}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end


------musha tall3

local function create_tallrrr1_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_small")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    create_base(inst)


    --inst:AddComponent("inventoryitem")
	--inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall3.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(1.7)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(120/255,120/255,20/255)
		--inst.Light:Enable(true)
		inst.entity:SetPristine()

  if not TheWorld.ismastersim then
        return inst
    end
-----------------------
    
    -----------------------
 inst.doctor = true
-------------------------------------

    create_common(inst)
	create_chester(inst)
    --inst:AddTag("musha_tall3")
   --inst:RemoveTag("musha_tall")
   --inst:RemoveTag("musha_tall2")
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
inst.level5 = true
inst.iceyamche = false
--inst:RemoveTag("fridge")

    inst:SetStateGraph("SGmusha_tall3")


    inst.Transform:SetScale(0.8, 0.8, 0.8)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.15, .7 )
    MakeMediumBurnableCharacter(inst, "pig_torso")

    inst.components.burnable:SetBurnTime(1)
  --  MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(500)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(90)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(30)

    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_4)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_4
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]
---
    --inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI })
	--inst.components.eater:SetElemental()
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})

    

    local growth_stages = {
        {name="tall3", time = GetTall4GrowTime, fn = function() end },
        {name="adult3", fn = SetAdult3}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end

------musha tall3

local function create_tallrrr2_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_teen")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    create_base(inst)


    --inst:AddComponent("inventoryitem")
	--inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall3.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(1.7)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(120/255,120/255,20/255)
		--inst.Light:Enable(true)
		inst.entity:SetPristine()

  if not TheWorld.ismastersim then
        return inst
    end
-----------------------
    
    -----------------------
 
-------------------------------------

    create_common(inst)
	create_chester(inst)
    --inst:AddTag("musha_tall3")
   --inst:RemoveTag("musha_tall")
   --inst:RemoveTag("musha_tall2")
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
inst.level5 = true
inst.iceyamche = false
--inst:RemoveTag("fridge")

    inst:SetStateGraph("SGmusha_tall3")


    inst.Transform:SetScale(0.8, 0.8, 0.8)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.15, .7 )
    MakeMediumBurnableCharacter(inst, "pig_torso")

    inst.components.burnable:SetBurnTime(1)
  --  MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(500)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(90)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(30)

    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_4)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_4
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]
---
    --inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI })
	--inst.components.eater:SetElemental()
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})

    

    local growth_stages = {
        {name="tall3", time = GetTall4GrowTime, fn = function() end },
        {name="adult3", fn = SetAdult3}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end

------musha tall3

local function create_tallrrr3_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    create_base(inst)


    --inst:AddComponent("inventoryitem")
	--inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall3.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(1.7)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(120/255,120/255,20/255)
		--inst.Light:Enable(true)
		inst.entity:SetPristine()

  if not TheWorld.ismastersim then
        return inst
    end
-----------------------
    
    -----------------------
 
-------------------------------------

    create_common(inst)
	create_chester(inst)
    --inst:AddTag("musha_tall3")
   --inst:RemoveTag("musha_tall")
   --inst:RemoveTag("musha_tall2")
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
inst.level5 = true
inst.iceyamche = false
--inst:RemoveTag("fridge")

    inst:SetStateGraph("SGmusha_tall3")


    inst.Transform:SetScale(0.8, 0.8, 0.8)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.15, .7 )
    MakeMediumBurnableCharacter(inst, "pig_torso")

    inst.components.burnable:SetBurnTime(1)
  --  MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(500)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(90)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(30)

    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_4)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_4
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]
---
    --inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI })
	--inst.components.eater:SetElemental()
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})

    

    local growth_stages = {
        {name="tall3", time = GetTall4GrowTime, fn = function() end },
        {name="adult3", fn = SetAdult3}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end

------musha tall3

local function create_tallrrr4_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall2")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    create_base(inst)


    --inst:AddComponent("inventoryitem")
	--inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall3.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(1.7)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(120/255,120/255,20/255)
		--inst.Light:Enable(true)
		inst.entity:SetPristine()

  if not TheWorld.ismastersim then
        return inst
    end
-----------------------
    
    -----------------------
 
-------------------------------------

    create_common(inst)
	create_chester(inst)
    --inst:AddTag("musha_tall3")
   --inst:RemoveTag("musha_tall")
   --inst:RemoveTag("musha_tall2")
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
inst.level5 = true
inst.iceyamche = false
--inst:RemoveTag("fridge")

    inst:SetStateGraph("SGmusha_tall3")


    inst.Transform:SetScale(0.8, 0.8, 0.8)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.15, .7 )
    MakeMediumBurnableCharacter(inst, "pig_torso")

    inst.components.burnable:SetBurnTime(1)
  --  MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(500)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(90)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(30)

    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_4)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_4
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]
---
    --inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI })
	--inst.components.eater:SetElemental()
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})

    

    local growth_stages = {
        {name="tall3", time = GetTall4GrowTime, fn = function() end },
        {name="adult3", fn = SetAdult3}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end

------musha tall3

local function create_tallrrrice_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_ice")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    create_base(inst)


    --inst:AddComponent("inventoryitem")
	--inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall3.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(1.7)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(120/255,120/255,20/255)
		--inst.Light:Enable(true)
		inst.entity:SetPristine()

  if not TheWorld.ismastersim then
        return inst
    end
-----------------------
    
    -----------------------
  
-------------------------------------

    create_common(inst)
	create_chester(inst)
    --inst:AddTag("musha_tall3")
   --inst:RemoveTag("musha_tall")
   --inst:RemoveTag("musha_tall2")
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
inst.level5 = true
inst.iceyamche = true
inst:AddTag("fridge")
inst:ListenForEvent("attacked", Onfreeze)
    inst:SetStateGraph("SGmusha_tall3")


    inst.Transform:SetScale(0.8, 0.8, 0.8)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.15, .7 )
    MakeMediumBurnableCharacter(inst, "pig_torso")

    inst.components.burnable:SetBurnTime(1)
  --  MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(500)
    

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(90)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(30)

    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_4)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_4
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]
---
    --inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI })
	--inst.components.eater:SetElemental()
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})

    

    local growth_stages = {
        {name="tall3", time = GetTall4GrowTime, fn = function() end },
        {name="adult3", fn = SetAdult3}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end


local function create_tallrrr5_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall4")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    create_base(inst)


    --inst:AddComponent("inventoryitem")
	--inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall3.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(1.7)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(120/255,120/255,20/255)
		--inst.Light:Enable(true)
		inst.entity:SetPristine()

  if not TheWorld.ismastersim then
        return inst
    end
-----------------------
    
    -----------------------
 
-------------------------------------

    create_common(inst)
	create_chester(inst)
    --inst:AddTag("musha_tall3")
   --inst:RemoveTag("musha_tall")
   --inst:RemoveTag("musha_tall2")
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
inst.level5 = true
inst.iceyamche = false
--inst:RemoveTag("fridge")

    inst:SetStateGraph("SGmusha_tall3")


    inst.Transform:SetScale(0.8, 0.8, 0.8)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.15, .7 )
    MakeMediumBurnableCharacter(inst, "pig_torso")

    inst.components.burnable:SetBurnTime(1)
  --  MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(500)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(90)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(30)

    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_4)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_4
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,-180,0)
    inst.components.container.widgetpos_controller = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]
---
    --inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI })
	--inst.components.eater:SetElemental()
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})

    

    local growth_stages = {
        {name="tall3", time = GetTall4GrowTime, fn = function() end },
        {name="adult3", fn = SetAdult3}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()


    --print("smallbird - create_teen_smallbird END")
	return inst
end


-----------musha_tall4

local function create_tall4_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall4")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    create_base(inst)


  --  inst:AddComponent("inventoryitem")
--	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall4.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(2.1)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(200/255,190/255,15/255)
		--inst.Light:Enable(true)
		inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche4")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche4")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    -----------------------
  
--box5
-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall4")
   --inst:RemoveTag("musha_tall")
   --inst:RemoveTag("musha_tall2")
   --inst:RemoveTag("musha_tall3")
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
inst.level5 = false
inst.level6 = true
inst.iceyamche = false
--inst:RemoveTag("fridge")
inst.darkyamche = false 

    inst:SetStateGraph("SGmusha_tall4")


    inst.Transform:SetScale(0.9, 0.9, 0.9)

  --  inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.2, 0.9)
    MakeMediumBurnableCharacter(inst, "pig_torso")
    inst.components.burnable:SetBurnTime(1)
   -- MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(600)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(100)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(35)


    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_5)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
   inst.components.container.widgetslotpos = slotpos_5
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]
---
   -- inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI })
	--inst.components.eater:SetElemental()
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})

    

    local growth_stages = {
        {name="tall4", time = GetTall5GrowTime, fn = function() end },
        {name="adult4", fn = SetAdult4}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()

    --print("smallbird - create_teen_smallbird END")
	return inst
end


local function create_tallrrrr1_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_small")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    create_base(inst)


  --  inst:AddComponent("inventoryitem")
--	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall4.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(2.1)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(200/255,190/255,15/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche4")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche4")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
    -----------------------
  inst.doctor = true
-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall4")
   --inst:RemoveTag("musha_tall")
   --inst:RemoveTag("musha_tall2")
   --inst:RemoveTag("musha_tall3")
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
inst.level5 = false
inst.level6 = true
inst.iceyamche = false
--inst:RemoveTag("fridge")
inst.darkyamche = false 

    inst:SetStateGraph("SGmusha_tall4")


    inst.Transform:SetScale(0.9, 0.9, 0.9)

  --  inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.2, 0.9)
    MakeMediumBurnableCharacter(inst, "pig_torso")
    inst.components.burnable:SetBurnTime(1)
   -- MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(600)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(100)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(35)


    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_5)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
   inst.components.container.widgetslotpos = slotpos_5
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]
---
   -- inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI })
	--inst.components.eater:SetElemental()
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})

    

    local growth_stages = {
        {name="tall4", time = GetTall5GrowTime, fn = function() end },
        {name="adult4", fn = SetAdult4}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()

    --print("smallbird - create_teen_smallbird END")
	return inst
end

local function create_tallrrrr2_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_teen")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    create_base(inst)


  --  inst:AddComponent("inventoryitem")
--	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall4.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(2.1)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(200/255,190/255,15/255)
		--inst.Light:Enable(true)
		inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche4")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche4")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
    -----------------------
  
-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall4")
   --inst:RemoveTag("musha_tall")
   --inst:RemoveTag("musha_tall2")
   --inst:RemoveTag("musha_tall3")
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
inst.level5 = false
inst.level6 = true
inst.iceyamche = false
--inst:RemoveTag("fridge")
inst.darkyamche = false 

    inst:SetStateGraph("SGmusha_tall4")


    inst.Transform:SetScale(0.9, 0.9, 0.9)

  --  inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.2, 0.9)
    MakeMediumBurnableCharacter(inst, "pig_torso")
    inst.components.burnable:SetBurnTime(1)
   -- MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(600)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(100)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(35)


    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_5)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
   inst.components.container.widgetslotpos = slotpos_5
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]
---
   -- inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI })
	--inst.components.eater:SetElemental()
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})

    

    local growth_stages = {
        {name="tall4", time = GetTall5GrowTime, fn = function() end },
        {name="adult4", fn = SetAdult4}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()

    --print("smallbird - create_teen_smallbird END")
	return inst
end

local function create_tallrrrr3_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    create_base(inst)


  --  inst:AddComponent("inventoryitem")
--	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall4.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(2.1)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(200/255,190/255,15/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche4")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche4")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
    -----------------------

-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall4")
   --inst:RemoveTag("musha_tall")
   --inst:RemoveTag("musha_tall2")
   --inst:RemoveTag("musha_tall3")
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
inst.level5 = false
inst.level6 = true
inst.iceyamche = false
--inst:RemoveTag("fridge")
inst.darkyamche = false 

    inst:SetStateGraph("SGmusha_tall4")


    inst.Transform:SetScale(0.9, 0.9, 0.9)

  --  inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.2, 0.9)
    MakeMediumBurnableCharacter(inst, "pig_torso")
    inst.components.burnable:SetBurnTime(1)
   -- MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(600)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(100)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(35)


    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_5)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
   inst.components.container.widgetslotpos = slotpos_5
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]
---
   -- inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI })
	--inst.components.eater:SetElemental()
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})

    

    local growth_stages = {
        {name="tall4", time = GetTall5GrowTime, fn = function() end },
        {name="adult4", fn = SetAdult4}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()

    --print("smallbird - create_teen_smallbird END")
	return inst
end

local function create_tallrrrr4_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall2")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    create_base(inst)


  --  inst:AddComponent("inventoryitem")
--	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall4.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(2.1)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(200/255,190/255,15/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche4")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche4")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
    -----------------------
  
-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall4")
   --inst:RemoveTag("musha_tall")
   --inst:RemoveTag("musha_tall2")
   --inst:RemoveTag("musha_tall3")
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
inst.level5 = false
inst.level6 = true
inst.iceyamche = false
--inst:RemoveTag("fridge")
inst.darkyamche = false 

    inst:SetStateGraph("SGmusha_tall4")


    inst.Transform:SetScale(0.9, 0.9, 0.9)

  --  inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.2, 0.9)
    MakeMediumBurnableCharacter(inst, "pig_torso")
    inst.components.burnable:SetBurnTime(1)
   -- MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(600)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(100)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(35)


    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_5)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
   inst.components.container.widgetslotpos = slotpos_5
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]
---
   -- inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI })
	--inst.components.eater:SetElemental()
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})

    

    local growth_stages = {
        {name="tall4", time = GetTall5GrowTime, fn = function() end },
        {name="adult4", fn = SetAdult4}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()

    --print("smallbird - create_teen_smallbird END")
	return inst
end

local function create_tallrrrr5_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall3")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    create_base(inst)


  --  inst:AddComponent("inventoryitem")
--	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall4.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(2.1)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(200/255,190/255,15/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche4")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche4")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
    -----------------------
 
-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall4")
   --inst:RemoveTag("musha_tall")
   --inst:RemoveTag("musha_tall2")
   --inst:RemoveTag("musha_tall3")
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
inst.level5 = false
inst.level6 = true
inst.iceyamche = false
--inst:RemoveTag("fridge")
inst.darkyamche = false 

    inst:SetStateGraph("SGmusha_tall4")


    inst.Transform:SetScale(0.9, 0.9, 0.9)

  --  inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.2, 0.9)
    MakeMediumBurnableCharacter(inst, "pig_torso")
    inst.components.burnable:SetBurnTime(1)
   -- MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(600)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(100)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(35)


    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_5)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
   inst.components.container.widgetslotpos = slotpos_5
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]
---
   -- inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI })
	--inst.components.eater:SetElemental()
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})

    

    local growth_stages = {
        {name="tall4", time = GetTall5GrowTime, fn = function() end },
        {name="adult4", fn = SetAdult4}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()

    --print("smallbird - create_teen_smallbird END")
	return inst
end


local function create_tallrrrrice_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_ice")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    create_base(inst)


  --  inst:AddComponent("inventoryitem")
--	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall4.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(2.1)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(200/255,190/255,15/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche4")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche4")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
    -----------------------
 
-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall4")
   --inst:RemoveTag("musha_tall")
   --inst:RemoveTag("musha_tall2")
   --inst:RemoveTag("musha_tall3")
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
inst.level5 = false
inst.level6 = true
inst.iceyamche = true
inst:AddTag("fridge")
inst.darkyamche = false 
inst:ListenForEvent("attacked", Onfreeze)
    inst:SetStateGraph("SGmusha_tall4")


    inst.Transform:SetScale(0.9, 0.9, 0.9)

  --  inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.2, 0.9)
    MakeMediumBurnableCharacter(inst, "pig_torso")
    inst.components.burnable:SetBurnTime(1)
   -- MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(600)
    

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(100)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(35)


    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_5)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
   inst.components.container.widgetslotpos = slotpos_5
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]
---
   -- inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI })
	--inst.components.eater:SetElemental()
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})

    

    local growth_stages = {
        {name="tall4", time = GetTall5GrowTime, fn = function() end },
        {name="adult4", fn = SetAdult4}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()

    --print("smallbird - create_teen_smallbird END")
	return inst
end

local function create_tallrrrr6_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall5")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")

-------------------------------------
    create_base(inst)


  --  inst:AddComponent("inventoryitem")
--	inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall4.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(2.1)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(200/255,190/255,15/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche4")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche4")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
    -----------------------

-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall4")
   --inst:RemoveTag("musha_tall")
   --inst:RemoveTag("musha_tall2")
   --inst:RemoveTag("musha_tall3")
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
inst.level5 = false
inst.level6 = true
inst.iceyamche = false
--inst:RemoveTag("fridge")
inst.darkyamche = true 
    inst:SetStateGraph("SGmusha_tall4")


    inst.Transform:SetScale(1.05, 1.05, 1.05)

  --  inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.2, 0.9)
    MakeMediumBurnableCharacter(inst, "pig_torso")
    inst.components.burnable:SetBurnTime(1)
   -- MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(600)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(100)

--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(35)


    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_5)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
   inst.components.container.widgetslotpos = slotpos_5
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    inst.components.container.side_align_tip = 160]]
---
   -- inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI })
	--inst.components.eater:SetElemental()
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    inst.components.lootdropper:SetLoot({"glowdust"})


    local growth_stages = {
        {name="tall4", time = GetTall5GrowTime, fn = function() end },
        {name="adult4", fn = SetAdult4}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()

    --print("smallbird - create_teen_smallbird END")
	return inst
end

--------musha_5
-------Level7 phoenix state

local function create_tall5_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall5")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")




-------------------------------------
    create_base(inst)


  --  inst:AddComponent("inventoryitem")
	--inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall5.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(3)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(225/255,200/255,75/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche5")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche5")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
    -----------------------
  
-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall5")
   --inst:RemoveTag("musha_tall")
   --inst:RemoveTag("musha_tall2")
   --inst:RemoveTag("musha_tall3")
   --inst:RemoveTag("musha_tall4")
     inst.level7 = true
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
inst.level5 = false
inst.level6 = false
inst.iceyamche = false
--inst:RemoveTag("fridge")
inst.darkyamche = true 


    inst:SetStateGraph("SGmusha_tall5")


    inst.Transform:SetScale(1.1, 1.1, 1.1)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.2, 0.9)
   -- MakeSmallBurnableCharacter(inst, "head")
    MakeMediumBurnableCharacter(inst, "pig_torso")
    inst.components.burnable:SetBurnTime(1)
inst.components.burnable:SetFXLevel(300)
    --MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(700)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(120)

  --  inst.components.hunger:SetKillRate(TUNING.TEENBIRD_HEALTH * 1.75 /TUNING.TEENBIRD_STARVE_KILL_TIME)
--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(40)
    
    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_6)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_6
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    --inst.components.container.widgetpos = Vector3(-5,-75,0)
    inst.components.container.side_align_tip = 160]]
--	inst.components.container.side_widget = true    

--   inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI })
--	inst.components.eater:SetElemental()
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

     --   inst.procfn = function() tryproc(inst) end
     --   inst:ListenForEvent("attacked", inst.procfn)

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    --inst.components.lootdropper:SetLoot({"musha_egg"})

    inst.components.lootdropper:SetLoot({"glowdust"})

    

    local growth_stages = {
        {name="tall5", time = GetTall6GrowTime, fn = function() end },
        {name="adult5", fn = SetAdult5}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()

	return inst
end


local function create_tallrrrrr1_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_small")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")




-------------------------------------
    create_base(inst)


  --  inst:AddComponent("inventoryitem")
	--inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall5.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(3)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(225/255,200/255,75/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche5")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche5")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
    -----------------------
  inst.doctor = true
-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall5")
   --inst:RemoveTag("musha_tall")
   --inst:RemoveTag("musha_tall2")
   --inst:RemoveTag("musha_tall3")
   --inst:RemoveTag("musha_tall4")
     inst.level7 = true
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
inst.level5 = false
inst.level6 = false
inst.iceyamche = false
--inst:RemoveTag("fridge")
inst.darkyamche = false 


    inst:SetStateGraph("SGmusha_tall5")


    inst.Transform:SetScale(1, 1, 1)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.2, 0.9)
   -- MakeSmallBurnableCharacter(inst, "head")
    MakeMediumBurnableCharacter(inst, "pig_torso")
    inst.components.burnable:SetBurnTime(1)
inst.components.burnable:SetFXLevel(300)
    --MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(700)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(120)

  --  inst.components.hunger:SetKillRate(TUNING.TEENBIRD_HEALTH * 1.75 /TUNING.TEENBIRD_STARVE_KILL_TIME)
--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(40)
    
    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_6)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_6
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    --inst.components.container.widgetpos = Vector3(-5,-75,0)
    inst.components.container.side_align_tip = 160]]
--	inst.components.container.side_widget = true    

--   inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI })
--	inst.components.eater:SetElemental()
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

     --   inst.procfn = function() tryproc(inst) end
     --   inst:ListenForEvent("attacked", inst.procfn)

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    --inst.components.lootdropper:SetLoot({"musha_egg"})

    inst.components.lootdropper:SetLoot({"glowdust"})

    

    local growth_stages = {
        {name="tall5", time = GetTall6GrowTime, fn = function() end },
        {name="adult5", fn = SetAdult5}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()

	return inst
end


local function create_tallrrrrr2_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_teen")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")




-------------------------------------
    create_base(inst)


  --  inst:AddComponent("inventoryitem")
	--inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall5.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(3)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(225/255,200/255,75/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche5")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche5")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
    -----------------------
  
-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall5")
   --inst:RemoveTag("musha_tall")
   --inst:RemoveTag("musha_tall2")
   --inst:RemoveTag("musha_tall3")
   --inst:RemoveTag("musha_tall4")
     inst.level7 = true
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
inst.level5 = false
inst.level6 = false
inst.iceyamche = false
--inst:RemoveTag("fridge")
inst.darkyamche = false 


    inst:SetStateGraph("SGmusha_tall5")


    inst.Transform:SetScale(1, 1, 1)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.2, 0.9)
   -- MakeSmallBurnableCharacter(inst, "head")
    MakeMediumBurnableCharacter(inst, "pig_torso")
    inst.components.burnable:SetBurnTime(1)
inst.components.burnable:SetFXLevel(300)
    --MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(700)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(120)

  --  inst.components.hunger:SetKillRate(TUNING.TEENBIRD_HEALTH * 1.75 /TUNING.TEENBIRD_STARVE_KILL_TIME)
--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(40)
    
    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_6)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_6
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    --inst.components.container.widgetpos = Vector3(-5,-75,0)
    inst.components.container.side_align_tip = 160]]
--	inst.components.container.side_widget = true    

--   inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI })
--	inst.components.eater:SetElemental()
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

     --   inst.procfn = function() tryproc(inst) end
     --   inst:ListenForEvent("attacked", inst.procfn)

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    --inst.components.lootdropper:SetLoot({"musha_egg"})

    inst.components.lootdropper:SetLoot({"glowdust"})

    

    local growth_stages = {
        {name="tall5", time = GetTall6GrowTime, fn = function() end },
        {name="adult5", fn = SetAdult5}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()

	return inst
end


local function create_tallrrrrr3_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")




-------------------------------------
    create_base(inst)


  --  inst:AddComponent("inventoryitem")
	--inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall5.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(3)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(225/255,200/255,75/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche5")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche5")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
    -----------------------
  
-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall5")
   --inst:RemoveTag("musha_tall")
   --inst:RemoveTag("musha_tall2")
   --inst:RemoveTag("musha_tall3")
   --inst:RemoveTag("musha_tall4")
     inst.level7 = true
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
inst.level5 = false
inst.level6 = false
inst.iceyamche = false
--inst:RemoveTag("fridge")
inst.darkyamche = false 


    inst:SetStateGraph("SGmusha_tall5")


    inst.Transform:SetScale(1, 1, 1)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.2, 0.9)
   -- MakeSmallBurnableCharacter(inst, "head")
    MakeMediumBurnableCharacter(inst, "pig_torso")
    inst.components.burnable:SetBurnTime(1)
inst.components.burnable:SetFXLevel(300)
    --MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(700)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(120)

  --  inst.components.hunger:SetKillRate(TUNING.TEENBIRD_HEALTH * 1.75 /TUNING.TEENBIRD_STARVE_KILL_TIME)
--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(40)
    
    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_6)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_6
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    --inst.components.container.widgetpos = Vector3(-5,-75,0)
    inst.components.container.side_align_tip = 160]]
--	inst.components.container.side_widget = true    

--   inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI })
--	inst.components.eater:SetElemental()
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

     --   inst.procfn = function() tryproc(inst) end
     --   inst:ListenForEvent("attacked", inst.procfn)

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    --inst.components.lootdropper:SetLoot({"musha_egg"})

    inst.components.lootdropper:SetLoot({"glowdust"})

    

    local growth_stages = {
        {name="tall5", time = GetTall6GrowTime, fn = function() end },
        {name="adult5", fn = SetAdult5}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()

	return inst
end


local function create_tallrrrrr4_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall2")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")




-------------------------------------
    create_base(inst)


  --  inst:AddComponent("inventoryitem")
	--inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall5.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(3)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(225/255,200/255,75/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche5")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche5")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
    -----------------------
  
-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall5")
   --inst:RemoveTag("musha_tall")
   --inst:RemoveTag("musha_tall2")
   --inst:RemoveTag("musha_tall3")
   --inst:RemoveTag("musha_tall4")
     inst.level7 = true
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
inst.level5 = false
inst.level6 = false
inst.iceyamche = false
--inst:RemoveTag("fridge")
inst.darkyamche = false 


    inst:SetStateGraph("SGmusha_tall5")


    inst.Transform:SetScale(1, 1, 1)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.2, 0.9)
   -- MakeSmallBurnableCharacter(inst, "head")
    MakeMediumBurnableCharacter(inst, "pig_torso")
    inst.components.burnable:SetBurnTime(1)
inst.components.burnable:SetFXLevel(300)
    --MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(700)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(120)

  --  inst.components.hunger:SetKillRate(TUNING.TEENBIRD_HEALTH * 1.75 /TUNING.TEENBIRD_STARVE_KILL_TIME)
--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(40)
    
    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_6)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_6
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    --inst.components.container.widgetpos = Vector3(-5,-75,0)
    inst.components.container.side_align_tip = 160]]
--	inst.components.container.side_widget = true    

--   inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI })
--	inst.components.eater:SetElemental()
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

     --   inst.procfn = function() tryproc(inst) end
     --   inst:ListenForEvent("attacked", inst.procfn)

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    --inst.components.lootdropper:SetLoot({"musha_egg"})

    inst.components.lootdropper:SetLoot({"glowdust"})

    

    local growth_stages = {
        {name="tall5", time = GetTall6GrowTime, fn = function() end },
        {name="adult5", fn = SetAdult5}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()

	return inst
end


local function create_tallrrrrr5_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall3")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")




-------------------------------------
    create_base(inst)


  --  inst:AddComponent("inventoryitem")
	--inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall5.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(3)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(225/255,200/255,75/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche5")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche5")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
 
-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall5")
   --inst:RemoveTag("musha_tall")
   --inst:RemoveTag("musha_tall2")
   --inst:RemoveTag("musha_tall3")
   --inst:RemoveTag("musha_tall4")
     inst.level7 = true
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
inst.level5 = false
inst.level6 = false
inst.iceyamche = false
--inst:RemoveTag("fridge")
inst.darkyamche = false 


    inst:SetStateGraph("SGmusha_tall5")


    inst.Transform:SetScale(1, 1, 1)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.2, 0.9)
   -- MakeSmallBurnableCharacter(inst, "head")
    MakeMediumBurnableCharacter(inst, "pig_torso")
    inst.components.burnable:SetBurnTime(1)
inst.components.burnable:SetFXLevel(300)
    --MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(700)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(120)

  --  inst.components.hunger:SetKillRate(TUNING.TEENBIRD_HEALTH * 1.75 /TUNING.TEENBIRD_STARVE_KILL_TIME)
--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(40)
    
    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_6)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_6
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    --inst.components.container.widgetpos = Vector3(-5,-75,0)
    inst.components.container.side_align_tip = 160]]
--	inst.components.container.side_widget = true    

--   inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI })
--	inst.components.eater:SetElemental()
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

     --   inst.procfn = function() tryproc(inst) end
     --   inst:ListenForEvent("attacked", inst.procfn)

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    --inst.components.lootdropper:SetLoot({"musha_egg"})

    inst.components.lootdropper:SetLoot({"glowdust"})

    

    local growth_stages = {
        {name="tall5", time = GetTall6GrowTime, fn = function() end },
        {name="adult5", fn = SetAdult5}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()

	return inst
end


local function create_tallrrrrrice_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_ice")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")




-------------------------------------
    create_base(inst)


  --  inst:AddComponent("inventoryitem")
	--inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall5.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(3)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(225/255,200/255,75/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche5")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche5")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
    -----------------------

-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall5")
   --inst:RemoveTag("musha_tall")
   --inst:RemoveTag("musha_tall2")
   --inst:RemoveTag("musha_tall3")
   --inst:RemoveTag("musha_tall4")
     inst.level7 = true
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
inst.level5 = false
inst.level6 = false
inst.iceyamche = true
inst:AddTag("fridge")
inst.darkyamche = false 
inst:ListenForEvent("attacked", Onfreeze)
    inst:SetStateGraph("SGmusha_tall5")


   inst.Transform:SetScale(1, 1, 1)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.2, 0.9)
   -- MakeSmallBurnableCharacter(inst, "head")
    MakeMediumBurnableCharacter(inst, "pig_torso")
    inst.components.burnable:SetBurnTime(1)
inst.components.burnable:SetFXLevel(300)
    --MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(700)
    

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(120)

  --  inst.components.hunger:SetKillRate(TUNING.TEENBIRD_HEALTH * 1.75 /TUNING.TEENBIRD_STARVE_KILL_TIME)
--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(40)
    
    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_6)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_6
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    --inst.components.container.widgetpos = Vector3(-5,-75,0)
    inst.components.container.side_align_tip = 160]]
--	inst.components.container.side_widget = true    

--   inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI })
--	inst.components.eater:SetElemental()
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

     --   inst.procfn = function() tryproc(inst) end
     --   inst:ListenForEvent("attacked", inst.procfn)

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    --inst.components.lootdropper:SetLoot({"musha_egg"})

    inst.components.lootdropper:SetLoot({"glowdust"})

    

    local growth_stages = {
        {name="tall5", time = GetTall6GrowTime, fn = function() end },
        {name="adult5", fn = SetAdult5}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()

	return inst
end


local function create_tallrrrrr6_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall4")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")




-------------------------------------
    create_base(inst)


  --  inst:AddComponent("inventoryitem")
	--inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall5.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(3)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(225/255,200/255,75/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche5")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche5")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
    -----------------------
 

-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall5")
   --inst:RemoveTag("musha_tall")
   --inst:RemoveTag("musha_tall2")
   --inst:RemoveTag("musha_tall3")
   --inst:RemoveTag("musha_tall4")
     inst.level7 = true
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
inst.level5 = false
inst.level6 = false
inst.iceyamche = false
--inst:RemoveTag("fridge")
inst.darkyamche = false 
 

    inst:SetStateGraph("SGmusha_tall5")


    inst.Transform:SetScale(1, 1, 1)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.2, 0.9)
   -- MakeSmallBurnableCharacter(inst, "head")
    MakeMediumBurnableCharacter(inst, "pig_torso")
    inst.components.burnable:SetBurnTime(1)
inst.components.burnable:SetFXLevel(300)
    --MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(700)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(120)

  --  inst.components.hunger:SetKillRate(TUNING.TEENBIRD_HEALTH * 1.75 /TUNING.TEENBIRD_STARVE_KILL_TIME)
--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(40)
    
    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_6)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_6
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    --inst.components.container.widgetpos = Vector3(-5,-75,0)
    inst.components.container.side_align_tip = 160]]
--	inst.components.container.side_widget = true    

--   inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI })
--	inst.components.eater:SetElemental()
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

     --   inst.procfn = function() tryproc(inst) end
     --   inst:ListenForEvent("attacked", inst.procfn)

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    --inst.components.lootdropper:SetLoot({"musha_egg"})

    inst.components.lootdropper:SetLoot({"glowdust"})

    

    local growth_stages = {
        {name="tall5", time = GetTall6GrowTime, fn = function() end },
        {name="adult5", fn = SetAdult5}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()

	return inst
end



-------Level8 phoenix state

local function create_rp1_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_small")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")




-------------------------------------
    create_base(inst)


  --  inst:AddComponent("inventoryitem")
	--inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall5.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(3)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(225/255,200/255,75/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche5")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche5")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
    -----------------------
 
-------------------------------------------
inst.doctor = true
-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall6")
   --inst:RemoveTag("musha_tall")
   --inst:RemoveTag("musha_tall2")
   --inst:RemoveTag("musha_tall3")
   --inst:RemoveTag("musha_tall4")
   --inst:RemoveTag("musha_tall5")
     inst.level8 = true
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
inst.level5 = false
inst.level6 = false
inst.level7 = false
inst.iceyamche = false
--inst:RemoveTag("fridge")
inst.darkyamche = false 


    inst:SetStateGraph("SGmusha_tall6")


    inst.Transform:SetScale(1, 1, 1)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.1, 0.8)
   -- MakeSmallBurnableCharacter(inst, "head")
    MakeMediumBurnableCharacter(inst, "pig_torso")
    inst.components.burnable:SetBurnTime(1)
inst.components.burnable:SetFXLevel(300)
    --MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(800)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(120)

  --  inst.components.hunger:SetKillRate(TUNING.TEENBIRD_HEALTH * 1.75 /TUNING.TEENBIRD_STARVE_KILL_TIME)
--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(40)
    
    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_6)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_6
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    --inst.components.container.widgetpos = Vector3(-5,-75,0)
    inst.components.container.side_align_tip = 160]]
--	inst.components.container.side_widget = true    

--   inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI })
--	inst.components.eater:SetElemental()
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

     --   inst.procfn = function() tryproc(inst) end
     --   inst:ListenForEvent("attacked", inst.procfn)

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    --inst.components.lootdropper:SetLoot({"musha_egg"})

    inst.components.lootdropper:SetLoot({"glowdust"})

    
--[[
    local growth_stages = {
        {name="tall5", time = GetTall6GrowTime, fn = function() end },
        {name="adult5", fn = SetAdult5}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()
]]
	return inst
end


local function create_rp2_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_teen")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")




-------------------------------------
    create_base(inst)


  --  inst:AddComponent("inventoryitem")
	--inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall5.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(3)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(225/255,200/255,75/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche5")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche5")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
    -----------------------
 
-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall6")
   --inst:RemoveTag("musha_tall")
   --inst:RemoveTag("musha_tall2")
   --inst:RemoveTag("musha_tall3")
   --inst:RemoveTag("musha_tall4")
   --inst:RemoveTag("musha_tall5")
     inst.level8 = true
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
inst.level5 = false
inst.level6 = false
inst.level7 = false
inst.iceyamche = false
--inst:RemoveTag("fridge")
inst.darkyamche = false 


    inst:SetStateGraph("SGmusha_tall6")


    inst.Transform:SetScale(1, 1, 1)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.1, 0.8)
   -- MakeSmallBurnableCharacter(inst, "head")
    MakeMediumBurnableCharacter(inst, "pig_torso")
    inst.components.burnable:SetBurnTime(1)
inst.components.burnable:SetFXLevel(300)
    --MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(800)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(120)

  --  inst.components.hunger:SetKillRate(TUNING.TEENBIRD_HEALTH * 1.75 /TUNING.TEENBIRD_STARVE_KILL_TIME)
--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(40)
    
    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_6)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_6
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    --inst.components.container.widgetpos = Vector3(-5,-75,0)
    inst.components.container.side_align_tip = 160]]
--	inst.components.container.side_widget = true    

--   inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI })
--	inst.components.eater:SetElemental()
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

     --   inst.procfn = function() tryproc(inst) end
     --   inst:ListenForEvent("attacked", inst.procfn)

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    --inst.components.lootdropper:SetLoot({"musha_egg"})

    inst.components.lootdropper:SetLoot({"glowdust"})

    
--[[
    local growth_stages = {
        {name="tall5", time = GetTall6GrowTime, fn = function() end },
        {name="adult5", fn = SetAdult5}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()
]]
	return inst
end

local function create_rp3_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")




-------------------------------------
    create_base(inst)


  --  inst:AddComponent("inventoryitem")
	--inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall5.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(3)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(225/255,200/255,75/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche5")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche5")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
    -----------------------
 

-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall6")
   --inst:RemoveTag("musha_tall")
   --inst:RemoveTag("musha_tall2")
   --inst:RemoveTag("musha_tall3")
   --inst:RemoveTag("musha_tall4")
   --inst:RemoveTag("musha_tall5")
     inst.level8 = true
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
inst.level5 = false
inst.level6 = false
inst.level7 = false
inst.iceyamche = false
--inst:RemoveTag("fridge")
inst.darkyamche = false 


    inst:SetStateGraph("SGmusha_tall6")


    inst.Transform:SetScale(1, 1, 1)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.1, 0.8)
   -- MakeSmallBurnableCharacter(inst, "head")
    MakeMediumBurnableCharacter(inst, "pig_torso")
    inst.components.burnable:SetBurnTime(1)
inst.components.burnable:SetFXLevel(300)
    --MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(800)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(120)

  --  inst.components.hunger:SetKillRate(TUNING.TEENBIRD_HEALTH * 1.75 /TUNING.TEENBIRD_STARVE_KILL_TIME)
--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(40)
    
    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_6)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_6
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    --inst.components.container.widgetpos = Vector3(-5,-75,0)
    inst.components.container.side_align_tip = 160]]
--	inst.components.container.side_widget = true    

--   inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI })
--	inst.components.eater:SetElemental()
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

     --   inst.procfn = function() tryproc(inst) end
     --   inst:ListenForEvent("attacked", inst.procfn)

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    --inst.components.lootdropper:SetLoot({"musha_egg"})

    inst.components.lootdropper:SetLoot({"glowdust"})

    
--[[
    local growth_stages = {
        {name="tall5", time = GetTall6GrowTime, fn = function() end },
        {name="adult5", fn = SetAdult5}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()
]]
	return inst
end

local function create_rp4_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall2")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")




-------------------------------------
    create_base(inst)


  --  inst:AddComponent("inventoryitem")
	--inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall5.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(3)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(225/255,200/255,75/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche5")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche5")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
    -----------------------


-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall6")
   --inst:RemoveTag("musha_tall")
   --inst:RemoveTag("musha_tall2")
   --inst:RemoveTag("musha_tall3")
   --inst:RemoveTag("musha_tall4")
   --inst:RemoveTag("musha_tall5")
     inst.level8 = true
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
inst.level5 = false
inst.level6 = false
inst.level7 = false
inst.iceyamche = false
--inst:RemoveTag("fridge")
inst.darkyamche = false 


    inst:SetStateGraph("SGmusha_tall6")


    inst.Transform:SetScale(1, 1, 1)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.1, 0.8)
   -- MakeSmallBurnableCharacter(inst, "head")
    MakeMediumBurnableCharacter(inst, "pig_torso")
    inst.components.burnable:SetBurnTime(1)
inst.components.burnable:SetFXLevel(300)
    --MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(800)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(120)

  --  inst.components.hunger:SetKillRate(TUNING.TEENBIRD_HEALTH * 1.75 /TUNING.TEENBIRD_STARVE_KILL_TIME)
--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(40)
    
    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_6)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_6
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    --inst.components.container.widgetpos = Vector3(-5,-75,0)
    inst.components.container.side_align_tip = 160]]
--	inst.components.container.side_widget = true    

--   inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI })
--	inst.components.eater:SetElemental()
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

     --   inst.procfn = function() tryproc(inst) end
     --   inst:ListenForEvent("attacked", inst.procfn)

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    --inst.components.lootdropper:SetLoot({"musha_egg"})

    inst.components.lootdropper:SetLoot({"glowdust"})

    
--[[
    local growth_stages = {
        {name="tall5", time = GetTall6GrowTime, fn = function() end },
        {name="adult5", fn = SetAdult5}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()
]]
	return inst
end

local function create_rp5_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall3")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")




-------------------------------------
    create_base(inst)


  --  inst:AddComponent("inventoryitem")
	--inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall5.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(3)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(225/255,200/255,75/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche5")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche5")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
    -----------------------
 
-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall6")
   --inst:RemoveTag("musha_tall")
   --inst:RemoveTag("musha_tall2")
   --inst:RemoveTag("musha_tall3")
   --inst:RemoveTag("musha_tall4")
   --inst:RemoveTag("musha_tall5")
     inst.level8 = true
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
inst.level5 = false
inst.level6 = false
inst.level7 = false
inst.iceyamche = false
--inst:RemoveTag("fridge")
inst.darkyamche = false 


    inst:SetStateGraph("SGmusha_tall6")


    inst.Transform:SetScale(1, 1, 1)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.1, 0.8)
   -- MakeSmallBurnableCharacter(inst, "head")
    MakeMediumBurnableCharacter(inst, "pig_torso")
    inst.components.burnable:SetBurnTime(1)
inst.components.burnable:SetFXLevel(300)
    --MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(800)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(120)

  --  inst.components.hunger:SetKillRate(TUNING.TEENBIRD_HEALTH * 1.75 /TUNING.TEENBIRD_STARVE_KILL_TIME)
--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(40)
    
    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_6)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_6
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    --inst.components.container.widgetpos = Vector3(-5,-75,0)
    inst.components.container.side_align_tip = 160]]
--	inst.components.container.side_widget = true    

--   inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI })
--	inst.components.eater:SetElemental()
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

     --   inst.procfn = function() tryproc(inst) end
     --   inst:ListenForEvent("attacked", inst.procfn)

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    --inst.components.lootdropper:SetLoot({"musha_egg"})

    inst.components.lootdropper:SetLoot({"glowdust"})

    
--[[
    local growth_stages = {
        {name="tall5", time = GetTall6GrowTime, fn = function() end },
        {name="adult5", fn = SetAdult5}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()
]]
	return inst
end

local function create_rp6_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall4")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")




-------------------------------------
    create_base(inst)


  --  inst:AddComponent("inventoryitem")
	--inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall5.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(3)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(225/255,200/255,75/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche5")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche5")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
    -----------------------
 

-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall6")
   --inst:RemoveTag("musha_tall")
   --inst:RemoveTag("musha_tall2")
   --inst:RemoveTag("musha_tall3")
   --inst:RemoveTag("musha_tall4")
   --inst:RemoveTag("musha_tall5")
     inst.level8 = true
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
inst.level5 = false
inst.level6 = false
inst.level7 = false
inst.iceyamche = false
--inst:RemoveTag("fridge")
inst.darkyamche = false 


    inst:SetStateGraph("SGmusha_tall6")


     inst.Transform:SetScale(1, 1, 1)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.1, 0.8)
   -- MakeSmallBurnableCharacter(inst, "head")
    MakeMediumBurnableCharacter(inst, "pig_torso")
    inst.components.burnable:SetBurnTime(1)
inst.components.burnable:SetFXLevel(300)
    --MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(800)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(120)

  --  inst.components.hunger:SetKillRate(TUNING.TEENBIRD_HEALTH * 1.75 /TUNING.TEENBIRD_STARVE_KILL_TIME)
--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(40)
    
    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_6)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_6
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    --inst.components.container.widgetpos = Vector3(-5,-75,0)
    inst.components.container.side_align_tip = 160]]
--	inst.components.container.side_widget = true    

--   inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI })
--	inst.components.eater:SetElemental()
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

     --   inst.procfn = function() tryproc(inst) end
     --   inst:ListenForEvent("attacked", inst.procfn)

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    --inst.components.lootdropper:SetLoot({"musha_egg"})

    inst.components.lootdropper:SetLoot({"glowdust"})

    
--[[
    local growth_stages = {
        {name="tall5", time = GetTall6GrowTime, fn = function() end },
        {name="adult5", fn = SetAdult5}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()
]]
	return inst
end

-------------

local function create_rp7_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_tall5")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")




-------------------------------------
    create_base(inst)


  --  inst:AddComponent("inventoryitem")
	--inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall5.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(3)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(225/255,200/255,75/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche5")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche5")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
    -----------------------
 
-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall6")
   --inst:RemoveTag("musha_tall")
   --inst:RemoveTag("musha_tall2")
   --inst:RemoveTag("musha_tall3")
   --inst:RemoveTag("musha_tall4")
   --inst:RemoveTag("musha_tall5")
     inst.level8 = true
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
inst.level5 = false
inst.level6 = false
inst.level7 = false
inst.iceyamche = false
--inst:RemoveTag("fridge")
inst.darkyamche = true 


    inst:SetStateGraph("SGmusha_tall6")


    inst.Transform:SetScale(1.15, 1.15, 1.15)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.1, 0.8)
   -- MakeSmallBurnableCharacter(inst, "head")
    MakeMediumBurnableCharacter(inst, "pig_torso")
    inst.components.burnable:SetBurnTime(1)
inst.components.burnable:SetFXLevel(300)
    --MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(800)

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(120)

  --  inst.components.hunger:SetKillRate(TUNING.TEENBIRD_HEALTH * 1.75 /TUNING.TEENBIRD_STARVE_KILL_TIME)
--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(40)
    
    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_6)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_6
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    --inst.components.container.widgetpos = Vector3(-5,-75,0)
    inst.components.container.side_align_tip = 160]]
--	inst.components.container.side_widget = true    

--   inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI })
--	inst.components.eater:SetElemental()
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

     --   inst.procfn = function() tryproc(inst) end
     --   inst:ListenForEvent("attacked", inst.procfn)

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    --inst.components.lootdropper:SetLoot({"musha_egg"})

    inst.components.lootdropper:SetLoot({"glowdust"})

    
--[[
    local growth_stages = {
        {name="tall5", time = GetTall6GrowTime, fn = function() end },
        {name="adult5", fn = SetAdult5}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()
]]
	return inst
end

-------------

local function create_rpice_teen()
    --print("tallbird -  create_tall_teen")

        local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.AnimState:SetBank("smallbird")
    inst.AnimState:SetBuild("musha_ice")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("beakfull")




-------------------------------------
    create_base(inst)


  --  inst:AddComponent("inventoryitem")
	--inst.components.inventoryitem.atlasname = "images/inventoryimages/musha_tall5.xml"

    --inst.entity:AddLight()
	--inst.Light:SetRadius(3)
    --inst.Light:SetFalloff(.7)
    --inst.Light:SetIntensity(.5)
    --inst.Light:SetColour(225/255,200/255,75/255)
		--inst.Light:Enable(true)
	if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()
			inst.replica.container:WidgetSetup("chest_yamche5")
		end)
		return inst
	end
inst.entity:SetPristine()

	inst:AddComponent("container")  
    inst.components.container:WidgetSetup("chest_yamche5")
	inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
-----------------------
    
    -----------------------
 

-------------------------------------

    create_common(inst)
	
    --inst:AddTag("musha_tall6")
   --inst:RemoveTag("musha_tall")
   --inst:RemoveTag("musha_tall2")
   --inst:RemoveTag("musha_tall3")
   --inst:RemoveTag("musha_tall4")
   --inst:RemoveTag("musha_tall5")
     inst.level8 = true
   inst.baby = false
inst.level1 = false
inst.level2 = false
inst.level3 = false
inst.level4 = false
inst.level5 = false
inst.level6 = false
inst.level7 = false
inst.iceyamche = true
inst:AddTag("fridge")
inst.darkyamche = false 
inst:ListenForEvent("attacked", Onfreeze)
    inst:SetStateGraph("SGmusha_tall6")


    inst.Transform:SetScale(1, 1, 1)

   -- inst.Physics:SetCylinder(.5, 1)

	inst.DynamicShadow:SetSize( 1.1, 0.8)
   -- MakeSmallBurnableCharacter(inst, "head")
    MakeMediumBurnableCharacter(inst, "pig_torso")
    inst.components.burnable:SetBurnTime(1)
inst.components.burnable:SetFXLevel(300)
    --MakeSmallPropagator(inst)
    MakeSmallFreezableCharacter(inst, "head")
    
    inst.components.health:SetMaxHealth(800)
    

    --inst:ListenForEvent("healthdelta", OnHealthDelta)
    
    inst.components.hunger:SetMax(120)

  --  inst.components.hunger:SetKillRate(TUNING.TEENBIRD_HEALTH * 1.75 /TUNING.TEENBIRD_STARVE_KILL_TIME)
--[[
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetRetargetFunction(3, TeenRetarget)
    inst.components.combat:SetKeepTargetFunction(TeenKeepTarget)
    SetTeenAttackDefault(inst)
]]--
	inst.components.combat.hiteffectsymbol = "head"
    inst.components.combat:SetRange(3)
    inst.components.combat:SetDefaultDamage(40)
    
    --inst:AddComponent("container")
    --[[inst.components.container:SetNumSlots(#slotpos_6)
        inst.components.container.itemtestfn = itemtest

    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    
    inst.components.container.widgetslotpos = slotpos_6
    inst.components.container.widgetanimbank = "ui_chest_3x3"
    inst.components.container.widgetanimbuild = "ui_chest_3x3"
    inst.components.container.widgetpos = Vector3(0,200,0)
    --inst.components.container.widgetpos = Vector3(-5,-75,0)
    inst.components.container.side_align_tip = 160]]
--	inst.components.container.side_widget = true    

--   inst.components.eater:SetDiet({ FOODGROUP.OMNI }, { FOODGROUP.OMNI })
--	inst.components.eater:SetElemental()
--inst.components.eater.foodprefs = { "MEAT", "VEGGIE", "INSECT", "SEEDS", "GENERIC", "CRISTAL", "EXP",}

     --   inst.procfn = function() tryproc(inst) end
     --   inst:ListenForEvent("attacked", inst.procfn)

    inst:ListenForEvent("newcombattarget", OnNewTarget)
    
    --inst.components.lootdropper:SetLoot({"musha_egg"})

    inst.components.lootdropper:SetLoot({"glowdust"})

    
--[[
    local growth_stages = {
        {name="tall5", time = GetTall6GrowTime, fn = function() end },
        {name="adult5", fn = SetAdult5}
    }

	inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()
]]
	return inst
end

-------------

return Prefab( "musha_small", create_smallbird, assets, prefabs),

	   Prefab( "musha_teen", create_teen_smallbird, teen_assets),
	   Prefab( "musha_teenr1", create_teenr1_smallbird, assets),
	   Prefab( "musha_teenr2", create_teenr2_smallbird, tall_assets),
	   Prefab( "musha_teenr3", create_teenr3_smallbird, tall2_assets),
	   Prefab( "musha_teenr4", create_teenr4_smallbird, tall3_assets),
	   Prefab( "musha_teenice", create_teenice_smallbird, ice_assets),

	   Prefab( "musha_tall", create_tall_teen, tall_assets) ,
	   Prefab( "musha_tallr1", create_tallr1_teen, assets) ,
	   Prefab( "musha_tallr2", create_tallr2_teen, teen_assets) ,
	   Prefab( "musha_tallr3", create_tallr3_teen, tall2_assets) ,
	   Prefab( "musha_tallr4", create_tallr4_teen, tall3_assets) ,
	   Prefab( "musha_tallrice", create_tallrice_teen, ice_assets) ,

 	   Prefab( "musha_tall2", create_tall2_teen, tall2_assets), 
 	   Prefab( "musha_tallrr1", create_tallrr1_teen, assets), 
 	   Prefab( "musha_tallrr2", create_tallrr2_teen, teen_assets), 
 	   Prefab( "musha_tallrr3", create_tallrr3_teen, tall_assets), 
 	   Prefab( "musha_tallrr4", create_tallrr4_teen, tall3_assets), 
 	   Prefab( "musha_tallrr5", create_tallrr5_teen, tall4_assets), 
 	   Prefab( "musha_tallrrice", create_tallrrice_teen, ice_assets), 

	   Prefab( "musha_tall3", create_tall3_teen, tall3_assets), 
 	   Prefab( "musha_tallrrr1", create_tallrrr1_teen, assets), 
 	   Prefab( "musha_tallrrr2", create_tallrrr2_teen, teen_assets), 
 	   Prefab( "musha_tallrrr3", create_tallrrr3_teen, tall_assets), 
 	   Prefab( "musha_tallrrr4", create_tallrrr4_teen, tall2_assets), 
 	   Prefab( "musha_tallrrr5", create_tallrrr5_teen, tall4_assets), 
 	   Prefab( "musha_tallrrrice", create_tallrrrice_teen, ice_assets), 

	   Prefab( "musha_tall4", create_tall4_teen, tall4_assets), 
 	   Prefab( "musha_tallrrrr1", create_tallrrrr1_teen, assets), 
 	   Prefab( "musha_tallrrrr2", create_tallrrrr2_teen, teen_assets), 
 	   Prefab( "musha_tallrrrr3", create_tallrrrr3_teen, tall_assets), 
 	   Prefab( "musha_tallrrrr4", create_tallrrrr4_teen, tall2_assets), 
 	   Prefab( "musha_tallrrrr5", create_tallrrrr5_teen, tall3_assets), 
 	   Prefab( "musha_tallrrrr6", create_tallrrrr6_teen, tall5_assets), 
 	   Prefab( "musha_tallrrrrice", create_tallrrrrice_teen, ice_assets), 

	   Prefab( "musha_tall5", create_tall5_teen, tall5_assets), 
	   Prefab( "musha_tallrrrrr1", create_tallrrrrr1_teen, assets), 
 	   Prefab( "musha_tallrrrrr2", create_tallrrrrr2_teen, teen_assets), 
 	   Prefab( "musha_tallrrrrr3", create_tallrrrrr3_teen, tall_assets), 
 	   Prefab( "musha_tallrrrrr4", create_tallrrrrr4_teen, tall2_assets), 
 	   Prefab( "musha_tallrrrrr5", create_tallrrrrr5_teen, tall3_assets), 
 	   Prefab( "musha_tallrrrrr6", create_tallrrrrr6_teen, tall4_assets), 
 	   Prefab( "musha_tallrrrrrice", create_tallrrrrrice_teen, ice_assets), 

	   Prefab( "musha_rp1", create_rp1_teen, rp1_assets), 
	   Prefab( "musha_rp2", create_rp2_teen, rp2_assets), 
	   Prefab( "musha_rp3", create_rp3_teen, rp3_assets), 
	   Prefab( "musha_rp4", create_rp4_teen, rp4_assets), 
	   Prefab( "musha_rp5", create_rp5_teen, rp5_assets), 
	   Prefab( "musha_rp6", create_rp6_teen, rp6_assets), 
	   Prefab( "musha_rp7", create_rp7_teen, tall5_assets), 
	   Prefab( "musha_rpice", create_rpice_teen, ice_assets), 

MakePlacer( "common/firepit_placer", "firepit", "firepit", "preview" ) 

