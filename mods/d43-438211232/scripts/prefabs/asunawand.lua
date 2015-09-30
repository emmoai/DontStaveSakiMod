local assets=
{ 
    Asset("ANIM", "anim/asunawand.zip"),
    Asset("ANIM", "anim/swap_asunawand.zip"), 

    Asset("ATLAS", "images/inventoryimages/asunawand.xml"),
    Asset("IMAGE", "images/inventoryimages/asunawand.tex"),
}

local prefabs = 
{
}

    local function OnEquip(inst, owner) 
        --owner.AnimState:OverrideSymbol("swap_object", "swap_asunawands", "purplestaff")
        owner.AnimState:OverrideSymbol("swap_object", "swap_asunawand", "asunawand")
        owner.AnimState:Show("ARM_carry") 
        owner.AnimState:Hide("ARM_normal") 
    end

    local function OnUnequip(inst, owner) 
        owner.AnimState:Hide("ARM_carry") 
        owner.AnimState:Show("ARM_normal") 
    end

local function asunaheal(staff, target)

    local caster = staff.components.inventoryitem.owner	
    local tar = target or caster
    if not caster then caster = tar end
    
    if caster ~= nil and caster.components.hunger.current > 30 and not caster.components.hunger:IsStarving() and target.components.health ~= nil then
        caster.components.hunger:DoDelta(-40)
        caster.components.sanity:DoDelta(5)	
        target.components.health:DoDelta(40)
	end	

	if caster ~= nil and caster.components.hunger.current < 15 then
		caster.components.sanity:DoDelta(-10)
	end	
	
	if caster ~= nil and caster.components.hunger:IsStarving() then
		caster.components.sanity:DoDelta(-20)
		caster.components.health:DoDelta(-20)
	end	
	
	if target.components.edible ~= nil and target.components.stackable.stacksize and caster.components.hunger.current > 15 and not target.components.stackable:IsStack() then
        target.components.edible.healthvalue = 10
        caster.components.hunger:DoDelta(-15)
	end

end 


local function yellow_reticuletargetfn()
    return Vector3(ThePlayer.entity:LocalToWorldSpace(5, 0, 0))
end
	
local function fn()
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    local sound = inst.entity:AddSoundEmitter()	
    MakeInventoryPhysics(inst)
 	inst.entity:AddNetwork()
	
    anim:SetBank("asunawand")
    anim:SetBuild("asunawand")
    anim:PlayAnimation("idle")
	

	
	if not TheWorld.ismastersim then
   return inst
end	

    inst:AddComponent("inspectable")
    inst:AddComponent("reticule")
    inst.components.reticule.targetfn = yellow_reticuletargetfn
	
    inst.castsound = "dontstarve/common/staffteleport"
	
    inst:AddComponent("spellcaster")
	
    inst.components.spellcaster:SetSpellFn(asunaheal)
    inst.components.spellcaster.canuseontargets = true	
	
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.keepondeath = true
    inst.components.inventoryitem.imagename = "asunawand"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/asunawand.xml"
     
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
 	inst.components.inventoryitem.keepondeath = true
	
	if not inst.components.characterspecific then
		inst:AddComponent("characterspecific")
	end
 
	inst.components.characterspecific:SetOwner("asuna")
	inst.components.characterspecific:SetStorable(true)
	inst.components.characterspecific:SetComment("强大的保护.") 
	

    return inst
end

return  Prefab("common/inventory/asunawand", fn, assets, prefabs)