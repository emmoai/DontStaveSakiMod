local prefabs =
{
    "nightmarefuel",
}

local brain = require( "brains/nightmarecreaturebrain")

local function retargetfn(inst)
    return FindEntity(inst, TUNING.SHADOWCREATURE_TARGET_DIST,
        function(guy) 
            return inst.components.combat:CanTarget(guy)
        end,
        { "player" },
        { "playerghost" }
    )
end

SetSharedLootTable('nightmare_creature',
{
    {'nightmarefuel', 1.0},
    {'nightmarefuel', 0.5},
})

local function CanShareTargetWith(dude)
    return dude:HasTag("shadowcreature") and not dude.components.health:IsDead()
end

local function OnAttacked(inst, data)
    if data.attacker ~= nil then
        inst.components.combat:SetTarget(data.attacker)
        inst.components.combat:ShareTarget(data.attacker, 30, CanShareTargetWith, 1)
    end
end

local function MakeShadowCreature(data)
    local bank = data.bank 
    local build = data.build 

    local assets =
    {
        Asset("ANIM", "anim/"..data.build..".zip"),
    }

    local sounds = 
    {
        attack = "dontstarve/sanity/creature"..data.num.."/attack",
        attack_grunt = "dontstarve/sanity/creature"..data.num.."/attack_grunt",
        death = "dontstarve/sanity/creature"..data.num.."/die",
        idle = "dontstarve/sanity/creature"..data.num.."/idle",
        taunt = "dontstarve/sanity/creature"..data.num.."/taunt",
        appear = "dontstarve/sanity/creature"..data.num.."/appear",
        disappear = "dontstarve/sanity/creature"..data.num.."/dissappear",
    }

    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddSoundEmitter()
        inst.entity:AddNetwork()

        inst.Transform:SetFourFaced()

        MakeCharacterPhysics(inst, 10, 1.5)
        RemovePhysicsColliders(inst)
        inst.Physics:SetCollisionGroup(COLLISION.SANITY)
        inst.Physics:CollidesWith(COLLISION.SANITY)      
         
        inst.AnimState:SetBank(bank)
        inst.AnimState:SetBuild(build)
        inst.AnimState:PlayAnimation("idle_loop")
        inst.AnimState:SetMultColour(1, 1, 1, 0.5)

        inst:AddTag("shadowcreature")
        inst:AddTag("monster")
        inst:AddTag("hostile")
        inst:AddTag("shadow")
        inst:AddTag("notraptrigger")

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst:AddComponent("locomotor") -- locomotor must be constructed before the stategraph
        inst.components.locomotor.walkspeed = data.speed
        inst.sounds = sounds

        inst:SetStateGraph("SGshadowcreature")
        inst:SetBrain(brain)

        inst:AddComponent("sanityaura")
        inst.components.sanityaura.aura = -TUNING.SANITYAURA_LARGE

        inst:AddComponent("health")
        inst.components.health:SetMaxHealth(data.health)

        inst:AddComponent("combat")
        inst.components.combat:SetDefaultDamage(data.damage)
        inst.components.combat:SetAttackPeriod(data.attackperiod)
        inst.components.combat:SetRetargetFunction(3, retargetfn)

        inst:AddComponent("lootdropper")
        inst.components.lootdropper:SetChanceLootTable('nightmare_creature')

        inst:ListenForEvent("attacked", OnAttacked)
        -- if GetNightmareClock() then
        --     inst:ListenForEvent( "phasechange", 
        --                         function (source,data)
        --                             dprint("phase:",data.newphase)
        --                             if data.newphase == "dawn" then
        --                                 local dawntime = GetNightmareClock():GetDawnTime()
        --                                 inst:DoTaskInTime(GetRandomWithVariance(dawntime/2,dawntime/3),
        --                                                     function()
        --                                                         -- otherwise we end up with a lot of piles of nightmareful
        --                                                         inst.components.lootdropper:SetLoot({})
        --                                                         inst.sg:GoToState("disappear")
        --                                                     end)
        --                             end
        --                         end,
        --                         TheWorld)

        -- end

        inst:AddComponent("knownlocations")

        return inst
    end

    return Prefab("monsters/"..data.name, fn, assets, prefabs)
end

local data =
{
    {
        name = "crawlingnightmare",
        build = "shadow_insanity1_basic",
        bank = "shadowcreature1",
        num = 1,
        speed = TUNING.CRAWLINGHORROR_SPEED,
        health = TUNING.CRAWLINGHORROR_HEALTH,
        damage = TUNING.CRAWLINGHORROR_DAMAGE,
        attackperiod = TUNING.CRAWLINGHORROR_ATTACK_PERIOD,
        sanityreward = TUNING.SANITY_MED,
    },
    {
        name = "nightmarebeak",
        build = "shadow_insanity2_basic",
        bank = "shadowcreature2",
        num = 2,
        speed = TUNING.TERRORBEAK_SPEED,
        health = TUNING.TERRORBEAK_HEALTH,
        damage = TUNING.TERRORBEAK_DAMAGE,
        attackperiod = TUNING.TERRORBEAK_ATTACK_PERIOD,
        sanityreward = TUNING.SANITY_LARGE,
    },
}

local ret = {}
for i, v in ipairs(data) do
    table.insert(ret, MakeShadowCreature(v))
end

return unpack(ret) 
