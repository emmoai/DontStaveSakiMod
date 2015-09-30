local assets = {
	Asset("ANIM", "anim/blackblade.zip"),
	Asset("ANIM", "anim/swap_blackblade.zip"),

	Asset("ATLAS", "images/inventoryimages/blackblade.xml"),
	Asset("IMAGE", "images/inventoryimages/blackblade.tex"),

	Asset("SOUNDPACKAGE", "sound/brs.fev"),
    Asset("SOUND", "sound/brs.fsb"),

}

local foldername = KnownModIndex:GetModActualName("Black Rock Shooter")
local bbdmg = GetModConfigData("blackbladedmg", foldername)
local maxdura = GetModConfigData("maxdura", foldername)


local function onequip(inst, owner)
	owner.AnimState:OverrideSymbol("swap_object", "swap_blackblade", "blackblade")
	owner.AnimState:Show("ARM_carry")
	owner.AnimState:Hide("ARM_normal")
end

local function onunequip(inst, owner)
	owner.AnimState:Hide("ARM_carry")
	owner.AnimState:Show("ARM_normal")
end

local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	inst.AnimState:SetBank("blackblade")
    inst.AnimState:SetBuild("blackblade")
    inst.AnimState:PlayAnimation("idle")  
    
    MakeInventoryPhysics(inst)

    if not TheWorld.ismastersim then
    	return inst
    end

    inst.entity:SetPristine()

    if maxdura == "infinite" then
    	inst:RemoveComponent("finiteuses")
	elseif maxdura == "finite" then
		inst:AddComponent("finiteuses")
    	inst.components.finiteuses:SetOnFinished(inst.Remove)
	end

	inst:AddComponent("characterspecific")

	inst:AddTag("sharp")

	inst:AddComponent("weapon")
	inst.components.weapon:SetDamage(bbdmg)
	inst.components.weapon:SetRange(.5)
	--inst.components.weapon:SetOnAttack(OnHit)

	inst:AddComponent("equippable")
	inst.components.equippable.keepondeath = true
	inst.components.equippable:SetOnEquip(onequip)
	inst.components.equippable:SetOnUnequip(onunequip)
	
	inst:AddComponent("inspectable")
	
	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.keepondeath = true
	inst.components.inventoryitem.imagename = "blackblade"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/blackblade.xml"

	return inst
end

return Prefab("common/inventory/blackblade", fn, assets)
