local assets = {}

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddLight()
    inst.entity:AddNetwork()

	inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
	inst.AnimState:SetRayTestOnBB(true)
	inst.AnimState:SetFinalOffset(-1)
	
	inst.Light:SetRadius(5)
	inst.Light:SetFalloff(0.66)
	inst.Light:SetIntensity(0.66)
	inst.Light:SetColour(235 / 255, 121 / 255, 12 / 255)

    inst:AddTag("FX")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	return inst
end

return Prefab("common/fx/horofire", fn, assets)
