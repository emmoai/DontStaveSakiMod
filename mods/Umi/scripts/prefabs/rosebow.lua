local assets=
{
    Asset("ANIM", "anim/rosebow.zip"),
    Asset("ANIM", "anim/swap_rosebow.zip"),
 
    Asset("ATLAS", "images/inventoryimages/rosebow.xml"),
    Asset("IMAGE", "images/inventoryimages/rosebow.tex"),
}

local prefabs = 
{
	"umi"
}

local function fn()
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "rosebow.tex" )
	
	inst.AnimState:SetBank("rosebow")
    inst.AnimState:SetBuild("rosebow")
    inst.AnimState:PlayAnimation("idle")
	
	if not TheWorld.ismastersim then
        return inst
    end
 
    local function OnEquip(inst, owner)
        owner.AnimState:OverrideSymbol("swap_object", "swap_rosebow", "swap_rosebow")
        owner.AnimState:Show("ARM_carry")
        owner.AnimState:Hide("ARM_normal")
    end
 
    local function OnUnequip(inst, owner)
        owner.AnimState:Hide("ARM_carry")
        owner.AnimState:Show("ARM_normal")
    end
 
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.keepondeath = true
    inst.components.inventoryitem.imagename = "rosebow"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/rosebow.xml"

    -------
    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(20)
    inst.components.finiteuses:SetUses(20)
    inst.components.finiteuses:SetOnFinished(inst.Remove)
    inst.components.finiteuses:SetConsumption(ACTIONS.CHOP, 1)
    -------
     
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
	inst.components.inventoryitem.keepondeath = true
	
	inst:AddComponent("inspectable")
		
	inst:AddTag("shadow")
inst.entity:SetPristine()
 	inst:AddComponent("weapon")
	inst.components.weapon:SetDamage(100)
    inst.components.weapon:SetRange(8, 10)
    inst.components.equippable.walkspeedmult = 2.0
	inst.components.weapon:SetProjectile("madoka_projectile")

	if not inst.components.characterspecific then
    inst:AddComponent("characterspecific")
end

	inst.components.characterspecific:SetOwner("umi")
	inst.components.characterspecific:SetStorable(false)
	inst.components.characterspecific:SetComment("Don't know how to use.") 

  --owner in DST
	--inst:DoTaskInTime(0, function() if not GetPlayer() or GetPlayer().prefab ~= "wayrra" then inst:Remove() end end)

    return inst
	
end
	
return  Prefab("common/inventory/rosebow", fn, assets)