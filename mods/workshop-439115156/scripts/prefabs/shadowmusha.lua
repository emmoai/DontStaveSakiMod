require "brains/shadowmushabrain"
local brain = require "brains/shadowmushabrain"
require "stategraphs/SGshadowmusha"
local MUSHA_NEAR_LEADER_DISTANCE = 20
local assets = 
{
       Asset( "ANIM", "anim/player_basic.zip" ),
    Asset("ANIM", "anim/musha_h.zip"),
	Asset("SOUND", "sound/maxwell.fsb"),
	Asset("SOUND", "sound/willow.fsb"),    
	Asset("ANIM", "anim/swap_pickaxe.zip"),
	Asset("ANIM", "anim/swap_axe.zip"),
	Asset("ANIM", "anim/swap_nightmaresword.zip"),
}

local prefabs = 
{

}

local items =
{
	AXE = "swap_axe",
	PICK = "swap_pickaxe",
    SWORD = "swap_nightmaresword"

}

local function onkilll(inst, data)
local smallllchance = 0.3
local normalchance = 0.6

local leader = inst.components.follower.leader
if inst.components.follower:IsNearLeader(MUSHA_NEAR_LEADER_DISTANCE) then
	if leader and leader:HasTag("musha") and not leader:HasTag("playerghost") then
	
	local victim = data.victim
	   if not (victim:HasTag("prey") or
            victim:HasTag("veggie") or
            victim:HasTag("eyeplant") or
            victim:HasTag("insect") or			
            victim:HasTag("structure")) then
    local delta = victim.components.combat.defaultdamage * 0.25
		   if math.random() < normalchance then
    				leader.level = leader.level + 1
 	leader.components.talker:Say("额外[EXP](+1) \n".. (leader.level))		
  					end					
				end
		  if (victim:HasTag("prey") or
              victim:HasTag("insect") or			
            victim:HasTag("frog")) then
    local delta = victim.components.combat.defaultdamage * 0.1
		   if math.random() < smallllchance then
    				leader.level = leader.level + 1
 	leader.components.talker:Say("额外[EXP](+1) \n".. (leader.level))	
  
					end					
				end
			end
		
end 
end 

local function ondeath(inst)
SpawnPrefab("ice_splash").Transform:SetPosition(inst:GetPosition():Get()) inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")
end 
local function die(inst)
	inst.components.health:Kill()
end
--[[local function dead(inst, data)
local leader = inst.components.follower.leader
if inst.components.follower:IsNearLeader(MUSHA_NEAR_LEADER_DISTANCE) then
if inst.components.hunger:GetPercent() <= 1 and inst.components.hunger:GetPercent() >= 0.9 then
    inst.Transform:SetScale(0.55, 0.55, 0.55)
	--inst.components.combat:SetDefaultDamage(60)
 elseif inst.components.hunger:GetPercent() < 0.9 and inst.components.hunger:GetPercent() >= 0.7 then
    inst.Transform:SetScale(0.51, 0.51, 0.51)
 elseif inst.components.hunger:GetPercent() < 0.8 and inst.components.hunger:GetPercent() >= 0.7 then
    inst.Transform:SetScale(0.46, 0.46, 0.46)
elseif inst.components.hunger:GetPercent() < 0.7 and inst.components.hunger:GetPercent() >= 0.6 then
    inst.Transform:SetScale(0.41, 0.41, 0.41)
 elseif inst.components.hunger:GetPercent() < 0.6 and inst.components.hunger:GetPercent() >= 0.5 then
    inst.Transform:SetScale(0.36, 0.36, 0.36)
elseif inst.components.hunger:GetPercent() < 0.5 and inst.components.hunger:GetPercent() >= 0.1 then
    inst.Transform:SetScale(0.31, 0.31, 0.31)
elseif inst.components.hunger:GetPercent() < 0.1 and inst.components.hunger.current > 0  then
    inst.Transform:SetScale(0.25, 0.25, 0.25)
elseif inst.components.hunger.current == 0 then
SpawnPrefab("ice_splash").Transform:SetPosition(leader:GetPosition():Get())
leader.components.health:DoDelta(25)
            die(inst)
end
end
end]]

local function EquipItem(inst, item)
	if item then
	    inst.AnimState:OverrideSymbol("swap_object", item, item)
	    inst.AnimState:Show("ARM_carry") 
	    inst.AnimState:Hide("ARM_normal")
	end
end


local function resume(inst, time)
    if inst.death then
        inst.death:Cancel()
        inst.death = nil
    end
    inst.death = inst:DoTaskInTime(time, die)
end

local function onsave(inst, data)
    data.timeleft = (inst.lifetime - inst:GetTimeAlive())
end

local function KeepTarget(isnt, target)
    return target and target:IsValid()
end

local function onload(inst, data)
    if data.timeleft then
        inst.lifetime = data.timeleft
        if inst.lifetime > 0 then
            resume(inst, inst.lifetime)
        else
            die(inst)
        end
    end
end

local function entitydeathfn(inst, data)
    if data.inst:HasTag("player") then
        inst:DoTaskInTime(math.random(), function() inst.components.health:Kill() end)
    end
end

local function ShouldWakeUp(inst)
    return not inst.stop
end

local function ShouldSleep(inst)
    return inst.stop
end
local function OnHitfreeze(inst, data)
local other = data.target
   local pos = other:GetPosition()
    if other and other.components.freezable then
        other.components.freezable:AddColdness(0.1)
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
local other = data.target
   --local pos = other:GetPosition()
if other and other.components.health then
   --SpawnPrefab("statue_transition").Transform:SetPosition(other:GetPosition():Get())
        inst.components.health:DoDelta(10)
elseif other and other:HasTag("musha") then
	inst.components.combat:SetTarget(nil)
inst.components.combat:GiveUp()
    end
end
-------------

local function dead(inst, data)
if inst.components.hunger:GetPercent() < 1 and inst.components.hunger:GetPercent() >= 0.9 then
    inst.Transform:SetScale(0.8, 0.8, 0.8)
	inst.components.health:StartRegen(1, 1)
    inst.components.combat:SetDefaultDamage(60)

elseif inst.components.hunger:GetPercent() < 0.9 and inst.components.hunger:GetPercent() >= 0.8 then
    inst.Transform:SetScale(0.75, 0.75, 0.75)
	inst.components.health:StartRegen(1, 2)
    inst.components.combat:SetDefaultDamage(55)

elseif inst.components.hunger:GetPercent() < 0.8 and inst.components.hunger:GetPercent() >= 0.7 then
    inst.Transform:SetScale(0.7, 0.7, 0.7)
	inst.components.health:StartRegen(1, 2.5)
    inst.components.combat:SetDefaultDamage(50)

elseif inst.components.hunger:GetPercent() < 0.7 and inst.components.hunger:GetPercent() >= 0.6 then
    inst.Transform:SetScale(0.65, 0.65, 0.65)
	inst.components.health:StartRegen(1, 3)
    inst.components.combat:SetDefaultDamage(45)

elseif inst.components.hunger:GetPercent() < 0.6 and inst.components.hunger:GetPercent() >= 0.5 then
    inst.Transform:SetScale(0.6, 0.6, 0.6)
	inst.components.health:StartRegen(1, 3.5)
    inst.components.combat:SetDefaultDamage(40)

elseif inst.components.hunger:GetPercent() < 0.5 and inst.components.hunger:GetPercent() >= 0.1 then
    inst.Transform:SetScale(0.56, 0.56, 0.56)
	inst.components.health:StartRegen(1, 4)
    inst.components.combat:SetDefaultDamage(35)
 
elseif inst.components.hunger:GetPercent() < 0.1 and inst.components.hunger.current > 0 then
    inst.Transform:SetScale(0.51, 0.51, 0.51)
	inst.components.health:StartRegen(1, 5)
    inst.components.combat:SetDefaultDamage(30)
 
elseif inst.components.hunger.current == 0 then
	inst.components.health:StartRegen(0, 0)
 
            die(inst)
end
end
local function onclose(inst)
local leader = inst.components.follower.leader
if inst.components.follower:IsNearLeader(MUSHA_NEAR_LEADER_DISTANCE) then
inst.components.locomotor.runspeed = TUNING.SHADOWWAXWELL_SPEED
end end 

local function far(inst)
local leader = inst.components.follower.leader
if inst.components.follower:IsNearLeader(MUSHA_NEAR_LEADER_DISTANCE) then
inst.components.locomotor.runspeed = (TUNING.SHADOWWAXWELL_SPEED*1.5)
inst.components.combat:GiveUp()
end end

local function musha_update(inst)
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 10, {"player"})
for k,v in pairs(ents) do
if inst.gmusha and not inst.components.follower.leader then
v.components.leader:AddFollower(inst)
inst.components.hunger:SetRate(100/TUNING.TEENBIRD_STARVE_TIME)
elseif not inst.gmusha then
inst.components.follower:SetLeader(nil)
inst.components.hunger:SetRate(0/TUNING.TEENBIRD_STARVE_TIME)
end end end

local function onusemusha(inst, data)
if not inst.gmusha then
inst.Light:Enable(true)
inst.gmusha = true
inst.stop = false
inst.sg:GoToState("hit")
inst.components.talker:Say("跟上来\n召唤时间(启动)")
inst.SoundEmitter:PlaySound("dontstarve/common/gem_shatter")
if inst.components.sleeper:IsAsleep() then
inst.components.sleeper:WakeUp()
end 
end  end
local function offusemusha(inst, data)
if inst.gmusha then
inst.components.locomotor.runspeed = 3
inst.sg:GoToState("stunned")
inst.Light:Enable(false)
inst.gmusha = false
inst.stop = true
inst.components.talker:Say("停下\n召唤时间(停止)")
inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")

end 
end 

local function fn()
  local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

	inst.Transform:SetFourFaced(inst)

	MakeGhostPhysics(inst, 1, .5)

	inst.AnimState:SetBank("wilson")
	inst.AnimState:SetBuild("musha_h")
	inst.AnimState:PlayAnimation("idle")

    inst.AnimState:Hide("ARM_carry")
    inst.AnimState:Hide("hat")
    inst.AnimState:Hide("hat_hair")

    inst:AddTag("scarytoprey")
    --inst:AddTag("NOCLICK")
    inst:AddTag("character")
	inst:AddTag("companion")
    inst:AddTag("noauradamage")
 
    inst.Transform:SetScale(0.8, 0.8, 0.8)

	inst:AddComponent("colourtweener")
	inst.components.colourtweener:StartTween({1,1,1,.7}, 0)
    --inst.Transform:SetScale(0.7, 0.7, 0.7)
	inst.entity:AddLight()
	inst.Light:SetRadius(.3)
    inst.Light:SetFalloff(.5)
    inst.Light:SetIntensity(.3)
    inst.Light:SetColour(50/255,50/255,50/255)
	
		    inst:AddComponent("talker")
	   inst.components.talker.fontsize = 24
    inst.components.talker.colour = Vector3(20, 20, 100, 1)


       	if not TheWorld.ismastersim then
   return inst
end	
inst.entity:SetPristine()
 inst:AddComponent("inspectable")
	inst:AddComponent("locomotor")
    --inst.components.locomotor:SetSlowMultiplier( 0.6 )

    inst.components.locomotor.pathcaps = { ignorecreep = true }
    inst.components.locomotor.runspeed = TUNING.SHADOWWAXWELL_SPEED

    inst:AddComponent("combat")
    inst.components.combat.playerdamagepercent = 0
    inst.components.combat.hiteffectsymbol = "torso"
    -- inst.components.combat:SetRetargetFunction(1, Retarget)
    inst.components.combat:SetKeepTargetFunction(KeepTarget)
    inst.components.combat:SetAttackPeriod(TUNING.SHADOWWAXWELL_ATTACK_PERIOD)
    inst.components.combat:SetRange(2, 3)
    inst.components.combat:SetDefaultDamage(TUNING.SHADOWWAXWELL_DAMAGE)
--40
    inst:AddComponent("health")
    inst.components.health:SetMaxHealth(150)
	inst.components.health:SetAbsorptionAmount(0.5)
inst.components.health.nofadeout = true
 --inst:ListenForEvent("death", ondeath)
    inst:AddComponent("hunger")
	inst.components.hunger:SetMax(1000)
inst.components.hunger:SetRate(0/TUNING.TEENBIRD_STARVE_TIME)
	inst:AddComponent("inventory")
   inst.components.inventory.dropondeath = false
	    inst:AddComponent("sleeper")
    inst.components.sleeper:SetResistance(0)
    inst.components.sleeper:SetSleepTest(ShouldSleep)
    inst.components.sleeper:SetWakeTest(ShouldWakeUp)
   inst:AddComponent("machine")
    inst.components.machine.turnonfn = onusemusha
    inst.components.machine.turnofffn = offusemusha
    inst.components.machine.cooldowntime = 0
	
   --[[inst:AddComponent("sanityaura")
    inst.components.sanityaura.penalty = 20
        player.components.sanity:RecalculatePenalty()]]

--------------------
        inst:AddComponent("playerprox")
    inst.components.playerprox:SetDist(7, 7)
    inst.components.playerprox:SetOnPlayerNear(onclose)
    inst.components.playerprox:SetOnPlayerFar(far)
-------------------

    inst.items = items
    inst.equipfn = EquipItem

--    inst.lifetime = TUNING.SHADOWWAXWELL_LIFETIME
--    inst.death = inst:DoTaskInTime(inst.lifetime, die)
   -- inst.OnSave = onsave
   -- inst.OnLoad = onload
   offusemusha(inst)
inst:AddComponent("follower")
inst:ListenForEvent("death", ondeath)
inst:ListenForEvent("hungerdelta", dead)
     inst:ListenForEvent("onhitother", OnHitfreeze)
	 inst:ListenForEvent("killed", onkilll)
 inst:ListenForEvent("onhitother", OnHitvampire)
 inst:ListenForEvent("hungerdelta", musha_update)
    EquipItem(inst)

    inst:ListenForEvent("entity_death", function(world, data) entitydeathfn(inst, data) end, TheWorld)
    

	--local brain = require"brains/shadowwaxwellbrain"
	inst:SetBrain(brain)
	inst:SetStateGraph("SGshadowmusha")


	return inst
end

return Prefab("common/shadowmusha", fn, assets, prefabs)