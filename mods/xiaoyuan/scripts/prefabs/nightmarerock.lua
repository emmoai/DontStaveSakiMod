local assets = {
	Asset("ANIM", "anim/nightmarerock.zip"),
}

for i = 1, 5, 1 do
	table.insert(assets, Asset( "IMAGE", "images/inventoryimages/nightmarerock"..tostring(i)..".tex" ))
	table.insert(assets, Asset( "ATLAS", "images/inventoryimages/nightmarerock"..tostring(i)..".xml" ))
end

local function GetStatus(inst)
	if inst.SoulStage == 1 then
		return "VOID"
	elseif inst.SoulStage == 2 then
		return "WEAK"
	elseif inst.SoulStage == 3 then
		return "NORM"
	elseif inst.SoulStage == 4 then
		return "GRAY"
	elseif inst.SoulStage == 5 then
		return "FULL"
	end
end

local function UpdateRock(inst, stage)
	inst.SoulStage = stage
	inst.AnimState:PlayAnimation(tostring(stage), true)
	inst.components.inventoryitem.atlasname = "images/inventoryimages/nightmarerock"..tostring(stage)..".xml"
	inst.components.inventoryitem:ChangeImageName("nightmarerock"..tostring(stage))
	if stage < 4 then
		inst.components.trader:Enable()
	else
		inst.components.trader:Disable()
	end
	if inst.SoulMaster then
		inst.SoulMaster:PushEvent("soulchange", stage)
	end
end

local function FuelTest(inst, item, giver)
	if item.prefab == "nightmarefuel" and giver == inst.SoulMaster then
		return true
	end
end

local function FuelAccept(inst, giver, item)
	inst:UpdateRock(inst.SoulStage + 2)
end

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	MakeInventoryPhysics(inst)

	inst.AnimState:SetBank("nightmarerock")
	inst.AnimState:SetBuild("nightmarerock")
	
	inst:AddTag("irreplaceable")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst:AddComponent("inspectable")
	inst.components.inspectable.getstatus = GetStatus

	inst:AddComponent("inventoryitem")
local old = inst.components.inventoryitem.SetOwner
inst.components.inventoryitem.SetOwner = function(self, owner)
    old(self, owner)
    if owner then
        owner:DoTaskInTime(0, function()
            if owner.components.container then
                owner.components.container:DropItem(inst)
            end
        end)
    end
end

	inst:AddComponent("trader")
	inst.components.trader.acceptnontradable = true
	inst.components.trader.test = FuelTest
	inst.components.trader.onaccept = FuelAccept

	inst.UpdateRock = UpdateRock
	
	inst.SoulMaster = nil

	inst:UpdateRock(5)

	return inst
end

return Prefab("common/inventory/nightmarerock", fn, assets)
