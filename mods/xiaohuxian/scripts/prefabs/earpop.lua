local assets=
{
    Asset("ANIM", "anim/earpop.zip"),
    Asset("ANIM", "anim/swap_earpop.zip"),
    Asset("IMAGE", "images/inventoryimages/earpop.tex"),
    Asset("ATLAS", "images/inventoryimages/earpop.xml"),
}

local function UpdateSanity(inst)
    --if inst.components.fueled and inst.components.weapon then
    if inst.components.weapon then
        local san = TUNING.DAPPERNESS_MED * inst.components.perishable:GetPercent()
        --* inst.components.fueled:GetPercent()
        san = Remap(san, 0, TUNING.DAPPERNESS_MED, TUNING.HAMBAT_MIN_DAMAGE_MODIFIER*TUNING.DAPPERNESS_MED, TUNING.DAPPERNESS_MED)
        inst.components.equippable.dapperness = (san)
    end
end

local function OnLoad(inst, data)
    UpdateSanity(inst)
end

local function onattack(inst, owner, target)
    local summonchance = 0.1
    local freezzchance = 0.5
    local ranNum = math.random()
    if ranNum < freezzchance then
        if target.components.freezable then
            target.components.freezable:AddColdness(1)
            target.components.freezable:SpawnShatterFX()
        end
    end
    if ranNum < summonchance then 
        local pt = target:GetPosition()
		local st_pt =  FindWalkableOffset(pt or owner:GetPosition(), math.random()*2*PI, 2, 3)
		local ores = {"butterflymuffin","frogglebunwich","taffy","pumpkincookie","stuffedeggplant","fishsticks","honeynuggets","honeyham","dragonpie","kabobs","mandrakesoup","baconeggs","meatballs","bonestew","perogies","turkeydinner","ratatouille","jammypreserves","fruitmedley","fishtacos","waffles","unagi","flowersalad","icecream","watermelonicle","trailmix","hotchili","guacamole"}
		local ore = ores[math.random(#ores)]
		if st_pt then
			st_pt = st_pt + pt
			local st1 = SpawnPrefab(ore)
			local st2 = SpawnPrefab("collapse_small")
			st1.Transform:SetPosition(st_pt.x, st_pt.y, st_pt.z)
			st2.Transform:SetPosition(st_pt.x, st_pt.y, st_pt.z)
		end
    end
end

local function onequip(inst, owner) 
    owner.AnimState:OverrideSymbol("swap_object", "swap_earpop", "swap_ruins_bat")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 
    owner.components.hunger.burnrate = 0.7
    UpdateSanity(inst)
end

local function onunequip(inst, owner) 
    owner.AnimState:Hide("ARM_carry") 
    owner.AnimState:Show("ARM_normal") 
    owner.components.hunger.burnrate = 1
end

local function turnon(inst)
    local owner = inst.components.inventoryitem and inst.components.inventoryitem.owner
    --if inst.components.fueled:IsEmpty() then
    --    if owner then
            onequip(inst, owner)
    --    end
    --else
    if owner then
        onequip(inst, owner)
    end
    --inst.components.fueled:StartConsuming()
    --end
end

local function turnoff(inst, ranout)
    if inst.components.equippable and inst.components.equippable:IsEquipped() then
        local owner = inst.components.inventoryitem and inst.components.inventoryitem.owner
        if owner then
            onequip(inst, owner)
        end
    end
    --inst.components.fueled:StopConsuming()
end

local function equip(inst, owner)
    turnon(inst)
end

local function unequip(inst, owner)
    onunequip(inst, owner)
    turnoff(inst)
end

local function perish(inst)
    local owner = inst.components.inventoryitem and inst.components.inventoryitem.owner
        turnoff(inst)
end
local function drop(inst)
    turnoff(inst)
end

-- local function fn(Sim)
-- 	local inst = CreateEntity()
    
--     inst.entity:AddTransform()
--     inst.entity:AddAnimState()
--     inst.entity:AddSoundEmitter()
--     inst.entity:AddNetwork()
--     MakeInventoryPhysics(inst)
    
--     inst.AnimState:SetBank("ruins_bat")
--     inst.AnimState:SetBuild("earpop")
--     inst.AnimState:PlayAnimation("idle")

local function fn(Sim)
    -- local inst = CreateEntity()
    -- local trans = inst.entity:AddTransform()
    -- local anim = inst.entity:AddAnimState()
    -- local sound = inst.entity:AddSoundEmitter()
    -- MakeInventoryPhysics(inst)
    
    -- anim:SetBank("ruins_bat")
    -- anim:SetBuild("earpop")
    -- anim:PlayAnimation("idle")


    local inst = CreateEntity()
 
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
     
    MakeInventoryPhysics(inst)    
      
    inst.AnimState:SetBank("ruins_bat")
    inst.AnimState:SetBuild("earpop")
    inst.AnimState:PlayAnimation("idle")
    
    inst:AddTag("sharp")
	--inst:AddTag("show_spoilage")
	inst:AddTag("icebox_valid")
	
    if not TheWorld.ismastersim then
        return inst
    end
 
    inst.entity:SetPristine()

	inst.OnLoad = OnLoad
	
	inst:AddComponent("perishable")
	inst.components.perishable:SetPerishTime(TUNING.PERISH_MED)
	inst.components.perishable:StartPerishing()
	inst.components.perishable.onperishreplacement = "waffles"
	
    inst:AddComponent("weapon")
    local popmaxdmg = 60
    local popmindmg = 30
    local popdamage = popmaxdmg * inst.components.perishable:GetPercent()
    popdamage = Remap(popdamage, 0, popmaxdmg, popmindmg, popmaxdmg)
    inst.components.weapon:SetDamage(popdamage)
	inst.components.weapon.onattack = onattack

    inst:AddComponent("inspectable")
	
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem:SetOnDroppedFn( drop )
	inst.components.inventoryitem.atlasname = "images/inventoryimages/earpop.xml"
    
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( equip )
    inst.components.equippable:SetOnUnequip( unequip )
	inst.components.equippable.dapperness = UpdateSanity(inst)
	inst.components.equippable.walkspeedmult = 1.2
	
    return inst
end

return Prefab( "common/inventory/earpop", fn, assets, prefabs) 