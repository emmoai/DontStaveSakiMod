local assets=
{
	Asset("ANIM", "anim/exp.zip"),
  Asset("ATLAS", "images/inventoryimages/exp.xml"),
  Asset("IMAGE", "images/inventoryimages/exp.tex"),

}

local function OnPutInInventory(inst)
   inst:AddTag("invexp")
end

local function OnDropped(inst,data)
   inst:RemoveTag("invexp")
end

local function close(inst)
local player = GetPlayer()

    if not inst:HasTag("invexp") and not player:HasTag("valkyrieh") and player:HasTag("easyd") then
        local fx2 = SpawnPrefab("sparklefx")
        fx2.entity:SetParent(player.entity)
	fx2.Transform:SetScale(1, 1, 1)
        fx2.Transform:SetPosition(0, 0, 0)
player.components.health:DoDelta(15)
player.components.sanity:DoDelta(5)
	player.level = player.level + 0
	player.components.talker:Say("额外[EXP]+0 \n简单模式下无?")
    inst:Remove()

    elseif not inst:HasTag("invexp") and not player:HasTag("valkyrieh") and player:HasTag("normald") then
        local fx2 = SpawnPrefab("sparklefx")
        fx2.entity:SetParent(player.entity)
	fx2.Transform:SetScale(1, 1, 1)
        fx2.Transform:SetPosition(0, 0, 0)
player.components.health:DoDelta(5)
player.components.sanity:DoDelta(5)
	player.level = player.level + 1
	player.components.talker:Say("额外[EXP](+1) \n".. (player.level))
    inst:Remove()
    elseif not inst:HasTag("invexp") and not player:HasTag("valkyrieh") and player:HasTag("hardd") then
        local fx2 = SpawnPrefab("sparklefx")
        fx2.entity:SetParent(player.entity)
	fx2.Transform:SetScale(1, 1, 1)
        fx2.Transform:SetPosition(0, 0, 0)
player.components.health:DoDelta(4)
player.components.sanity:DoDelta(4)
	player.level = player.level + 2
	player.components.talker:Say("额外[EXP](+2) \n".. (player.level))
    inst:Remove()
    elseif not inst:HasTag("invexp") and not player:HasTag("valkyrieh") and player:HasTag("hardcored") then
        local fx2 = SpawnPrefab("sparklefx")
        fx2.entity:SetParent(player.entity)
	fx2.Transform:SetScale(1, 1, 1)
        fx2.Transform:SetPosition(0, 0, 0)
player.components.health:DoDelta(3)
player.components.sanity:DoDelta(3)
	player.level = player.level + 3
	player.components.talker:Say("额外[EXP](+3) \n".. (player.level))
    inst:Remove()
    elseif not inst:HasTag("invexp") and not player:HasTag("valkyrieh") and player:HasTag("helld") then
        local fx2 = SpawnPrefab("sparklefx")
        fx2.entity:SetParent(player.entity)
	fx2.Transform:SetScale(1, 1, 1)
        fx2.Transform:SetPosition(0, 0, 0)
player.components.health:DoDelta(2)
player.components.sanity:DoDelta(2)
	player.level = player.level + 4
	player.components.talker:Say("额外[EXP](+4) \n".. (player.level))
    inst:Remove()

end
end

local function far(inst)
end


local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
 	inst.entity:AddNetwork()

        	if not TheWorld.ismastersim then
   return inst
end	

    inst.entity:AddSoundEmitter()
    
    inst.AnimState:SetBank("bulb")
    inst.AnimState:SetBuild("exp")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:SetMultColour(1, 1, 1, 0.3)

    local light = inst.entity:AddLight()
    light:SetFalloff(0.3)
    light:SetIntensity(.3)
    light:SetRadius(0.3)
    light:SetColour(120/255, 120/255, 150/255)
    light:Enable(true)
    inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )

    inst:AddComponent("edible")
    inst.components.edible.foodtype = "EXP"

    inst.components.edible.sanityvalue = 0
    inst.components.edible.healthvalue = 40
    inst.components.edible.hungervalue = 0
    inst:AddComponent("tradable")
        inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "exp.tex" )

    --inst:AddComponent("stackable")
	--inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = 40000000
    inst.components.fuel.fueltype = "CHEMICAL"

    inst:AddComponent("inspectable")

    inst:AddComponent("bait")
    inst:AddTag("molebait")
    
    inst:AddComponent("inventoryitem")
inst.components.inventoryitem.atlasname = "images/inventoryimages/exp.xml"

        inst:AddComponent("playerprox")
    inst.components.playerprox:SetDist(4, 5)
    inst.components.playerprox:SetOnPlayerNear(close)
    inst.components.playerprox:SetOnPlayerFar(far)

    inst.components.inventoryitem:SetOnDroppedFn(OnDropped)
    inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)

    return inst
end

return Prefab( "common/inventory/exp", fn, assets) 

