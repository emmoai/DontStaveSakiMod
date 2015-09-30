local assets=
{
	Asset("ANIM", "anim/yyy.zip"),
	Asset("ANIM", "anim/swap_yyy.zip"),
        Asset("IMAGE", "images/inventoryimages/yyy.tex"),
	Asset("ATLAS", "images/inventoryimages/yyy.xml"),
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
    OnDropped(inst)
    local pos = Vector3(target.Transform:GetWorldPosition())
    local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 3)
    	for k,v in pairs(ents) do
	    if v == target then
            v.components.health:DoDelta(0)
	    local pt = Point(v.Transform:GetWorldPosition())
            local breaking = SpawnPrefab("ground_l_breaking")
            breaking.Transform:SetPosition(pt.x, 0, pt.z)
	    local pt01 = owner:GetPosition()
            local pt02 = target:GetPosition()
            target.Transform:SetPosition((pt02.x-pt01.x)*0.1+pt02.x, 0, (pt02.z-pt01.z)*0.1+pt02.z)
	    elseif v.components.combat and v.components.health and not v.components.health:IsDead() and not v:HasTag("player") then
	    v.components.health:DoDelta(-95)
	    local pt = Point(v.Transform:GetWorldPosition())
            local breaking = SpawnPrefab("ground_l_breaking")
            breaking.Transform:SetPosition(pt.x, 0, pt.z)
	    local pt03 = owner:GetPosition()
            local pt04 = v:GetPosition()
            v.Transform:SetPosition((pt04.x-pt03.x)*0.1+pt04.x, 0, (pt04.z-pt03.z)*0.1+pt04.z)
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
    owner.AnimState:OverrideSymbol("swap_object", "swap_yyy", "swap_spear")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal")
    local light2 = inst.entity:AddLight()
    light2:SetFalloff(.6)
    light2:SetIntensity(.8)
    light2:SetRadius(3)
    light2:Enable(true)
    light2:SetColour(255/255, 88/255, 112/255)	 
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
    inst.AnimState:SetBuild("yyy")
    inst.AnimState:PlayAnimation("idle")  
    
    if not TheWorld.ismastersim then
        return inst
    end

    -------        
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(120)
    inst.components.weapon:SetRange(6, 10)

    inst:AddComponent("projectile")
    inst.components.projectile:SetSpeed(20)
    inst.components.projectile:SetCanCatch(false)
    inst.components.projectile:SetHoming(false)
    inst.components.projectile:SetOnThrownFn(OnThrown)
    inst.components.projectile:SetOnHitFn(OnHit)
    inst.components.projectile:SetOnCaughtFn(OnCaught)

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/yyy.xml"
    
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )

    inst:AddComponent("tradable")
    inst.components.tradable.goldvalue = 12

    local light = inst.entity:AddLight()
    light:SetFalloff(.6)
    light:SetIntensity(.8)
    light:SetRadius(3)
    light:Enable(true)
    light:SetColour(255/255, 88/255, 112/255)

    return inst
end

return Prefab( "common/inventory/yyy", fn, assets) 
