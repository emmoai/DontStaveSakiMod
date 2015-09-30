local assets =
{
	Asset("ANIM", "anim/energy_particle.zip"),

    Asset("ATLAS", "images/inventoryimages/energy_particle.xml"),
    Asset("IMAGE", "images/inventoryimages/energy_particle.tex"),
}

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
    RemovePhysicsColliders(inst)

    inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
    inst.AnimState:SetBank("particle")
    inst.AnimState:SetBuild("energy_particle")
    inst.AnimState:PlayAnimation("idle", true)

    if not TheWorld.ismastersim then
        return inst
    end

    inst.entity:SetPristine()

    inst:AddComponent("inspectable")

    inst:AddComponent("stackable")

    inst:AddComponent("tradable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "energy_particle"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/energy_particle.xml"

    return inst
    
end

return Prefab("common/inventory/energy_particle", fn, assets)