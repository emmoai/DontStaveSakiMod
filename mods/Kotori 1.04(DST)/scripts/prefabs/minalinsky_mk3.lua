local assets =
{
    Asset("ANIM", "anim/minalinsky_mk3.zip"),
	
	Asset("ATLAS", "images/inventoryimages/minalinsky_mk3.xml"),
    Asset("IMAGE", "images/inventoryimages/minalinsky_mk3.tex"),
}

local prefabs = 
{
"kotori",
"minalinsky",
"minalinsky_mk2",
}


local function onequip(inst, owner) 
    owner.AnimState:OverrideSymbol("swap_body", "minalinsky_mk3", "swap_body")
	    if inst.components.container ~= nil then
        inst.components.container:Open(owner)
    end
end

local function onunequip(inst, owner) 
    owner.AnimState:ClearOverrideSymbol("swap_body")
	    if inst.components.container ~= nil then
        inst.components.container:Close(owner)
    end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
	inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "minalinsky_mk3.tex" )

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("backpack1")
    inst.AnimState:SetBuild("minalinsky_mk3")
    inst.AnimState:PlayAnimation("anim")
	inst:AddTag("backpack")

    inst.foleysound = "dontstarve/movement/foley/backpack"

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "minalinsky_mk3"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/minalinsky_mk3.xml"

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY

    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
	inst.components.equippable.walkspeedmult = 1.5

    inst:AddComponent("container")
    inst.components.container:WidgetSetup("krampus_sack")

	if not inst.components.characterspecific then
    inst:AddComponent("characterspecific")
end

	inst.components.characterspecific:SetOwner("kotori")
	inst.components.characterspecific:SetStorable(false)
	inst.components.characterspecific:SetComment("Don't know how to use.") 

  --owner in DST
	--inst:DoTaskInTime(0, function() if not GetPlayer() or GetPlayer().prefab ~= "kotori" then inst:Remove() end end)

    return inst
end

return Prefab("common/inventory/minalinsky_mk3", fn, assets)