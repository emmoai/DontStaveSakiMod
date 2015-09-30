local assets =
{
	Asset("ANIM", "anim/ground_l_breaking.zip"),
}

local function fn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    inst.entity:AddSoundEmitter()
	
    inst.AnimState:SetBank("ground_breaking")
    inst.AnimState:SetBuild("ground_l_breaking")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:SetFinalOffset(-1)
    inst:AddTag("fx")

    if not TheWorld.ismastersim then
        return inst
    end
    
    inst:ListenForEvent("animover", function(inst) inst:Remove() end)
    return inst
end

return Prefab("common/fx/ground_l_breaking", fn, assets) 
