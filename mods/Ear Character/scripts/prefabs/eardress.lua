local assets=
{
	Asset("ANIM", "anim/eardress.zip"),
	Asset("IMAGE", "images/inventoryimages/eardress.tex"),
	Asset("ATLAS", "images/inventoryimages/eardress.xml"),
}

local function onequip(inst, owner) 
    
    owner.AnimState:OverrideSymbol("swap_body", "eardress", "swap_body")
    inst.components.fueled:StartConsuming()
	--owner.components.inventory:SetOverflow(inst)
    inst.components.container:Open(owner)
end

local function onunequip(inst, owner) 
    owner.AnimState:ClearOverrideSymbol("swap_body")
    inst.components.fueled:StopConsuming()
	--owner.components.inventory:SetOverflow(nil)
    inst.components.container:Close(owner)
end

--[[
local slotpos = {}

for y = 0, 1 do
	table.insert(slotpos, Vector3(-162, -y*75 + 45 ,0))
	table.insert(slotpos, Vector3(-162 + 75, -y*75 + 45 ,0))
end
--]]

local function onfinish(inst)
	inst.components.container:DropEverything()
    inst.components.container:Close()
	inst:Remove()
end


local function fn(Sim)
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    MakeInventoryPhysics(inst)
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("krampus_sack.png")
    
    inst.AnimState:SetBank("torso_rain")
    inst.AnimState:SetBuild("eardress")
    inst.AnimState:PlayAnimation("anim")

    inst:AddTag("fridge")
	

	



    if not TheWorld.ismastersim then
        return inst
    end
    
    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "eardress"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/eardress.xml"

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY
    inst.components.equippable.insulated = true
	inst.components.equippable.dapperness = TUNING.DAPPERNESS_MED
    
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )
    
    inst:AddComponent("fueled")
    inst.components.fueled.fueltype = "USAGE"
 	inst.components.fueled:InitializeFuelLevel(4800)
	inst.components.fueled:SetDepletedFn(onfinish)
	
	inst:AddComponent("armor")
    inst.components.armor:InitCondition(999,TUNING.FULL_ABSORPTION )
	inst.components.armor:SetPercent(1)
	
    inst:AddComponent("container")
    inst.components.container:WidgetSetup("icepack")
--[[
    inst.components.container.widgetslotpos = slotpos
    inst.components.container.widgetanimbank = "ui_icepack_2x3"
    inst.components.container.widgetanimbuild = "ui_icepack_2x3"
    inst.components.container.widgetpos = Vector3(-5,-70,0)
    inst.components.container.side_widget = true
    inst.components.container.type = "pack"
--]]
    return inst
end

return Prefab( "common/inventory/eardress", fn, assets) 
