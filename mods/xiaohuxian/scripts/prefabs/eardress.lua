local assets=
{
    Asset("ANIM", "anim/eardress.zip"),
    Asset("IMAGE", "images/inventoryimages/eardress.tex"),
    Asset("ATLAS", "images/inventoryimages/eardress.xml"),
}

local function onequip(inst, owner) 
    
    owner.AnimState:OverrideSymbol("swap_body", "eardress", "swap_body")
    --inst.components.fueled:StartConsuming()
    --owner.components.inventory:SetOverflow(inst)
    inst.components.container:Open(owner)
end


local function onunequip(inst, owner) 
    owner.AnimState:ClearOverrideSymbol("swap_body")
    --inst.components.fueled:StopConsuming()
    --owner.components.inventory:SetOverflow(nil)
    inst.components.container:Close(owner)
end

local function fn(Sim)
    local inst = CreateEntity()
    
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
    
    local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("krampus_sack.png")
    
    inst.AnimState:SetBank("torso_rain")
    inst.AnimState:SetBuild("eardress")
    inst.AnimState:PlayAnimation("anim")
    
    inst:AddComponent("inspectable")
    inst:AddTag("fridge")
    
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/eardress.xml"

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY
    inst.components.equippable.insulated = true
    inst.components.equippable.dapperness = TUNING.DAPPERNESS_MED
    
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )
    
    inst:AddComponent("container")
    inst.components.container:WidgetSetup("icepack")

    return inst
end

return Prefab( "common/inventory/eardress", fn, assets) 