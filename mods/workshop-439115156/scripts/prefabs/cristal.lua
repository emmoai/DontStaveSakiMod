local assets=
{
  Asset("ANIM", "anim/cristal.zip"),
  Asset("ATLAS", "images/inventoryimages/cristal.xml"),
  Asset("IMAGE", "images/inventoryimages/cristal.tex"),
}
local CRY_NEAR_LEADER_DISTANCE = 8

local function item_oneaten(inst, eater)
local poopchance = 0.4
local rebackchance = 0.2
local eggchance = 1.0
	local dark2 = SpawnPrefab("statue_transition_2")
	dark2.Transform:SetPosition(eater:GetPosition():Get())
      if math.random() < poopchance then
		local poo = SpawnPrefab("flower_cave")
		poo.Transform:SetPosition(eater.Transform:GetWorldPosition())	
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("flower_cave")
		poo.Transform:SetPosition(eater.Transform:GetWorldPosition())	
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("flower_cave_double")
		poo.Transform:SetPosition(eater.Transform:GetWorldPosition())	
    elseif math.random() < poopchance then
		local poo = SpawnPrefab("flower_cave_double")
		poo.Transform:SetPosition(eater.Transform:GetWorldPosition())	
    elseif math.random() < rebackchance then
		local poo = SpawnPrefab("flower_cave_triple")
		poo.Transform:SetPosition(eater.Transform:GetWorldPosition())	
    elseif math.random() < eggchance then
		local poo = SpawnPrefab("flower_cave")
		poo.Transform:SetPosition(eater.Transform:GetWorldPosition())	

	end	end

local function fn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
    
    inst.AnimState:SetBank("bulb")
    inst.AnimState:SetBuild("cristal")
    inst.AnimState:PlayAnimation("idle")

      inst.entity:AddLight()
    inst.Light:SetFalloff(0.7)
    inst.Light:SetIntensity(.5)
    inst.Light:SetRadius(1.5)
    inst.Light:SetColour(69/255, 180/255, 200/255)
    inst.Light:Enable(true)
	inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
    inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "cristal.tex" )

		inst:AddComponent("edible")
        inst.components.edible.foodtype = FOODTYPE.VEGGIE
		inst.components.edible:SetOnEatenFn(item_oneaten)	   
  inst.components.edible.hungervalue = 2
	inst.components.edible.healthvalue = 1000
	inst.components.edible.sanityvalue = 2
    inst:AddComponent("tradable")
	
 inst.entity:SetPristine()
 
   if not TheWorld.ismastersim then
        return inst
    end	
	  
	
    inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
inst.components.inventoryitem.atlasname = "images/inventoryimages/cristal.xml"

    return inst
end

return Prefab( "common/inventory/cristal", fn, assets) 

