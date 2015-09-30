local assets =
{
    Asset("ANIM", "anim/diamondmattock.zip"),
    Asset("ANIM", "anim/swap_diamondmattock.zip"),
}

local function UpdateEffectiveness(inst, isThomas)
    local tool = inst.components.tool
    if tool then
        if isThomas then
            tool:SetAction(ACTIONS.MINE, 1.5) 
            tool:SetAction(ACTIONS.CHOP, 1.5)
            
        else
            tool:SetAction(ACTIONS.MINE, 0.375) 
            tool:SetAction(ACTIONS.CHOP, 0.375)

            end
        end
    end

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_diamondmattock", "swap_object")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 
    UpdateEffectiveness(inst, owner.prefab == "thomas")

end

local function onunequip(inst, owner)
    owner.AnimState:Hide("ARM_carry") 
    owner.AnimState:Show("ARM_normal") 
    end


local function fn(Sim)
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
    MakeInventoryPhysics(inst)
    if not TheWorld.ismastersim then
        return inst
    end
    inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")    
    inst.AnimState:SetBank("multitool_axe_pickaxe")
    inst.AnimState:SetBuild("diamondmattock")
    inst.AnimState:PlayAnimation("idle")
    inst:AddTag("sharp")
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(TUNING.MULTITOOL_DAMAGE)
    inst:AddComponent("tool")
    UpdateEffectiveness(inst,true)
    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/diamondmattock.xml"
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )
    MakeHauntableLaunch(inst)
    return inst
end

return Prefab("common/inventory/diamondmattock", fn, assets)




