
-- In a prefab file, you need to list all the assets it requires.
-- These can be either standard assets, or custom ones in your mod
-- folder.
local Assets =
{
	Asset("ANIM", "anim/bindingring_build.zip"), -- a standard asset
    Asset("ATLAS", "images/inventoryimages/bindingring.xml"),    -- a custom asset, found in the mod folder
}

-- Write a local function that creates, customizes, and returns an instance of the prefab.
local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    inst.entity:AddNetwork()
	
    MakeInventoryPhysics(inst)
    
    inst.AnimState:SetBank("bindingring")
    inst.AnimState:SetBuild("bindingring_build")
    inst.AnimState:PlayAnimation("idle", true)
   
	if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("inspectable")
	
	inst:AddComponent("soulteleporter")
	
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/bindingring.xml"

	inst.components.inventoryitem:SetOnPickupFn( function(inst, pickuper) inst.components.soulteleporter:OnPickup(pickuper) end)
	
    return inst
end


-- Add some strings for this item
STRINGS.NAMES.BINDINGRING = "传送戒指"

--Strings courtesy of The Silent Dapper Darkness
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BINDINGRING = "我可以用这个传送到朋友身边."
STRINGS.CHARACTERS.WILLOW.DESCRIBE.BINDINGRING = "它是如此闪亮。几乎像火一样漂亮."
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.BINDINGRING = "沃乐夫冈不戴首饰. 但是可以帮助沃尔夫冈?"
STRINGS.CHARACTERS.WENDY.DESCRIBE.BINDINGRING = "我可以用这个来回报理解我的痛苦的人."
STRINGS.CHARACTERS.WX78.DESCRIBE.BINDINGRING = "搬迁装置.电源是一个谜."
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.BINDINGRING = "我没有做过任何研究对这个，但我有一个关于这个戒指的预感."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.BINDINGRING = "这就像那些树木年轮中的一个，是吗？但更亮泽。我敢打赌，露西会喜欢这个."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.BINDINGRING = "现在如果只有这个戒指能让我离开这里."

STRINGS.RECIPE_DESC.BINDINGRING = "Binds to your soul."

-- Finally, return a new prefab with the construction function and assets.
return Prefab( "common/inventory/bindingring", fn, Assets)

