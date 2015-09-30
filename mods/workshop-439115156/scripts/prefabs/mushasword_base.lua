-----------------------------

local assets=
{
	Asset("ANIM", "anim/mushasword_base.zip"),
	Asset("ANIM", "anim/swap_mushasword_base.zip"),
	Asset("ANIM", "anim/swap_mushasword_frost1.zip"),	
    	Asset("ATLAS", "images/inventoryimages/mushasword_base.xml"),
	Asset("IMAGE", "images/inventoryimages/mushasword_base.tex"),
}

local function levelexp(inst,data)

	local max_exp = 220
	local exp = math.min(inst.level, max_exp)

if inst.level >= 210 then
--inst.components.talker:Say("-[破损之刃]-\n[成长点数]".. (inst.level))
end
if inst.level >=0 and inst.level <10 then
inst.components.talker:Say("-[破损之刃] \n下一级:[10]\n[成长点数]".. (inst.level))
elseif inst.level >=10 and inst.level <30 then
inst.components.talker:Say("-[破损之刃] \n下一级:[30]\n[成长点数]".. (inst.level))
elseif inst.level >=30 and inst.level <50 then
inst.components.talker:Say("-[破损之刃] \n下一级:[50]\n[成长点数]".. (inst.level))
elseif inst.level >=50 and inst.level <70 then
inst.components.talker:Say("-[破损之刃] \n下一级:[70]\n[成长点数]".. (inst.level))
elseif inst.level >=70 and inst.level <90 then
inst.components.talker:Say("-[破损之刃] \n下一级:[90]\n[成长点数]".. (inst.level))
elseif inst.level >=90 and inst.level <120 then
inst.components.talker:Say("-[破损之刃] \n下一级:[120]\n[成长点数]".. (inst.level))
elseif inst.level >=120 and inst.level <150 then
inst.components.talker:Say("-[破损之刃] \n下一级:[150]\n[成长点数]".. (inst.level))
elseif inst.level >=150 and inst.level <180 then
inst.components.talker:Say("-[破损之刃] \n下一级:[180]\n[成长点数]".. (inst.level))
elseif inst.level >=180 and inst.level <210 then
inst.components.talker:Say("-[破损之刃] \n下一级:[210]\n[成长点数]".. (inst.level))
elseif inst.level >=210 and inst.level <215 then
inst.components.talker:Say("-[原型之刃] \nMAX")
end
end

local function onpreload(inst, data)
	if data then
		if data.level then
		inst.level = data.level
			levelexp(inst)
end
	end
		end
local function onsave(inst, data)
	data.level = inst.level
end

local function onblink(staff, pos, caster)

    if caster.components.sanity ~= nil then
        caster.components.sanity:DoDelta(-10)
    end
end

local function blinkstaff_reticuletargetfn()
    local player = ThePlayer
	local rotation = player.Transform:GetRotation() * DEGREES
    local pos = player:GetPosition()
    for r = 13, 1, -1 do
        local numtries = 2 * PI * r
        local pt = FindWalkableOffset(pos, rotation, r, numtries)
        if pt ~= nil then
            return pt + pos
        end
    end
end

local function Upgradedamage(inst, data)
if inst.components.fueled:IsEmpty() then
inst.broken = true
elseif not inst.components.fueled:IsEmpty() then
inst.broken = false
end
if inst.broken then
   inst.components.weapon:SetDamage(1)
	inst.components.talker:Say("-彻底损坏的刀\n伤害(1)")
  
elseif not inst.broken then

 if inst.level >=0 and inst.level <10 then
    inst.components.weapon:SetDamage(20)
	inst.components.talker:Say("-破损之刃(LV1)\n伤害(20)")
 elseif inst.level >=10 and inst.level <30 then
    inst.components.weapon:SetDamage(22)
	inst.components.talker:Say("-破损之刃(LV2)\n伤害(22)")
 elseif inst.level >=30 and inst.level <50 then
    inst.components.weapon:SetDamage(24)
	inst.components.talker:Say("-破损之刃(LV3)\n伤害(24)")
 elseif inst.level >=50 and inst.level <70 then
    inst.components.weapon:SetDamage(26)
	inst.components.talker:Say("-破损之刃(LV4)]\n伤害(26)")
  elseif inst.level >=70 and inst.level <90 then
    inst.components.weapon:SetDamage(28)
	inst.components.talker:Say("-破损之刃(LV5)\n伤害(28)")
elseif inst.level >=90 and inst.level <120 then
    inst.components.weapon:SetDamage(30)
	inst.components.talker:Say("-破损之刃(LV6)\n伤害(30)")
elseif inst.level >=120 and inst.level <150 then
    inst.components.weapon:SetDamage(32)
	inst.components.talker:Say("-破损之刃(LV7)\n伤害(32)")
elseif inst.level >=150 and inst.level <180 then
    inst.components.weapon:SetDamage(34)
	inst.components.talker:Say("-破损之刃(LV8)\n伤害(34))")
elseif inst.level >=180 and inst.level <210 then
    inst.components.weapon:SetDamage(36)
	inst.components.talker:Say("-破损之刃(LV9)\n伤害(36)")
elseif inst.level >=210 then
    inst.components.weapon:SetDamage(38)
	inst.components.talker:Say("-原型之刃\n凤凰之刃\n伤害(38)\n火焰(12/12)")
end
end
end

local function OnDurability(inst, data)
inst.broken = true
 	Upgradedamage(inst)
end
-------- --------
local function TakeItem(inst, item, data)
local expchance0 = 1
local expchance1 = 0.3
local expchance2 = 0.2
local expchance3 = 0.12
	inst.components.fueled:DoDelta(5000000)
	SpawnPrefab("splash").Transform:SetPosition(inst:GetPosition():Get())
inst.broken = false      
Upgradedamage(inst)
   if math.random() < expchance1 and inst.level <= 216 then
	inst.level = inst.level + 2
	levelexp(inst)
	inst.components.talker:Say("-[破损之刃] \n幸运点数! +(2)\n[成长点数]".. (inst.level))
    elseif  math.random() < expchance2 and inst.level <= 216 then
	inst.level = inst.level + 5
	levelexp(inst)
	inst.components.talker:Say("-[破损之刃] \n幸运点数! +(5)\n[成长点数]".. (inst.level))
	elseif  math.random() < expchance3 and inst.level <= 216 then
	inst.level = inst.level + 8
	levelexp(inst)
	inst.components.talker:Say("-[破损之刃] \n幸运点数! +(8)\n[成长点数]".. (inst.level))
	elseif  math.random() < expchance0 and inst.level <= 216 then
	inst.level = inst.level + 1
	levelexp(inst)
    end
end
-------- --------
local function OnLoad(inst, data)
    Upgradedamage(inst)
end

local function onattack_base(inst, attacker, target)
local damagedur1 = 0.2
local damagedur2 = 0.5
local damagedur3 = 0.7
local damagedur4 = 1
local expchance = 0.2
local expchance2 = 0.1
local flamechance = 0.12
if math.random() < expchance and not inst.broken and inst.level <= 216 then
	inst.level = inst.level + 1
	levelexp(inst)
	end
    if target and not inst.broken and math.random() < damagedur1 then
inst.components.fueled:DoDelta(-150000)
    elseif target and not inst.broken and math.random() < damagedur2 then
inst.components.fueled:DoDelta(-75000)
    elseif target and not inst.broken and math.random() < damagedur3 then
inst.components.fueled:DoDelta(-35000)
    elseif target and not inst.broken and math.random() < damagedur4 then
inst.components.fueled:DoDelta(-20000)
    elseif target and inst.broken then
SpawnPrefab("splash").Transform:SetPosition(inst:GetPosition():Get())
	inst.components.talker:Say("-损坏的武器 \n伤害 (1)")
    end
 
	-----
	if  math.random() < flamechance and target.components.burnable and not inst:HasTag("structure") and not inst.boost and inst.level >=210 then
        target.components.burnable:Ignite()
        target.components.health:DoDelta(-12)
		
	end
    if target.components.sleeper and target.components.sleeper:IsAsleep() then
        target.components.sleeper:WakeUp()
    end
    if target.components.burnable and target.components.burnable:IsBurning() then
        target.components.burnable:Extinguish()
    end
    if target.components.combat then
        target.components.combat:SuggestTarget(attacker)
    end
end


local function onequip(inst, owner)

    Upgradedamage(inst)

    owner.AnimState:OverrideSymbol("swap_object", "swap_mushasword_base", "swap_nightmaresword")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 

if inst.level >=210 then
    owner.AnimState:OverrideSymbol("swap_object", "swap_mushasword", "swap_nightmaresword")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 
end
end

local function onunequip(inst, owner) 
    Upgradedamage(inst)
    if inst.task then inst.task:Cancel() inst.task = nil end
    owner.AnimState:Hide("ARM_carry") 
    owner.AnimState:Show("ARM_normal") 

end

local function OnDropped(inst,data)
    end
local function OnPutInInventory(inst)
    end
	
local function consume(inst, owner)
if not inst.broken then
inst.components.fueled:DoDelta(-25000)
end
end


local function fn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
    inst.entity:AddLight()
	inst.Light:SetRadius(.4)
    inst.Light:SetFalloff(.5)
    inst.Light:SetIntensity(.5)
    inst.Light:SetColour(80/255,120/255,250/255)
	inst.Light:Enable(true)
	
  MakeInventoryPhysics(inst)  
  
    inst.AnimState:SetBank("nightmaresword")
    inst.AnimState:SetBuild("mushasword_base")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:SetMultColour(1, 1, 1, 0.7)

   inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "blade_b.tex" )
	-- inst:AddTag("sharp")
	 
	 inst:AddComponent("talker")
	
    inst.components.talker.fontsize = 20
    inst.components.talker.font = TALKINGFONT
    inst.components.talker.colour = Vector3(0.5, 0.5, 0.5, 1)
    inst.components.talker.offset = Vector3(200,-250,0)
    inst.components.talker.symbol = "swap_object"
	
     inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("weapon")
    inst.components.weapon:SetOnAttack(Upgradedamage)
    inst.components.weapon:SetOnAttack(onattack_base)

    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem:SetOnDroppedFn(OnDropped)
      inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)
    	inst.components.inventoryitem.atlasname = "images/inventoryimages/mushasword_base.xml"
  
    inst.OnLoad = OnLoad

    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )

        inst:AddComponent("fueled")
       inst.components.fueled.fueltype = "CHEMICAL"
       inst.components.fueled:InitializeFuelLevel(30000000)
		
       inst.components.fueled:SetDepletedFn(OnDurability)
        inst.components.fueled.ontakefuelfn = TakeItem
        inst.components.fueled.accepting = true
inst.components.fueled:StopConsuming()        
inst.boost = false 

	inst.level = 0
inst:ListenForEvent("levelup", levelexp)
	inst.OnSave = onsave
	inst.OnPreLoad = onpreload

    MakeHauntableLaunch(inst)
    return inst
end

return Prefab( "common/inventory/mushasword_base", fn, assets) 
