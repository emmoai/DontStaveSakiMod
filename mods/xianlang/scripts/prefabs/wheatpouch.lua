local assets = {
	Asset("ATLAS", "images/inventoryimages/wheatpouch.xml"),
	Asset("IMAGE", "images/inventoryimages/wheatpouch.tex"),
}

local function onpouchwork(worker, data)
	worker.components.hunger:DoDelta(0, true)
end

local function onequip(inst, owner) 
    owner.AnimState:OverrideSymbol("swap_body", "swap_backpack", "backpack")
    owner.AnimState:OverrideSymbol("swap_body", "swap_backpack", "swap_body")
	
	owner.healthtask = owner:DoPeriodicTask(1, function()
    owner.components.health:DoDelta(0.1, true)
end)

    owner.components.health.maxhealth = 140
    owner.components.health:DoDelta(0)
	owner:ListenForEvent("working", onpouchwork)
  end

local function onunequip(inst, owner) 
    owner.AnimState:ClearOverrideSymbol("swap_body")
    owner.AnimState:ClearOverrideSymbol("backpack")
	owner.components.health.maxhealth = 30
    owner.components.health:DoDelta(0)
if owner.healthtask then
    owner.healthtask:Cancel()
    owner.healthtask = nil
end
	owner:RemoveEventCallback("working", onpouchwork)
end
 
local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()
	
	MakeInventoryPhysics(inst)  

    inst.AnimState:SetBank("backpack1")
    inst.AnimState:SetBuild("swap_backpack")
    inst.AnimState:PlayAnimation("anim")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end
	
	inst.boost = true
	inst:AddComponent("characterspecific")
	inst:AddComponent("armor")
	inst.components.armor:InitCondition(TUNING.ARMORMARBLE * 1000000000000000000, TUNING.ARMORWOOD_ABSORPTION)
	
	inst:AddComponent("insulator")
    inst.components.insulator:SetInsulation(TUNING.INSULATION_TINY)
	inst:AddComponent("inspectable")	
	inst:AddComponent("equippable")
	inst.components.equippable.equipslot = EQUIPSLOTS.BODY
	inst.components.equippable:SetOnEquip( onequip )
	inst.components.equippable:SetOnUnequip( onunequip )

	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/wheatpouch.xml"

	return inst
end

STRINGS.NAMES.WHEATPOUCH = "Wheatpouch"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.WHEATPOUCH = "Precious wheat that grants Horo's freedom."

return Prefab("common/inventory/wheatpouch", fn, assets) 
