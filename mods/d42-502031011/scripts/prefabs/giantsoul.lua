local assets =
{
	Asset("ANIM", "anim/giantsoul.zip"),

    Asset("ATLAS", "images/inventoryimages/giantsoul.xml"),
    Asset("IMAGE", "images/inventoryimages/giantsoul.tex"),
}

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
    RemovePhysicsColliders(inst)

    --inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
    inst.AnimState:SetBank("giantsoul")
    inst.AnimState:SetBuild("giantsoul")
    inst.AnimState:PlayAnimation("idle", true)

    if not TheWorld.ismastersim then
        return inst
    end

    inst.entity:SetPristine()

    inst:AddComponent("inspectable")

    inst:AddComponent("tradable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "giantsoul"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/giantsoul.xml"

    return inst
    
end

return Prefab("common/inventory/giantsoul", fn, assets)