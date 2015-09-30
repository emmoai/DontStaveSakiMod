local assets=
{
    Asset("ANIM", "anim/bow.zip"),
    Asset("ANIM", "anim/swap_quiver.zip"),
	 

    Asset("ATLAS", "images/inventoryimages/quiver.xml"),
    Asset("IMAGE", "images/inventoryimages/quiver.tex"),
	
	Asset("ANIM", "anim/ui_quiver_1x1.zip"),
}
prefabs = {
}

-------------------------------------------------------------QUIVER --------------------------------------------------------

local containers = require "containers"
local prev_widgetsetup=containers.widgetsetup
 
local function originalwidgetsetup(container, prefab, data)
    local t = data or params[prefab or container.inst.prefab]
    if t ~= nil then
        for k, v in pairs(t) do
            container[k] = v
        end
        container:SetNumSlots(container.widget.slotpos ~= nil and #container.widget.slotpos or 0)
    end
end

local quiverwidgetparams =
	{
		widget =
		{
			slotpos = {Vector3(0, -5, 0)},
			animbank = "ui_quiver_1x1",
			animbuild = "ui_quiver_1x1",
			pos = Vector3(-140, -280, 0),
		},
		issidewidget = true,
		type = "quiver",
	}

function quiverwidgetparams.itemtestfn(container, item, slot)
		if item:HasTag("zupalexsrangedweapons") and (item:HasTag("arrow") or item:HasTag("bolt")) then 
			return true
		else
			return false
		end
end
	

local function OnEquipQuiver(inst, owner)
	inst._widgetupdate:set(true)
	
    owner.AnimState:OverrideSymbol("swap_body", "swap_quiver", "swap_body")
	if inst.components.container ~= nil then
        inst.components.container:Open(owner)
    end
end
 
local function OnUnequipQuiver(inst, owner)
	inst._widgetupdate:set(false)

    owner.AnimState:ClearOverrideSymbol("swap_body")
	if inst.components.container ~= nil then
        inst.components.container:Close(owner)
    end
end

local function OnWidgetUpdate(inst)
    if inst._widgetupdate:value() ~= inst._clientwidgetupdate then
        inst._clientwidgetupdate = inst._widgetupdate:value()
		containers.widgetsetup = originalwidgetsetup
        inst.replica.container:WidgetSetup(inst.prefab, quiverwidgetparams)
		containers.widgetsetup = prev_widgetsetup
    end
end

local function quiverfn()
    local inst = CreateEntity()
    local trans = inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    local netw = inst.entity:AddNetwork()
	
    MakeInventoryPhysics(inst)
     
    anim:SetBank("quiver")
    anim:SetBuild("swap_quiver")
    anim:PlayAnimation("anim")
 
	inst:AddTag("quiver") -- Tag is not doing anything by itself. I can be called by other stuffs though.
	
	inst._widgetupdate = net_bool(inst.GUID, "_widgetupdate", "onwidgetupdate")
	
 --The following section is suitable for a DST compatible prefab.
    inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then	
	inst._clientwidgetupdate = false
	inst:ListenForEvent("onwidgetupdate", OnWidgetUpdate)
        return inst
    end
----------------------------------------------------------------
	
    inst:AddComponent("inspectable")
	
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.cangoincontainer = false
    inst.components.inventoryitem.imagename = "quiver"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/quiver.xml"
	
	inst:AddComponent("equippable")
	inst.components.equippable.equipslot = EQUIPSLOTS.QUIVER
	inst.components.equippable:SetOnEquip( OnEquipQuiver )
	inst.components.equippable:SetOnUnequip( OnUnequipQuiver )
	
	inst:AddComponent("container")
	
	containers.widgetsetup = originalwidgetsetup
    inst.components.container:WidgetSetup(inst.prefab, quiverwidgetparams)
	containers.widgetsetup = prev_widgetsetup
	
	inst:AddComponent("zupalexsrangedweapons")

    MakeHauntableLaunch(inst)

	return inst
end


return  Prefab("common/inventory/quiver", quiverfn, assets, prefabs)