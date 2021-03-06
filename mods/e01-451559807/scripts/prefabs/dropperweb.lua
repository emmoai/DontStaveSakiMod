local prefabs =
{
    "spider_dropper",
}

local function SpawnInvestigators(inst, data)
    if inst.components.childspawner then
        local num_to_release = math.min(2, inst.components.childspawner.childreninside)          
        for k = 1,num_to_release do
            local spider = inst.components.childspawner:SpawnChild(data.target, nil, 3)
            if spider then 
                spider.sg:GoToState("dropper_enter")
            end
        end
    end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
    inst.entity:AddGroundCreepEntity()
    inst.entity:AddMiniMapEntity()

    inst.GroundCreepEntity:SetRadius(5)
    inst:AddTag("spiderden")
    inst.MiniMapEntity:SetIcon("whitespider_den.png")

    if not TheWorld.ismastersim then
        return inst
    end

    inst.entity:SetPristine()

    inst:ListenForEvent("creepactivate", SpawnInvestigators)

    inst:AddComponent("health")
    inst:AddComponent("childspawner")
    inst.components.childspawner:SetRegenPeriod(120)
    inst.components.childspawner:SetSpawnPeriod(240)
    inst.components.childspawner:SetMaxChildren(math.random(2, 3))
    inst.components.childspawner:StartRegen()
    inst.components.childspawner.childname = "spider_dropper"

    return inst
end

return Prefab("cave/objects/dropperweb", fn, nil,prefabs)