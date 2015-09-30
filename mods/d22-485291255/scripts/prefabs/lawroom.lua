local assets=
{ 
    Asset("ANIM", "anim/lawroom.zip"),
    Asset("ANIM", "anim/swap_lawroom.zip"), 

    Asset("ATLAS", "images/inventoryimages/lawroom.xml"),
    Asset("IMAGE", "images/inventoryimages/lawroom.tex"),
}

local prefabs = 
{
}

local function ShouldAcceptItem(inst, item)
    if item.prefab == "spidergland" then
       return true
    end
    return false
end

local function canhealing(staff, caster, target, pos)
    if target.components.health.currenthealth < target.components.health.maxhealth then
       return true
    end 

    return false
end

local function teleport_func(inst, target)
    if inst.components.finiteuses.current > 0 then
        target.components.health:DoDelta(20)
        inst.components.finiteuses:Use(1)
    end 
end

 local function onblink(staff, pos, caster)
    if caster.components.sanity ~= nil then
        caster.components.sanity:DoDelta(-15)
    end
    
    end

local function OnGetItemFromPlayer(inst, giver, item)
    if item.prefab == "spidergland" then
       inst.components.finiteuses.current = inst.components.finiteuses.current + inst.components.finiteuses.total *0.2
    end
    if inst.components.finiteuses.current > inst.components.finiteuses.total then
       inst.components.finiteuses.current = inst.components.finiteuses.total
    end
end

    local function OnEquip(inst, owner) 
        --owner.AnimState:OverrideSymbol("swap_object", "swap_lawrooms", "purplestaff")
        owner.AnimState:OverrideSymbol("swap_object", "swap_lawroom", "swap_lawroom")
        owner.AnimState:Show("ARM_carry") 
        owner.AnimState:Hide("ARM_normal") 
	    local light = inst.entity:AddLight()
		light:SetFalloff(.6)
		light:SetIntensity(.9)
		light:SetRadius(3)
		light:Enable(true)
		light:SetColour(19/255, 148/255, 235/255)	
		inst.AnimState:SetBloomEffectHandle( "shaders/anim_haunted.ksh" )	
		
    end

    local function OnUnequip(inst, owner) 
        owner.AnimState:Hide("ARM_carry") 
        owner.AnimState:Show("ARM_normal") 
    end
	
local function fn()
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    local sound = inst.entity:AddSoundEmitter()	
    MakeInventoryPhysics(inst)
 	inst.entity:AddNetwork()
	inst.entity:AddLight()
	
    anim:SetBank("lawroom")
    anim:SetBuild("lawroom")
    anim:PlayAnimation("idle")
		
	if not TheWorld.ismastersim then
   return inst
end	

	inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
	inst.components.equippable.dapperness = -1

    inst:AddComponent("inspectable")
	
    inst.castsound = "dontstarve/common/staffteleport"
	
    inst:AddComponent("spellcaster")
	
    inst.components.spellcaster:SetSpellFn(teleport_func)
    inst.components.spellcaster.CanCast = canhealing
    inst.components.spellcaster.canuseontargets = true
    inst.components.spellcaster.canusefrominventory = false
    inst.components.spellcaster.canonlyuseonlocomotors = true
	
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.keepondeath = true
    inst.components.inventoryitem.imagename = "lawroom"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/lawroom.xml"
  
 	inst.components.inventoryitem.keepondeath = true
	
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(25)
	   
	inst:AddComponent("blinkstaff")
    inst.components.blinkstaff.onblinkfn = onblink

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(10)
    inst.components.finiteuses:SetUses(10)
    if inst.components.finiteuses.current < 0 then
       inst.components.finiteuses.current = 0
    end
	
    inst:AddComponent("trader")
    inst.components.trader.onaccept = OnGetItemFromPlayer
    inst.components.trader:SetAcceptTest(ShouldAcceptItem)
	
    return inst
end

return  Prefab("common/inventory/lawroom", fn, assets, prefabs)