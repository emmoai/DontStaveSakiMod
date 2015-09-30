local assets=
{
	Asset("ANIM", "anim/glowdust.zip"),
  Asset("ATLAS", "images/inventoryimages/glowdust.xml"),
  Asset("IMAGE", "images/inventoryimages/glowdust.tex"),

}


local function OnPickup(inst)
    inst.components.disappears:StopDisappear()
end

local function OnDropped(inst)
    inst.components.disappears:PrepareDisappear()
end

local function OnHaunt(inst)
    inst.components.disappears:Disappear()
    return true
end

local function item_oneaten(inst, eater)

    if eater.wormlight then
        eater.wormlight.components.spell.lifetime = 0
        eater.wormlight.components.spell:ResumeSpell()
    else
        local light = SpawnPrefab("wormlight_light")
        light.components.spell:SetTarget(eater)
        if not light.components.spell.target then
            light:Remove()
        end
        light.components.spell:StartSpell()
    end
end

local function itemfn()
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
  
	inst.AnimState:SetBank("ashes")
    inst.AnimState:SetBuild("glowdust")
    inst.AnimState:PlayAnimation("idle")
    MakeInventoryPhysics(inst)
   local light = inst.entity:AddLight()
    light:SetFalloff(0.7)
    light:SetIntensity(.5)
    light:SetRadius(0.5)
    light:SetColour(69/255, 131/255, 145/255)
    light:Enable(true)
    inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
	
          	if not TheWorld.ismastersim then
   return inst
end	
inst.entity:SetPristine()  
 
    inst:AddComponent("inspectable")

    --inst:AddComponent("disappears")
   -- inst.components.disappears.sound = "dontstarve/common/dust_blowaway"
   -- inst.components.disappears.anim = "disappear"
    inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
    inst:AddComponent("inventoryitem")
	--inst.components.inventoryitem:SetOnPutInInventoryFn(OnPickup)
	
    inst.components.inventoryitem.atlasname = "images/inventoryimages/glowdust.xml"
 
    inst:AddComponent("tradable")
    
    inst:AddComponent("edible")
    inst.components.edible.foodtype = FOODTYPE.VEGGIE
    inst.components.edible.healthvalue = TUNING.HEALING_MEDSMALL + TUNING.HEALING_SMALL
    inst.components.edible.hungervalue = TUNING.CALORIES_MED
    inst.components.edible.sanityvalue = TUNING.SANITY_MED
    inst.components.edible:SetOnEatenFn(item_oneaten)

	--  inst:ListenForEvent("ondropped", OnDropped)
    --inst.components.disappears:PrepareDisappear()

    --[[inst:AddComponent("hauntable")
    inst.components.hauntable.cooldown_on_successful_haunt = false
    inst.components.hauntable.usefx = false
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
    inst.components.hauntable:SetOnHauntFn(OnHaunt)]]
	
    return inst
end

local function light_resume(inst, time)
    local percent = time/inst.components.spell.duration
    local var = inst.components.spell.variables
    if percent and time > 0 then
        --Snap light to value
        inst.components.lighttweener:StartTween(inst.light, Lerp(0, var.radius, percent), 0.8, 0.5, {1,1,1}, 0)
        --resume tween with time left
        inst.components.lighttweener:StartTween(nil, 0, nil, nil, nil, time)
    end
end

local function light_onsave(inst, data)
    data.timealive = inst:GetTimeAlive()
end

local function light_onload(inst, data)
    if data and data.timealive then
        light_resume(inst, data.timealive)
    end
end

local function light_spellfn(inst, target, variables)
    if target then
        inst.Transform:SetPosition(target:GetPosition():Get())
    end
end

local function light_start(inst)
    local spell = inst.components.spell
    inst.components.lighttweener:StartTween(inst.light, spell.variables.radius, 0.8, 0.5, {169/255,231/255,245/255}, 0)
    inst.components.lighttweener:StartTween(nil, 0, nil, nil, nil, spell.duration)
end

local function light_ontarget(inst, target)
    if not target then return end
    target.wormlight = inst
    target:AddTag(inst.components.spell.spellname)
   -- target.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
	target.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")

end

local function light_onfinish(inst)
    if not inst.components.spell.target then
        return
    end
    inst.components.spell.target.wormlight = nil
   -- inst.components.spell.target.AnimState:ClearBloomEffectHandle()
end

local light_variables = {
    radius = TUNING.WORMLIGHT_RADIUS,
}

local function lightfn()

  	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    inst:AddComponent("lighttweener")
    inst.light = inst.entity:AddLight()
    inst.light:Enable(true)

    inst:AddTag("FX")
    inst:AddTag("NOCLICK")
	
	if not TheWorld.ismastersim then
   return inst
end	
inst.entity:SetPristine()  

    local spell = inst:AddComponent("spell")
    inst.components.spell.spellname = "wormlight"
    inst.components.spell:SetVariables(light_variables)
    inst.components.spell.duration = TUNING.WORMLIGHT_DURATION
    inst.components.spell.ontargetfn = light_ontarget
    inst.components.spell.onstartfn = light_start
    inst.components.spell.onfinishfn = light_onfinish
    inst.components.spell.fn = light_spellfn
    inst.components.spell.resumefn = light_resume
    inst.components.spell.removeonfinish = true

    return inst
end

return Prefab( "common/inventory/glowdust", itemfn, assets),
Prefab("common/inventory/wormlight_light", lightfn)
