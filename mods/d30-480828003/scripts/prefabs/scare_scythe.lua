local assets =
{ 
    Asset("ANIM", "anim/scare_scythe.zip"),
    Asset("ANIM", "anim/swap_scare_scythe.zip"), 

    Asset("ATLAS", "images/inventoryimages/scare_scythe.xml"),
    Asset("IMAGE", "images/inventoryimages/scare_scythe.tex"),
}

local function onequip(inst, owner) 
    owner.AnimState:OverrideSymbol("swap_object", "swap_scare_scythe", "scare_scythe")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 
end

local function onunequip(inst, owner)
    owner.AnimState:Hide("ARM_carry") 
    owner.AnimState:Show("ARM_normal") 
end

local function onattack(inst, owner, target)
    owner.components.health:DoDelta(1,false,"scare_scythe")
end

local function onfinished(inst, owner)
    local owner = inst.components.inventoryitem and inst.components.inventoryitem.owner
        if owner then
        local brokentool = SpawnPrefab("brokentool")
        brokentool.Transform:SetPosition(inst.Transform:GetWorldPosition() )
    inst:Remove()
    end
end

local function fn()

    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    
    MakeInventoryPhysics(inst)
    inst.entity:AddNetwork()
   
    anim:SetBank("scare_scythe")
    anim:SetBuild("scare_scythe")
    anim:PlayAnimation("idle")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    ---------
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "scare_scythe"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/scare_scythe.xml"
    ---------
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )
    --------- 
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(40)
    inst.components.weapon.onattack = onattack
    ---------
    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(100)
    inst.components.finiteuses:SetUses(100)
    inst.components.finiteuses:SetOnFinished( onfinished )

    MakeHauntableLaunch(inst)

    return inst
end

return  Prefab("common/inventory/scare_scythe", fn, assets)