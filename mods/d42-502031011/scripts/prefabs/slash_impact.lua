local assets =
{
	Asset("ANIM", "anim/blackblade.zip"),
}

local function PlayImpactAnim(proxy)
	local inst = CreateEntity()

    inst:AddTag("FX")
    --[[Non-networked entity]]
    inst.entity:SetCanSleep(false)
    inst.persists = false

	inst.entity:AddTransform()
	inst.entity:AddAnimState()

    inst.Transform:SetFromProxy(proxy.GUID)
	
    inst.AnimState:SetBank("blackblade")
    inst.AnimState:SetBuild("blackblade")
    inst.AnimState:PlayAnimation("slash")
    
    inst:ListenForEvent("animover", inst.Remove)
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddNetwork()

    --Dedicated server does not need to spawn the local fx
    if not TheNet:IsDedicated() then
        --Delay one frame so that we are positioned properly before starting the effect
        --or in case we are about to be removed
        inst:DoTaskInTime(0, PlayImpactAnim)
    end

    inst.Transform:SetTwoFaced()

    inst:AddTag("FX")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.persists = false
    inst:DoTaskInTime(0.5, inst.Remove)

    return inst
end

return Prefab("common/fx/slash_impact", fn, assets)