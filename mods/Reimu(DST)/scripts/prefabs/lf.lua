local assets=
{
	Asset("ANIM", "anim/lf.zip"),
	Asset("ANIM", "anim/swap_lf.zip"),
        Asset("IMAGE", "images/inventoryimages/lf.tex"),
	Asset("ATLAS", "images/inventoryimages/lf.xml"),
}

local function OnDropped(inst)
    inst.AnimState:PlayAnimation("idle")
end

local function OnCaught(inst, catcher)
    if catcher then
        if catcher.components.inventory then
            if inst.components.equippable and not catcher.components.inventory:GetEquippedItem(inst.components.equippable.equipslot) then
				catcher.components.inventory:Equip(inst)
			else
                catcher.components.inventory:GiveItem(inst)
            end
            catcher:PushEvent("catch")
        end
    end
end

local function OnThrown(inst, owner)
inst.AnimState:PlayAnimation("planted")
end

local function OnHit(inst, owner, target)
    if owner == target then
        OnDropped(inst)
    else
	inst:Remove()
    end
    local pos = Vector3(target.Transform:GetWorldPosition())
    local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 5)
    	for k,v in pairs(ents) do
	    if v == target then
		local pt = Point(v.Transform:GetWorldPosition())
            	local breaking = SpawnPrefab("ground_l_breaking")
            	breaking.Transform:SetPosition(pt.x, 0, pt.z)
		if v:HasTag("monster") then
			v.components.health:DoDelta(-15)
		end
	    elseif v.components.combat and v.components.health and not v.components.health:IsDead() and not v:HasTag("player") then
	    	if v:HasTag("monster") then
			v.components.health:DoDelta(-15)
		end
		v.components.health:DoDelta(-50)
		local pt = Point(v.Transform:GetWorldPosition())
            	local breaking = SpawnPrefab("ground_l_breaking")
            	breaking.Transform:SetPosition(pt.x, 0, pt.z)
  	    end
    	end
    local impactfx = SpawnPrefab("impact")
    if impactfx then
	    local follower = impactfx.entity:AddFollower()
	    follower:FollowSymbol(target.GUID, target.components.combat.hiteffectsymbol, 0, 0, 0 )
        impactfx:FacePoint(Vector3(inst.Transform:GetWorldPosition()))
    end
end

local function onequip(inst, owner) 
    owner.AnimState:OverrideSymbol("swap_object", "swap_lf", "swap_spear")
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
    inst.entity:AddNetwork()
    inst.entity:AddSoundEmitter()

    MakeInventoryPhysics(inst)
    
    inst.AnimState:SetBank("carrot")
    inst.AnimState:SetBuild("lf")
    inst.AnimState:PlayAnimation("idle")  

    if not TheWorld.ismastersim then
        return inst
    end
    
    -------        
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(50)
    inst.components.weapon:SetRange(8, 12)

    inst:AddComponent("projectile")
    inst.components.projectile:SetSpeed(24)
    inst.components.projectile:SetCanCatch(false)
    inst.components.projectile:SetHoming(false)
    inst.components.projectile:SetOnThrownFn(OnThrown)
    inst.components.projectile:SetOnHitFn(OnHit)
    inst.components.projectile:SetOnCaughtFn(OnCaught)

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/lf.xml"
    
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )
    inst.components.equippable.equipstack = true

    inst:AddComponent("tradable")
    inst.components.tradable.goldvalue = 1

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    return inst
end

return Prefab( "common/inventory/lf", fn, assets) 
