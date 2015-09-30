local assets =
{
	Asset("ANIM", "anim/buildgridplacer.zip"),
}

local function fn()
	local inst = CreateEntity()

    --[[Non-networked entity]]

	inst.entity:AddTransform()
	inst.entity:AddAnimState()

	inst.AnimState:SetBank("buildgridplacer")
	inst.AnimState:SetBuild("buildgridplacer")
	inst.AnimState:PlayAnimation("anim", true)
	inst.Transform:SetScale(1.5,1.5,1.5)
	
	inst:AddComponent("placer")
	inst.persists = false
    inst.AnimState:SetLightOverride(1)
	inst.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround)
	return inst
end

return Prefab("common/buildgridplacer", fn, assets)