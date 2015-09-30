local assets =
{
    Asset("ANIM", "anim/dogoo_eyebone.zip"),
    Asset("ANIM", "anim/dogoo_eyebone_build.zip"),
    Asset("ANIM", "anim/dogoo_eyebone_snow_build.zip"),
    Asset("ANIM", "anim/dogoo_eyebone_shadow_build.zip"),
     
    Asset("ATLAS", "images/inventoryimages/dogoo_eyebone.xml"),
    Asset("ATLAS", "images/inventoryimages/dogoo_eyebone_closed.xml"),
    Asset("ATLAS", "images/inventoryimages/dogoo_eyebone_snow.xml"),
    Asset("ATLAS", "images/inventoryimages/dogoo_eyebone_closed_snow.xml"),
    Asset("ATLAS", "images/inventoryimages/dogoo_eyebone_shadow.xml"),
    Asset("ATLAS", "images/inventoryimages/dogoo_eyebone_closed_shadow.xml"),
}
  
local SPAWN_DIST = 30
  
local function OpenEye(inst)
    inst.isOpenEye = true
    inst.components.inventoryitem.atlasname = "images/inventoryimages/"..inst.openEye..".xml"
    inst.components.inventoryitem:ChangeImageName(inst.openEye)
end
  
local function CloseEye(inst)
    inst.isOpenEye = nil
    inst.components.inventoryitem.atlasname = "images/inventoryimages/"..inst.closedEye..".xml"
    inst.components.inventoryitem:ChangeImageName(inst.closedEye)
end
  
local function RefreshEye(inst)
    if inst.isOpenEye then
        OpenEye(inst)
    else
        CloseEye(inst)
    end
end
  
local function MorphShadowEyebone(inst)
    inst.AnimState:SetBuild("dogoo_eyebone_shadow_build")
  
    inst.openEye = "dogoo_eyebone_shadow"
    inst.closedEye = "dogoo_eyebone_closed_shadow"
    RefreshEye(inst)
  
    inst.EyeboneState = "SHADOW"
end
  
local function MorphSnowEyebone(inst)
    inst.AnimState:SetBuild("dogoo_eyebone_snow_build")
  
    inst.openEye = "dogoo_eyebone_snow"
    inst.closedEye = "dogoo_eyebone_closed_snow"
    RefreshEye(inst)
  
    inst.EyeboneState = "SNOW"
end
  
--[[
local function MorphNormalEyebone(inst)
    inst.AnimState:SetBuild("dogoo_eyebone_build")
  
    inst.openEye = "dogoo_eyebone"
    inst.closedEye = "dogoo_eyebone_closed"  
    RefreshEye(inst)
  
    inst.EyeboneState = "NORMAL"
end
]]
  
local function GetSpawnPoint(pt)
    local theta = math.random() * 2 * PI
    local radius = SPAWN_DIST
    local offset = FindWalkableOffset(pt, theta, radius, 12, true)
    return offset ~= nil and (pt + offset) or nil
end
  
local function SpawnDogoo(inst)
    if not inst.owner then
        print("Error: Eyebone has no linked player!")
        return
    end
    --print("dogoo_eyebone - SpawnDogoo")
  
    local pt = inst:GetPosition()
    --print("    near", pt)
          
    local spawn_pt = GetSpawnPoint(pt)
    if spawn_pt ~= nil then
        --print("    at", spawn_pt)
        local dogoo = SpawnPrefab("personal_dogoo")
        if dogoo ~= nil then
            dogoo.Physics:Teleport(spawn_pt:Get())
            dogoo:FacePoint(pt:Get())
            if inst.owner then
                inst.owner.dogoo = dogoo
            end
            return dogoo
        end
  
    --else
        -- this is not fatal, they can try again in a new location by picking up the bone again
        --print("dogoo_eyebone - SpawnDogoo: Couldn't find a suitable spawn point for dogoo")
    end
end
  
local StartRespawn
  
local function StopRespawn(inst)
    --print("dogoo_eyebone - StopRespawn")
    if inst.respawntask ~= nil then
        inst.respawntask:Cancel()
        inst.respawntask = nil
        inst.respawntime = nil
    end
end
  
local function RebindDogoo(inst, dogoo)
    dogoo = dogoo or (inst.owner and inst.owner.dogoo)
    if dogoo ~= nil then
        if inst.owner then
            dogoo.components.named:SetName(inst.owner.name.."'s Dogoo")
        end
        inst.AnimState:PlayAnimation("idle_loop", true)
        OpenEye(inst)
        inst:ListenForEvent("death", function()
            if inst.owner then
                inst.owner.dogoo = nil
            end
            StartRespawn(inst, TUNING.CHESTER_RESPAWN_TIME)
        end, dogoo)
  
        if dogoo.components.follower.leader ~= inst then
            dogoo.components.follower:SetLeader(inst)
        end
        return true
    end
end
  
local function RespawnDogoo(inst)
    --print("dogoo_eyebone - RespawnDogoo")
    StopRespawn(inst)
    RebindDogoo(inst, (inst.owner and inst.owner.dogoo) or SpawnDogoo(inst))
end
  
StartRespawn = function(inst, time)
    StopRespawn(inst)
  
    time = time or 0
    inst.respawntask = inst:DoTaskInTime(time, RespawnDogoo)
    inst.respawntime = GetTime() + time
    inst.AnimState:PlayAnimation("dead", true)
    CloseEye(inst)
end
  
local function FixDogoo(inst)
    inst.fixtask = nil
    --take an existing dogoo if there is one
    if not RebindDogoo(inst) then
        inst.AnimState:PlayAnimation("dead", true)
        CloseEye(inst)
          
        if inst.components.inventoryitem.owner ~= nil then
            local time_remaining = 0
            local time = GetTime()
            if inst.respawntime and inst.respawntime > time then
                time_remaining = inst.respawntime - time        
            end
            StartRespawn(inst, time_remaining)
        end
    end
end
  
local function OnPutInInventory(inst)
    if inst.fixtask == nil then
        inst.fixtask = inst:DoTaskInTime(1, FixDogoo)
    end
end
  
  
local function OnSave(inst, data)
    --print("dogoo_eyebone - OnSave")
    --data.EyeboneState = inst.EyeboneState
    if inst.respawntime ~= nil then
        local time = GetTime()
        if inst.respawntime > time then
            data.respawntimeremaining = inst.respawntime - time
        end
    end
end
  
local function OnLoad(inst, data)
    if data == nil then
        return
    end
  
    if data.EyeboneState == "SHADOW" then
        MorphShadowEyebone(inst)
    elseif data.EyeboneState == "SNOW" then
        MorphSnowEyebone(inst)
    end
  
    if data.respawntimeremaining ~= nil then
        inst.respawntime = data.respawntimeremaining + GetTime()
    end
end
  
  
local function GetStatus(inst)
    --print("smallbird - GetStatus")
    if inst.respawntask ~= nil then
        return "WAITING"
    end
end
  
local function fn()
    local inst = CreateEntity()
  
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
  
    --so I can find the thing while testing
    --inst.entity:AddMiniMapEntity()
    --inst.MiniMapEntity:SetIcon("treasure.png")
  
    MakeInventoryPhysics(inst)
  
    inst:AddTag("personal_dogoo_eyebone")
    inst:AddTag("irreplaceable")
    inst:AddTag("nonpotatable")
      
    inst:AddTag("_named")
  
    inst.AnimState:SetBank("eyebone")
    inst.AnimState:SetBuild("dogoo_eyebone_build")
    inst.AnimState:PlayAnimation("idle_loop", true)
  
    inst.entity:SetPristine()
  
    if not TheWorld.ismastersim then
        return inst
    end
      
    -- Dogoo will not be saved normally. He is saved with the player.
    inst.persists = false
  
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/dogoo_eyebone.xml"
    inst.components.inventoryitem:ChangeImageName("dogoo_eyebone")
    inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)
  
    inst.EyeboneState = "NORMAL"
    inst.openEye = "dogoo_eyebone"
    inst.closedEye = "dogoo_eyebone_closed"
  
    inst.isOpenEye = nil
    OpenEye(inst)
  
    inst:AddComponent("inspectable")
    inst.components.inspectable.getstatus = GetStatus
    inst.components.inspectable:RecordViews()
    inst.components.inspectable.nameoverride = "dogoo_eyebone"
  
    inst:AddComponent("leader")
      
      
    inst:AddComponent("named")
  
    MakeHauntableLaunch(inst)
  
    --inst.MorphNormalEyebone = MorphNormalEyebone
    inst.MorphSnowEyebone = MorphSnowEyebone
    inst.MorphShadowEyebone = MorphShadowEyebone
  
    inst.OnLoad = OnLoad
    inst.OnSave = OnSave
  
    inst.fixtask = inst:DoTaskInTime(1, FixDogoo)
    inst.RebindDogoo = RebindDogoo
  
    return inst
end
  
return Prefab("common/inventory/personal_dogoo_eyebone", fn, assets)