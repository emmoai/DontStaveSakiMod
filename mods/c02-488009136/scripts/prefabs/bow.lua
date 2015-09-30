local assets=
{
    Asset("ANIM", "anim/bow.zip"),
    Asset("ANIM", "anim/swap_bow.zip"),
	
    Asset("ATLAS", "images/inventoryimages/bow.xml"),
    Asset("IMAGE", "images/inventoryimages/bow.tex"),
	
	Asset("ATLAS", "images/inventoryimages/arrow.xml"),
    Asset("IMAGE", "images/inventoryimages/arrow.tex"),
	Asset("ATLAS", "images/inventoryimages/goldarrow.xml"),
    Asset("IMAGE", "images/inventoryimages/goldarrow.tex"),
	Asset("ATLAS", "images/inventoryimages/moonstonearrow.xml"),
    Asset("IMAGE", "images/inventoryimages/moonstonearrow.tex"),
	Asset("ATLAS", "images/inventoryimages/firearrow.xml"),
    Asset("IMAGE", "images/inventoryimages/firearrow.tex"),
	Asset("ATLAS", "images/inventoryimages/icearrow.xml"),
    Asset("IMAGE", "images/inventoryimages/icearrow.tex"),
	 
--------------------------------------------------------------------	 
	 
	Asset("ANIM", "anim/crossbow.zip"),
    Asset("ANIM", "anim/swap_crossbow.zip"),
	 
    Asset("ATLAS", "images/inventoryimages/crossbow.xml"),
    Asset("IMAGE", "images/inventoryimages/crossbow.tex"),
	
	Asset("ATLAS", "images/inventoryimages/bolt.xml"),
    Asset("IMAGE", "images/inventoryimages/bolt.tex"),
	Asset("ATLAS", "images/inventoryimages/explosivebolt.xml"),
    Asset("IMAGE", "images/inventoryimages/explosivebolt.tex"),
	
---------------------------------------------------------------------

    Asset("ANIM", "anim/swap_magicbow.zip"),
	
    Asset("ATLAS", "images/inventoryimages/magicbow.xml"),
    Asset("IMAGE", "images/inventoryimages/magicbow.tex"),

}
prefabs = {
    "explode_small",
	"sparkles",
}

----------------------------------------------------------------------------BOWS--------------------------------------------------------------

local OriginalDoAttackButton
local OriginalOnRemoteAttackButton
local ClientOriginalDoAttackButton
local ClientOriginalOnRemoteAttackButton

local function BowOnRemoteAttackOverride(self, target, force_attack, noforce)
	local activeitem 

	if self.inst.replica.inventory ~= nil then
		activeitem = self.inst.replica.inventory:GetActiveItem() or self.inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
	elseif self.inst.replica.combat ~= nil then
		activeitem = self.inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
	end
	
	local actiontoperform
	
	if activeitem ~= nil then
		if activeitem:HasTag("bow") then
			actiontoperform = ACTIONS.BOWATTACK
		elseif activeitem:HasTag("crossbow") then
			actiontoperform = ACTIONS.CROSSBOWATTACK
		end
	end

	if actiontoperform ~= nil then
		if self.ismastersim and self:IsEnabled() and self.handler == nil then
			--Check if target is valid, otherwise make
			--it nil so that we still attack and miss.
			if target ~= nil and not noforce then
				if self.inst.sg:HasStateTag("attack") then
					self.inst.sg.statemem.chainattack_cb = function()
						self:OnRemoteAttackButton(target, force_attack)
					end
				else
					target = self:GetAttackTarget(force_attack, target, target == self.inst.sg.statemem.attacktarget)
					self.attack_buffer = BufferedAction(self.inst, target, actiontoperform, nil, nil, nil, nil, true)
					self.attack_buffer._predictpos = true
				end
			else
				self.remote_controls[CONTROL_ATTACK] = 0
				target = target ~= nil and self:GetAttackTarget(force_attack, target) or nil
				if target ~= nil then
					self.attack_buffer = BufferedAction(self.inst, target, actiontoperform)
				end
			end
		end
	end
end

local function BowForceAttackOverride(self, retarget)
    local force_attack = self:IsControlPressed(CONTROL_FORCE_ATTACK)
    local target = self:GetAttackTarget(force_attack, retarget, retarget ~= nil)
	
    if target == nil then
        --Still need to let the server know our attack button is down
        if not self.ismastersim and
            self.locomotor == nil and
            self.remote_controls[CONTROL_ATTACK] == nil then
            self:RemoteAttackButton()
        end
        return --no target
    end

	local activeitem 

	if self.inst.replica.inventory ~= nil then
		activeitem = self.inst.replica.inventory:GetActiveItem() or self.inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
	elseif self.inst.replica.combat ~= nil then
		activeitem = self.inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
	end
	
	local actiontoperform
	
	if activeitem ~= nil then
		if activeitem:HasTag("bow") then
			actiontoperform = ACTIONS.BOWATTACK
		elseif activeitem:HasTag("crossbow") then
			actiontoperform = ACTIONS.CROSSBOWATTACK
		end
	end
	
	if actiontoperform ~= nil then
		if self.ismastersim then
			self.locomotor:PushAction(BufferedAction(self.inst, target, actiontoperform), true)
		elseif self.locomotor == nil then
			self:RemoteAttackButton(target, force_attack)
		elseif self:CanLocomote() then
			local buffaction = BufferedAction(self.inst, target, actiontoperform)
			buffaction.preview_cb = function()
				self:RemoteAttackButton(target, force_attack)
			end
			self.locomotor:PreviewAction(buffaction, true)
		end
	end
end

local function BowLCOverride(inst, target)
local isPvPon = TheNet:GetPVPEnabled()
local activeitem 

	if inst.replica.inventory ~= nil then
		activeitem = inst.replica.inventory:GetActiveItem() or inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
	elseif inst.replica.combat ~= nil then
		activeitem = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
	end
	
	local actiontoperform
	
	if activeitem ~= nil then
		if activeitem:HasTag("bow") then
			actiontoperform = ACTIONS.BOWATTACK
		elseif activeitem:HasTag("crossbow") then
			actiontoperform = ACTIONS.CROSSBOWATTACK
		end
	end

	if actiontoperform ~= nil then
		if inst.components.playercontroller:IsControlPressed(CONTROL_FORCE_ATTACK) then
			if target ~= nil and target ~= inst then
				if inst.replica.combat:CanTarget(target) then
					if not isPvPon then
						return (activeitem:HasTag("zupalexsrangedweapons") and (not target:HasTag("player") or inst.components.playercontroller:IsControlPressed(CONTROL_FORCE_ATTACK)))
							and inst.components.playeractionpicker:SortActionList({ actiontoperform }, target, nil)
							or nil
					elseif isPvPon then
						return (activeitem:HasTag("zupalexsrangedweapons") and inst.components.playercontroller:IsControlPressed(CONTROL_FORCE_ATTACK))
							and inst.components.playeractionpicker:SortActionList({ actiontoperform }, target, nil)
							or nil
					end
				end
			end
		else
			return nil, true
		end
	else
		return nil, true
	end
end

local function SetBowActionsOverride(inst, owner, enable)
local activeitem 

	if owner.replica.inventory ~= nil then
		activeitem = owner.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) or owner.replica.inventory:GetActiveItem()
	end
	if activeitem == nil and owner.replica.combat ~= nil then
		activeitem = owner.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
	end
	
--	print("Equipped is : ", activeitem or "UNAVAILABLE", " / inst : ", inst, " (is host = ", TheWorld.ismastersim, ")")

    if enable then
--		print("I equipped a bow/crossbow")
		if not TheWorld.ismastersim and activeitem == nil then
--			print("Issue detected")
			inst:DoTaskInTime(0.5, function() SendModRPCToServer(MOD_RPC["Archery Mod"]["RequestUnequip"], EQUIPSLOTS.HANDS, true) end)
			SendModRPCToServer(MOD_RPC["Archery Mod"]["CallOnUnequipBow"], inst)
        else
			if not TheWorld.ismastersim and not (activeitem ~= nil and activeitem:HasTag("zupalexsrangedweapons")) then		 
--				print(inst._hostATKchanged:value(), "  /  ", inst._clientATKchangedbow)
				SendModRPCToServer(MOD_RPC["Archery Mod"]["CallOnUnequipBow"], inst)
			else
				if owner.components.playercontroller ~= nil then
					if TheWorld.ismastersim then
--						print("Default Remote Attack and Force Attack are overriden on the host side for ", owner)
						owner.components.playercontroller.OnRemoteAttackButton = BowOnRemoteAttackOverride
--					else print("Default Remote Attack and Force Attack are overriden on the client side for ", owner)
					end
					owner.components.playercontroller.DoAttackButton = BowForceAttackOverride
				end
				if owner.components.playeractionpicker ~= nil then
--					if TheWorld.ismastersim then print("Default left click is overriden on the host side for ", owner)
--					else print("Default Left Click is overriden on the client side for ", owner) end
					owner.components.playeractionpicker.leftclickoverride = BowLCOverride
				end
			end
--			print(inst._hostATKchanged:value(), "  /  ", inst._clientATKchanged)
		end
--		print("--------------------------------------------------------------------------------------------------------")
    else
--		print("I unequipped a bow/crossbow")
		if not TheWorld.ismastersim and activeitem == nil then
--			print("No new item equipped or issue detected.")
			inst:DoTaskInTime(0.5, function() SendModRPCToServer(MOD_RPC["Archery Mod"]["RequestUnequip"], EQUIPSLOTS.HANDS, true) end)
		end
		
        if owner.components.playercontroller ~= nil then
			if TheWorld.ismastersim then
--				print("Default Remote Attack and Force Attack are restored on host side for ", owner)
				owner.components.playercontroller.OnRemoteAttackButton = OriginalOnRemoteAttackButton
				owner.components.playercontroller.DoAttackButton = OriginalDoAttackButton
			else
--				print("Default Remote Attack and Force Attack are restored on client side for ", owner)
				owner.components.playercontroller.DoAttackButton = ClientOriginalDoAttackButton
			end
        end
        if owner.components.playeractionpicker ~= nil then
--			if TheWorld.ismastersim then print("Default Left Click restored on host side for : ", owner)
--			else print("Default Left Click restored on client side for : ", owner) end
			owner.components.playeractionpicker.leftclickoverride = nil
        end
--		print("--------------------------------------------------------------------------------------------------------------------------------------")
    end
end


local function onattack(inst, attacker, target)
    if target.components.sleeper and target.components.sleeper:IsAsleep() then
        target.components.sleeper:WakeUp()
    end

    if target.components.combat then
        target.components.combat:SuggestTarget(attacker)
    end
	
	local quiver = attacker.components.inventory:GetEquippedItem(EQUIPSLOTS.QUIVER)
	
	if inst:HasTag("magic") and inst:HasTag("bow") then
		if inst.components.fueled ~= nil and not inst.components.fueled:IsEmpty() then
			inst.components.fueled:DoDelta(-1)
		end
	else	
		if quiver ~= nil and quiver.components.container ~= nil then
			local projinquiver = quiver.components.container:GetItemInSlot(1)
				if projinquiver ~= nil then
					if projinquiver.components.stackable.stacksize == 1 and attacker.components.inventory:Has(projinquiver.prefab, 1) then
						local projtotransfer = SpawnPrefab(projinquiver.prefab)
						local amounttotransfer = select(2, attacker.components.inventory:Has(projinquiver.prefab, 1))
						quiver.components.container:ConsumeByName(projinquiver.prefab,1)
						
						if amounttotransfer < projtotransfer.components.stackable.maxsize then
							projtotransfer.components.stackable:SetStackSize(amounttotransfer)
							attacker.components.inventory:ConsumeByName(projinquiver.prefab,amounttotransfer)
						else
							projtotransfer.components.stackable:SetStackSize(projtotransfer.components.stackable.maxsize)
							attacker.components.inventory:ConsumeByName(projinquiver.prefab,projtotransfer.components.stackable.maxsize)						
						end
						
						quiver.components.container:GiveItem(projtotransfer)
					else
						quiver.components.container:ConsumeByName(projinquiver.prefab,1)				
					end
				end
		end
	end
	
	if inst.components.zupalexsrangedweapons ~= nil and inst:HasTag("crossbow") then
		inst:RemoveTag("readytoshoot")
		attacker.AnimState:OverrideSymbol("swap_object", "swap_crossbow", "swap_crossbow")
	end
end

local function OnEquipBow(inst, owner)
	if TheWorld.ismastersim then
		if OriginalDoAttackButton == nil and owner.components.playercontroller ~= nil then
			OriginalDoAttackButton = owner.components.playercontroller.DoAttackButton
			OriginalOnRemoteAttackButton = owner.components.playercontroller.OnRemoteAttackButton
		end
	else
		if ClientOriginalDoAttackButton == nil and owner.components.playercontroller ~= nil then
			ClientOriginalDoAttackButton = owner.components.playercontroller.DoAttackButton
			ClientOriginalOnRemoteAttackButton = owner.components.playercontroller.OnRemoteAttackButton
		end
	end
	
--	print("I equip the bow")
			
    owner.AnimState:OverrideSymbol("swap_object", "swap_bow", "swap_bow")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
	
	SetBowActionsOverride(inst, owner, true)
	inst:DoTaskInTime(1, function(inst) inst._hostATKchanged:set(true) end)
end
 
local function OnUnequipBow(inst, owner)	
--	print("I unequip the bow")
	
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")

	SetBowActionsOverride(inst, owner, false)
	inst._hostATKchanged:set(false)	
end

local function OnHostATKChanged(inst)
	if inst._hostATKchanged:value() ~= inst._clientATKchanged then
		inst._clientATKchanged = inst._hostATKchanged:value()
	
		if not TheWorld.ismastersim then	
			local bowowner = ThePlayer
--			print("I want to retrieve the client player : ", bowowner)
			
			if inst._hostATKchanged:value() then
				SetBowActionsOverride(inst, bowowner, true)
			else
				SetBowActionsOverride(inst, bowowner, false)
			end
		end
	end
end

local function bowfn()
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    local netw = inst.entity:AddNetwork()
	
    MakeInventoryPhysics(inst)
     
    anim:SetBank("bow")
    anim:SetBuild("bow")
    anim:PlayAnimation("bow_idle")
 
	inst:AddTag("bow") -- Tag is not doing anything by itself. I can be called by other stuffs though.
	inst:AddTag("ranged")
	
	inst._hostATKchanged = net_bool(inst.GUID, "_hostATKchanged", "onhostATKchanged")
	inst._clientATKchanged = false
	inst:ListenForEvent("onhostATKchanged", OnHostATKChanged)
	
 --The following section is suitable for a DST compatible prefab.
    inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then	
        return inst
    end
----------------------------------------------------------------
	
--	print("BOW USES = " , TUNING.BOWUSES, "   /   BOW DMG = ", TUNING.BOWDMG)
	
	if TUNING.BOWUSES < 201 then
		inst:AddComponent("finiteuses")
		inst.components.finiteuses:SetMaxUses(TUNING.BOWUSES)
		inst.components.finiteuses:SetUses(TUNING.BOWUSES)
		inst.components.finiteuses:SetOnFinished(inst.Remove)
	end
	
    inst:AddComponent("inspectable")
	
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "bow"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/bow.xml"
	
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquipBow )
    inst.components.equippable:SetOnUnequip( OnUnequipBow )
	
	inst:AddComponent("zupalexsrangedweapons")
	inst.components.zupalexsrangedweapons:SetDamage(0)
    inst.components.zupalexsrangedweapons:SetRange((TUNING.BOWRANGE - 2), TUNING.BOWRANGE)
    inst.components.zupalexsrangedweapons:SetProjectile("arrow")
	inst.components.zupalexsrangedweapons:SetOnAttack(onattack)
	inst.components.zupalexsrangedweapons:SetAllowedProjectiles( { "arrow", "goldarrow", "moonstonearrow", "firearrow", "icearrow" } )

    MakeHauntableLaunch(inst)
 
    return inst
end

----------------------------------------------------ARROWS----------------------------------------------------------

local function onpickup(inst)
	if inst.prefab == "moonstonearrow" then	
		inst.Light:Enable(false)
	end
end

local function onputininventory(inst, owner)
	local activeitem = nil
	local quiver = nil
	local projinquiver = nil
	
	if owner.components.inventory ~= nil then
		inst:DoTaskInTime(0, function () 
								activeitem = owner.components.inventory:GetActiveItem()
								quiver = owner.components.inventory:GetEquippedItem(EQUIPSLOTS.QUIVER)
--								print("Active item is : ", activeitem or "UNAVAILABLE", "  / Quiver is : ", quiver or "UNAVAILABLE")
								
								if inst ~= activeitem and quiver ~= nil then
									projinquiver = quiver.replica.container:GetItemInSlot(1)
--									print("Player ", inst.components.inventoryitem.owner, " put ", inst, " in its inventory (owner = ", owner, ")")
--									print("Quiver has : ", projinquiver or "EMPTY")
									if projinquiver == nil then
										local projtostore = SpawnPrefab(string.lower(inst.prefab))
										projtostore.components.stackable:SetStackSize(inst.components.stackable.stacksize)
										quiver.components.container:GiveItem(projtostore, 1)
										inst:Remove()
									elseif projinquiver.prefab == inst.prefab and not projinquiver.components.stackable:IsFull() then
										local currentactivestack = inst.components.stackable.stacksize
										local currentstackinquiver = projinquiver.components.stackable.stacksize
										local stackoverflow = currentactivestack - projinquiver.components.stackable:RoomLeft()			
										
										if stackoverflow <= 0 then
											projinquiver.components.stackable:SetStackSize(currentactivestack + currentstackinquiver)
											inst:Remove()
										else
											projinquiver.components.stackable:SetStackSize(projinquiver.components.stackable.maxsize)
											local projtostore = SpawnPrefab(string.lower(inst.prefab))
											projtostore.components.stackable:SetStackSize(stackoverflow)
											owner:DoTaskInTime(0, function() owner.components.inventory:GiveItem(projtostore) end)
											inst:Remove()
										end
									end								
								end
							end)
	end
end

local function commonarrowfn(arrowanim, tags) 
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    local netw = inst.entity:AddNetwork()
	
    MakeInventoryPhysics(inst)
 
	inst:AddTag("projectile") -- Tag is not doing anything by itself. I can be called by other stuffs though.
	inst:AddTag("arrow")

	if tags ~= nil then
        for i, v in ipairs(tags) do
            inst:AddTag(v)
        end
    end
	
	anim:SetBank("arrow")
    anim:SetBuild("bow")
    anim:PlayAnimation(arrowanim, true)
	
 --The following section is suitable for a DST compatible prefab.
    inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then	
        return inst
    end
----------------------------------------------------------------
	
	inst:AddComponent("projectile")
	
    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem:SetOnPickupFn(onpickup)
	inst.components.inventoryitem:SetOnPutInInventoryFn(onputininventory)
	
	
	inst:AddComponent("zupalexsrangedweapons")
	
	inst:AddComponent("stackable")
	
	 
    return inst
end

local function onhitarrow_fire(attacker, target)
	target.SoundEmitter:PlaySound("dontstarve/wilson/blowdart_impact_fire")
	
--	print("I am shooting a Fire Arrow")
	
	if target.components.burnable then
        target.components.burnable:Ignite(nil, attacker)
    end
    if target.components.freezable then
        target.components.freezable:Unfreeze()
    end
    if target.components.health then
        target.components.health:DoFireDamage((TUNING.BOWDMG*(TUNING.FIREARROWDMGMOD/2.0)), attacker)
    end
end

local function onhitarrow_ice(attacker, target)
--	print("I am shooting an Ice Arrow")
   
    if target.components.burnable then
        if target.components.burnable:IsBurning() then
            target.components.burnable:Extinguish()
        elseif target.components.burnable:IsSmoldering() then
            target.components.burnable:SmotherSmolder()
        end
    end

    if target.components.freezable then
        target.components.freezable:AddColdness(1)
        target.components.freezable:SpawnShatterFX()
    end
end

local function onhitbolt_explosive(inst, attacker, target)
--	print("I am shooting an Explosive Bolt")
	local isPvPon = TheNet:GetPVPEnabled()
	
	local targposx, targposy, targposz = target.Transform:GetWorldPosition()
	
	for i, v in ipairs(AllPlayers) do
        local distSq = v:GetDistanceSqToInst(inst)
        local k = math.max(0, math.min(1, distSq / 1600))
        local intensity = k * (k - 2) + 1 --easing.outQuad(k, 1, -1, 1)
        if intensity > 0 then
            v:ScreenFlash(intensity)
            v:ShakeCamera(CAMERASHAKE.FULL, .7, .02, intensity / 2)
        end
    end
	
	local ents = TheSim:FindEntities(targposx, targposy, targposz, TUNING.EXPLOSIVEBOLTRAD)
    for i, ent in ipairs(ents) do
		if (not isPvPon and not ent:HasTag("player")) or (isPvPon) then
			if ent ~= inst and attacker.components.combat:IsValidTarget(ent)
				then
					ent.components.combat:GetAttacked(attacker, TUNING.EXPLOSIVEBOLTDMG)
			elseif ent.components.workable ~= nil and ent.components.workable:CanBeWorked() then
					ent.components.workable:WorkedBy(inst, TUNING.EXPLOSIVEBOLTDMG)
			elseif ent == attacker then
					ent.components.combat:GetAttacked(attacker, TUNING.EXPLOSIVEBOLTDMG*0.2)
			elseif isPvPon and ent:HasTag("player") then
					ent.components.combat:GetAttacked(attacker, TUNING.EXPLOSIVEBOLTDMG*0.2)
			end
			if ent:IsValid() and not ent:IsInLimbo() then
				if ent.components.burnable ~= nil and
					not ent.components.burnable:IsBurning() and
					not ent:HasTag("burnt") then
					ent.components.burnable:Ignite()
				end
			end
		end
    end

    SpawnPrefab("explode_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/blackpowder_explo")
	
	local rdmradius = TUNING.EXPLOSIVEBOLTRAD/4
	
	TheWorld:DoTaskInTime(0.15, function() SpawnPrefab("explode_small").Transform:SetPosition(targposx+math.random(-rdmradius, rdmradius), targposy+math.random(-rdmradius, rdmradius), targposz+math.random(-rdmradius, rdmradius)) end)
	target:DoTaskInTime(0.15, function() target.SoundEmitter:PlaySound("dontstarve/common/blackpowder_explo") end)
	TheWorld:DoTaskInTime(0.25, function() SpawnPrefab("explode_small").Transform:SetPosition(targposx+math.random(-rdmradius, rdmradius), targposy+math.random(-rdmradius, rdmradius), targposz+math.random(-rdmradius, rdmradius)) end)
	target:DoTaskInTime(0.25, function() target.SoundEmitter:PlaySound("dontstarve/common/blackpowder_explo") end)
	TheWorld:DoTaskInTime(0.4, function() SpawnPrefab("explode_small").Transform:SetPosition(targposx+math.random(-rdmradius, rdmradius), targposy+math.random(-rdmradius, rdmradius), targposz+math.random(-rdmradius, rdmradius)) end)
	target:DoTaskInTime(0.4, function() target.SoundEmitter:PlaySound("dontstarve/common/blackpowder_explo") end)
	
end

local function onthrown_regular(inst, data)
    inst.AnimState:SetOrientation( ANIM_ORIENTATION.OnGround )
	if inst.Physics ~= nil and not inst:HasTag("nocollisionoverride") then
		inst.Physics:ClearCollisionMask()
		inst.Physics:CollidesWith(COLLISION.WORLD)
		if TUNING.COLLISIONSAREON then
			inst.Physics:CollidesWith(COLLISION.OBSTACLES)
		end
	end
end

local function shootarrow(inst)
    inst.AnimState:PlayAnimation("arrow_flight")
    inst:AddTag("NOCLICK")
    inst.persists = false
end

local function shootgoldarrow(inst)
    inst.AnimState:PlayAnimation("goldarrow_flight")
    inst:AddTag("NOCLICK")
    inst.persists = false
end

local function shootmoonstonearrow(inst)
    inst.AnimState:PlayAnimation("moonstonearrow_flight", true)
	inst.Light:Enable(true)
    inst:AddTag("NOCLICK")
    inst.persists = false
end

local function onmissarrow_regular(inst, attacker, target)
	local RecChance = inst.components.zupalexsrangedweapons:GetRecChance(false)

	if math.random() <= RecChance then
		local currentweaponbaseproj = inst.components.zupalexsrangedweapons:GetBasicAmmo()
--		print("currentprojbasic in super miss = ", currentprojbasicammo)
		local recoveredarrow = SpawnPrefab(currentweaponbaseproj)
		recoveredarrow.Transform:SetPosition(target.Transform:GetWorldPosition())
	end

	inst:Remove()
end

local function onmiss_explosivebolt(inst, attacker, target)
	local shooter = inst.components.zupalexsrangedweapons.owner
	onhitbolt_explosive(inst, shooter, target)
	inst:Remove()
end

local function onhitarrow_healing(inst, attacker, target)
	if target ~= nil then
		if target.components.health ~= nil and not target.components.health:IsDead() then
		target.components.health:DoDelta(25)
		end
		
		if target.components.sanity ~= nil then
			target.components.sanity:DoDelta(-5)
		end
	end
end

local function HITorMISSHandler(inst, attacker, target, DamageToApply, canmiss, canrecover)
	local misschancesmall, misschancebig = inst.components.zupalexsrangedweapons:GetMissChance()
	
	local misschance
	local RecChance
	
	if canmiss then
		if target:HasTag("rabbit") or target:HasTag("bird") or target:HasTag("mole") or target:HasTag("butterfly") or target:HasTag("bee") or target:HasTag("frog") then 
			misschance = misschancesmall
		else
			misschance = misschancebig
		end
	else
		misschance = 0
	end
	
	local hitscore = math.random()
	
--	print("hitscore = ", hitscore)
--	print("miss chance = ", misschance)
	
--	print("Thrower in Component file = ", inst.components.zupalexsrangedweapons.owner)
	
	local bowowner = inst.components.zupalexsrangedweapons.owner -- in this particular case, the "attacker" is actually the bow, because the inst is the arrow, and the "owner" of the arrow is the bow...
	
	if bowowner == nil then
		bowowner = attacker
	end
	
	if not target:IsInLimbo() then
		if hitscore <= misschance then	
			if bowowner ~= nil and bowowner.components and bowowner.components.talker then
				local miss_message = "I should aim better next time!"
				bowowner.components.talker:Say(miss_message)
			end
			target:PushEvent("attacked", {attacker = bowowner, damage = 0.1})
			
			if inst.prefab == "explosivebolt" then
				onhitbolt_explosive(inst, bowowner, target)
			end
			
			if canrecover then
				RecChance = inst.components.zupalexsrangedweapons:GetRecChance(false)
			else
				RecChance = 0
			end
			
			if math.random() <= RecChance and not (inst:HasTag("explosive") or (inst:HasTag("magic") and inst:HasTag("energy"))) then
				local rdmshift = Vector3(math.random(-1, 1), math.random(-1, 1), math.random(-1, 1))
				local targposx, targposy, targposz = target.Transform:GetWorldPosition()
				local currentprojbasicammo = inst.components.zupalexsrangedweapons:GetBasicAmmo()
	--			print("currentprojbasic in miss = ", currentprojbasicammo)
				local recoveredarrow = SpawnPrefab(currentprojbasicammo)
				recoveredarrow.Transform:SetPosition((targposx + rdmshift.x), (targposy + rdmshift.y), (targposz + rdmshift.z))
			end		
		else	
			if target:HasTag("player") then
				if (1-hitscore) <= TUNING.CRITCHANCEPVP then
	--				print("Score a critical against a Player!")
					DamageToApply = DamageToApply*TUNING.CRITDMGMODPVP
				end
			else
				if (1-hitscore) <= TUNING.CRITCHANCEPVE then
	--				print("Score a critical against a Mob!")
					DamageToApply = DamageToApply*TUNING.CRITDMGMODPVE
				end
			end
				
	--		print("Damage To Apply = ", DamageToApply)	
				
			target.components.combat:GetAttacked(bowowner, DamageToApply)
			
			if inst.prefab == "firearrow" then
				onhitarrow_fire(bowowner, target)
			elseif inst.prefab == "icearrow" then
				onhitarrow_ice(bowowner, target)
			elseif inst.prefab == "explosivebolt" then
				onhitbolt_explosive(inst, bowowner, target)
			elseif inst.prefab == "healingarrow" then
				onhitarrow_healing(inst, bowowner, target)
			end
			
			if canrecover then
				RecChance = inst.components.zupalexsrangedweapons:GetRecChance(true)
			else
				RecChance = 0
			end
			
			if math.random() <= RecChance and not (inst:HasTag("explosive") or (inst:HasTag("magic") and inst:HasTag("energy"))) then
				local currentprojbasicammo = inst.components.zupalexsrangedweapons:GetBasicAmmo()
	--			print("currentprojbasic in hit = ", currentprojbasicammo)
				local recoveredarrow = SpawnPrefab(currentprojbasicammo)
				recoveredarrow.Transform:SetPosition(target.Transform:GetWorldPosition())
			end		
		end	
	else
		if not inst:HasTag("explosive") then
			onmissarrow_regular(inst, attacker, inst)
		else
			onmiss_explosivebolt(inst, attacker, inst)
		end
	end
end

local function onhitcommon(inst, attacker, target)	
	local bowowner = inst.components.zupalexsrangedweapons.owner -- in this particular case, the "attacker" is actually the bow, because the inst is the arrow, and the "owner" of the arrow is the bow...
	local BaseDamage = inst.components.zupalexsrangedweapons:GetArrowBaseDamage()
	local DmgModifier = 1.0
	
	if bowowner ~= nil and bowowner.components.sanity ~= nil then
		if inst.prefab == "lightarrow" then 
			if target:HasTag("shadowcreature") then
				DmgModifier = 1.6
				bowowner.components.sanity:DoDelta(5)
			elseif not target:HasTag("shadowcreature") then
				DmgModifier = 0.6
				bowowner.components.sanity:DoDelta(-10)						
			end	
		elseif inst.prefab == "shadowarrow" then 
			if target:HasTag("shadowcreature")then
				DmgModifier = 0.2
				bowowner.components.sanity:DoDelta(-10)
			else 
				bowowner.components.sanity:DoDelta(-2)
			end
		elseif inst.prefab == "healingarrow" then 
			if target:HasTag("hostile")then
				bowowner.components.sanity:DoDelta(-15)
			elseif target:HasTag("player")then
				bowowner.components.sanity:DoDelta(-5)
			end
		end
	end
	
	local FinalDamage = BaseDamage*DmgModifier
	
	HITorMISSHandler(inst, attacker, target, FinalDamage, true, true)

	inst:Remove()
end

local function oncollide(inst, other)
	local attacker = inst.components.zupalexsrangedweapons.owner

	if not (other:HasTag("campfire") or other:HasTag("watersource")) then
		if inst.components.zupalexsrangedweapons ~= nil and not inst:HasTag("explosive") then
			if other.components.combat ~= nil and other:IsValid() and not other:IsInLimbo() and not other:HasTag("wall") then
				local BaseDamage = inst.components.zupalexsrangedweapons:GetArrowBaseDamage()
				HITorMISSHandler(inst, attacker, other, BaseDamage, false, false)
			else
				local inst_x, inst_y, inst_z = inst.Transform:GetWorldPosition()
				local obstacle_x, obstacle_y, obstacle_z = other.Transform:GetWorldPosition()
				local currentprojbasicammo = inst.components.zupalexsrangedweapons:GetBasicAmmo()
				local recoveredarrow = SpawnPrefab(currentprojbasicammo)
				recoveredarrow.Transform:SetPosition((2*inst_x-obstacle_x), (2*inst_y-obstacle_y), (2*inst_z-obstacle_z))
			end
		elseif inst.components.zupalexsrangedweapons ~= nil and inst:HasTag("explosive") then
			onhitbolt_explosive(inst, attacker, other)
		end
 
		if inst:IsValid() then
			inst:Remove()
		end		
	elseif other:HasTag("campfire") or other:HasTag("watersource") then
--		print("Low obstalce encountered")
		RemovePhysicsColliders(inst)
		inst.Physics:CollidesWith(COLLISION.WORLD)
		inst.Physics:CollidesWith(COLLISION.OBSTACLES)
	end
end

local function regulararrowfn()
	local inst = commonarrowfn("arrow_idle", { "piercing", "sharp" })
	
	if not TheWorld.ismastersim then
        return inst
    end
	
	inst.Physics:SetCollisionCallback(oncollide)
	
	inst.components.projectile:SetSpeed(40)
	inst.components.projectile:SetOnThrownFn(shootarrow)
	inst.components.projectile:SetOnHitFn(onhitcommon)
	inst.components.projectile:SetOnMissFn(onmissarrow_regular)
	inst.components.projectile:SetLaunchOffset(Vector3(0.35, 1.05, 0))
	inst:ListenForEvent("onthrown", onthrown_regular)
	
	inst.components.inventoryitem.imagename = "arrow"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/arrow.xml"
	
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM
	
	return inst
end

local function goldarrowfn()
	local inst = commonarrowfn("goldarrow_idle", { "piercing", "sharp", "golden" })
	
	if not TheWorld.ismastersim then
        return inst
    end
	
	inst.Physics:SetCollisionCallback(oncollide)
	
	inst.components.projectile:SetSpeed(40)
	inst.components.projectile:SetOnThrownFn(shootgoldarrow)
	inst.components.projectile:SetOnHitFn(onhitcommon)
	inst.components.projectile:SetOnMissFn(onmissarrow_regular)
	inst.components.projectile:SetLaunchOffset(Vector3(0.35, 1.05, 0))
	inst:ListenForEvent("onthrown", onthrown_regular)
	
	inst.components.inventoryitem.imagename = "goldarrow"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/goldarrow.xml"
	
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM
	
	return inst
end

local function ondroppedMSarrow(inst)
	inst.Light:Enable(true)
end

local function moonstonearrowfn()
	local inst = commonarrowfn("moonstonearrow_idle", { "piercing", "sharp", "moonstone" })
	
	local light = inst.entity:AddLight()
	
	inst.Light:SetIntensity(0.6)
	inst.Light:SetRadius(0.5)
	inst.Light:SetFalloff(0.75)
	inst.Light:Enable(true)
	inst.Light:SetColour(0/255, 0/255, 255/255)
	
	if not TheWorld.ismastersim then
        return inst
    end
	
	inst.Physics:SetCollisionCallback(oncollide)
	
    inst.components.inventoryitem:SetOnDroppedFn(ondroppedMSarrow)
	
	inst.components.projectile:SetSpeed(40)
	inst.components.projectile:SetOnThrownFn(shootmoonstonearrow)
	inst.components.projectile:SetOnHitFn(onhitcommon)
	inst.components.projectile:SetOnMissFn(onmissarrow_regular)
	inst.components.projectile:SetLaunchOffset(Vector3(0.35, 1.05, 0))
	inst:ListenForEvent("onthrown", onthrown_regular)
	
	inst.components.inventoryitem.imagename = "moonstonearrow"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/moonstonearrow.xml"
	
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM
	
	return inst
end

local function onmissarrow_special(inst, attacker, target)
	inst:Remove()
end

local function shootarrow_fire(inst)
    inst.AnimState:PlayAnimation("firearrow_flight", true)
    inst:AddTag("NOCLICK")
    inst.persists = false
end

local function shootarrow_ice(inst)
    inst.AnimState:PlayAnimation("icearrow_flight", true)
    inst:AddTag("NOCLICK")
    inst.persists = false
end

local function firearrowfn()
	local inst = commonarrowfn("firearrow_idle", { "burning" })
	
	if not TheWorld.ismastersim then
        return inst
    end
	
	inst.Physics:SetCollisionCallback(oncollide)
	
	inst.components.projectile:SetSpeed(40)
	inst.components.projectile:SetOnThrownFn(shootarrow_fire)
    inst.components.projectile:SetOnHitFn(onhitcommon)
    inst.components.projectile:SetOnMissFn(onmissarrow_regular)
	inst.components.projectile:SetLaunchOffset(Vector3(0.35, 1.05, 0))
    inst:ListenForEvent("onthrown", onthrown_regular)
	
	inst.components.inventoryitem.imagename = "firearrow"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/firearrow.xml"
	
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM
	
	return inst
end

local function icearrowfn()
	local inst = commonarrowfn("icearrow_idle", { "freezing" })
	
	if not TheWorld.ismastersim then
        return inst
    end
	
	inst.Physics:SetCollisionCallback(oncollide)
	
	inst.components.projectile:SetSpeed(40)
	inst.components.projectile:SetOnThrownFn(shootarrow_ice)
    inst.components.projectile:SetOnHitFn(onhitcommon)
    inst.components.projectile:SetOnMissFn(onmissarrow_regular)
	inst.components.projectile:SetLaunchOffset(Vector3(0.35, 1.05, 0))
    inst:ListenForEvent("onthrown", onthrown_regular)
	
	inst.components.inventoryitem.imagename = "icearrow"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/icearrow.xml"
	
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM
	
	return inst
end

------------------------------------------------------------ CROSSBOWS ------------------------------------------------------------

local function onarmedxbow(inst, armer)
	inst:AddTag("readytoshoot")
	armer.AnimState:OverrideSymbol("swap_object", "swap_crossbow", "swap_crossbow_armed")
end

local function OnEquipXbow(inst, owner)
	if TheWorld.ismastersim then
		if OriginalDoAttackButton == nil and owner.components.playercontroller ~= nil then
			OriginalDoAttackButton = owner.components.playercontroller.DoAttackButton
			OriginalOnRemoteAttackButton = owner.components.playercontroller.OnRemoteAttackButton
		end
	else
		if ClientOriginalDoAttackButton == nil and owner.components.playercontroller ~= nil then
			ClientOriginalDoAttackButton = owner.components.playercontroller.DoAttackButton
			ClientOriginalOnRemoteAttackButton = owner.components.playercontroller.OnRemoteAttackButton
		end
	end
	
--	print("I equip the crossbow")

	if inst:HasTag("readytoshoot") then
		owner.AnimState:OverrideSymbol("swap_object", "swap_crossbow", "swap_crossbow_armed")
	else
		owner.AnimState:OverrideSymbol("swap_object", "swap_crossbow", "swap_crossbow")
	end
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
	
	SetBowActionsOverride(inst, owner, true)
	inst:DoTaskInTime(1, function(inst) inst._hostATKchanged:set(true) end)
end
 
local function OnUnequipXbow(inst, owner)	
--	print("I unequip the crossbow")
	
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
	
	SetBowActionsOverride(inst, owner, false)
	inst._hostATKchanged:set(false)
end

local function crossbowfn()
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    local netw = inst.entity:AddNetwork()
	
    MakeInventoryPhysics(inst)
     
    anim:SetBank("crossbow")
    anim:SetBuild("crossbow")
    anim:PlayAnimation("crossbow_idle")
 
	inst:AddTag("crossbow") -- Tag is not doing anything by itself. I can be called by other stuffs though.
	inst:AddTag("ranged")
	
	inst._hostATKchanged = net_bool(inst.GUID, "_hostATKchanged", "onhostATKchanged")
	inst._clientATKchanged = false
	inst:ListenForEvent("onhostATKchanged", OnHostATKChanged)
	
 --The following section is suitable for a DST compatible prefab.
    inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then	
        return inst
    end
----------------------------------------------------------------
	
--	print("BOW USES = " , TUNING.BOWUSES, "   /   BOW DMG = ", TUNING.BOWDMG)
	
	if TUNING.BOWUSES < 201 then
		inst:AddComponent("finiteuses")
		inst.components.finiteuses:SetMaxUses(TUNING.BOWUSES)
		inst.components.finiteuses:SetUses(TUNING.BOWUSES)
		inst.components.finiteuses:SetOnFinished(inst.Remove)
	end
	
    inst:AddComponent("inspectable")
	
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "crossbow"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/crossbow.xml"
	
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquipXbow )
    inst.components.equippable:SetOnUnequip( OnUnequipXbow )
	
	inst:AddComponent("zupalexsrangedweapons")
--	inst.components.zupalexsrangedweapons:SetIsReady(false)
	inst.components.zupalexsrangedweapons:SetOnArmedFn(onarmedxbow)
	inst.components.zupalexsrangedweapons:SetDamage(0)
    inst.components.zupalexsrangedweapons:SetRange((TUNING.BOWRANGE*TUNING.CROSSBOWRANGEMOD - 2), TUNING.BOWRANGE*TUNING.CROSSBOWRANGEMOD)
    inst.components.zupalexsrangedweapons:SetProjectile("arrow")
	inst.components.zupalexsrangedweapons:SetOnAttack(onattack)
	inst.components.zupalexsrangedweapons:SetAllowedProjectiles( { "bolt", "explosivebolt"} )
	
    MakeHauntableLaunch(inst)
 
    return inst
end


------------------------------------------------------------ BOLTS ----------------------------------------------------------------

local function commonboltfn(boltanim, tags) 
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    local netw = inst.entity:AddNetwork()
	
    MakeInventoryPhysics(inst)
     
    anim:SetBank("bolt")
    anim:SetBuild("crossbow")
    anim:PlayAnimation(boltanim)
 
	inst:AddTag("projectile") -- Tag is not doing anything by itself. I can be called by other stuffs though.
	inst:AddTag("bolt")

	if tags ~= nil then
        for i, v in ipairs(tags) do
            inst:AddTag(v)
        end
    end

 --The following section is suitable for a DST compatible prefab.
    inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end
----------------------------------------------------------------
	
	inst:AddComponent("projectile")
	
    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem:SetOnPickupFn(onpickup)
	inst.components.inventoryitem:SetOnPutInInventoryFn(onputininventory)
	
	inst:AddComponent("zupalexsrangedweapons")
	
	inst:AddComponent("stackable")
	
	 
    return inst
end

local function shootbolt(inst)
    inst.AnimState:PlayAnimation("bolt_flight",true)
    inst:AddTag("NOCLICK")
    inst.persists = false
end

local function shootexplosivebolt(inst)
    inst.AnimState:PlayAnimation("explosivebolt_flight",true)
    inst:AddTag("NOCLICK")
    inst.persists = false
end
	
local function regularboltfn()
	local inst = commonboltfn("bolt_idle", { "piercing", "sharp" })
	
	if not TheWorld.ismastersim then
        return inst
    end
	
	inst.Physics:SetCollisionCallback(oncollide)
	
	inst.components.projectile:SetSpeed(40)
	inst.components.projectile:SetOnThrownFn(shootbolt)
    inst.components.projectile:SetOnHitFn(onhitcommon)
    inst.components.projectile:SetOnMissFn(onmissarrow_regular)
	inst.components.projectile:SetLaunchOffset(Vector3(0.35, 1.05, 0))
    inst:ListenForEvent("onthrown", onthrown_regular)
	
	inst.components.inventoryitem.imagename = "bolt"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/bolt.xml"
	
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM
	
	return inst
end

local function explosiveboltfn()
	local inst = commonboltfn("explosivebolt_idle", { "explosive" })
	
	inst.entity:AddSoundEmitter()
	
	if not TheWorld.ismastersim then
        return inst
    end
		
	inst.Physics:SetCollisionCallback(oncollide)
	
	inst.components.projectile:SetSpeed(40)
	inst.components.projectile:SetOnThrownFn(shootexplosivebolt)
    inst.components.projectile:SetOnHitFn(onhitcommon)
    inst.components.projectile:SetOnMissFn(onmiss_explosivebolt)
	inst.components.projectile:SetLaunchOffset(Vector3(0.35, 1.05, 0))
    inst:ListenForEvent("onthrown", onthrown_regular)
	
	inst.components.inventoryitem.imagename = "explosivebolt"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/explosivebolt.xml"
	
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM
	
	return inst
end

----------------------------------------------------------------------------------------------MAGIC BOW-----------------------------------------------------------------

local function SpawnSparkles(inst, owner)
	if inst.sparkles01 == nil then
        inst.sparkles01 = SpawnPrefab("sparkles")
        inst.sparkles01.Transform:SetPosition(inst:GetPosition():Get())
        inst.sparkles01:SetFollowTarget(owner, "swap_object", -100, -300, 0.02)
    end
	
	local ismoving = false
	
	inst.onlocomote = function(owner)
		if inst.sparkles01 ~= nil then
			if inst.components.fueled ~= nil and not inst.components.fueled:IsEmpty() then
				if owner.components.locomotor.wantstomoveforward and not ismoving then
					ismoving = true
					inst.sparkles01:SetFollowTarget(owner, "swap_hat", 50, -280, 0.02)
					inst.sparkles01.AnimState:PlayAnimation("mov", true)
		--          inst.sparkles01.SoundEmitter:PlaySound("dontstarve/common/fan_twirl_LP", "twirl")
				elseif not owner.components.locomotor.wantstomoveforward and ismoving then
					ismoving = false
					inst.sparkles01:SetFollowTarget(owner, "swap_object", -100, -300, 0.02)
					inst.sparkles01.AnimState:PlayAnimation("idle", true)
		--          inst.sparkles01.SoundEmitter:KillSound("twirl")
				end
			else
				inst:RemoveEventCallback("locomote", inst.onlocomote, owner)
			end
		else
			inst:RemoveEventCallback("locomote", inst.onlocomote, owner)
		end
    end

    inst:ListenForEvent("locomote", inst.onlocomote, owner)
end

local function OnEquipMagicBow(inst, owner)
	if TheWorld.ismastersim then
		if OriginalDoAttackButton == nil and owner.components.playercontroller ~= nil then
			OriginalDoAttackButton = owner.components.playercontroller.DoAttackButton
			OriginalOnRemoteAttackButton = owner.components.playercontroller.OnRemoteAttackButton
		end
	else
		if ClientOriginalDoAttackButton == nil and owner.components.playercontroller ~= nil then
			ClientOriginalDoAttackButton = owner.components.playercontroller.DoAttackButton
			ClientOriginalOnRemoteAttackButton = owner.components.playercontroller.OnRemoteAttackButton
		end
	end
	
	owner.AnimState:OverrideSymbol("swap_object", "swap_magicbow", "swap_magicbow")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
	
	if inst.components.fueled ~= nil and not inst.components.fueled:IsEmpty() then
		inst:AddTag("hasfuel")
	end
	
	if inst:HasTag("hasfuel") then
		inst.Light:Enable(true)
		SpawnSparkles(inst, owner)
	end
	
	if inst.components.zupalexsrangedweapons.projectile.prefab == "healingarrow" and not self.inst:HasTag("healer") then
		self.inst:AddTag("healer")
	end
	
	SetBowActionsOverride(inst, owner, true)
	inst:DoTaskInTime(1, function(inst) inst._hostATKchanged:set(true) end)
	
--	print("I equip the bow")
end
 
local function OnUnequipMagicBow(inst, owner)	
--	print("I unequip the bow")
	
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")

	if inst.sparkles01 ~= nil then
        inst.sparkles01:SetFollowTarget(nil)
        inst.sparkles01 = nil
		inst:RemoveEventCallback("locomote", inst.onlocomote, owner)
    end
	
	inst.Light:Enable(false)
	
	SetBowActionsOverride(inst, owner, false)
	inst._hostATKchanged:set(false)	
end

local function magicbow_empty(inst)
	if inst.sparkles01 ~= nil then
        inst.sparkles01:SetFollowTarget(nil)
        inst.sparkles01 = nil
    end
	
	inst.Light:Enable(false)
	
	if inst:HasTag("hasfuel") then
		inst:RemoveTag("hasfuel")
	end
end

local function MagicBowCanAcceptFuelItem(self, item)
	if item ~= nil and item.components.fuel ~= nil and (item.components.fuel.fueltype == FUELTYPE.ZUPALEX or item.prefab == "nightmarefuel") then
		return true
	else
		return false
	end
end

local function MagicBowTakeFuel(self, item)		
	if self:CanAcceptFuelItem(item) then
	
		local changeproj = self.inst.components.zupalexsrangedweapons:MBSetNewProjectile(item.prefab)
	
--		print("changeproj = ", changeproj)
	
		if changeproj then
			self:MakeEmpty()
		end
	
		if not self.inst:HasTag("hasfuel") then
			if self.inst.components.equippable ~= nil and self.inst.components.equippable:IsEquipped() then
				self.inst.Light:Enable(true)
			end
			self.inst:AddTag("hasfuel")
		end
		
		if item.prefab =="nightmarefuel" or item.prefab == "z_bluegoop" then
			self:DoDelta(5)
		elseif item.prefab =="z_firefliesball" then
			self:DoDelta(10)
		end
		
        item:Remove()

        if self.inst.components.equippable ~= nil and self.inst.components.equippable:IsEquipped() and self.inst.sparkles01 == nil then
			local owner = self.inst.components.inventoryitem.owner
            SpawnSparkles(self.inst, owner)
        end

        return true
    end
end

local function MagicBowOnSave(self)
    if self.currentfuel > 0 then
        return {fuel = self.currentfuel}
    end
end

local function magicbowfn()
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    local netw = inst.entity:AddNetwork()
	
    MakeInventoryPhysics(inst)
	
    anim:SetBank("magicbow")
    anim:SetBuild("bow")
    anim:PlayAnimation("magicbow_idle")
 
 	local light = inst.entity:AddLight()
	
	inst.Light:SetIntensity(0.8)
	inst.Light:SetRadius(0.5)
	inst.Light:SetFalloff(0.33)
	inst.Light:SetColour(204/255, 0/255, 255/255)
	inst.Light:Enable(false)
 
	inst:AddTag("bow") -- Tag is not doing anything by itself. I can be called by other stuffs though.
	inst:AddTag("ranged")
	inst:AddTag("magic")
	
	inst._hostATKchanged = net_bool(inst.GUID, "_hostATKchanged", "onhostATKchanged")
	inst._clientATKchanged = false
	inst:ListenForEvent("onhostATKchanged", OnHostATKChanged)
	
 --The following section is suitable for a DST compatible prefab.
    inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then	
        return inst
    end
----------------------------------------------------------------
	
--	print("BOW USES = " , TUNING.BOWUSES, "   /   BOW DMG = ", TUNING.BOWDMG)
	
--	inst:AddComponent("finiteuses")
--	inst.components.finiteuses:SetMaxUses(10)
--	inst.components.finiteuses:SetUses(10)
--	inst.components.finiteuses:SetOnFinished(magicbow_empty)
	
    inst:AddComponent("inspectable")
	
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "magicbow"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/magicbow.xml"
	inst.components.inventoryitem:SetOnDroppedFn(function(inst) inst.Light:Enable(false) end)
	
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( OnEquipMagicBow )
    inst.components.equippable:SetOnUnequip( OnUnequipMagicBow )
	
	inst:AddComponent("zupalexsrangedweapons")
	inst.components.zupalexsrangedweapons:SetDamage(0)
    inst.components.zupalexsrangedweapons:SetRange((TUNING.BOWRANGE - 2), TUNING.BOWRANGE)
    inst.components.zupalexsrangedweapons:SetProjectile("shadowarrow")
	inst.components.zupalexsrangedweapons:SetOnAttack(onattack)
	
	inst:AddComponent("fueled")
	inst.components.fueled.accepting = true
	inst.components.fueled.fueltype = FUELTYPE.ZUPALEX
	inst:AddTag("NIGHTMARE_fueled") -- to accept the nightmarefuel as well without modifying the fueltype of the nightmarefuel (better compatibility sake)
--	inst.components.fueled:InitializeFuelLevel(0)
	inst.components.fueled.maxfuel = 10
	inst.components.fueled:StopConsuming()
	inst.components.fueled.CanAcceptFuelItem = MagicBowCanAcceptFuelItem
	inst.components.fueled.TakeFuelItem = MagicBowTakeFuel
	inst.components.fueled.OnSave = MagicBowOnSave
	inst.components.fueled:SetDepletedFn(magicbow_empty)
	
--	for k, v in pairs(FUELTYPE) do
--		print(v)
--	end
	
    MakeHauntableLaunch(inst)
 
    return inst
end


--------------------------------------------------------------------------MAGIC PROJECTILES-------------------------------------------------------------------------

local function commonmagicprojfn(arrowanim, tags) 
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    local netw = inst.entity:AddNetwork()
 
    MakeInventoryPhysics(inst)
 
 	anim:SetBank("magicprojectile")
    anim:SetBuild("bow")
    anim:PlayAnimation(arrowanim)
 
	inst:AddTag("projectile") -- Tag is not doing anything by itself. I can be called by other stuffs though.
	inst:AddTag("arrow")
	inst:AddTag("magic")

	if tags ~= nil then
        for i, v in ipairs(tags) do
            inst:AddTag(v)
        end
    end
	
 --The following section is suitable for a DST compatible prefab.
    inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then	
        return inst
    end
----------------------------------------------------------------
	
	inst:AddComponent("projectile")	
	
	inst:AddComponent("zupalexsrangedweapons")
	 
    return inst
end

local function shootshadowarrow(inst)
    inst.AnimState:PlayAnimation("shadowarrow_flight")
    inst:AddTag("NOCLICK")
    inst.persists = false
end

local function shadowarrowfn()
	local inst = commonmagicprojfn("shadowarrow_flight", { "shadow" })
	
	RemovePhysicsColliders(inst)
	
	local light = inst.entity:AddLight()
	
	inst.Light:SetIntensity(0.8)
	inst.Light:SetRadius(3)
	inst.Light:SetFalloff(0.33)
	inst.Light:Enable(true)
	inst.Light:SetColour(119/255, 45/255, 166/255)
	
	inst:AddTag("energy")
	inst:AddTag("nocollisionoverride")
	
	inst.persists = false
	
	if not TheWorld.ismastersim then
        return inst
    end
	
--	inst.Physics:SetCollisionCallback(oncollide)
	
	inst.components.projectile:SetSpeed(40)
	inst.components.projectile:SetOnThrownFn(shootshadowarrow)
	inst.components.projectile:SetOnHitFn(onhitcommon)
	inst.components.projectile:SetOnMissFn(inst.Remove)
	inst.components.projectile:SetLaunchOffset(Vector3(0.35, 1.05, 0))
	inst:ListenForEvent("onthrown", onthrown_regular)
	
	return inst
end

local function shootlightarrow(inst)
    inst.AnimState:PlayAnimation("lightarrow_flight")
    inst:AddTag("NOCLICK")
    inst.persists = false
end

local function lightarrowfn()
	local inst = commonmagicprojfn("lightarrow_flight", { "light" })
	
	RemovePhysicsColliders(inst)
	
	local light = inst.entity:AddLight()
	
	inst.Light:SetIntensity(0.8)
	inst.Light:SetRadius(3)
	inst.Light:SetFalloff(0.33)
	inst.Light:Enable(true)
	inst.Light:SetColour(255/255, 253/255, 54/255)
	
	inst:AddTag("energy")
	inst:AddTag("nocollisionoverride")
	
	inst.persists = false
	
	if not TheWorld.ismastersim then
        return inst
    end
	
--	inst.Physics:SetCollisionCallback(oncollide)
	
	inst.components.projectile:SetSpeed(30)
	inst.components.projectile:SetOnThrownFn(shootlightarrow)
	inst.components.projectile:SetOnHitFn(onhitcommon)
	inst.components.projectile:SetOnMissFn(inst.Remove)
	inst.components.projectile:SetLaunchOffset(Vector3(0.35, 1.05, 0))
	inst:ListenForEvent("onthrown", onthrown_regular)
	
	return inst
end

local function shoothealingarrow(inst)
    inst.AnimState:PlayAnimation("healingarrow_flight")
    inst:AddTag("NOCLICK")
    inst.persists = false
end

local function healingarrowfn()
	local inst = commonmagicprojfn("healingarrow_flight", { "healing" })
	
	RemovePhysicsColliders(inst)
	
	local light = inst.entity:AddLight()
	
	inst.Light:SetIntensity(0.8)
	inst.Light:SetRadius(3)
	inst.Light:SetFalloff(0.33)
	inst.Light:Enable(true)
	inst.Light:SetColour(247/255, 116/255, 255/255)
	
	inst:AddTag("energy")
	inst:AddTag("nocollisionoverride")
	
	inst.persists = false
	
	if not TheWorld.ismastersim then
        return inst
    end
	
--	inst.Physics:SetCollisionCallback(oncollide)
	
	inst.components.projectile:SetSpeed(20)
	inst.components.projectile:SetOnThrownFn(shoothealingarrow)
	inst.components.projectile:SetOnHitFn(onhitcommon)
	inst.components.projectile:SetOnMissFn(inst.Remove)
	inst.components.projectile:SetLaunchOffset(Vector3(0.35, 1.05, 0))
	inst:ListenForEvent("onthrown", onthrown_regular)
	
	return inst
end

return  Prefab("common/inventory/bow", bowfn, assets, prefabs),
		Prefab("common/inventory/arrow", regulararrowfn, assets, prefabs),
		Prefab("common/inventory/goldarrow", goldarrowfn, assets, prefabs),
		Prefab("common/inventory/moonstonearrow", moonstonearrowfn, assets, prefabs),
		Prefab("common/inventory/firearrow", firearrowfn, assets, prefabs),
		Prefab("common/inventory/icearrow", icearrowfn, assets, prefabs),
		Prefab("common/inventory/crossbow", crossbowfn, assets, prefabs),
		Prefab("common/inventory/bolt", regularboltfn, assets, prefabs),
		Prefab("common/inventory/explosivebolt", explosiveboltfn, assets, prefabs),
		Prefab("common/inventory/magicbow", magicbowfn, assets, prefabs),
		Prefab("common/inventory/shadowarrow", shadowarrowfn, assets),
		Prefab("common/inventory/lightarrow", lightarrowfn, assets),
		Prefab("common/inventory/healingarrow", healingarrowfn, assets)