local assets=
{
	Asset("ANIM", "anim/cacao.zip"),
	
	Asset("ATLAS", "images/inventoryimages/cacao.xml"),
	Asset("IMAGE", "images/inventoryimages/cacao.tex"),
}

local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
    
    inst.AnimState:SetBuild("moditem")
    inst.AnimState:SetBank("moditem")
    inst.AnimState:PlayAnimation("idle")

    inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

	inst:AddComponent("cookable")
    inst.components.cookable.product = "cacao_cooked"
	
    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/cacao.xml"	
	
    
    return inst
end

return Prefab( "common/inventory/cacao", fn, assets) 
