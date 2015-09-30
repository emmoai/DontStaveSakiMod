local assets =
{
    Asset("ANIM", "anim/hime_suit.zip"),
	
	Asset("ATLAS", "images/inventoryimages/hime_suit.xml"),
    Asset("IMAGE", "images/inventoryimages/hime_suit.tex"),
}

local prefabs = 
{
	"kotori"
}

local function OnBlocked(owner) 
    owner.SoundEmitter:PlaySound("dontstarve/wilson/hit_armour") 
end

local function onequip(inst, owner) 
    owner.AnimState:OverrideSymbol("swap_body", "hime_suit", "swap_body")
    inst:ListenForEvent("blocked", OnBlocked, owner)
end

local function onunequip(inst, owner) 
    owner.AnimState:ClearOverrideSymbol("swap_body")
    inst:RemoveEventCallback("blocked", OnBlocked, owner)
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
	inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "hime_suit.tex" )

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("armor_wood")
    inst.AnimState:SetBuild("hime_suit")
    inst.AnimState:PlayAnimation("anim")

    inst.foleysound = "dontstarve/movement/foley/logarmour"

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "hime_suit"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/hime_suit.xml"

    inst:AddComponent("armor")
    inst.components.armor:InitCondition(10000, TUNING.ARMORWOOD_ABSORPTION)
	inst.components.armor:SetPercent(1)

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY

    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

inst:AddComponent("insulator")
    inst.components.insulator:SetInsulation(TUNING.INSULATION_LARGE)
    inst.components.insulator:SetSummer()
 
    inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_LARGE)

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("common/inventory/hime_suit", fn, assets)