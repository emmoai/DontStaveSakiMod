local assets =
{
	Asset("ANIM", "anim/blue_shot_projectile.zip"),

    Asset("ATLAS", "images/inventoryimages/blue_shot.xml"),
    Asset("IMAGE", "images/inventoryimages/blue_shot.tex")
}

local function OnShoot(inst, owner, target)
    inst.AnimState:PlayAnimation("dud", true)
end

local function OnHit(inst, owner, target)
    inst:Remove()
    local impactfx = SpawnPrefab("dud_impact")
    if impactfx then
        local follower = impactfx.entity:AddFollower()
        follower:FollowSymbol(target.GUID, target.components.combat.hiteffectsymbol, 0, 0, 0 )
        impactfx:FacePoint(inst.Transform:GetWorldPosition())
    end
    owner.SoundEmitter:PlaySound("dontstarve/creatures/hound/firehound_explo", "explosion")
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
    RemovePhysicsColliders(inst)

    inst.AnimState:SetBank("shooter")
    inst.AnimState:SetBuild("blue_shot_projectile")
    inst.AnimState:PlayAnimation("idle")
    --if bloom ~= nil then
    --    inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
    --end

    inst:AddTag("projectile")

    if not TheWorld.ismastersim then
        return inst
    end

    inst.entity:SetPristine()
    
    inst:AddComponent("projectile")
    inst.components.projectile:SetSpeed(20)
    inst.components.projectile:SetOnThrownFn(OnShoot)
    inst.components.projectile:SetOnHitFn(OnHit)
    inst.components.projectile:SetOnMissFn(inst.Remove)

    inst:AddComponent("stackable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "blue_shot"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/blue_shot.xml"


    return inst
end

return Prefab("common/inventory/dud", fn, assets)