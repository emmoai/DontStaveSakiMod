require "prefabutil"
local brain = require "brains/chesterbrain"

local WAKE_TO_FOLLOW_DISTANCE = 14
local SLEEP_NEAR_LEADER_DISTANCE = 7

local assets =
{
    Asset("ANIM", "anim/ui_chester_shadow_3x4.zip"),
    Asset("ANIM", "anim/ui_chest_3x3.zip"),

    Asset("ANIM", "anim/chester.zip"),
    Asset("ANIM", "anim/dogoo_build.zip"),
    Asset("ANIM", "anim/dogoo_shadow_build.zip"),
    Asset("ANIM", "anim/dogoo_snow_build.zip"),

    Asset("SOUND", "sound/chester.fsb"),
}

local prefabs =
{
    "personal_dogoo_eyebone",
    "chesterlight"
}

local function ShouldWakeUp(inst)
    return DefaultWakeTest(inst) or not inst.components.follower:IsNearLeader(WAKE_TO_FOLLOW_DISTANCE)
end

local function ShouldSleep(inst)
    --print(inst, "ShouldSleep", DefaultSleepTest(inst), not inst.sg:HasStateTag("open"), inst.components.follower:IsNearLeader(SLEEP_NEAR_LEADER_DISTANCE))
    return DefaultSleepTest(inst) and not inst.sg:HasStateTag("open") and inst.components.follower:IsNearLeader(SLEEP_NEAR_LEADER_DISTANCE) and not TheWorld.state.isfullmoon
end

local function ShouldKeepTarget()
    return false -- dogoo can't attack, and won't sleep if he has a target
end

local function OnOpen(inst)
    if not inst.components.health:IsDead() then
        inst.sg:GoToState("open")
    end
end

local function OnClose(inst)
    if not inst.components.health:IsDead() and inst.sg.currentstate.name ~= "transition" then
        inst.sg:GoToState("close")
    end
end

-- eye bone was killed/destroyed
local function OnStopFollowing(inst)
    --print("dogoo - OnStopFollowing")
    inst:RemoveTag("companion")
end

local function OnStartFollowing(inst)
    --print("dogoo - OnStartFollowing")
    inst:AddTag("companion")
end

local function MorphShadowDogoo(inst)
    inst.AnimState:SetBuild("dogoo_shadow_build")
    inst:AddTag("spoiler")

    inst.components.container:WidgetSetup("shadowchester")

    local leader = inst.components.follower.leader    
    if leader ~= nil then
        inst.components.follower.leader:MorphShadowEyebone()
    end

    inst.DogooState = "SHADOW"
    inst._isshadowdogoo:set(true)
end


local function MorphSnowDogoo(inst)
    inst.AnimState:SetBuild("dogoo_snow_build")
    inst:AddTag("fridge")

    local leader = inst.components.follower.leader
    if leader ~= nil then
        inst.components.follower.leader:MorphSnowEyebone()
    end

    inst.DogooState = "SNOW"
    inst._isshadowdogoo:set(false)
end


local function MorphNormalDogoo(inst)
    inst.AnimState:SetBuild("dogoo_build")
    inst:RemoveTag("fridge")
    inst:RemoveTag("spoiler")

    inst.components.container:WidgetSetup("chester")

    local leader = inst.components.follower.leader    
    if leader ~= nil then
        inst.components.follower.leader:MorphNormalEyebone()
    end

    inst.DogooState = "NORMAL"
    inst._isshadowdogoo:set(false)
end
--


local function CanMorph(inst)
    if inst.DogooState ~= "NORMAL" or not TheWorld.state.isfullmoon then
        return false, false
    end

    local container = inst.components.container
    if container:IsOpen() then
        return false, false
    end

    local canShadow = true
    local canSnow = true

    for i = 1, container:GetNumSlots() do
        local item = container:GetItemInSlot(i)
        if item == nil then
            return false, false
        end

        canShadow = canShadow and item.prefab == "nightmarefuel"
        canSnow = canSnow and item.prefab == "bluegem"

        if not (canShadow or canSnow) then
            return false, false
        end
    end

    return canShadow, canSnow
end


local function CheckForMorph(inst)
    local canShadow, canSnow = CanMorph(inst)
    if canShadow or canSnow then
        inst.sg:GoToState("transition")
    end
end

local function DoMorph(inst, fn)
    inst.MorphChester = nil
    inst:StopWatchingWorldState("isfullmoon", CheckForMorph)
    inst:RemoveEventCallback("onclose", CheckForMorph)
    fn(inst) 
end
local function MorphDogoo(inst)
    local canShadow, canSnow = CanMorph(inst)
    if not (canShadow or canSnow) then
        return
    end

    local container = inst.components.container
    for i = 1, container:GetNumSlots() do
        container:RemoveItem(container:GetItemInSlot(i)):Remove()
    end

    DoMorph(inst, canShadow and MorphShadowDogoo or MorphSnowDogoo)
end

local function OnSave(inst, data)
    data.DogooState = inst.DogooState
end

local function OnPreLoad(inst, data)
    if data == nil then
        return
    elseif data.DogooState == "SHADOW" then
        DoMorph(inst, MorphShadowDogoo)
    elseif data.DogooState == "SNOW" then
        DoMorph(inst, MorphSnowDogoo)
    end
end

local function OnIsShadowDogooDirty(inst)
    if inst._isshadowdogoo:value() ~= inst._clientshadowmorphed then
        inst._clientshadowmorphed = inst._isshadowdogoo:value()
        inst.replica.container:WidgetSetup(inst._clientshadowmorphed and "shadowchester" or nil)
    end
end

local function create_dogoo()
    --print("dogoo - create_dogoo")

    local inst = CreateEntity()
    
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    MakeCharacterPhysics(inst, 75, .5)
    inst.Physics:SetCollisionGroup(COLLISION.CHARACTERS)
    inst.Physics:ClearCollisionMask()
    inst.Physics:CollidesWith(COLLISION.WORLD)
    inst.Physics:CollidesWith(COLLISION.OBSTACLES)
    inst.Physics:CollidesWith(COLLISION.CHARACTERS)

    inst:AddTag("companion")
    inst:AddTag("character")
    inst:AddTag("scarytoprey")
    inst:AddTag("personal_dogoo")
    inst:AddTag("notraptrigger")
	
    inst:AddTag("_named")

    inst.MiniMapEntity:SetIcon("personal_dogoo.tex")
    inst.MiniMapEntity:SetCanUseCache(false)

    inst.AnimState:SetBank("dogoo")
    inst.AnimState:SetBuild("dogoo_build")

    inst.DynamicShadow:SetSize(2, 1.5)

    inst.Transform:SetFourFaced()

    inst._isshadowdogoo = net_bool(inst.GUID, "_isshadowdogoo", "onisshadowdogoodirty")
	

	

    inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
		inst:DoTaskInTime(0.1, function(inst)
			inst.replica.container:WidgetSetup(inst._isshadowdogoo:value() and "shadowchester" or "chester")
		end)
        inst._clientshadowmorphed = false
        inst:ListenForEvent("onisshadowdogoodirty", OnIsShadowDogooDirty)
        return inst
    end
	
	-- Dogoo will not be saved normally. He is saved with the player.
	inst.persists = false

    ------------------------------------------

    --print("   combat")
    inst:AddComponent("combat")
    inst.components.combat.hiteffectsymbol = "dogoo_body"
    inst.components.combat:SetKeepTargetFunction(ShouldKeepTarget)
	local self = inst.components.combat
	local old = self.GetAttacked
	function self:GetAttacked(attacker, damage, weapon, stimuli)
		if attacker then
			return true
		end
		return old(self, attacker, damage, weapon, stimuli)
	end
    --inst:ListenForEvent("attacked", OnAttacked)

    --print("   health")
    inst:AddComponent("health")
    inst.components.health:SetMaxHealth(TUNING.CHESTER_HEALTH)
    inst.components.health:StartRegen(TUNING.CHESTER_HEALTH_REGEN_AMOUNT, TUNING.CHESTER_HEALTH_REGEN_PERIOD)
    inst:AddTag("noauradamage")

    --print("   inspectable")
    inst:AddComponent("inspectable")
    inst.components.inspectable:RecordViews()
    --inst.components.inspectable.getstatus = GetStatus
    inst.components.inspectable.nameoverride = "dogoo"

    --print("   locomotor")
    inst:AddComponent("locomotor")
    inst.components.locomotor.walkspeed = 3
    inst.components.locomotor.runspeed = 7

    --print("   follower")
    inst:AddComponent("follower")
    inst:ListenForEvent("stopfollowing", OnStopFollowing)
    inst:ListenForEvent("startfollowing", OnStartFollowing)

    --print("   knownlocations")
    inst:AddComponent("knownlocations")

    --print("   burnable")
    MakeSmallBurnableCharacter(inst, "dogoo_body")

    --("   container")
    inst:AddComponent("container")
    inst.components.container:WidgetSetup("chester")
    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose

    --print("   sleeper")
    inst:AddComponent("sleeper")
    inst.components.sleeper:SetResistance(3)
    inst.components.sleeper.testperiod = GetRandomWithVariance(6, 2)
    inst.components.sleeper:SetSleepTest(ShouldSleep)
    inst.components.sleeper:SetWakeTest(ShouldWakeUp)
	
    inst:AddComponent("named")

    MakeHauntableDropFirstItem(inst)
    AddHauntableCustomReaction(inst, function(inst, haunter)
        if math.random() <= TUNING.HAUNT_CHANCE_ALWAYS then
            inst.components.hauntable.panic = true
            inst.components.hauntable.panictimer = TUNING.HAUNT_PANIC_TIME_SMALL
            inst.components.hauntable.hauntvalue = TUNING.HAUNT_SMALL
            return true
        end
        return false
    end, false, false, true)

    --print("   sg")
    inst:SetStateGraph("SGchester")
    inst.sg:GoToState("idle")

    --print("   brain")
    inst:SetBrain(brain)

    inst.DogooState = "NORMAL"
    inst.MorphChester = MorphDogoo
    inst:WatchWorldState("isfullmoon", CheckForMorph)
    inst:ListenForEvent("onclose", CheckForMorph)

    inst.OnSave = OnSave
    inst.OnPreLoad = OnPreLoad

    --print("dogoo - create_dogoo END")
	
		
    return inst
end

return Prefab("common/personal_dogoo", create_dogoo, assets, prefabs)
