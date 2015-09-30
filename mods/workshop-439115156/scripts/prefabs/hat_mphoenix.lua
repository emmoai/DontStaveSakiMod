local assets=
{
	Asset("ANIM", "anim/hat_mphoenix.zip"),
  Asset("ATLAS", "images/inventoryimages/hat_mphoenix.xml"),
  Asset("IMAGE", "images/inventoryimages/hat_mphoenix.tex")
}


---------------------------
--------------growable
local function levelexp(inst,data)

	local max_exp = 4100
	local exp = math.min(inst.level, max_exp)

if inst.level > 4005 then
--inst.components.talker:Say("-[���ͷ��]-\n[�ɳ�����]".. (inst.level))
end
if inst.level >=0 and inst.level <10 then
inst.components.talker:Say("-[���ͷ��] \n��һ��[10]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=10 and inst.level <30 then
inst.components.talker:Say("-[���ͷ��] \n��һ��[30]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=30 and inst.level <50 then
inst.components.talker:Say("-[���ͷ��] \n��һ��[50]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=50 and inst.level <70 then
inst.components.talker:Say("-[���ͷ��] \n��һ��[70]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=70 and inst.level <90 then
inst.components.talker:Say("-[���ͷ��] \n��һ��[90]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=90 and inst.level <120 then
inst.components.talker:Say("-[���ͷ��] \n��һ��[120]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=120 and inst.level <150 then
inst.components.talker:Say("-[���ͷ��] \n��һ��[150]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=150 and inst.level <180 then
inst.components.talker:Say("-[���ͷ��] \n��һ��[180]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=180 and inst.level <210 then
inst.components.talker:Say("-[���ͷ��] \n��һ��[210]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=210 and inst.level <250 then
inst.components.talker:Say("-[���ͷ��] \n��һ��[250]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=250 and inst.level <350 then
inst.components.talker:Say("-[���ͷ��] \n��һ��[350]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=350 and inst.level <450 then
inst.components.talker:Say("-[���ͷ��] \n��һ��[450]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=450 and inst.level <550 then
inst.components.talker:Say("-[���ͷ��] \n��һ��[550]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=550 and inst.level <650 then
inst.components.talker:Say("-[���ͷ��] \n��һ��[650]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=650 and inst.level <750 then
inst.components.talker:Say("-[���ͷ��] \n��һ��[750]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=750 and inst.level <850 then
inst.components.talker:Say("-[���ͷ��] \n��һ��[850]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=850 and inst.level <950 then
inst.components.talker:Say("-[���ͷ��] \n��һ��[950]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=950 and inst.level <1050 then
inst.components.talker:Say("-[���ͷ��] \n��һ��[1050]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=1050 and inst.level <1200 then
inst.components.talker:Say("-[���ͷ��] \n��һ��[1200]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=1200 and inst.level <1400 then
inst.components.talker:Say("-[���ͷ��] \n��һ��[1500]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=1400 and inst.level <1600 then
inst.components.talker:Say("-[���ͷ��] \n��һ��[1600]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=1600 and inst.level <1800 then
inst.components.talker:Say("-[���ͷ��] \n��һ��[1800]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=1800 and inst.level <2000 then
inst.components.talker:Say("-[���ͷ��] \n��һ��[2000]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=2000 and inst.level <2200 then
inst.components.talker:Say("-[���ͷ��] \n��һ��[2200]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=2200 and inst.level <2400 then
inst.components.talker:Say("-[���ͷ��] \n��һ��[2400]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=2400 and inst.level <2600 then
inst.components.talker:Say("-[���ͷ��] \n��һ��[2600]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=2600 and inst.level <2800 then
inst.components.talker:Say("-[���ͷ��] \n��һ��[2800]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=2800 and inst.level <3000 then
inst.components.talker:Say("-[���ͷ��] \n��һ��[3000]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=3000 and inst.level <4000 then
inst.components.talker:Say("-[���ͷ��] \n��һ��[4000]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=4000 and inst.level <4005 then
inst.components.talker:Say("-[���ͷ��] \n[MAX]")
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

local function healowner(inst, owner)
     if (owner.components.health and owner.components.health:IsHurt())then
        owner.components.health:DoDelta(1,false)
end
end

local function consume(inst, owner)
if not inst.broken and inst.boost then
inst.components.fueled:DoDelta(-15000)
end
end

local function UpgradeArmor(inst, data, owner)
if inst.components.fueled:IsEmpty() then
inst.broken = true
elseif not inst.components.fueled:IsEmpty() then
inst.broken = false
end
if inst.broken then
 inst.components.fueled:StopConsuming()        
    inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0)
  --  inst.components.equippable.walkspeedmult = 1
 
inst.components.talker:Say("-[�𻵵ķ��ͷ��\n����(0)\n耐久(0)")
elseif not inst.broken and not inst.boost then
 
 if inst.level >=0 and inst.level <10 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.65)
inst.components.talker:Say("-[���ͷ��(LV1)]\n����(65)\n��ů(MED)\n�ٶ�����(10)")
  inst.components.equippable.walkspeedmult = 1.10 inst.components.equippable.dapperness = 0    inst.components.insulator.insulation = TUNING.INSULATION_MED
  elseif inst.level >=10 and inst.level <30 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.66)
inst.components.talker:Say("-[���ͷ��(LV2)]\n����(66)\n��ů(MED)\n�ٶ�����(10)")
 inst.components.equippable.walkspeedmult = 1.10 inst.components.equippable.dapperness = 0    inst.components.insulator.insulation = TUNING.INSULATION_MED
 elseif inst.level >=30 and inst.level <50 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.67)
inst.components.talker:Say("-[���ͷ��(LV3)]\n����(67)\n��ů(MED)\n�ٶ�����(10)")
 inst.components.equippable.walkspeedmult = 1.10 inst.components.equippable.dapperness = 0    inst.components.insulator.insulation = TUNING.INSULATION_MED
 elseif inst.level >=50 and inst.level <70 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.68)
inst.components.talker:Say("-[���ͷ��(LV4)]\n����(68)\n��ů(MED)\n�ٶ�����(10)")
 inst.components.equippable.walkspeedmult = 1.10 inst.components.equippable.dapperness = 0    inst.components.insulator.insulation = TUNING.INSULATION_MED
  elseif inst.level >=70 and inst.level <90 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.69)
inst.components.talker:Say("-[���ͷ��(LV5)]\n����(69)\n��ů(MED)\n�ٶ�����(10)")
 inst.components.equippable.walkspeedmult = 1.10 inst.components.equippable.dapperness = 0    inst.components.insulator.insulation = TUNING.INSULATION_MED
 elseif inst.level >=90 and inst.level <120 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.70)
inst.components.talker:Say("-[���ͷ��(LV6)]\n����(70)\n��ů(MED)\n�ٶ�����(10)")
 inst.components.equippable.walkspeedmult = 1.10 inst.components.equippable.dapperness = 0    inst.components.insulator.insulation = TUNING.INSULATION_MED
 elseif inst.level >=120 and inst.level <150 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.71)
inst.components.talker:Say("-[���ͷ��(LV7)]\n����(71)\n��ů(MED)\n�ٶ�����(10)")
 inst.components.equippable.walkspeedmult = 1.10 inst.components.equippable.dapperness = 0    inst.components.insulator.insulation = TUNING.INSULATION_MED
elseif inst.level >=150 and inst.level <180 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.72)
inst.components.talker:Say("-[���ͷ��(LV8)]\n����(72)\n��ů(MED)\n�ٶ�����(10)")
 inst.components.equippable.walkspeedmult = 1.10 inst.components.equippable.dapperness = 0    inst.components.insulator.insulation = TUNING.INSULATION_MED
elseif inst.level >=180 and inst.level <210 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.58)
inst.components.talker:Say("-[���ͷ��(LV9)]\n����(73)\n��ů(MED)\n�ٶ�����(10)")
 inst.components.equippable.walkspeedmult = 1.10 inst.components.equippable.dapperness = 0    inst.components.insulator.insulation = TUNING.INSULATION_MED
elseif inst.level >=210 and inst.level <250 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.74)
inst.components.talker:Say("-[���ͷ��(LV10)]\n����(74)\n��ů(MED)\n�ٶ�����(10)")
 inst.components.equippable.walkspeedmult = 1.1  inst.components.equippable.dapperness = TUNING.DAPPERNESS_LARGE    inst.components.insulator.insulation = TUNING.INSULATION_LARGE
elseif inst.level >=250 and inst.level <350 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.75)
inst.components.talker:Say("-[���ͷ��(LV11)]\n����(75)\n��ů(MED)\n�ٶ�����(15)")
 inst.components.equippable.walkspeedmult = 1.15 inst.components.equippable.dapperness = 0    inst.components.insulator.insulation = TUNING.INSULATION_MED
elseif inst.level >=350 and inst.level <450 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.76)
inst.components.talker:Say("-[���ͷ��(LV12)]\n����(76)\n��ů(MED)\n�ٶ�����(15)")
 inst.components.equippable.walkspeedmult = 1.15 inst.components.equippable.dapperness = 0    inst.components.insulator.insulation = TUNING.INSULATION_MED
elseif inst.level >=450 and inst.level <550 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.77)
inst.components.talker:Say("-[���ͷ��(LV13)]\n����(77)\n��ů(MED)\n�ٶ�����(15)")
 inst.components.equippable.walkspeedmult = 1.15 inst.components.equippable.dapperness = 0    inst.components.insulator.insulation = TUNING.INSULATION_MED
elseif inst.level >=550 and inst.level <650 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.78)
inst.components.talker:Say("-[���ͷ��(LV14)]\n����(78)\n��ů(MED)\n�ٶ�����(15)")
 inst.components.equippable.walkspeedmult = 1.15 inst.components.equippable.dapperness = 0    inst.components.insulator.insulation = TUNING.INSULATION_MED
elseif inst.level >=650 and inst.level <750 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.79)
inst.components.talker:Say("-[���ͷ��(LV15)]\n����(79)\n��ů(MED)\n�ٶ�����(15)")
 inst.components.equippable.walkspeedmult = 1.15 inst.components.equippable.dapperness = 0    inst.components.insulator.insulation = TUNING.INSULATION_MED
elseif inst.level >=750 and inst.level <850 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.80)
inst.components.talker:Say("-[���ͷ��(LV16)]\n����(80)\n��ů(MED)\n�ٶ�����(15)")
 inst.components.equippable.walkspeedmult = 1.15 inst.components.equippable.dapperness = 0    inst.components.insulator.insulation = TUNING.INSULATION_MED
elseif inst.level >=850 and inst.level <950 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.81)
inst.components.talker:Say("-[���ͷ��(LV17)]\n����(81)\n��ů(MED)\n�ٶ�����(15)")
 inst.components.equippable.walkspeedmult = 1.15 inst.components.equippable.dapperness = 0    inst.components.insulator.insulation = TUNING.INSULATION_MED
elseif inst.level >=950 and inst.level <1050 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.82)
inst.components.talker:Say("-[���ͷ��(LV18)]\n����(82)\n��ů(MED)\n�ٶ�����(15)")
 inst.components.equippable.walkspeedmult = 1.15 inst.components.equippable.dapperness = 0    inst.components.insulator.insulation = TUNING.INSULATION_MED
elseif inst.level >=1050 and inst.level <1200 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.83)
inst.components.talker:Say("-[���ͷ��(LV19)]\n����(83)\n��ů(MED)\n�ٶ�����(15)")
 inst.components.equippable.walkspeedmult = 1.15 inst.components.equippable.dapperness = 0    inst.components.insulator.insulation = TUNING.INSULATION_MED
elseif inst.level >=1200 and inst.level <1400 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.84)
inst.components.talker:Say("-[���ͷ��(LV20)]\n����(84)\n��ů(MED)\n�ٶ�����(15)")
 inst.components.equippable.walkspeedmult = 1.15 inst.components.equippable.dapperness = 0    inst.components.insulator.insulation = TUNING.INSULATION_MED
elseif inst.level >=1400 and inst.level <1600 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.85)
inst.components.talker:Say("-[���ͷ��(LV21)]\n����(85)\n��ů(MED)\n�ٶ�����(20)")
 inst.components.equippable.walkspeedmult = 1.2 inst.components.equippable.dapperness = 0    inst.components.insulator.insulation = TUNING.INSULATION_MED
elseif inst.level >=1600 and inst.level <1800 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.86)
inst.components.talker:Say("-[���ͷ��(LV22)]\n����(86)\n��ů(MED)\n�ٶ�����(20)")
 inst.components.equippable.walkspeedmult = 1.2 inst.components.equippable.dapperness = 0    inst.components.insulator.insulation = TUNING.INSULATION_MED
elseif inst.level >=1800 and inst.level <2000 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.87)
inst.components.talker:Say("-[���ͷ��(LV23)]\n����(87)\n��ů(MED)\n�ٶ�����(20)")
 inst.components.equippable.walkspeedmult = 1.2 inst.components.equippable.dapperness = 0    inst.components.insulator.insulation = TUNING.INSULATION_MED
elseif inst.level >=2000 and inst.level <2200 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.88)
inst.components.talker:Say("-[���ͷ��(LV24)]\n����(88)\n��ů(MED)\n�ٶ�����(20)")
 inst.components.equippable.walkspeedmult = 1.2 inst.components.equippable.dapperness = 0    inst.components.insulator.insulation = TUNING.INSULATION_MED
elseif inst.level >=2200 and inst.level <2400 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.89)
inst.components.talker:Say("-[���ͷ��(LV25)]\n����(89)\n��ů(MED)\n�ٶ�����(20)")
 inst.components.equippable.walkspeedmult = 1.2 inst.components.equippable.dapperness = 0    inst.components.insulator.insulation = TUNING.INSULATION_MED
elseif inst.level >=2400 and inst.level <2600 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.90)
inst.components.talker:Say("-[���ͷ��(LV26)]\n����(90)\n��ů(MED)\n�ٶ�����(20)")
 inst.components.equippable.walkspeedmult = 1.2 inst.components.equippable.dapperness = 0    inst.components.insulator.insulation = TUNING.INSULATION_MED
elseif inst.level >=2600 and inst.level <2800 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.91)
inst.components.talker:Say("-[���ͷ��(LV27)]\n����(91)\n��ů(MED)\n�ٶ�����(20)")
 inst.components.equippable.walkspeedmult = 1.20 inst.components.equippable.dapperness = 0    inst.components.insulator.insulation = TUNING.INSULATION_MED
elseif inst.level >=2800 and inst.level <3000 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.92)
inst.components.talker:Say("-[���ͷ��(LV28)]\n����(92)\n��ů(MED)\n�ٶ�����(20)")
 inst.components.equippable.walkspeedmult = 1.20 inst.components.equippable.dapperness = 0    inst.components.insulator.insulation = TUNING.INSULATION_MED
elseif inst.level >=3000 and inst.level <4000 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.93)
inst.components.talker:Say("-[���ͷ��(LV29)]\n����(93)\n��ů(MED)\n�ٶ�����(20)")
 inst.components.equippable.walkspeedmult = 1.20 inst.components.equippable.dapperness = 0    inst.components.insulator.insulation = TUNING.INSULATION_MED
elseif inst.level >=4000 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.94)
inst.components.talker:Say("-[���ͷ��(LV30)]\n����(94)\n��ů(MED)\n�ٶ�����(25)")
 inst.components.equippable.walkspeedmult = 1.25 inst.components.equippable.dapperness = 0    inst.components.insulator.insulation = TUNING.INSULATION_MED
end
	elseif not inst.broken and inst.boost then
		
 if inst.level >=0 and inst.level <10 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.65)
inst.components.talker:Say("-[���ͷ��(LV1)]\n����(65)\n��ů(Large)\nHP�ظ�(3)\n�Բлظ�(MED)\n����20)")
  inst.components.equippable.walkspeedmult = 0.8  inst.components.equippable.dapperness = TUNING.DAPPERNESS_MED   inst.components.insulator.insulation = TUNING.INSULATION_LARGE
   elseif inst.level >=10 and inst.level <30 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.66)
inst.components.talker:Say("-[���ͷ��(LV2)]\n����(66)\n��ů(Large)\nHP�ظ�(3)\n�Բлظ�(MED)\n����20)")
 inst.components.equippable.walkspeedmult = 0.8  inst.components.equippable.dapperness = TUNING.DAPPERNESS_MED    inst.components.insulator.insulation = TUNING.INSULATION_LARGE
 elseif inst.level >=30 and inst.level <50 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.67)
inst.components.talker:Say("-[���ͷ��(LV3)]\n����(67)\n��ů(Large)\nHP�ظ�(3)\n�Բлظ�(MED)\n����20)")
 inst.components.equippable.walkspeedmult = 0.8  inst.components.equippable.dapperness = TUNING.DAPPERNESS_MED    inst.components.insulator.insulation = TUNING.INSULATION_LARGE
 elseif inst.level >=50 and inst.level <70 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.68)
inst.components.talker:Say("-[���ͷ��(LV4)]\n����(68)\n��ů(Large)\nHP�ظ�(3)\n�Բлظ�(MED)\n����20)")
 inst.components.equippable.walkspeedmult = 0.8  inst.components.equippable.dapperness = TUNING.DAPPERNESS_MED    inst.components.insulator.insulation = TUNING.INSULATION_LARGE
  elseif inst.level >=70 and inst.level <90 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.69)
inst.components.talker:Say("-[���ͷ��(LV5)]\n����(69)\n��ů(Large)\nHP�ظ�(3)\n�Բлظ�(MED)\n����20)")
 inst.components.equippable.walkspeedmult = 0.8  inst.components.equippable.dapperness = TUNING.DAPPERNESS_MED    inst.components.insulator.insulation = TUNING.INSULATION_LARGE
 elseif inst.level >=90 and inst.level <120 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.70)
inst.components.talker:Say("-[���ͷ��(LV6)]\n����(70)\n��ů(Large)\nHP�ظ�(3)\n�Բлظ�(MED)\n����20)")
 inst.components.equippable.walkspeedmult = 0.8  inst.components.equippable.dapperness = TUNING.DAPPERNESS_MED    inst.components.insulator.insulation = TUNING.INSULATION_LARGE
 elseif inst.level >=120 and inst.level <150 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.71)
inst.components.talker:Say("-[���ͷ��(LV7)]\n����(71)\n��ů(Large)\nHP�ظ�(3)\n�Բлظ�(MED)\n����20)")
 inst.components.equippable.walkspeedmult = 0.8  inst.components.equippable.dapperness = TUNING.DAPPERNESS_MED    inst.components.insulator.insulation = TUNING.INSULATION_LARGE
elseif inst.level >=150 and inst.level <180 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.72)
inst.components.talker:Say("-[���ͷ��(LV8)]\n����(72)\n��ů(Large)\nHP�ظ�(3)\n�Բлظ�(MED)\n����20)")
 inst.components.equippable.walkspeedmult = 0.8  inst.components.equippable.dapperness = TUNING.DAPPERNESS_MED    inst.components.insulator.insulation = TUNING.INSULATION_LARGE
elseif inst.level >=180 and inst.level <210 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.58)
inst.components.talker:Say("-[���ͷ��(LV9)]\n����(73)\n��ů(Large)\nHP�ظ�(3)\n�Բлظ�(MED)\n����20)")
 inst.components.equippable.walkspeedmult = 0.8  inst.components.equippable.dapperness = TUNING.DAPPERNESS_MED    inst.components.insulator.insulation = TUNING.INSULATION_LARGE
elseif inst.level >=210 and inst.level <250 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.74)
inst.components.talker:Say("-[���ͷ��(LV10)]\n����(74)\n��ů(Large)\nHP�ظ�(3)\n�Բлظ�(Large)\n����20)")
 inst.components.equippable.walkspeedmult = 0.8  inst.components.equippable.dapperness = TUNING.DAPPERNESS_LARGE    inst.components.insulator.insulation = TUNING.INSULATION_LARGE
elseif inst.level >=250 and inst.level <350 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.75)
inst.components.talker:Say("-[���ͷ��(LV11)]\n����(75)\n��ů(Large)\nHP�ظ�(3)\n�Բлظ�(Large)\n����15)")
 inst.components.equippable.walkspeedmult = 0.85  inst.components.equippable.dapperness = TUNING.DAPPERNESS_LARGE    inst.components.insulator.insulation = TUNING.INSULATION_LARGE
elseif inst.level >=350 and inst.level <450 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.76)
inst.components.talker:Say("-[���ͷ��(LV12)]\n����(76)\n��ů(Large)\nHP�ظ�(3)\n�Բлظ�(Large)\n����15)")
 inst.components.equippable.walkspeedmult = 0.85  inst.components.equippable.dapperness = TUNING.DAPPERNESS_LARGE    inst.components.insulator.insulation = TUNING.INSULATION_LARGE
elseif inst.level >=450 and inst.level <550 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.77)
inst.components.talker:Say("-[���ͷ��(LV13)]\n����(77)\n��ů(Large)\nHP�ظ�(3)\n�Բлظ�(Large)\n����15)")
 inst.components.equippable.walkspeedmult = 0.85  inst.components.equippable.dapperness = TUNING.DAPPERNESS_LARGE    inst.components.insulator.insulation = TUNING.INSULATION_LARGE
elseif inst.level >=550 and inst.level <650 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.78)
inst.components.talker:Say("-[���ͷ��(LV14)]\n����(78)\n��ů(Large)\nHP�ظ�(3)\n�Բлظ�(Large)\n����15)")
 inst.components.equippable.walkspeedmult = 0.85  inst.components.equippable.dapperness = TUNING.DAPPERNESS_LARGE    inst.components.insulator.insulation = TUNING.INSULATION_LARGE
elseif inst.level >=650 and inst.level <750 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.79)
inst.components.talker:Say("-[���ͷ��(LV15)]\n����(79)\n��ů(Large)\nHP�ظ�(3)\n�Բлظ�(Large)\n����15)")
 inst.components.equippable.walkspeedmult = 0.85  inst.components.equippable.dapperness = TUNING.DAPPERNESS_LARGE    inst.components.insulator.insulation = TUNING.INSULATION_LARGE
elseif inst.level >=750 and inst.level <850 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.80)
inst.components.talker:Say("-[���ͷ��(LV16)]\n����(80)\n��ů(Large)\nHP�ظ�(3)\n�Բлظ�(Large)\n����15)")
 inst.components.equippable.walkspeedmult = 0.85  inst.components.equippable.dapperness = TUNING.DAPPERNESS_LARGE    inst.components.insulator.insulation = TUNING.INSULATION_LARGE
elseif inst.level >=850 and inst.level <950 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.81)
inst.components.talker:Say("-[���ͷ��(LV17)]\n����(81)\n��ů(Large)\nHP�ظ�(3)\n�Բлظ�(Large)\n����15)")
 inst.components.equippable.walkspeedmult = 0.85  inst.components.equippable.dapperness = TUNING.DAPPERNESS_LARGE    inst.components.insulator.insulation = TUNING.INSULATION_LARGE
elseif inst.level >=950 and inst.level <1050 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.82)
inst.components.talker:Say("-[���ͷ��(LV18)]\n����(82)\n��ů(Large)\nHP�ظ�(3)\n�Բлظ�(Large)\n����15)")
 inst.components.equippable.walkspeedmult = 0.85  inst.components.equippable.dapperness = TUNING.DAPPERNESS_LARGE    inst.components.insulator.insulation = TUNING.INSULATION_LARGE
elseif inst.level >=1050 and inst.level <1200 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.83)
inst.components.talker:Say("-[���ͷ��(LV19)]\n����(83)\n��ů(Large)\nHP�ظ�(3)\n�Բлظ�(Large)\n����15)")
 inst.components.equippable.walkspeedmult = 0.85  inst.components.equippable.dapperness = TUNING.DAPPERNESS_LARGE    inst.components.insulator.insulation = TUNING.INSULATION_LARGE
elseif inst.level >=1200 and inst.level <1400 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.84)
inst.components.talker:Say("-[���ͷ��(LV20)]\n����(84)\n��ů(Large)\nHP�ظ�(3)\n�Բлظ�(Large)\n����15)")
 inst.components.equippable.walkspeedmult = 0.85  inst.components.equippable.dapperness = TUNING.DAPPERNESS_LARGE    inst.components.insulator.insulation = TUNING.INSULATION_LARGE
elseif inst.level >=1400 and inst.level <1600 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.85)
inst.components.talker:Say("-[���ͷ��(LV21)]\n����(85)\n��ů(Large)\nHP�ظ�(3)\n�Բлظ�(Large)\n����10)")
 inst.components.equippable.walkspeedmult = 0.9  inst.components.equippable.dapperness = TUNING.DAPPERNESS_LARGE    inst.components.insulator.insulation = TUNING.INSULATION_LARGE
elseif inst.level >=1600 and inst.level <1800 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.86)
inst.components.talker:Say("-[���ͷ��(LV22)]\n����(86)\n��ů(Large)\nHP�ظ�(3)\n�Բлظ�(Large)\n����10)")
 inst.components.equippable.walkspeedmult = 0.9  inst.components.equippable.dapperness = TUNING.DAPPERNESS_LARGE    inst.components.insulator.insulation = TUNING.INSULATION_LARGE
elseif inst.level >=1800 and inst.level <2000 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.87)
inst.components.talker:Say("-[���ͷ��(LV23)]\n����(87)\n��ů(Large)\nHP�ظ�(3)\n�Բлظ�(Large)\n����10)")
 inst.components.equippable.walkspeedmult = 0.9  inst.components.equippable.dapperness = TUNING.DAPPERNESS_LARGE    inst.components.insulator.insulation = TUNING.INSULATION_LARGE
elseif inst.level >=2000 and inst.level <2200 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.88)
inst.components.talker:Say("-[���ͷ��(LV24)]\n����(88)\n��ů(Large)\nHP�ظ�(3)\n�Բлظ�(Large)\n����10)")
 inst.components.equippable.walkspeedmult = 0.9  inst.components.equippable.dapperness = TUNING.DAPPERNESS_LARGE    inst.components.insulator.insulation = TUNING.INSULATION_LARGE
elseif inst.level >=2200 and inst.level <2400 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.89)
inst.components.talker:Say("-[���ͷ��(LV25)]\n����(89)\n��ů(Large)\nHP�ظ�(3)\n�Բлظ�(Large)\n����10)")
 inst.components.equippable.walkspeedmult = 0.9  inst.components.equippable.dapperness = TUNING.DAPPERNESS_LARGE    inst.components.insulator.insulation = TUNING.INSULATION_LARGE
elseif inst.level >=2400 and inst.level <2600 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.90)
inst.components.talker:Say("-[���ͷ��(LV26)]\n����(90)\n��ů(Large)\nHP�ظ�(3)\n�Բлظ�(Large)\n����10)")
 inst.components.equippable.walkspeedmult = 0.9  inst.components.equippable.dapperness = TUNING.DAPPERNESS_LARGE    inst.components.insulator.insulation = TUNING.INSULATION_LARGE
elseif inst.level >=2600 and inst.level <2800 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.91)
inst.components.talker:Say("-[���ͷ��(LV27)]\n����(91)\n��ů(Large)\nHP�ظ�(3)\n�Բлظ�(Large)\n����10)")
 inst.components.equippable.walkspeedmult = 0.9  inst.components.equippable.dapperness = TUNING.DAPPERNESS_LARGE    inst.components.insulator.insulation = TUNING.INSULATION_LARGE
elseif inst.level >=2800 and inst.level <3000 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.92)
inst.components.talker:Say("-[���ͷ��(LV28)]\n����(92)\n��ů(Large)\nHP�ظ�(3)\n�Բлظ�(Large)\n����10)")
 inst.components.equippable.walkspeedmult = 0.9  inst.components.equippable.dapperness = TUNING.DAPPERNESS_LARGE    inst.components.insulator.insulation = TUNING.INSULATION_LARGE
elseif inst.level >=3000 and inst.level <4000 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.93)
inst.components.talker:Say("-[���ͷ��(LV29)]\n����(93)\n��ů(Large)\nHP�ظ�(3)\n�Բлظ�(Large)\n����10)")
 inst.components.equippable.walkspeedmult = 0.9  inst.components.equippable.dapperness = TUNING.DAPPERNESS_LARGE    inst.components.insulator.insulation = TUNING.INSULATION_LARGE
elseif inst.level >=4000 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.94)
inst.components.talker:Say("-[���ͷ��(LV30)]\n����(94)\n��ů(Large)\nHP�ظ�(3)\n�Բлظ�(Large)\n����5)")
 inst.components.equippable.walkspeedmult = 0.95  inst.components.equippable.dapperness = TUNING.DAPPERNESS_LARGE    inst.components.insulator.insulation = TUNING.INSULATION_LARGE
end
end end

local function OnDurability(inst, data)
inst.broken = true
 	UpgradeArmor(inst)
	inst.components.fueled:StopConsuming()        
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
UpgradeArmor(inst)
   if math.random() < expchance1 and inst.level <= 4005 then
	inst.level = inst.level + 2
	levelexp(inst)
	inst.components.talker:Say("-[���ͷ��] \n���˵���! +(2)\n[�ɳ�����]".. (inst.level))
    elseif  math.random() < expchance2 and inst.level <= 4005 then
	inst.level = inst.level + 5
	levelexp(inst)
	inst.components.talker:Say("-[���ͷ��] \n���˵���! +(5)\n[�ɳ�����]".. (inst.level))
	elseif  math.random() < expchance3 and inst.level <= 4005 then
	inst.level = inst.level + 8
	levelexp(inst)
	inst.components.talker:Say("-[���ͷ��] \n���˵���! +(8)\n[�ɳ�����]".. (inst.level))
	elseif  math.random() < expchance0 and inst.level <= 4005 then
	inst.level = inst.level + 1
	levelexp(inst)
    end
end
-------- --------

local function OnLoad(inst, data)
    UpgradeArmor(inst)
end

	local function onequip(inst, owner, fname_override)
	UpgradeArmor(inst) 
inst.components.fueled:StartConsuming()        
	if inst.boost then
        owner.AnimState:OverrideSymbol("swap_hat", "hat_mphoenix", "swap_hat")
        owner.AnimState:Show("HAT")
       -- owner.AnimState:Show("HAT_HAIR")
        owner.AnimState:Hide("HAIR_NOHAT")
        owner.AnimState:Show("HAIR")
	elseif not inst.boost then
        owner.AnimState:OverrideSymbol("swap_hat", "hat_mphoenix2", "swap_hat")
        owner.AnimState:Show("HAT")
       -- owner.AnimState:Show("HAT_HAIR")
        owner.AnimState:Hide("HAIR_NOHAT")
        owner.AnimState:Show("HAIR")
        end
	
	inst.expfn = function(attacked, data)
local expchance = 0.5
local damagedur1 = 0.2
local damagedur2 = 0.5
local damagedur3 = 0.7
local damagedur4 = 1

if data and data.attacker and math.random() < damagedur1 then
inst.components.fueled:DoDelta(-150000)
elseif data and data.attacker and math.random() < damagedur2 then
inst.components.fueled:DoDelta(-100000)
elseif data and data.attacker and math.random() < damagedur3 then
inst.components.fueled:DoDelta(-50000)
elseif data and data.attacker and math.random() < damagedur4 then
inst.components.fueled:DoDelta(-50000)
end
if data and data.attacker and math.random() < expchance and inst.level <= 4000 then
inst.components.fueled:DoDelta(-50000)
	inst.level = inst.level + 1
			levelexp(inst)
		 end end	
		 
    inst.gasfn = function(attacked, data)
local other = data.attacker 
    if data and data.attacker and data.attacker.components.sleeper and inst.boost then
            data.attacker.components.sleeper:AddSleepiness(1, 24)
	SpawnPrefab("small_puff").Transform:SetPosition(other:GetPosition():Get())
       end end
    inst:ListenForEvent("attacked", inst.gasfn, owner)
		   inst:ListenForEvent("attacked", inst.expfn, owner)
	end	
	


    local function onunequip(inst, owner)
    UpgradeArmor(inst)
inst.components.fueled:StopConsuming()        
	inst.boost = false 
    inst:RemoveEventCallback("attacked", inst.gasfn, owner)
    inst:RemoveEventCallback("attacked", inst.expfn, owner)
	   if inst.consume then inst.consume:Cancel() inst.consume = nil end
    if inst.healowner then inst.healowner:Cancel() inst.healowner= nil end

         owner.AnimState:Hide("HAT")
        owner.AnimState:Hide("HAT_HAIR")
        owner.AnimState:Show("HAIR_NOHAT")
        owner.AnimState:Show("HAIR")
    end

  local function maskon(inst, data, owner, fname_override)
  local owner = inst.components.inventoryitem.owner
if owner and inst.boost then
	inst.boost = false 
	   if inst.consume then inst.consume:Cancel() inst.consume = nil end
    if inst.healowner then inst.healowner:Cancel() inst.healowner= nil end
	UpgradeArmor(inst)
	owner.components.talker:Say("mask off !")
        owner.AnimState:OverrideSymbol("swap_hat", "hat_mphoenix2", "swap_hat")
        owner.AnimState:Show("HAT")
       -- owner.AnimState:Show("HAT_HAIR")
        owner.AnimState:Hide("HAIR_NOHAT")
        owner.AnimState:Show("HAIR")

        inst.components.useableitem:StopUsingItem()

elseif owner and not inst.boost then
	    inst.heal = inst:DoPeriodicTask(10, function() healowner(inst, owner) end)
		    inst.consumed = inst:DoPeriodicTask(1, function() consume(inst, owner) end)
	inst.boost = true 
	UpgradeArmor(inst)
	owner.components.talker:Say("mask on !")
        owner.AnimState:OverrideSymbol("swap_hat", "hat_mphoenix", "swap_hat")
        owner.AnimState:Show("HAT")
       -- owner.AnimState:Show("HAT_HAIR")
        owner.AnimState:Hide("HAIR_NOHAT")
        owner.AnimState:Show("HAIR")
 
 
        inst.components.useableitem:StopUsingItem()
end
end

	
local function fn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

     MakeInventoryPhysics(inst)  
   
    inst:AddTag("hat")
	inst:AddTag("metal")
        inst.AnimState:SetBank("beehat")
        inst.AnimState:SetBuild("hat_mphoenix")
        inst.AnimState:PlayAnimation("anim")
        		inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "hat_mphoenix.tex") 	 

    inst:AddComponent("talker")
    inst.components.talker.fontsize = 20
    inst.components.talker.font = TALKINGFONT
    inst.components.talker.colour = Vector3(1, 0.8, 0.65, 1)
    inst.components.talker.offset = Vector3(-200,-220,0)
    inst.components.talker.symbol = "swap_object"
	
	inst.entity:SetPristine()
    if not TheWorld.ismastersim then
        return inst
		end		
		
    inst:AddComponent("inspectable")
    	
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/hat_mphoenix.xml"

     inst:AddComponent("useableitem")
     inst.components.useableitem:SetOnUseFn(maskon)

    inst:AddComponent("armor")
	inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.65)
        inst:AddComponent("equippable")
        inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
        inst.components.equippable:SetOnEquip( onequip )
        inst.components.equippable:SetOnUnequip( onunequip )
	inst.boost = false 

    inst.OnLoad = OnLoad

     inst:AddComponent("insulator")
 
        inst:AddComponent("fueled")
       inst.components.fueled.fueltype = "CHEMICAL"
       inst.components.fueled:InitializeFuelLevel(15000000)
       inst.components.fueled:SetDepletedFn(OnDurability)
        inst.components.fueled.ontakefuelfn = TakeItem
        inst.components.fueled.accepting = true
inst.components.fueled:StartConsuming()        

	inst.level = 0
inst:ListenForEvent("levelup", levelexp)
	inst.OnSave = onsave
	inst.OnPreLoad = onpreload

    return inst
end
---------------------------------
return Prefab( "common/inventory/hat_mphoenix", fn, assets) 
