local assets =
{
    Asset("ANIM", "anim/bee.zip"),
    Asset("ANIM", "anim/bee_build.zip"),
    Asset("SOUND", "sound/bee.fsb"),
}

local prefabs =
{
     "ice",
     "honey",
}

local killersounds =
{
    takeoff = "dontstarve/bee/killerbee_takeoff",
    attack = "dontstarve/bee/killerbee_attack",
    buzz = "dontstarve/bee/killerbee_fly_LP",
    hit = "dontstarve/bee/killerbee_hurt",
    death = "dontstarve/bee/killerbee_death",
}


local function shouldKeepTarget()
    return true
end

local function OnWorked(inst, worker)
    local owner = inst.components.homeseeker ~= nil and inst.components.homeseeker.home or nil
    if owner ~= nil and owner.components.childspawner ~= nil then
        owner.components.childspawner:OnChildKilled(inst)
    end
    if worker.components.inventory ~= nil then
        if METRICS_ENABLED then
            FightStat_Caught(inst)
        end

        inst.SoundEmitter:KillAllSounds()

        worker.components.inventory:GiveItem(inst, nil, inst:GetPosition())
    end
end

local function KillerRetarget(inst)
    return FindEntity(inst, SpringCombatMod(8),
        function(guy)
            return inst.components.combat:CanTarget(guy)
        end,
        { "_combat", "_health" },
        { "insect", "INLIMBO" },
        {  "animal", "monster" })
end

local function commonfn(build, tags)
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddLightWatcher()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    MakeCharacterPhysics(inst, 1, .5)
    inst.Physics:SetCollisionGroup(COLLISION.FLYERS)
    inst.Physics:ClearCollisionMask()
    inst.Physics:CollidesWith(COLLISION.WORLD)
    inst.Physics:CollidesWith(COLLISION.FLYERS)

    inst.DynamicShadow:SetSize(.8, .5)
    inst.Transform:SetFourFaced()

    inst.Transform:SetScale(1.2, 1.2, 1.2)
    --inst.AnimState:OverrideMultColour(255,255,255,1)

    inst:AddTag("bee")
    inst:AddTag("insect")
    inst:AddTag("smallcreature")
    inst:AddTag("cattoyairborne")
    inst:AddTag("flying")
    for i, v in ipairs(tags) do
        inst:AddTag(v)
    end

    inst.AnimState:SetBank("bee")
    inst.AnimState:SetBuild(build)
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:SetRayTestOnBB(true)

    MakeFeedableSmallLivestockPristine(inst)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("locomotor") -- locomotor must be constructed before the stategraph
    inst.components.locomotor:EnableGroundSpeedMultiplier(false)
    inst.components.locomotor:SetTriggersCreep(false)
    inst:SetStateGraph("SGbee")

    inst:AddComponent("lootdropper")
    inst.components.lootdropper:AddRandomLoot("honey", 1)
    inst.components.lootdropper:AddRandomLoot("ice", 5)   
    inst.components.lootdropper.numrandomloot = 1
    inst:AddComponent("lootdropper")
    inst.components.lootdropper:SetLoot({})

    MakeSmallBurnableCharacter(inst, "body", Vector3(0, -1, 1))
    MakeTinyFreezableCharacter(inst, "body", Vector3(0, -1, 1))

    ------------------

    inst:AddComponent("health")
    inst.components.health:SetMaxHealth(TUNING.TENTACLE_HEALTH)

    inst:AddComponent("combat")
    inst.components.combat:SetRange(2)
    inst.components.combat:SetDefaultDamage(TUNING.TENTACLE_DAMAGE)
    inst.components.combat:SetAttackPeriod(TUNING.TENTACLE_ATTACK_PERIOD)
    inst.components.combat:SetKeepTargetFunction(shouldKeepTarget)

    inst:AddComponent("knownlocations")

    inst:DoTaskInTime(11, inst.Remove)

    return inst
end

local killerbrain = require("brains/killerbeebrain")

local function OnWake(inst)
    --if not inst.components.inventoryitem:IsHeld() then
        inst.SoundEmitter:PlaySound(inst.sounds.buzz, "buzz")
    --end
end

local function OnSleep(inst)
    inst.SoundEmitter:KillSound("buzz")
end

local function OnSpawnedFromHaunt(inst)
    if inst.components.hauntable ~= nil then
        inst.components.hauntable:Panic()
    end
end

local function icebee()

    local inst = commonfn("bee_build", { "killer", "scarytoprey" })

    if not TheWorld.ismastersim then
        return inst
    end

    inst.components.health:SetMaxHealth(TUNING.BEE_HEALTH)
    inst.components.combat:SetDefaultDamage(TUNING.BEE_DAMAGE)
    inst.components.combat:SetAttackPeriod(TUNING.BEE_ATTACK_PERIOD)
    inst.components.combat:SetRetargetFunction(2, KillerRetarget)
    inst:SetBrain(killerbrain)
    inst.sounds = killersounds

    inst.OnEntityWake = OnWake
    inst.OnEntitySleep = OnSleep    

    MakeHauntablePanic(inst)
    inst:ListenForEvent("spawnedfromhaunt", OnSpawnedFromHaunt)

    return inst

end

return Prefab("common/inventory/icebee",icebee,assets,prefabs)