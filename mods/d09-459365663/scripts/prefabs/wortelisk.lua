--Down when sane, up when insane.
local assets =
{
    Asset("ANIM", "anim/wortelisk.zip"),

    Asset( "IMAGE", "images/inventoryimages/wortelisk.tex" ),
    Asset ("ATLAS", "images/inventoryimages/wortelisk.xml" ),
}

local prefabs =
{
    "sanity_raise",
    "sanity_lower",
}


local COLLISION_SIZE = 1 --must be an int
local NEAR_DIST_SQ = 25 * 25
local FAR_DIST_SQ = 26 * 26

local UPDATE_INTERVAL = .2
local UPDATE_OFFSET = 0 --used to stagger periodic updates across entities

--V2C: Use a shared add/remove wall because regions may overlap
local PF_SHARED = {}

local function AddSharedWall(pathfinder, x, z, inst)
    local id = tostring(x)..","..tostring(z)
    if PF_SHARED[id] == nil then
        PF_SHARED[id] = { [inst] = true }
        pathfinder:AddWall(x, 0, z)
    else
        PF_SHARED[id][inst] = true
    end
end

local function RemoveSharedWall(pathfinder, x, z, inst)
    local id = tostring(x)..","..tostring(z)
    if PF_SHARED[id] ~= nil then
        PF_SHARED[id][inst] = nil
        if next(PF_SHARED[id]) ~= nil then
            return
        end
        PF_SHARED[id] = nil
    end
    pathfinder:RemoveWall(x, 0, z)
end

local function OnIsPathFindingDirty(inst)
    if inst._ispathfinding:value() then
        if inst._pftable == nil then
            inst._pftable = {}
            local pathfinder = TheWorld.Pathfinder
            local x, y, z = inst.Transform:GetWorldPosition()
            x = math.floor(x * 100 + .5) / 100
            z = math.floor(z * 100 + .5) / 100
            for dx = -COLLISION_SIZE, COLLISION_SIZE do
                local x1 = x + dx
                for dz = -COLLISION_SIZE, COLLISION_SIZE do
                    local z1 = z + dz
                    AddSharedWall(pathfinder, x1, z1, inst)
                    table.insert(inst._pftable, { x1, z1 })
                end
            end
        end
    elseif inst._pftable ~= nil then
        local pathfinder = TheWorld.Pathfinder
        for i, v in ipairs(inst._pftable) do
            RemoveSharedWall(pathfinder, v[1], v[2], inst)
        end
        inst._pftable = nil
    end
end

local function InitializePathFinding(inst, isready)
    if isready then
        inst:ListenForEvent("onispathfindingdirty", OnIsPathFindingDirty)
        OnIsPathFindingDirty(inst)
    else
        inst:DoTaskInTime(0, InitializePathFinding, true)
    end
end

local function turnonpathfinding(inst)
    _ispathfinding:set(true)
end

local function turnoffpathfinding(inst)
    _ispathfinding:set(false)
end

local function setactivephysics(inst)
    inst.Physics:SetCollisionGroup(COLLISION.OBSTACLES)
    inst.Physics:ClearCollisionMask()
    inst.Physics:CollidesWith(COLLISION.WORLD)
    inst.Physics:CollidesWith(COLLISION.ITEMS)
    inst.Physics:CollidesWith(COLLISION.CHARACTERS)
end

local function setinactivephysics(inst)
    inst.Physics:SetCollisionGroup(COLLISION.OBSTACLES)
    inst.Physics:ClearCollisionMask()
    inst.Physics:CollidesWith(COLLISION.WORLD)
    inst.Physics:CollidesWith(COLLISION.ITEMS)
end

local function transitionactive(inst)
    inst.active = true
    inst.AnimState:PlayAnimation("raise")
    inst.AnimState:PushAnimation("idle_active", true)
    setactivephysics(inst)
    inst._ispathfinding:set(true)
    inst.SoundEmitter:PlaySound("dontstarve/sanity/shadowrock_up")
    SpawnPrefab("sanity_raise").Transform:SetPosition(inst.Transform:GetWorldPosition())
end

local function transitioninactive(inst)
    inst.active = false
    inst.AnimState:PlayAnimation("lower")
    inst.AnimState:PushAnimation("idle_inactive", true)
    setinactivephysics(inst)
    inst._ispathfinding:set(false)
    inst.SoundEmitter:PlaySound("dontstarve/sanity/shadowrock_down")
    SpawnPrefab("sanity_lower").Transform:SetPosition(inst.Transform:GetWorldPosition())
end

local function setactive(inst, force)
    if not force and (inst.active or inst.activatetask ~= nil) then
        return
    end

    if inst.deactivatetask ~= nil then
        inst.deactivatetask:Cancel()
        inst.deactivatetask = nil
    end

    if force then
        if inst.activatetask ~= nil then
            inst.activatetask:Cancel()
            inst.activatetask = nil
        end

        inst.active = true
        inst.AnimState:PlayAnimation("idle_active")
        setactivephysics(inst)
        inst._ispathfinding:set(true)
    else
        inst.activatetask = inst:DoTaskInTime(math.random(), transitionactive) 
    end


    inst.components.inverseaura:Enable(true)
end

local function setinactive(inst, force)
    if not force and (not inst.active or inst.deactivatetask ~= nil) then
        return
    end

    if inst.activatetask ~= nil then
        inst.activatetask:Cancel()
        inst.activatetask = nil
    end

    if force then
        if inst.deactivatetask ~= nil then
            inst.deactivatetask:Cancel()
            inst.deactivatetask = nil
        end

        inst.active = false
        inst.AnimState:PlayAnimation("idle_inactive")
        setinactivephysics(inst)
        inst._ispathfinding:set(false)
    else
        inst.deactivatetask = inst:DoTaskInTime(math.random(), transitioninactive)  
    end

    inst.components.inverseaura:Enable(false)
end

local function refresh(inst)
    local x, y, z = inst.Transform:GetWorldPosition()
    if inst.active then
        for i, v in ipairs(AllPlayers) do
            if not v:HasTag("notarget") and
                v.components.sanity ~= nil and
                v.components.sanity:IsSane() == inst.activeonsane and v:HasTag("wortox") then
                local p1x, p1y, p1z = v.Transform:GetWorldPosition()
                if distsq(x, z, p1x, p1z) < FAR_DIST_SQ then
                    return
                end
            end
        end
        setinactive(inst)
    else
        for i, v in ipairs(AllPlayers) do
            if not v:HasTag("notarget") and
                v.components.sanity ~= nil and
                v.components.sanity:IsSane() == inst.activeonsane and v:HasTag("wortox") then
                local p1x, p1y, p1z = v.Transform:GetWorldPosition()
                if distsq(x, z, p1x, p1z) < NEAR_DIST_SQ then
                    setactive(inst)
                    return
                end
            end
        end
    end
end

local function getstatus(inst)
    return inst.active and "ACTIVE" or "INACTIVE"
end

local function onremove(inst)
    inst._ispathfinding:set_local(false)
    OnIsPathFindingDirty(inst)
end

local transformables =
{
    { old = "bee", new = "killerbee" },
    { old = "beehive", new = "wasphive" },
    { old = "flower", new = "flower_evil" },
    { old = "pond", new = "lava_pond", chance = TUNING.WORTELISK_CHANCE },
    { old = "pond_mos", new = "lava_pond", chance = TUNING.WORTELISK_CHANCE },
    { old = "pighouse", new = "mermhouse", chanc = TUNING.WORTELISK_CHANCE },
    { old = "rabbithole", new = "spiderden", chance = TUNING.WORTELISK_CHANCE, alternative = "rabbithouse", alternate_chance = (TUNING.WORTELISK_ALT_CHANCE / 10) },
    { old = "rabbit", new = "spider", alternative = "bunnyman", alternate_chance = TUNING.WORTELISK_ALT_CHANCE },
    { old = "evergreen", new = "leif", chance = TUNING.WORTELISK_CHANCE, alternative = "livingtree", alternate_chance = TUNING.WORTELISK_ALT_CHANCE},
    { old = "evergreen_normal", new = "leif", chance = TUNING.WORTELISK_CHANCE, alternative = "livingtree", alternate_chance = TUNING.WORTELISK_ALT_CHANCE},
    { old = "evergreen_short", new = "leif", chance = TUNING.WORTELISK_CHANCE, alternative = "livingtree", alternate_chance = TUNING.WORTELISK_ALT_CHANCE},
    { old = "evergreen_tall", new = "leif", chance = TUNING.WORTELISK_CHANCE, alternative = "livingtree", alternate_chance = TUNING.WORTELISK_ALT_CHANCE},
    { old = "evergreen_sparse", new = "leif", chance = TUNING.WORTELISK_CHANCE, alternative = "livingtree", alternate_chance = TUNING.WORTELISK_ALT_CHANCE},
    { old = "evergreen_sparse_normal", new = "leif", chance = TUNING.WORTELISK_CHANCE, alternative = "livingtree", alternate_chance = TUNING.WORTELISK_ALT_CHANCE},
    { old = "evergreen_sparse_tall", new = "leif", chance = TUNING.WORTELISK_CHANCE, alternative = "livingtree", alternate_chance = TUNING.WORTELISK_ALT_CHANCE},
    { old = "evergreen_sparse_short", new = "leif", chance = TUNING.WORTELISK_CHANCE, alternative = "livingtree", alternate_chance = TUNING.WORTELISK_ALT_CHANCE},
    { old = "statuemaxwell", new = "treasurechest" },
}

local function commonfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    MakeObstaclePhysics(inst, COLLISION_SIZE)

    inst.MiniMapEntity:SetIcon("obelisk.png")

    inst.AnimState:SetBank("wortelisk")
    inst.AnimState:SetBuild("wortelisk")
    inst.AnimState:PlayAnimation("idle_inactive")

    inst._pftable = nil
    inst._ispathfinding = net_bool(inst.GUID, "_ispathfinding", "onispathfindingdirty")
    InitializePathFinding(inst, TheWorld.ismastersim)

    inst.activeonsane = true

    inst.OnRemoveEntity = onremove

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.active = false
    inst.activatetask = nil
    inst.deactivatetask = nil


    inst:DoPeriodicTask(UPDATE_INTERVAL, refresh, UPDATE_OFFSET)

    --Stagger updates for next spawned entity
    UPDATE_OFFSET = UPDATE_OFFSET + FRAMES
    if UPDATE_OFFSET > UPDATE_INTERVAL then
        UPDATE_OFFSET = 0
    end

    inst:AddComponent("inspectable")
    inst.components.inspectable.getstatus = getstatus

    inst:AddComponent("inverseaura")
    inst.components.inverseaura:SetTickPeriod(1)
    inst.components.inverseaura:SetRadius( ( 20 ) )

    for k, v in pairs(transformables) do

        inst.components.inverseaura:AddItem(v.old, v)

    end

    return inst
end

return Prefab("common/objects/wortelisk", commonfn, assets, prefabs),
    MakePlacer("common/wortelisk_placer", "wortelisk", "wortelisk", "idle_active")