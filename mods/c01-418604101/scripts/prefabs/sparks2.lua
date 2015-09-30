local assets=
{
    Asset("ANIM", "anim/sparks2.zip"),
}

local prefabs = 
{
    "sparks_fx"
}

local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddLight()
	inst.entity:AddNetwork()
    inst.persists = false
    
    inst.AnimState:SetBank("sparks")
    inst.AnimState:SetBuild("sparks2")
    inst.AnimState:PlayAnimation("sparks_" .. tostring(math.random(3)))
    inst.Transform:SetScale(2,2,2)
    inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )

    inst:AddTag("FX")
    
    inst.Light:Enable(false)
    inst.Light:SetRadius(2)
    inst.Light:SetFalloff(1)
    inst.Light:SetIntensity(.9)
    inst.Light:SetColour(235/255,121/255,12/255)

    inst.entity:SetPristine()	

    if not TheWorld.ismastersim then
        return inst
    end

    
    --local fx = PlayFX(pos, "sparks", "sparks", "sparks_" .. math.random(3))
	if TUNING.LIGHTNING_GOAT_DAMAGE then --RoG
		local fx = SpawnPrefab("sparks_fx")
		if fx then
			fx.Transform:SetPosition(inst:GetPosition():Get())
		end
	end
    local i = .9

    local dt = 1/20
    local sound = true
    inst:DoPeriodicTask(dt, function() 
        if sound then inst.SoundEmitter:PlaySound("dontstarve/characters/wx78/spark") sound = false end
        inst.Light:SetIntensity(i)
        i =i - dt*2
        --r = r - dt*3
        if i <= 0 then
            inst:Remove()
        end
    end)

    return inst
end

return Prefab( "common/fx/sparks2", fn, assets, prefabs) 

