local assets=
{
	Asset("ANIM", "anim/rook.zip"),
	Asset("ANIM", "anim/rook_build.zip"),
	Asset("ANIM", "anim/rook_rhino.zip"),
	Asset("SOUND", "sound/chess.fsb"),
}

local prefabs =
{
	"meat",
    "minotaurhorn",
    "collapse_small",
}

local loot = 
{
	"meat",
	"meat",
    "meat",
    "meat",
    "meat",
    "meat",
    "meat",
    "meat",
    "minotaurhorn",
}

local SLEEP_DIST_FROMHOME = 20
local SLEEP_DIST_FROMTHREAT = 40
local MAX_CHASEAWAY_DIST = 50
local MAX_TARGET_SHARES = 5
local SHARE_TARGET_DIST = 40

local function ShouldSleep(inst)
    local homePos = inst.components.knownlocations:GetLocation("home")
    local myPos = Vector3(inst.Transform:GetWorldPosition() )
    if not (homePos and distsq(homePos, myPos) <= SLEEP_DIST_FROMHOME*SLEEP_DIST_FROMHOME)
       or (inst.components.combat and inst.components.combat.target)
       or (inst.components.burnable and inst.components.burnable:IsBurning() )
       or (inst.components.freezable and inst.components.freezable:IsFrozen() ) then
        return false
    end
    local nearestEnt = GetClosestInstWithTag("character", inst, SLEEP_DIST_FROMTHREAT)
    return nearestEnt == nil
end

local function ShouldWake(inst)
    local homePos = inst.components.knownlocations:GetLocation("home")
    local myPos = Vector3(inst.Transform:GetWorldPosition() )
    if (homePos and distsq(homePos, myPos) > SLEEP_DIST_FROMHOME*SLEEP_DIST_FROMHOME)
       or (inst.components.combat and inst.components.combat.target)
       or (inst.components.burnable and inst.components.burnable:IsBurning() )
       or (inst.components.freezable and inst.components.freezable:IsFrozen() ) then
        return true
    end
    local nearestEnt = GetClosestInstWithTag("character", inst, SLEEP_DIST_FROMTHREAT)
    return nearestEnt
end

local function Retarget(inst)
    local homePos = inst.components.knownlocations:GetLocation("home")
    local myPos = Vector3(inst.Transform:GetWorldPosition() )
    if (homePos and distsq(homePos, myPos) > 40*40) then
        return
    end
    
    local newtarget = FindEntity(inst, TUNING.MINOTAUR_TARGET_DIST, function(guy)
            return not (inst.components.follower and inst.components.follower.leader == guy)
                   and inst.components.combat:CanTarget(guy)
    end,
    nil,
    {"chess"},
    {"character","monster"}
    )
    return newtarget
end

local function KeepTarget(inst, target)

    if inst.sg and inst.sg:HasStateTag("running") then
        return true
    end

    local homePos = inst.components.knownlocations:GetLocation("home")
    local myPos = Vector3(inst.Transform:GetWorldPosition() )
    return (homePos and distsq(homePos, myPos) < 40*40)
end

local function OnAttacked(inst, data)
    local attacker = data and data.attacker
    if attacker and attacker:HasTag("chess") then return end
    inst.components.combat:SetTarget(attacker)
    inst.components.combat:ShareTarget(attacker, SHARE_TARGET_DIST, function(dude) return dude:HasTag("chess") end, MAX_TARGET_SHARES)
end

local function onsmashother(inst, other)
    if not other:IsValid() then
        return
    elseif other.components.health ~= nil and not other.components.health:IsDead() then
        if other:HasTag("smashable") then
            --other.Physics:SetCollides(false)
            other.components.health:Kill()
        else
            SpawnPrefab("collapse_small").Transform:SetPosition(other.Transform:GetWorldPosition())
            inst.SoundEmitter:PlaySound("dontstarve/creatures/rook/explo") 
            inst.components.combat:DoAttack(other)
        end
    elseif other.components.workable ~= nil and other.components.workable:CanBeWorked() then
        SpawnPrefab("collapse_small").Transform:SetPosition(other.Transform:GetWorldPosition())
        other.components.workable:Destroy(inst)
    end
end

local function oncollide(inst, other)
    if other == nil or
        not other:IsValid() or
        other:HasTag("player") or
        Vector3(inst.Physics:GetVelocity()):LengthSq() < 42 then
        return
    end

    for i, v in ipairs(AllPlayers) do
        v:ShakeCamera(CAMERASHAKE.SIDE, .5, .05, .1, inst, 40)
    end

    inst:DoTaskInTime(2 * FRAMES, onsmashother, other)
end

local function spawnchest(inst)
    inst:DoTaskInTime(3, function()

        inst.SoundEmitter:PlaySound("dontstarve/common/ghost_spawn")
        
        local chest = SpawnPrefab("minotaurchest")
        local x, y, z = inst.Transform:GetWorldPosition()
        chest.Transform:SetPosition(x, 0, z)

        local fx = SpawnPrefab("statue_transition_2")
        if fx ~= nil then
            fx.Transform:SetPosition(x, y, z)
            fx.Transform:SetScale(1, 2, 1)
        end

        fx = SpawnPrefab("statue_transition")
        if fx ~= nil then
            fx.Transform:SetPosition(x, y, z)
            fx.Transform:SetScale(1, 1.5, 1)
        end

        chest:AddComponent("scenariorunner")
        chest.components.scenariorunner:SetScript("chest_minotaur")
        chest.components.scenariorunner:Run()
    end)
end

local function MakeMinotaur()
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
	local sound = inst.entity:AddSoundEmitter()
	local shadow = inst.entity:AddDynamicShadow()
	inst.entity:AddNetwork()
	
	shadow:SetSize( 5, 3 )
    inst.Transform:SetFourFaced()

    MakeCharacterPhysics(inst, 100, 2.2)
    inst.Physics:SetCylinder(2.2, 4)
    inst.Physics:SetCollisionCallback(oncollide)

    anim:SetBank("rook")
    anim:SetBuild("rook_rhino")

    inst:AddComponent("locomotor")
    inst.components.locomotor.walkspeed = TUNING.MINOTAUR_WALK_SPEED
    inst.components.locomotor.runspeed =  TUNING.MINOTAUR_RUN_SPEED
    
    inst:SetStateGraph("SGminotaur")

    inst:AddTag("monster")
    inst:AddTag("hostile")
    inst:AddTag("minotaur")
    inst:AddTag("epic")
	
    if not TheWorld.ismastersim then
        return inst
    end

    local brain = require "brains/minotaurbrain"
    inst:SetBrain(brain)
    
    inst:AddComponent("sleeper")
    inst.components.sleeper:SetWakeTest(ShouldWake)
    inst.components.sleeper:SetSleepTest(ShouldSleep)
    inst.components.sleeper:SetResistance(3)

    inst:AddComponent("combat")
    inst.components.combat.hiteffectsymbol = "spring"
    inst.components.combat:SetAttackPeriod(TUNING.MINOTAUR_ATTACK_PERIOD)
    inst.components.combat:SetDefaultDamage(TUNING.MINOTAUR_DAMAGE)
    inst.components.combat:SetRetargetFunction(3, Retarget)
    inst.components.combat:SetKeepTargetFunction(KeepTarget)
    inst.components.combat:SetRange(3,4)

    inst:AddComponent("health")
    inst.components.health:SetMaxHealth(TUNING.MINOTAUR_HEALTH)

    inst:ListenForEvent("death", spawnchest)

    inst:AddComponent("lootdropper")
    inst.components.lootdropper:SetLoot(loot)
    
    inst:AddComponent("inspectable")
    inst:AddComponent("knownlocations")
    
    inst:DoTaskInTime(2*FRAMES, function() inst.components.knownlocations:RememberLocation("home", Vector3(inst.Transform:GetWorldPosition()) ) end)

    MakeMediumBurnableCharacter(inst, "spring")
    MakeMediumFreezableCharacter(inst, "spring")
    
    inst:ListenForEvent("attacked", OnAttacked)

    -- inst:AddComponent("debugger")

    return inst
end

return Prefab("cave/monsters/minotaur", function() return MakeMinotaur(true) end , assets, prefabs)

