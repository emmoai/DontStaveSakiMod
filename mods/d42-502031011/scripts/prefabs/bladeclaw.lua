local assets = {
	Asset("ANIM", "anim/bladeclaw.zip"),
	Asset("ANIM", "anim/swap_bladeclaw.zip"),

	Asset("ATLAS", "images/inventoryimages/bladeclaw.xml"),
	Asset("IMAGE", "images/inventoryimages/bladeclaw.tex"),

	Asset("SOUNDPACKAGE", "sound/brs.fev"),
    Asset("SOUND", "sound/brs.fsb"),

}

local foldername = KnownModIndex:GetModActualName("Black Rock Shooter")
local bcdmg = GetModConfigData("bladeclawdmg", foldername)
local maxdura = GetModConfigData("maxdura", foldername)

local function onequip(inst, owner)
	owner.AnimState:OverrideSymbol("swap_object", "swap_bladeclaw", "bladeclaw")
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
	
	inst.AnimState:SetBank("bladeclaw")
    inst.AnimState:SetBuild("bladeclaw")
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
		inst.components.finiteuses:SetMaxUses(200)
		inst.components.finiteuses:SetUses(200)
    	inst.components.finiteuses:SetOnFinished(inst.Remove)
	end

	inst:AddComponent("characterspecific")

	inst:AddTag("sharp")

	inst:AddComponent("weapon")
	inst.components.weapon:SetDamage(bcdmg)
	inst.components.weapon:SetRange(.5)

	inst:AddComponent("equippable")
	inst.components.equippable.keepondeath = true
	inst.components.equippable:SetOnEquip(onequip)
	inst.components.equippable:SetOnUnequip(onunequip)
	
	inst:AddComponent("inspectable")
	
	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.keepondeath = true
	inst.components.inventoryitem.imagename = "bladeclaw"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/bladeclaw.xml"

	return inst
end

return Prefab("common/inventory/bladeclaw", fn, assets)
