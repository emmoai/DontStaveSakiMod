local assets =
{
    Asset("ANIM", "anim/lawpump.zip"),
	Asset("ANIM", "anim/swap_bloodpump.zip"),
	
    Asset("ATLAS", "images/inventoryimages/lawreviver.xml"),
    Asset("IMAGE", "images/inventoryimages/lawreviver.tex"),
}

local function beat(inst)
    inst.AnimState:PlayAnimation("idle")
    inst.SoundEmitter:PlaySound("dontstarve/ghost/bloodpump")
    inst.beattask = inst:DoTaskInTime(.75 + math.random() * .75, beat)
end

local function ondropped(inst)
    if inst.beattask ~= nil then
        inst.beattask:Cancel()
    end
    inst.beattask = inst:DoTaskInTime(.75 + math.random() * .75, beat)
end

local function onpickup(inst)
    if inst.beattask ~= nil then
        inst.beattask:Cancel()
        inst.beattask = nil
    end
end

--The first pickup must be the maker
local function onfirstpickup(inst, maker)
    inst.components.inventoryitem:SetOnPickupFn(onpickup)
    onpickup(inst)
	
end

local function onload(inst)
    inst.components.inventoryitem:SetOnPickupFn(onpickup)
end

local function oninit(inst)
    --Most likely dynamically or debug spawned in, and not picked up
    onload(inst) --removes pickup damage
    ondropped(inst) --starts beating (should be on the ground)
end

local function healowner(inst, owner)
    if (owner.components.health and owner.components.health:IsHurt())
    and (owner.components.hunger and owner.components.hunger.current > 5 )then
        owner.components.health:DoDelta(TUNING.REDAMULET_CONVERSION,false,"lawreviver")
        owner.components.hunger:DoDelta(-TUNING.REDAMULET_CONVERSION)
    end
end

local function OnEquip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "swap_bloodpump", "swap_bloodpump")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
	inst.task = inst:DoPeriodicTask(20, healowner, nil, owner)
end
  
local function OnUnequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
    if inst.task ~= nil then
        inst.task:Cancel()
        inst.task = nil
    end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("lawpump01")
    inst.AnimState:SetBuild("lawpump")
    inst.AnimState:PlayAnimation("idle")

    inst.entity:SetPristine()
	
	inst:AddTag("resurrector")
	inst:AddTag("show_spoilage")
		
    if not TheWorld.ismastersim then
        return inst
    end
	
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(1)
			
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "lawreviver"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/lawreviver.xml"
    inst.components.inventoryitem:SetOnDroppedFn(ondropped)
    inst.components.inventoryitem:SetOnPickupFn(onfirstpickup)
	
    inst:AddComponent("inspectable")
		
    MakeHauntableLaunch(inst)
    inst:AddComponent("hauntable")
	inst.components.hauntable:SetHauntValue(TUNING.HAUNT_INSTANT_REZ)
	
	inst:AddComponent("perishable")
	inst.components.perishable:SetPerishTime(TUNING.PERISH_TWO_DAY)
	inst.components.perishable:StartPerishing()
	inst.components.perishable.onperishreplacement = "nightmarefuel"
		
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )

    inst.OnLoad = onload

    inst.beattask = inst:DoTaskInTime(0, oninit)

    return inst
end

return Prefab("common/lawreviver", fn, assets)