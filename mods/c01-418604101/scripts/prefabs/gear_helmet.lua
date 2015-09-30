
local assets=
{
	Asset("ANIM", "anim/gear_helmet.zip"),
	Asset("ATLAS", "images/inventoryimages/gear_helmet.xml"),
	Asset("IMAGE", "images/inventoryimages/gear_helmet.tex"),
}

local function OnBlocked(owner) 
    owner.SoundEmitter:PlaySound("dontstarve/wilson/hit_armour")
end

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_hat", "gear_helmet", "swap_hat")
    inst:ListenForEvent("blocked", OnBlocked, owner)	
	owner.SoundEmitter:PlaySound("dontstarve/creatures/knight/idle")
    local sparks = SpawnPrefab("sparks2")
    sparks.Transform:SetPosition(inst.Transform:GetWorldPosition() )
	
    owner.AnimState:Show("HAT")
    owner.AnimState:Show("HAT_HAIR")
    owner.AnimState:Hide("HAIR_NOHAT")
    owner.AnimState:Hide("HAIR")
		
	if owner.components.health then
		owner.components.health.save_fire_damage_scale = owner.components.health.fire_damage_scale
		owner.components.health.fire_damage_scale = owner.components.health.fire_damage_scale * 0.5
    end			
end

local function onunequip(inst, owner) 
    inst:RemoveEventCallback("blocked", OnBlocked, owner)
    owner.AnimState:Hide("HAT")
    owner.AnimState:Hide("HAT_HAIR")
    owner.AnimState:Show("HAIR_NOHAT")
    owner.AnimState:Show("HAIR")
	if owner.components.health then
		owner.components.health.fire_damage_scale = owner.components.health.save_fire_damage_scale or 1
    end			
end

local function fn(Sim)
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
	inst.entity:AddMiniMapEntity()
	inst.entity:AddNetwork()
    
    inst:AddTag("hat")
    
    anim:SetBank("beehat")
    anim:SetBuild("gear_helmet")
    anim:PlayAnimation("anim")    
        
    inst:AddTag("metal")
	
	inst.MiniMapEntity:SetIcon( "gear_helmet.tex" )

    if not TheWorld.ismastersim then
        return inst
    end

    inst.entity:SetPristine()
	
    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.foleysound = "dontstarve/movement/foley/metalarmour"	
    inst.components.inventoryitem.atlasname = "images/inventoryimages/gear_helmet.xml"
		
    inst:AddComponent("armor")
    inst.components.armor:InitCondition(TUNING.ARMORSLURPER, TUNING.ARMORMARBLE_ABSORPTION*0.85/0.95)		
		
    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable.walkspeedmult = 0.91	
	
	if inst.components.equippable.dapperness then --RoG
		inst.components.equippable.dapperness = TUNING.DAPPERNESS_TINY --like a flower hat
	else
		inst:AddComponent("dapperness")
		inst.components.dapperness.dapperness = TUNING.DAPPERNESS_TINY
	end	
	
    
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )

    return inst
end

return Prefab( "common/inventory/gear_helmet", fn, assets) 
