local assets =
{ 
    Asset("ANIM", "anim/hat_bee_bw.zip"),
    Asset("ANIM", "anim/hat_bee_bw_swap.zip"), 

    Asset("ATLAS", "images/inventoryimages/hat_bee_bw.xml"),
    Asset("IMAGE", "images/inventoryimages/hat_bee_bw.tex"),
}

local prefabs = 
{
	"sasuke"
}

local function OnEquip(inst, owner) 
    owner.AnimState:OverrideSymbol("swap_hat", "hat_bee_bw_swap", "swap_hat")

    owner.AnimState:Show("HAT")
    owner.AnimState:Show("HAT_HAIR")
    owner.AnimState:Hide("HAIR_NOHAT")
    owner.AnimState:Hide("HAIR")

    if owner:HasTag("player") then
        owner.AnimState:Hide("HEAD")
        owner.AnimState:Show("HEAD_HAIR")
    end
end

local function OnUnequip(inst, owner) 
    owner.AnimState:Hide("HAT")
    owner.AnimState:Hide("HAT_HAIR")
    owner.AnimState:Show("HAIR_NOHAT")
    owner.AnimState:Show("HAIR")

    if owner:HasTag("player") then
        owner.AnimState:Show("HEAD")
        owner.AnimState:Hide("HEAD_HAIR")
    end
end

local function health_drop(inst)
        local owner = inst.components.inventoryitem and inst.components.inventoryitem.owner
        if owner and owner.components.leader then
            owner.components.health:StartRegen(-1, 2)
            owner.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.5)
            owner.components.combat.damagemultiplier = 3
            owner.components.health.maxhealth=100
            if TheWorld.state.phase == "night" then
				owner.Light:Enable(true)
				owner.Light:SetRadius(11)
    			owner.Light:SetFalloff(1)
    			owner.Light:SetIntensity(0.5)
    			owner.Light:SetColour(128/255,128/255,255/255)
    		end
        end
end

local function health_stop(inst)
        local owner = inst.components.inventoryitem and inst.components.inventoryitem.owner
        if owner and owner.components.leader then
            owner.components.health:StartRegen(1,300)
            owner.components.health.maxhealth=200
            owner.components.combat.damagemultiplier = 1
            owner.Light:Enable(false)
        end
end

local function s_equip(inst, owner)
        OnEquip(inst, owner)
        health_drop(inst)
    end

    local function s_unequip(inst, owner)
        OnUnequip(inst, owner)
        health_stop(inst)
    end


local function fn()

    local inst = CreateEntity()
    
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("hat_bee_bw")
    inst.AnimState:SetBuild("hat_bee_bw")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("hat")

    if not TheWorld.ismastersim then
        return inst
    end

    inst.entity:SetPristine()

    inst:AddComponent("inspectable")

    inst:AddComponent("tradable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "hat_bee_bw"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/hat_bee_bw.xml"
    
    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip(OnEquip)
    inst.components.equippable:SetOnUnequip(OnUnequip)
    inst.components.equippable.walkspeedmult = 1.5
    inst.components.equippable:SetOnEquip( s_equip )
    inst.components.equippable:SetOnUnequip( s_unequip )
        
	inst:AddComponent("dapperness")
	inst.components.dapperness.dapperness = -TUNING.DAPPERNESS_HUGE * 2

	inst.components.inventoryitem:SetOnActiveItemFn( health_drop )

	if not inst.components.characterspecific then
    	inst:AddComponent("characterspecific")
	end

    inst.components.characterspecific:SetOwner("sasuke")
    inst.components.characterspecific:SetStorable(true)
    inst.components.characterspecific:SetComment("These seem heavier than they look.") 
     
    MakeHauntableLaunch(inst)

    return inst
end

return  Prefab("common/inventory/hat_bee_bw", fn, assets, prefabs)