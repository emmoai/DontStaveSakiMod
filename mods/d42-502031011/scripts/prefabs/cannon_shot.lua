local assets =
{
	Asset("ANIM", "anim/cannon_shot_projectile.zip"),

    Asset("ATLAS", "images/inventoryimages/blue_shot.xml"),
    Asset("IMAGE", "images/inventoryimages/blue_shot.tex"),

    Asset("SOUNDPACKAGE", "sound/brs.fev"),
    Asset("SOUND", "sound/brs.fsb"),
}

local NO_TAGS = {"FX", "NOCLICK","DECOR","INLIMBO"}

local function OnShoot(inst, owner, target)
    inst.AnimState:PlayAnimation("lance_shotanim", true)
end

local function ShakeCamera(inst)
            for k, v in pairs(AllPlayers) do
            v:ShakeCamera(CAMERASHAKE.FULL, 1, 0.033, 0.25, inst, 40)
            end
end

local function NoShake(inst)
            for k, v in pairs(AllPlayers) do
            v:ShakeCamera(CAMERASHAKE.FULL, 0, 0, 0, inst, 40)
            end
end

local function OnHit(inst, owner, target)

        inst:Remove()
        local pt = target:GetPosition()
        local range = 3.5
        local x, y, z = target.Transform:GetWorldPosition()
        local ents = TheSim:FindEntities(x, y, z, range, nil, NO_TAGS)
        local impactfx = SpawnPrefab("cannon_shot_impact")
        if owner and owner ~= nil and not owner.components.health:IsDead() then
            impactfx.Transform:SetPosition(x, y+2, z)
            owner.SoundEmitter:PlaySound("brs/brs/shoot")
        end  
        
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
    RemovePhysicsColliders(inst)

    inst.AnimState:SetBank("cannonshot")
    inst.AnimState:SetBuild("cannon_shot_projectile")
    --inst.AnimState:PlayAnimation("idle")

    inst:AddTag("projectile")

    if not TheWorld.ismastersim then
        return inst
    end

    inst.entity:SetPristine()

    inst:AddComponent("inspectable")

    inst:AddComponent("projectile")
    inst.components.projectile:SetSpeed(20)
    inst.components.projectile:SetOnThrownFn(OnShoot)
    inst.components.projectile:SetOnHitFn(OnHit)
    inst.components.projectile:SetOnMissFn(inst.Remove)

    inst:ListenForEvent("trade", NoShake)
    inst:ListenForEvent("onremove", ShakeCamera)

    return inst
    
end

return Prefab("common/inventory/cannon_shot", fn, assets)