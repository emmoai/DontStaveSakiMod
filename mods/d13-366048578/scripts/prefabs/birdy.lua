local assets = {  
    Asset("ANIM", "anim/birdy.zip"),
  
    Asset("IMAGE", "images/inventoryimages/birdy.tex"),   
    Asset("ATLAS", "images/inventoryimages/birdy.xml"),	
	
	}

local function onequip(inst, owner)
        owner.AnimState:OverrideSymbol("swap_hat", "birdy", "swap_hat")
        owner.AnimState:Show("HAT")
        owner.AnimState:Hide("HAT_HAIR")
        owner.AnimState:Show("HAIR_NOHAT")
        owner.AnimState:Show("HAIR")
        
        if owner:HasTag("player") then
			owner.AnimState:Show("HEAD")
			owner.AnimState:Show("HEAD_HAIR")
		end
		
		local birdspawner = TheWorld.components.birdspawner
        if birdspawner ~= nil then
            birdspawner:SetSpawnTimes(TUNING.BIRD_SPAWN_DELAY_FEATHERHAT)
            birdspawner:SetMaxBirds(TUNING.BIRD_SPAWN_MAX_FEATHERHAT)
        end
    
    end
	
local function onunequip(inst, owner) 
        owner.AnimState:Hide("HAT")
        owner.AnimState:Hide("HAT_HAIR")
        owner.AnimState:Show("HAIR_NOHAT")
        owner.AnimState:Show("HAIR")

		if owner:HasTag("player") then
	        owner.AnimState:Show("HEAD")
			owner.AnimState:Show("HEAD_HAIR")
		end
		
		local birdspawner = TheWorld.components.birdspawner
        if birdspawner ~= nil then
            birdspawner:SetSpawnTimes(TUNING.BIRD_SPAWN_DELAY)
            birdspawner:SetMaxBirds(TUNING.BIRD_SPAWN_MAX)
        end
end


local function fn(Sim)
	local inst = CreateEntity()
	local minimap = inst.entity:AddMiniMapEntity()
	local trans = inst.entity:AddTransform()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	MakeInventoryPhysics(inst)
    
	inst:AddTag("birdy")
	
    minimap:SetIcon( "birdy.tex" )
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	
    inst.entity:SetPristine() -- I have no idea what this does.
	
    inst.AnimState:SetBank("featherhat")
    inst.AnimState:SetBuild("birdy")
    inst.AnimState:PlayAnimation("anim")
	
	
    MakeHauntableLaunch(inst)
	
	inst:AddComponent("inspectable")
   
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/birdy.xml"
		
    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
	inst.components.equippable.dapperness = TUNING.DAPPERNESS_LARGE	
	
	inst:AddComponent("sanityaura")
	inst.components.sanityaura.aura = (TUNING.SANITYAURA_SMALL * 0.5)
	
	inst:AddComponent("insulator")
    inst.components.insulator.insulation = TUNING.INSULATION_SMALL
    inst.components.equippable:SetOnEquip( onequip )
	
	
    inst.components.equippable:SetOnUnequip( onunequip )
 
 
    return inst
end


return Prefab( "common/inventory/birdy", fn, assets)