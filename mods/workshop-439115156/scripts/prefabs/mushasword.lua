
---------------------------
local assets=
{
	Asset("ANIM", "anim/mushasword.zip"),
		Asset("ANIM", "anim/mushasword4.zip"),
   	Asset("ATLAS", "images/inventoryimages/mushasword.xml"),
	Asset("IMAGE", "images/inventoryimages/mushasword.tex"),
	Asset("ANIM", "anim/swap_mushasword_base.zip"),
	Asset("ANIM", "anim/swap_mushasword.zip"),
	Asset("ANIM", "anim/swap_mushasword2.zip"),
	Asset("ANIM", "anim/swap_mushasword3.zip"),
	Asset("ANIM", "anim/swap_mushasword4.zip"),
}

local function levelexp(inst,data)

	local max_exp = 4100
	local exp = math.min(inst.level, max_exp)

if inst.level >= 4005 then
--inst.components.talker:Say("-[���֮��]-\n[�ɳ�����]".. (inst.level))
end
if inst.level >=0 and inst.level <10 then
inst.components.talker:Say("-[���֮��] \n��һ��:[10]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=10 and inst.level <30 then
inst.components.talker:Say("-[���֮��] \n��һ��:[30]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=30 and inst.level <50 then
inst.components.talker:Say("-[���֮��] \n��һ��:[50]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=50 and inst.level <70 then
inst.components.talker:Say("-[���֮��] \n��һ��:[70]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=70 and inst.level <90 then
inst.components.talker:Say("-[���֮��] \n��һ��:[90]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=90 and inst.level <120 then
inst.components.talker:Say("-[���֮��] \n��һ��:[120]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=120 and inst.level <150 then
inst.components.talker:Say("-[���֮��] \n��һ��:[150]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=150 and inst.level <180 then
inst.components.talker:Say("-[���֮��] \n��һ��:[180]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=180 and inst.level <210 then
inst.components.talker:Say("-[���֮��] \n��һ��:[210]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=210 and inst.level <250 then
inst.components.talker:Say("-[���֮��] \n��һ��:[250]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=250 and inst.level <350 then
inst.components.talker:Say("-[���֮��] \n��һ��:[350]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=350 and inst.level <450 then
inst.components.talker:Say("-[���֮��] \n��һ��:[450]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=450 and inst.level <550 then
inst.components.talker:Say("-[���֮��] \n��һ��:[550]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=550 and inst.level <650 then
inst.components.talker:Say("-[���֮��] \n��һ��:[650]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=650 and inst.level <750 then
inst.components.talker:Say("-[���֮��] \n��һ��:[750]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=750 and inst.level <850 then
inst.components.talker:Say("-[���֮��] \n��һ��:[850]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=850 and inst.level <950 then
inst.components.talker:Say("-[���֮��] \n��һ��:[950]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=950 and inst.level <1050 then
inst.components.talker:Say("-[���֮��] \n��һ��:[1050]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=1050 and inst.level <1200 then
inst.components.talker:Say("-[���֮��] \n��һ��:[1200]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=1200 and inst.level <1400 then
inst.components.talker:Say("-[���֮��] \n��һ��:[1500]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=1400 and inst.level <1600 then
inst.components.talker:Say("-[���֮��] \n��һ��:[1600]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=1600 and inst.level <1800 then
inst.components.talker:Say("-[���֮��] \n��һ��:[1800]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=1800 and inst.level <2000 then
inst.components.talker:Say("-[���֮��] \n��һ��:[2000]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=2000 and inst.level <2200 then
inst.components.talker:Say("-[���֮��] \n��һ��:[2200]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=2200 and inst.level <2400 then
inst.components.talker:Say("-[���֮��] \n��һ��:[2400]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=2400 and inst.level <2600 then
inst.components.talker:Say("-[���֮��] \n��һ��:[2600]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=2600 and inst.level <2800 then
inst.components.talker:Say("-[���֮��] \n��һ��:[2800]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=2800 and inst.level <3000 then
inst.components.talker:Say("-[���֮��] \n��һ��:[3000]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=3000 and inst.level <4000 then
inst.components.talker:Say("-[���֮��] \n��һ��:[4000]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=4000 and inst.level <4005 then
inst.components.talker:Say("-[���֮��] \n[MAX]")
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

local function Upgradedamage(inst, data)
if inst.components.fueled:IsEmpty() then
inst.broken = true
elseif not inst.components.fueled:IsEmpty() then
inst.broken = false
end
if inst.broken then
   inst.components.weapon:SetDamage(1)
	inst.components.talker:Say("-�𻵵ķ��֮�� \n�˺� (1)")
  
elseif not inst.broken then

 if inst.level >=0 and inst.level <10 then
    inst.components.weapon:SetDamage(30)
	inst.components.talker:Say("-���֮�� (LV1)\n�˺� (30)\n����(20D/12C)")
 elseif inst.level >=10 and inst.level <30 then
    inst.components.weapon:SetDamage(32)
	inst.components.talker:Say("-���֮�� (LV2)\n�˺� (32)\n����(20D/12C)")
 elseif inst.level >=30 and inst.level <50 then
    inst.components.weapon:SetDamage(34)
	inst.components.talker:Say("-���֮�� (LV3)\n�˺� (34)\n����(20D/12C)")
 elseif inst.level >=50 and inst.level <70 then
    inst.components.weapon:SetDamage(36)
	inst.components.talker:Say("-���֮�� (LV4)]\n�˺� (36)\n����(20D/12C)")
  elseif inst.level >=70 and inst.level <90 then
    inst.components.weapon:SetDamage(38)
	inst.components.talker:Say("-���֮�� (LV5)\n�˺� (38)\n����(20D/12C)")
 elseif inst.level >=90 and inst.level <120 then
    inst.components.weapon:SetDamage(40)
	inst.components.talker:Say("-���֮�� (LV6)\n�˺� (40)\n����(20D/12C)")
 elseif inst.level >=120 and inst.level <150 then
    inst.components.weapon:SetDamage(42)
	inst.components.talker:Say("-���֮�� (LV7)\n�˺� (42)\n����(20D/12C)")
elseif inst.level >=150 and inst.level <180 then
    inst.components.weapon:SetDamage(44)
	inst.components.talker:Say("-���֮�� (LV8)\n�˺� (44)\n����(20D/12C)")
elseif inst.level >=180 and inst.level <210 then
    inst.components.weapon:SetDamage(46)
	inst.components.talker:Say("-���֮�� (LV9)\n�˺� (46)\n����(20D/12C)")
elseif inst.level >=210 and inst.level <250 then
    inst.components.weapon:SetDamage(48)
	inst.components.talker:Say("-���֮�� (LV10)\n�˺� (48)\n����(35D/20C)")
elseif inst.level >=250 and inst.level <350 then
    inst.components.weapon:SetDamage(49)
	inst.components.talker:Say("-���֮�� (LV11)\n�˺� (49)\n����(35D/20C)")
elseif inst.level >=350 and inst.level <450 then
    inst.components.weapon:SetDamage(50)
	inst.components.talker:Say("-���֮�� (LV12)\n�˺� (50)\n����(35D/20C)")
elseif inst.level >=450 and inst.level <550 then
    inst.components.weapon:SetDamage(51)
	inst.components.talker:Say("-���֮�� (LV13)\n�˺� (51)\n����(35D/20C)")
elseif inst.level >=550 and inst.level <650 then
    inst.components.weapon:SetDamage(52)
	inst.components.talker:Say("-���֮�� (LV14)\n�˺� (52)\n����(35D/20C)")
elseif inst.level >=650 and inst.level <750 then
    inst.components.weapon:SetDamage(53)
	inst.components.talker:Say("-���֮�� (LV15)\n�˺� (53)\n����(35D/20C)")
elseif inst.level >=750 and inst.level <850 then
    inst.components.weapon:SetDamage(54)
	inst.components.talker:Say("-���֮�� (LV16)\n�˺� (54)\n����(35D/20C)")
elseif inst.level >=850 and inst.level <950 then
    inst.components.weapon:SetDamage(55)
	inst.components.talker:Say("-���֮�� (LV17)\n�˺� (55)\n����(35D/20C)")
elseif inst.level >=950 and inst.level <1050 then
    inst.components.weapon:SetDamage(56)
	inst.components.talker:Say("-���֮�� (LV18)\n�˺� (56)\n����(35D/20C)")
elseif inst.level >=1050 and inst.level <1200 then
    inst.components.weapon:SetDamage(57)
	inst.components.talker:Say("-���֮�� (LV19)\n�˺� (57)\n����(35D/20C)")
elseif inst.level >=1200 and inst.level <1400 then
    inst.components.weapon:SetDamage(58)
	inst.components.talker:Say("-���֮�� (LV20)\n�˺� (58)\n����(50D/28C)")
elseif inst.level >=1400 and inst.level <1600 then
    inst.components.weapon:SetDamage(59)
	inst.components.talker:Say("-���֮�� (LV21)\n�˺� (59)\n����(50D/28C)")
elseif inst.level >=1600 and inst.level <1800 then
    inst.components.weapon:SetDamage(60)
	inst.components.talker:Say("-���֮�� (LV22)\n�˺� (60)\n����(50D/28C)")
elseif inst.level >=1800 and inst.level <2000 then
    inst.components.weapon:SetDamage(61)
	inst.components.talker:Say("-���֮�� (LV23)\n�˺� (61)\n����(50D/28C)")
elseif inst.level >=2000 and inst.level <2200 then
    inst.components.weapon:SetDamage(62)
	inst.components.talker:Say("-���֮�� (LV24)\n�˺� (62)\n����(50D/28C)")
elseif inst.level >=2200 and inst.level <2400 then
    inst.components.weapon:SetDamage(63)
	inst.components.talker:Say("-���֮�� (LV25)\n�˺� (63)\n����(50D/28C)")
elseif inst.level >=2400 and inst.level <2600 then
    inst.components.weapon:SetDamage(64)
	inst.components.talker:Say("-���֮�� (LV26)\n�˺� (64)\n����(50D/28C)")
elseif inst.level >=2600 and inst.level <2800 then
    inst.components.weapon:SetDamage(65)
	inst.components.talker:Say("-���֮�� (LV27)\n�˺� (65)\n����(50D/28C)")
elseif inst.level >=2800 and inst.level <3000 then
    inst.components.weapon:SetDamage(66)
	inst.components.talker:Say("-���֮�� (LV28)\n�˺� (66)\n����(50D/28C)")
elseif inst.level >=3000 and inst.level <4000 then
    inst.components.weapon:SetDamage(67)
	inst.components.talker:Say("-���֮�� (LV29)\n�˺� (67)\n����(50D/28C)")
elseif inst.level >=4000 then
    inst.components.weapon:SetDamage(68)
	inst.components.talker:Say("-Phoenix Blade (Max30)\n�˺� (68)\n����(50D/28C)")
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
   if math.random() < expchance1 and inst.level <= 4005 then
	inst.level = inst.level + 2
	levelexp(inst)
	inst.components.talker:Say("-[���֮��] \n���˵���! +(2)\n[�ɳ�����]".. (inst.level))
    elseif  math.random() < expchance2 and inst.level <= 4005 then
	inst.level = inst.level + 5
	levelexp(inst)
	inst.components.talker:Say("-[���֮��] \n���˵���! +(5)\n[�ɳ�����]".. (inst.level))
	elseif  math.random() < expchance3 and inst.level <= 4005 then
	inst.level = inst.level + 8
	levelexp(inst)
	inst.components.talker:Say("-[���֮��] \n���˵���! +(8)\n[�ɳ�����]".. (inst.level))
	elseif  math.random() < expchance0 and inst.level <= 4005 then
	inst.level = inst.level + 1
	levelexp(inst)
    end
end
-------- --------
local function OnLoad(inst, data)
    Upgradedamage(inst)
end


local function createlight(staff, target, pos)
    local caster = staff.components.inventoryitem.owner
if caster.components.sanity.current >= 40 then

    local light = SpawnPrefab("lightning")
    local light2 = SpawnPrefab("stafflight")

    light.Transform:SetPosition(pos.x, pos.y, pos.z)
    light2.Transform:SetPosition(pos.x, pos.y, pos.z)

        --caster.components.sanity:DoDelta(-TUNING.SANITY_MEDLARGE)
        caster.components.sanity:DoDelta(-TUNING.SANITY_HUGE)

    elseif caster.components.sanity.current < 40 then
	local fail1 = SpawnPrefab("statue_transition")
    local fail2 = SpawnPrefab("statue_transition_2")

    fail1.Transform:SetPosition(pos.x, pos.y, pos.z)
    fail2.Transform:SetPosition(pos.x, pos.y, pos.z)
    end
end

local function yellow_reticuletargetfn()
    return Vector3(ThePlayer.entity:LocalToWorldSpace(5, 0, 0))
end

local function onattack_Flame(inst, attacker, target)
local player = inst.components.inventoryitem.owner
local flamechance = 0.12
local flamechance2 = 0.20
local flamechance3 = 0.28
local flamechanceb = 0.12
local flamechance2b = 0.20
local flamechance3b = 0.28
local expchance = 0.1
local damagedur1 = 0.2
local damagedur2 = 0.5
local damagedur3 = 0.7
local damagedur4 = 1


if math.random() < expchance and not inst.broken and inst.level <= 4000 then
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
	inst.components.talker:Say("-������\n�˺� (1)")
    end
 
	-----
	if  math.random() < flamechance and target.components.burnable and not inst:HasTag("structure") and not inst.boost and inst.level <250 then
        target.components.burnable:Ignite()
        target.components.health:DoDelta(-20)
	elseif math.random() < flamechance2 and target.components.burnable and not inst:HasTag("structure") and not inst.boost and inst.level >=250 and inst.level <1400 then
        target.components.burnable:Ignite()
        target.components.health:DoDelta(-35)
	elseif math.random() < flamechance3 and target.components.burnable and not inst:HasTag("structure") and not inst.boost and inst.level >=1400 then
        target.components.burnable:Ignite()
        target.components.health:DoDelta(-50)	
		
	elseif math.random() < flamechanceb and target.components.burnable and not inst:HasTag("structure") and inst.boost and inst.level <250 then
        target.components.burnable:Ignite()
        target.components.health:DoDelta(-40)
	elseif math.random() < flamechance2b and target.components.burnable and not inst:HasTag("structure") and inst.boost and inst.level >=250 and inst.level <1400 then
        target.components.burnable:Ignite()
        target.components.health:DoDelta(-70)
	elseif math.random() < flamechance3b and target.components.burnable and not inst:HasTag("structure") and inst.boost and inst.level >=1400 then
        target.components.burnable:Ignite()
        target.components.health:DoDelta(-100)	

		
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
 
if inst.level <250 then  -- 250
    owner.AnimState:OverrideSymbol("swap_object", "swap_mushasword_base", "swap_nightmaresword")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 
elseif inst.level >=2 and inst.level <1400 then  --250 1400
    owner.AnimState:OverrideSymbol("swap_object", "swap_mushasword", "swap_nightmaresword")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 
elseif inst.level >=1400 then  --1400
    owner.AnimState:OverrideSymbol("swap_object", "swap_mushasword2", "swap_nightmaresword")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 
        inst.entity:AddLight()
	inst.Light:SetRadius(.8)
    inst.Light:SetFalloff(.5)
    inst.Light:SetIntensity(.5)
    inst.Light:SetColour(225/255,120/255,80/255)
end
end

local function onunequip(inst, owner) 
    Upgradedamage(inst)
	inst.Light:Enable(false)
    inst:RemoveComponent("spellcaster")
	inst.boost = false 
    if inst.task then inst.task:Cancel() inst.task = nil end
    if inst.sanity then inst.sanity:Cancel() inst.sanity = nil end
    owner.AnimState:Hide("ARM_carry") 
    owner.AnimState:Show("ARM_normal") 

end

local function sanity(inst, owner)
if owner.components.health and owner.components.health:IsHurt() then
        owner.components.sanity:DoDelta(1,false)
end
end

local function OnDropped(inst,data)
    end
local function OnPutInInventory(inst)
    end
	
local function consume(inst, owner)
if not inst.broken and inst.boost then
inst.components.fueled:DoDelta(-25000)
end
end

local function on_boost(inst, data)
local player = inst.components.inventoryitem.owner
        local owner = inst.components.inventoryitem.owner
    inst.AnimState:SetBank("nightmaresword")
    inst.AnimState:SetBuild("mushasword")
    inst.AnimState:PlayAnimation("idle")
if owner and inst.broken then
	inst.boost = false 	
	player.components.talker:Say("��~�ҵĵ�����!")
	inst.components.talker:Say("-[���֮��]\n�;�(0)")
    --inst.components.equippable.walkspeedmult = 1
	inst.Light:Enable(false)
    owner.AnimState:OverrideSymbol("swap_object", "swap_mushasword_base", "swap_nightmaresword")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 
        inst.components.useableitem:StopUsingItem()
end
if owner and not inst.boost and not inst.broken then
	inst.boost = true
	player.components.talker:Say("����֮��!")
    inst.task = inst:DoPeriodicTask(1, function() consume(inst, owner) end)
inst.SoundEmitter:PlaySound("dontstarve/common/fireAddFuel") 
         inst.entity:AddLight()
SpawnPrefab("small_puff").Transform:SetPosition(inst:GetPosition():Get())

        inst.components.useableitem:StopUsingItem()
 
if inst.level <250 then  --250
	inst.components.talker:Say("-[����֮��I]\n����(Small+)\n�����˺�X2(40D)")
    --inst.components.equippable.walkspeedmult = 1.1
	inst.Light:SetRadius(.6)
    inst.Light:SetFalloff(.5)
    inst.Light:SetIntensity(.5)
    inst.Light:SetColour(225/255,120/255,80/255)
	inst.Light:Enable(true)
    owner.AnimState:OverrideSymbol("swap_object", "swap_mushasword", "swap_nightmaresword")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 
	
elseif inst.level >=2 and inst.level <1400 then  --250  1400
	inst.components.talker:Say("-[����֮��II]\n����(Med+)\n�����˺�X2(70D)) \nSummon Star")
     --inst.components.equippable.walkspeedmult = 1.2
	inst.Light:SetRadius(.9)
    inst.Light:SetFalloff(.5)
    inst.Light:SetIntensity(.5)
    inst.Light:SetColour(225/255,120/255,80/255)
	inst.Light:Enable(true)
    owner.AnimState:OverrideSymbol("swap_object", "swap_mushasword3", "swap_nightmaresword")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 
	
	   inst:AddComponent("reticule")
    inst.components.reticule.targetfn = yellow_reticuletargetfn
    inst.components.reticule.ease = true

    inst:AddComponent("spellcaster")
    inst.components.spellcaster:SetSpellFn(createlight)
    inst.components.spellcaster.canuseonpoint = true
    MakeHauntableLaunch(inst)
    AddHauntableCustomReaction(inst, function(inst, haunter)
        if math.random() <= TUNING.HAUNT_CHANCE_RARE then
            local pos = Vector3(inst.Transform:GetWorldPosition())
            local start_angle = math.random()*2*PI
            local offset = FindWalkableOffset(pos, start_angle, math.random(3,12), 60, false, true)
            local pt = pos + offset
            createlight(inst, nil, pt)
            inst.components.hauntable.hauntvalue = TUNING.HAUNT_LARGE
            return true
        end
        return false
    end, true, false, true)
	
elseif inst.level >=1400 then  --1400
	inst.components.talker:Say("-[����֮��III]\n����(Large+))\n�����˺�X2(100D)\nSummon Star\nSanity regen")
     inst.task = inst:DoPeriodicTask(1, function() consume(inst, owner) end)
    inst.sanity = inst:DoPeriodicTask(10, function() sanity(inst, owner) end)
  --inst.components.equippable.walkspeedmult = 1.3
	inst.Light:SetRadius(1.5)
    inst.Light:SetFalloff(.5)
    inst.Light:SetIntensity(.5)
    inst.Light:SetColour(225/255,120/255,80/255)
	inst.Light:Enable(true)
	inst.AnimState:SetBank("nightmaresword")
    inst.AnimState:SetBuild("mushasword")
    inst.AnimState:PlayAnimation("idle")
    owner.AnimState:OverrideSymbol("swap_object", "swap_mushasword4", "swap_batbat")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 
	
     inst:AddComponent("reticule")
    inst.components.reticule.targetfn = yellow_reticuletargetfn
    inst.components.reticule.ease = true

    inst:AddComponent("spellcaster")
    inst.components.spellcaster:SetSpellFn(createlight)
    inst.components.spellcaster.canuseonpoint = true
    MakeHauntableLaunch(inst)
    AddHauntableCustomReaction(inst, function(inst, haunter)
        if math.random() <= TUNING.HAUNT_CHANCE_RARE then
            local pos = Vector3(inst.Transform:GetWorldPosition())
            local start_angle = math.random()*2*PI
            local offset = FindWalkableOffset(pos, start_angle, math.random(3,12), 60, false, true)
            local pt = pos + offset
            createlight(inst, nil, pt)
            inst.components.hauntable.hauntvalue = TUNING.HAUNT_LARGE
            return true
        end
        return false
    end, true, false, true)
 
  
end
-----------
elseif owner and inst.boost and not inst.broken then
	inst.boost = false 
	inst.components.talker:Say("�ص���!")
	inst.components.talker:Say("-[���֮��]\n�ص���")
      inst:RemoveComponent("spellcaster")
    if inst.task then inst.task:Cancel() inst.task = nil end
    if inst.sanity then inst.sanity:Cancel() inst.sanity = nil end

	inst.Light:Enable(false)

  inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")
SpawnPrefab("small_puff").Transform:SetPosition(inst:GetPosition():Get())
onequip(inst, owner)
--[[
if inst.level >=0 and inst.level <250 then  --250
    owner.AnimState:OverrideSymbol("swap_object", "swap_mushasword_base", "swap_nightmaresword")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 
elseif inst.level >=250 and inst.level <1400 then  --250 1400
    owner.AnimState:OverrideSymbol("swap_object", "swap_mushasword", "swap_nightmaresword")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 
elseif inst.level >=1400 then --1400
    owner.AnimState:OverrideSymbol("swap_object", "swap_mushasword2", "swap_nightmaresword")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 
end]]

        inst.components.useableitem:StopUsingItem()
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
    inst.AnimState:SetBuild("mushasword")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:SetMultColour(1, 1, 1, 0.7)

	inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "blade_1.tex" )
	 inst:AddTag("sharp")
	 	       inst:AddTag("waterproofer")
	 inst:AddComponent("talker")
	
    inst.components.talker.fontsize = 20
     inst.components.talker.font = TALKINGFONT
    inst.components.talker.colour = Vector3(1, 0.8, 0.65, 1)
    inst.components.talker.offset = Vector3(200,-250,0)
    inst.components.talker.symbol = "swap_object"
	
     inst.entity:SetPristine()
	 
    inst:AddComponent("weapon")
    inst.components.weapon:SetOnAttack(Upgradedamage)
    inst.components.weapon:SetOnAttack(onattack_Flame)
	
    if not TheWorld.ismastersim then
        return inst
    end
   
    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem:SetOnDroppedFn(OnDropped)
    inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)
    	inst.components.inventoryitem.atlasname = "images/inventoryimages/mushasword.xml"
  
    inst.OnLoad = OnLoad

    inst:AddComponent("waterproofer")
    inst.components.waterproofer.effectiveness = 0

            inst:AddComponent("useableitem")
    inst.components.useableitem:SetOnUseFn(on_boost)
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

return Prefab( "common/inventory/mushasword", fn, assets) 


----------------------------

