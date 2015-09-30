
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
STRINGS.NAMES.BINDINGRING = "���ͽ�ָ"

--Strings courtesy of The Silent Dapper Darkness
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BINDINGRING = "�ҿ�����������͵��������."
STRINGS.CHARACTERS.WILLOW.DESCRIBE.BINDINGRING = "��������������������һ��Ư��."
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.BINDINGRING = "���ַ�Բ�������. ���ǿ��԰����ֶ����?"
STRINGS.CHARACTERS.WENDY.DESCRIBE.BINDINGRING = "�ҿ�����������ر�����ҵ�ʹ�����."
STRINGS.CHARACTERS.WX78.DESCRIBE.BINDINGRING = "��Ǩװ��.��Դ��һ����."
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.BINDINGRING = "��û�������κ��о��������������һ�����������ָ��Ԥ��."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.BINDINGRING = "�������Щ��ľ�����е�һ�������𣿵��������ҸҴ�ģ�¶����ϲ�����."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.BINDINGRING = "�������ֻ�������ָ�������뿪����."

STRINGS.RECIPE_DESC.BINDINGRING = "Binds to your soul."

-- Finally, return a new prefab with the construction function and assets.
return Prefab( "common/inventory/bindingring", fn, Assets)

