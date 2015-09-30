require "stategraphs/SGtentacle"

local assets=
{
	Asset("ANIM", "anim/tentacle.zip"),
    Asset("SOUND", "sound/tentacle.fsb"),
}

local prefabs =
{
    "monstermeat",
    "tentaclespike",
    "tentaclespots",
}

SetSharedLootTable( 'tentacle_frost',
{
   {'ice', 0.2},
})

local function OnHitfreeze(inst, data)
local other = data.target
   local pos = other:GetPosition()
    if other and other.components.freezable then
        other.components.freezable:AddColdness(0.5)
        other.components.freezable:SpawnShatterFX()
elseif other and other:HasTag("musha") then
	inst.components.combat:SetTarget(nil)
inst.components.combat:GiveUp()
    end
    if other.components.burnable and other.components.burnable:IsBurning() then
        other.components.burnable:Extinguish()
    end
end

local function dead(inst, data)
if inst.components.hunger:GetPercent() <= 1 and inst.components.hunger:GetPercent() > 0.98 then
	inst.components.talker:Say(" £”‡’ŸªΩ ±º‰\n99%")	
elseif inst.components.hunger:GetPercent() <= 0.9 and inst.components.hunger:GetPercent() > 0.88 then	
	inst.components.talker:Say(" £”‡’ŸªΩ ±º‰\n90%")	
elseif inst.components.hunger:GetPercent() <= 0.79 and inst.components.hunger:GetPercent() > 0.78 then	
	inst.components.talker:Say(" £”‡’ŸªΩ ±º‰\n80%")	
elseif inst.components.hunger:GetPercent() <= 0.69 and inst.components.hunger:GetPercent() > 0.68 then	
	inst.components.talker:Say(" £”‡’ŸªΩ ±º‰\n70%")	
elseif inst.components.hunger:GetPercent() <= 0.59 and inst.components.hunger:GetPercent() > 0.58 then	
	inst.components.talker:Say(" £”‡’ŸªΩ ±º‰\n60%")	
elseif inst.components.hunger:GetPercent() <= 0.49 and inst.components.hunger:GetPercent() > 0.48 then	
	inst.components.talker:Say(" £”‡’ŸªΩ ±º‰\n50%")	
elseif inst.components.hunger:GetPercent() <= 0.39 and inst.components.hunger:GetPercent() > 0.38 then	
	inst.components.talker:Say(" £”‡’ŸªΩ ±º‰\n40%")		
elseif inst.components.hunger:GetPercent() <= 0.29 and inst.components.hunger:GetPercent() > 0.28 then	
	inst.components.talker:Say(" £”‡’ŸªΩ ±º‰\n30%")		
elseif inst.components.hunger:GetPercent() <= 0.19 and inst.components.hunger:GetPercent() > 0.18 then	
	inst.components.talker:Say(" £”‡’ŸªΩ ±º‰\n20%")		
elseif inst.components.hunger:GetPercent() <= 0.09 and inst.components.hunger:GetPercent() > 0.08 then	
	inst.components.talker:Say(" £”‡’ŸªΩ ±º‰\n10%")		
elseif inst.components.hunger.current < 1 then
	inst.components.health:DoDelta(-600)
SpawnPrefab("splash").Transform:SetPosition(inst:GetPosition():Get())
end
end

local function ghound_update(inst)
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 25, {"player"})
for k,v in pairs(ents) do
v.components.leader:AddFollower(inst)
end end 

local function retargetfn(inst)
    return FindEntity(
        inst,
        TUNING.TENTACLE_ATTACK_DIST,
        function(guy) 
            return guy.prefab ~= inst.prefab
                and guy.entity:IsVisible()
                and not guy.components.health:IsDead()
                and (guy.components.combat.target == inst or
                    guy:HasTag("monster") or
                    --guy:HasTag("animal") or
					not guy:HasTag("yamcheb") and not guy:HasTag("player") and not guy:HasTag("companion"))
        end,
        { "_combat", "_health" },
        { "prey" })
end

local function OnNewTarget(inst, data)
local other = data.target
    if data.target and data.target:HasTag("player") then
	return
elseif other and other:HasTag("player") then
	inst.components.combat:SetTarget(nil)
inst.components.combat:GiveUp()

end
end

local function shouldKeepTarget(inst, target)
    return target ~= nil
        and target:IsValid()
        and target.entity:IsVisible()
        and target.components.health ~= nil
        and not target.components.health:IsDead()
        and target:IsNear(inst, TUNING.TENTACLE_STOPATTACK_DIST)
end

local function OnAttacked(inst, data)
    if data.attacker == nil then
        return
    end

    local current_target = inst.components.combat.target

    if current_target == nil then
        --Don't want to handle initiating attacks here;
        --We only want to handle switching targets.
        return
    elseif current_target == data.attacker then
        --Already targeting our attacker, just update the time
        inst._last_attacker = current_target
        inst._last_attacked_time = GetTime()
        return
    end

    local time = GetTime()
    if inst._last_attacker == current_target and
        inst._last_attacked_time + TUNING.TENTACLE_ATTACK_AGGRO_TIMEOUT >= time then
        --Our target attacked us recently, stay on it!
        return
    end

    --Switch to new target
    inst.components.combat:SetTarget(data.attacker)
    inst._last_attacker = data.attacker
    inst._last_attacked_time = time
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddPhysics()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    inst.Physics:SetCylinder(0.25, 2)

    inst.AnimState:SetBank("tentacle")
    inst.AnimState:SetBuild("tentacle_frost")
    inst.AnimState:PlayAnimation("idle")
	
--inst:AddTag("companion")
    --inst:AddTag("monster")    
   -- inst:AddTag("hostile")
    inst:AddTag("wet")
  --  inst:AddTag("WORM_DANGER")
 	inst:AddComponent("colourtweener")
	inst.components.colourtweener:StartTween({1,1,1,.85}, 0)
			    inst:AddComponent("talker")
    inst.components.talker.fontsize = 21
    inst.components.talker.colour = Vector3(20, 20, 100, 1)
inst.Transform:SetScale(0.56, 0.56, 0.56)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

   inst:AddComponent("follower")
 --------------------
       
	
    inst:AddComponent("health")
    inst.components.health:SetMaxHealth(TUNING.TENTACLE_HEALTH*1.25)
    inst:AddComponent("hunger")
	inst.components.hunger:SetMax(400)
 inst.components.hunger:SetRate(100/TUNING.TEENBIRD_STARVE_TIME)
 
    inst:AddComponent("combat")
    inst.components.combat:SetRange(TUNING.TENTACLE_ATTACK_DIST)
    inst.components.combat:SetDefaultDamage(TUNING.TENTACLE_DAMAGE*0.75)
    inst.components.combat:SetAttackPeriod(TUNING.TENTACLE_ATTACK_PERIOD)
    inst.components.combat:SetRetargetFunction(GetRandomWithVariance(2, 0.5), retargetfn)
    inst.components.combat:SetKeepTargetFunction(shouldKeepTarget)

    MakeLargeFreezableCharacter(inst)

    --[[inst:AddComponent("sanityaura")
    inst.components.sanityaura.aura = -TUNING.SANITYAURA_MED]]
	
    inst:ListenForEvent("onhitother", OnHitfreeze)
inst:ListenForEvent("hungerdelta", dead)
    inst:AddComponent("inspectable")
    inst:AddComponent("lootdropper")
	  inst:ListenForEvent("newcombattarget", OnNewTarget)
	  inst:ListenForEvent("hungerdelta", ghound_update)
    inst.components.lootdropper:SetChanceLootTable('tentacle_frost')

    inst:SetStateGraph("SGtentacle")

    inst:ListenForEvent("attacked", OnAttacked)

    return inst
end

--------------
return Prefab( "marsh/monsters/tentacle_frost", fn, assets, prefabs) 
