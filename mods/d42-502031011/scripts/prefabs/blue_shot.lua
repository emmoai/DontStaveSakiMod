local assets =
{
	Asset("ANIM", "anim/blue_shot_projectile.zip"),

    Asset("ATLAS", "images/inventoryimages/blue_shot.xml"),
    Asset("IMAGE", "images/inventoryimages/blue_shot.tex"),

    Asset("SOUNDPACKAGE", "sound/brs.fev"),
    Asset("SOUND", "sound/brs.fsb"),
}

local foldername = KnownModIndex:GetModActualName("Black Rock Shooter")
local kpchance = GetModConfigData("killparticledropchance", foldername)
local rockaoe = GetModConfigData("rockcannonaoe", foldername)


local NO_TAGS = {"FX", "NOCLICK","DECOR","INLIMBO"}

local function OnShoot(inst, owner, target)

    --if target ~= owner then
        
        --owner.SoundEmitter:PlaySound("brs/brs/shoot")
    --end
    inst.AnimState:PlayAnimation("blue_shot", true)
end

local function ShakeCamera(inst)
        for k, v in pairs(AllPlayers) do
            v:ShakeCamera(CAMERASHAKE.FULL, 1, 0.033, 0.25, inst, 40)
        end
    end

local function OnHit(inst, owner, target)
        inst:PushEvent("shake")
        inst:Remove()
        local pt = target:GetPosition()
        local range = 3.5
        local x, y, z = target.Transform:GetWorldPosition()
        local ents = TheSim:FindEntities(x, y, z, range, nil, NO_TAGS)
        local impactfx = SpawnPrefab("blue_shot_impact")
        if owner and owner ~= nil and not owner.components.health:IsDead() then
            impactfx.Transform:SetPosition(x, y, z)
            owner.SoundEmitter:PlaySound("brs/brs/shoot")
        for _,v in ipairs(ents) do  
            if v.components.health and v.components.health.currenthealth > 0 then
                if not v:HasTag("wall") and not v:HasTag("structure") and not v:HasTag("player") and not v:HasTag("epic") then
                v.AnimState:PlayAnimation("hit")
                v.components.health:DoDelta(-rockaoe)
                if v.components.health:IsDead() then
                    if math.random() <= kpchance then
                        v.components.lootdropper:SpawnLootPrefab("energy_particle")
                    end  
                end               
                end
            end
        end
        end 
        target:ListenForEvent("onreachdestination", ShakeCamera)
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

    inst:AddComponent("stackable")

    inst:AddComponent("combat")
    inst.components.combat:SetDefaultDamage(30)
    inst.components.combat:SetAreaDamage(TUNING.DEERCLOPS_AOE_RANGE, TUNING.DEERCLOPS_AOE_SCALE)

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "blue_shot"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/blue_shot.xml"

    inst:ListenForEvent("shake", ShakeCamera)
    
    return inst
    
end

return Prefab("common/inventory/blue_shot", fn, assets)