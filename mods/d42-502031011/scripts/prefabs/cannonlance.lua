local assets = {
	Asset("ANIM", "anim/cannonlance.zip"),
	Asset("ANIM", "anim/swap_cannonlance.zip"),
	
}
	for i = 0, 10, 1 do
	table.insert(assets, Asset( "IMAGE", "images/inventoryimages/cannonlance"..tostring(i)..".tex" ))
	table.insert(assets, Asset( "ATLAS", "images/inventoryimages/cannonlance"..tostring(i)..".xml" ))
	end

	local foldername = KnownModIndex:GetModActualName("Black Rock Shooter")
	local lancedmg = GetModConfigData("cannonlancedmg", foldername)


local function GetStatus(inst)
	if inst.Ammo == 0 then
		return "EMPTY"
	elseif inst.Ammo > 0 and inst.Ammo < 5 then
		return "FEW"
	elseif inst.Ammo == 5 then
		return "HALF"
	elseif inst.Ammo > 5 and inst.Ammo < 10 then
		return "PLENTY"
	elseif inst.Ammo == 10 then
		return "FULL"
	end
end


local function UpdateShooter(inst, stage)
	inst.Ammo = stage
	inst.components.inventoryitem.atlasname = "images/inventoryimages/cannonlance"..tostring(stage)..".xml"
	inst.components.inventoryitem:ChangeImageName("cannonlance"..tostring(stage))

	if stage > 0 and stage <= 10 then
		if stage ~= 10 then
		inst.components.trader:Enable()
		elseif stage == 10 then
		inst.components.trader:Disable()
		end
		inst.components.weapon:SetDamage(lancedmg)
		inst.components.weapon:SetRange(12, 16)
		inst.components.weapon:SetProjectile("cannon_shot")

	else
		inst.components.trader:Enable()
		inst.components.weapon:SetDamage(20)
		inst.components.weapon:SetRange(0, 0)
		inst.components.weapon:SetProjectile("dud")
	end
	
	if inst.AmmoMaster then
		inst.AmmoMaster:PushEvent("soulchange", stage)
	end
	return inst.Ammo
end

local function FuelTest(inst, item, giver)
	if item.prefab == "blue_shot" then
		return true
	end
	return inst
end

local function FuelAccept(inst, giver, item)
	if inst.Ammo < 10 then
	inst:UpdateShooter(inst.Ammo + 1)
	end
	return inst.Ammo
end

local function AmmoLeft(inst)
	if inst.Ammo > 0 then
	inst:UpdateShooter(inst.Ammo - 1)
	else
	inst.components.trader:Enable()
	end
	return inst.Ammo
end


	local function onequip(inst, owner)

	owner.AnimState:OverrideSymbol("swap_object", "swap_cannonlance", "cannonlance")
	owner.AnimState:Show("ARM_carry")
	owner.AnimState:Hide("ARM_normal")
	owner.components.combat.min_attack_period = 0.8
	end

	local function onunequip(inst, owner)
	owner.AnimState:Hide("ARM_carry")
	owner.AnimState:Show("ARM_normal")
	owner.components.combat.min_attack_period = 0.4

	end

	local function OnSave(inst, data)
		if inst.Ammo then
			data.Ammo = inst.Ammo
		end
	end

	local function OnLoad(inst, data)
		if data and data.Ammo then
			inst:DoTaskInTime(0.1, function()
			inst:UpdateShooter(data.Ammo)
			end)
        end
	end

	local function OnDespawn(inst, data)
		if inst.Ammo then
			data.Ammo = inst.Ammo
		end
	end

local function fn(Sim)

	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	inst.AnimState:SetBank("cannonlance")
    inst.AnimState:SetBuild("cannonlance")
    inst.AnimState:PlayAnimation("idle")

    MakeInventoryPhysics(inst)

    if not TheWorld.ismastersim then
    	return inst
    end

    inst.entity:SetPristine()
	
	inst:AddComponent("characterspecific")

	inst:AddComponent("weapon")
	inst.components.weapon:SetElectric()
	inst.components.weapon:SetOnAttack(AmmoLeft)

	inst:AddComponent("inspectable")
	inst.components.inspectable.getstatus = GetStatus

	inst:AddComponent("equippable")
	inst.components.equippable.keepondeath = true
	inst.components.equippable:SetOnEquip(onequip)
	inst.components.equippable:SetOnUnequip(onunequip)
	
	inst:AddComponent("inventoryitem")

	inst:AddComponent("trader")
	inst.components.trader.acceptnontradable = true
	inst.components.trader.test = FuelTest
	inst.components.trader.onaccept = FuelAccept

	inst.UpdateShooter = UpdateShooter
	
	inst.AmmoMaster = nil

	inst:UpdateShooter(0)

	inst.OnSave = OnSave
	inst.OnLoad = OnLoad



	return inst
end

return Prefab("common/inventory/cannonlance", fn, assets)
