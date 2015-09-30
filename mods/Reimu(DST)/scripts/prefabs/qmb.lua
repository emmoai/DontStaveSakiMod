local assets=
{
	Asset("ANIM", "anim/qmb.zip"),
	Asset("ANIM", "anim/swap_qmb.zip"),
        Asset("IMAGE", "images/inventoryimages/qmb.tex"),
	Asset("ATLAS", "images/inventoryimages/qmb.xml"),
}

local function onfinished(inst)
    inst:Remove()
end

local function onattack_qmb(inst, attacker, target)
    attacker.components.hunger:DoDelta(-2)
    attacker.components.sanity:DoDelta(-1)
    local pos = Vector3(target.Transform:GetWorldPosition())
    local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 3)
    	for k,v in pairs(ents) do
	    if v == target and v.components.locomotor then
            	if v:HasTag("monster") then
		v.components.health:DoDelta(-15)
		local pt = Point(v.Transform:GetWorldPosition())
            	local breaking = SpawnPrefab("ground_l_breaking")
            	breaking.Transform:SetPosition(pt.x, 0, pt.z)
		end
	    local pt11 = attacker:GetPosition()
            local pt12 = target:GetPosition()
            target.Transform:SetPosition((pt12.x-pt11.x)*0.2+pt12.x, 0, (pt12.z-pt11.z)*0.2+pt12.z)
	    elseif v.components.combat and v.components.health and not v.components.health:IsDead() and not v:HasTag("player") then
	   	 	if v:HasTag("monster") then
		              v.components.health:DoDelta(-15)
			end
		v.components.health:DoDelta(-35)
		local pt = Point(v.Transform:GetWorldPosition())
            	local breaking = SpawnPrefab("ground_l_breaking")
            	breaking.Transform:SetPosition(pt.x, 0, pt.z)
	    	local pt13 = attacker:GetPosition()
            	local pt14 = v:GetPosition()
            	v.Transform:SetPosition((pt14.x-pt13.x)*0.2+pt14.x, 0, (pt14.z-pt13.z)*0.2+pt14.z)
  	    end
	end
end

local function onequip(inst, owner) 
    owner.AnimState:OverrideSymbol("swap_object", "swap_qmb", "swap_spear")
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
    inst.AnimState:SetBuild("qmb")
    inst.AnimState:PlayAnimation("idle")  

    if not TheWorld.ismastersim then
        return inst
    end
    
    -------        
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(35)
     inst.components.weapon:SetRange(8, 12)
    inst.components.weapon:SetOnAttack(onattack_qmb)

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/qmb.xml"
    
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )

    
    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(300)
    inst.components.finiteuses:SetUses(300)
    
    inst.components.finiteuses:SetOnFinished( onfinished )

    inst:AddComponent("tradable")
    inst.components.tradable.goldvalue = 8

    return inst
end

return Prefab( "common/inventory/qmb", fn, assets) 
