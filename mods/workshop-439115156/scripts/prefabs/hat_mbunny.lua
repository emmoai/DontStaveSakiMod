local assets=
{
	Asset("ANIM", "anim/hat_mbunny.zip"),
	Asset("ANIM", "anim/hat_mbunny2.zip"),
  Asset("ATLAS", "images/inventoryimages/hat_mbunny.xml"),
  Asset("IMAGE", "images/inventoryimages/hat_mbunny.tex")
}
--------------growable
local function levelexp(inst,data)

	local max_exp = 4100
	local exp = math.min(inst.level, max_exp)

if inst.level > 4000 then

end
if inst.level >=0 and inst.level <10 then
inst.components.talker:Say("-[兔子帽] \n下一级:[10]\n[成长点数]".. (inst.level))
elseif inst.level >=10 and inst.level <30 then
inst.components.talker:Say("-[兔子帽] \n下一级:[30]\n[成长点数]".. (inst.level))
elseif inst.level >=30 and inst.level <50 then
inst.components.talker:Say("-[兔子帽] \n下一级:[50]\n[成长点数]".. (inst.level))
elseif inst.level >=50 and inst.level <70 then
inst.components.talker:Say("-[兔子帽] \n下一级:[70]\n[成长点数]".. (inst.level))
elseif inst.level >=70 and inst.level <90 then
inst.components.talker:Say("-[兔子帽] \n下一级:[90]\n[成长点数]".. (inst.level))
elseif inst.level >=90 and inst.level <120 then
inst.components.talker:Say("-[兔子帽] \n下一级:[120]\n[成长点数]".. (inst.level))
elseif inst.level >=120 and inst.level <150 then
inst.components.talker:Say("-[兔子帽] \n下一级:[150]\n[成长点数]".. (inst.level))
elseif inst.level >=150 and inst.level <180 then
inst.components.talker:Say("-[兔子帽] \n下一级:[180]\n[成长点数]".. (inst.level))
elseif inst.level >=180 and inst.level <210 then
inst.components.talker:Say("-[兔子帽] \n下一级:[210]\n[成长点数]".. (inst.level))
elseif inst.level >=210 and inst.level <250 then
inst.components.talker:Say("-[兔子帽] \n下一级:[250]\n[成长点数]".. (inst.level))
elseif inst.level >=250 and inst.level <350 then
inst.components.talker:Say("-[兔子帽] \n下一级:[350]\n[成长点数]".. (inst.level))
elseif inst.level >=350 and inst.level <450 then
inst.components.talker:Say("-[兔子帽] \n下一级:[450]\n[成长点数]".. (inst.level))
elseif inst.level >=450 and inst.level <550 then
inst.components.talker:Say("-[兔子帽] \n下一级:[550]\n[成长点数]".. (inst.level))
elseif inst.level >=550 and inst.level <650 then
inst.components.talker:Say("-[兔子帽] \n下一级:[650]\n[成长点数]".. (inst.level))
elseif inst.level >=650 and inst.level <750 then
inst.components.talker:Say("-[兔子帽] \n下一级:[750]\n[成长点数]".. (inst.level))
elseif inst.level >=750 and inst.level <850 then
inst.components.talker:Say("-[兔子帽] \n下一级:[850]\n[成长点数]".. (inst.level))
elseif inst.level >=850 and inst.level <950 then
inst.components.talker:Say("-[兔子帽] \n下一级:[950]\n[成长点数]".. (inst.level))
elseif inst.level >=950 and inst.level <1050 then
inst.components.talker:Say("-[兔子帽] \n下一级:[1050]\n[成长点数]".. (inst.level))
elseif inst.level >=1050 and inst.level <1200 then
inst.components.talker:Say("-[兔子帽] \n下一级:[1200]\n[成长点数]".. (inst.level))
elseif inst.level >=1200 and inst.level <1400 then
inst.components.talker:Say("-[兔子帽] \n下一级:[1500]\n[成长点数]".. (inst.level))
elseif inst.level >=1400 and inst.level <1600 then
inst.components.talker:Say("-[兔子帽] \n下一级:[1600]\n[成长点数]".. (inst.level))
elseif inst.level >=1600 and inst.level <1800 then
inst.components.talker:Say("-[兔子帽] \n下一级:[1800]\n[成长点数]".. (inst.level))
elseif inst.level >=1800 and inst.level <2000 then
inst.components.talker:Say("-[兔子帽] \n下一级:[2000]\n[成长点数]".. (inst.level))
elseif inst.level >=2000 and inst.level <2200 then
inst.components.talker:Say("-[兔子帽] \n下一级:[2200]\n[成长点数]".. (inst.level))
elseif inst.level >=2200 and inst.level <2400 then
inst.components.talker:Say("-[兔子帽] \n下一级:[2400]\n[成长点数]".. (inst.level))
elseif inst.level >=2400 and inst.level <2600 then
inst.components.talker:Say("-[兔子帽] \n下一级:[2600]\n[成长点数]".. (inst.level))
elseif inst.level >=2600 and inst.level <2800 then
inst.components.talker:Say("-[兔子帽] \n下一级:[2800]\n[成长点数]".. (inst.level))
elseif inst.level >=2800 and inst.level <3000 then
inst.components.talker:Say("-[兔子帽] \n下一级:[3000]\n[成长点数]".. (inst.level))
elseif inst.level >=3000 and inst.level <4000 then
inst.components.talker:Say("-[兔子帽] \n下一级:[4000]\n[成长点数]".. (inst.level))
elseif inst.level >=4000 and inst.level <4005 then
inst.components.talker:Say("-[兔子帽] \n[MAX]")
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
---------------------------------------
local function UpgradeArmor(inst, data)
if inst.components.fueled:IsEmpty() then
inst.broken = true
elseif not inst.components.fueled:IsEmpty() then
inst.broken = false
end
if inst.broken then
   inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0)
    inst.components.equippable.walkspeedmult = 1
	inst.components.talker:Say("-[损坏的兔子帽]\n耐久(0)\n速度提升(0)")
            inst.components.fueled:StopConsuming()        
   end

if not inst.broken and not inst.boost then
   if inst.level >=0 and inst.level <10 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.11)
    inst.components.insulator.insulation = TUNING.INSULATION_MED
    inst.components.equippable.walkspeedmult = 1.20
inst.components.talker:Say("-[兔子帽(LV1)]\n速度提升(20)\n保温(MED)\n护甲(11)")
  elseif inst.level >=10 and inst.level <30 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.12)
    inst.components.insulator.insulation = TUNING.INSULATION_MED
    inst.components.equippable.walkspeedmult = 1.20
inst.components.talker:Say("-[兔子帽(LV2)]\n速度提升(20)\n保温(MED)\n护甲(12)")
 elseif inst.level >=30 and inst.level <50 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.13)
     inst.components.insulator.insulation = TUNING.INSULATION_MED
    inst.components.equippable.walkspeedmult = 1.20
inst.components.talker:Say("-[兔子帽(LV3)]\n速度提升(20)\n保温(MED)\n护甲(13)")
 elseif inst.level >=50 and inst.level <70 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.14)
     inst.components.insulator.insulation = TUNING.INSULATION_MED
    inst.components.equippable.walkspeedmult = 1.20
inst.components.talker:Say("-[兔子帽(LV4)]\n速度提升(20)\n保温(MED)\n护甲(14)")
  elseif inst.level >=70 and inst.level <90 then
 inst.components.armor:InitCondition(
 9999999999999999999999999999999999999999999999999999999999999, 0.15)
     inst.components.insulator.insulation = TUNING.INSULATION_MED
    inst.components.equippable.walkspeedmult = 1.20
inst.components.talker:Say("-[兔子帽(LV5)]\n速度提升(20)\n保温(MED)\n护甲(15)")
 elseif inst.level >=90 and inst.level <120 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.16)
     inst.components.insulator.insulation = TUNING.INSULATION_MED
    inst.components.equippable.walkspeedmult = 1.20
inst.components.talker:Say("-[兔子帽(LV6)]\n速度提升(20)\n保温(MED)\n护甲(16)")
 elseif inst.level >=120 and inst.level <150 then
  inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.17)
     inst.components.insulator.insulation = TUNING.INSULATION_MED
    inst.components.equippable.walkspeedmult = 1.20 
inst.components.talker:Say("-[兔子帽(LV7)]\n速度提升(20)\n保温(MED)\n护甲(17)")
elseif inst.level >=150 and inst.level <180 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.18)
    inst.components.insulator.insulation = TUNING.INSULATION_MED
    inst.components.equippable.walkspeedmult = 1.20
inst.components.talker:Say("-[兔子帽(LV8)]\n速度提升(20)\n保温(MED)\n护甲(18)")
elseif inst.level >=180 and inst.level <210 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.19)
    inst.components.insulator.insulation = TUNING.INSULATION_MED
    inst.components.equippable.walkspeedmult = 1.20
inst.components.talker:Say("-[兔子帽(LV9)]\n速度提升(20)\n保温(MED)\n护甲(19)")
elseif inst.level >=210 and inst.level <250 then
 inst.components.armor:InitCondition(
 9999999999999999999999999999999999999999999999999999999999999, 0.20)
     inst.components.insulator.insulation = TUNING.INSULATION_MED
    inst.components.equippable.walkspeedmult = 1.3
inst.components.talker:Say("-[兔子帽(LV10)]\n速度提升(30)\n保温(Large)\n护甲(20)")
elseif inst.level >=250 and inst.level <350 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.21)
     inst.components.insulator.insulation = TUNING.INSULATION_LARGE
    inst.components.equippable.walkspeedmult = 1.3
inst.components.talker:Say("-[兔子帽(LV11)]\n速度提升(30)\n保温(Large)\n护甲(21)")
elseif inst.level >=350 and inst.level <450 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.22)
      inst.components.insulator.insulation = TUNING.INSULATION_LARGE
    inst.components.equippable.walkspeedmult = 1.3
inst.components.talker:Say("-[兔子帽(LV12)]\n速度提升(30)\n保温(Large)\n护甲(22)")
elseif inst.level >=450 and inst.level <550 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.23)
      inst.components.insulator.insulation = TUNING.INSULATION_LARGE
    inst.components.equippable.walkspeedmult = 1.3
inst.components.talker:Say("-[兔子帽(LV13)]\n速度提升(30)\n保温(Large)\n护甲(23)")
elseif inst.level >=550 and inst.level <650 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.24)
      inst.components.insulator.insulation = TUNING.INSULATION_LARGE
    inst.components.equippable.walkspeedmult = 1.3
inst.components.talker:Say("-[兔子帽(LV14)]\n速度提升(30)\n保温(Large)\n护甲(24)")
elseif inst.level >=650 and inst.level <750 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.25)
      inst.components.insulator.insulation = TUNING.INSULATION_LARGE
    inst.components.equippable.walkspeedmult = 1.3
inst.components.talker:Say("-[兔子帽(LV15)]\n速度提升(30)\n保温(Large)\n护甲(25)")
elseif inst.level >=750 and inst.level <850 then
 inst.components.armor:InitCondition(
 9999999999999999999999999999999999999999999999999999999999999, 0.26)
      inst.components.insulator.insulation = TUNING.INSULATION_LARGE
    inst.components.equippable.walkspeedmult = 1.3
inst.components.talker:Say("-[兔子帽(LV16)]\n速度提升(30)\n保温(Large)\n护甲(26)")
elseif inst.level >=850 and inst.level <950 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.27)
      inst.components.insulator.insulation = TUNING.INSULATION_LARGE
    inst.components.equippable.walkspeedmult = 1.3
inst.components.talker:Say("-[兔子帽(LV17)]\n速度提升(30)\n保温(Large)\n护甲(27)")
elseif inst.level >=950 and inst.level <1050 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.28)
     inst.components.insulator.insulation = TUNING.INSULATION_LARGE
    inst.components.equippable.walkspeedmult = 1.3
inst.components.talker:Say("-[兔子帽(LV18)]\n速度提升(30)\n保温(Large)\n护甲(28)")
elseif inst.level >=1050 and inst.level <1200 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.29)
      inst.components.insulator.insulation = TUNING.INSULATION_LARGE
    inst.components.equippable.walkspeedmult = 1.3
inst.components.talker:Say("-[兔子帽(LV19)]\n速度提升(30)\n保温(Large)\n护甲(29)")
elseif inst.level >=1200 and inst.level <1400 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.30)
      inst.components.insulator.insulation = TUNING.INSULATION_LARGE
    inst.components.equippable.walkspeedmult = 1.3
inst.components.talker:Say("-[兔子帽(LV20)]\n速度提升(40)\n保温(Large)\n护甲(30)")
elseif inst.level >=1400 and inst.level <1600 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.32)
      inst.components.insulator.insulation = (TUNING.INSULATION_LARGE)
    inst.components.equippable.walkspeedmult = 1.4
inst.components.talker:Say("-[兔子帽(LV21)]\n速度提升(40)\n保温(Large)\n护甲(32)")
elseif inst.level >=1600 and inst.level <1800 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.34)
      inst.components.insulator.insulation = (TUNING.INSULATION_LARGE)
    inst.components.equippable.walkspeedmult = 1.4
inst.components.talker:Say("-[兔子帽(LV22)]\n速度提升(40)\n保温(Large)\n护甲(34)")
elseif inst.level >=1800 and inst.level <2000 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.36)
      inst.components.insulator.insulation = (TUNING.INSULATION_LARGE)
    inst.components.equippable.walkspeedmult = 1.4
inst.components.talker:Say("-[兔子帽(LV23)]\n速度提升(40)\n保温(Large)\n护甲(36)")
elseif inst.level >=2000 and inst.level <2200 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.38)
      inst.components.insulator.insulation = (TUNING.INSULATION_LARGE)
    inst.components.equippable.walkspeedmult = 1.4
inst.components.talker:Say("-[兔子帽(LV24)]\n速度提升(40)\n保温(Large)\n护甲(38)")
elseif inst.level >=2200 and inst.level <2400 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.40)
      inst.components.insulator.insulation = (TUNING.INSULATION_LARGE)
    inst.components.equippable.walkspeedmult = 1.4
inst.components.talker:Say("-[兔子帽(LV25)]\n速度提升(40)\n保温(Large)\n护甲(40)")
elseif inst.level >=2400 and inst.level <2600 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.42)
     inst.components.insulator.insulation = (TUNING.INSULATION_LARGE)
    inst.components.equippable.walkspeedmult = 1.4
inst.components.talker:Say("-[兔子帽(LV26)]\n速度提升(40)\n保温(Large)\n护甲(42)")
elseif inst.level >=2600 and inst.level <2800 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.44)
     inst.components.insulator.insulation = (TUNING.INSULATION_LARGE)
    inst.components.equippable.walkspeedmult = 1.4
inst.components.talker:Say("-[兔子帽(LV27)]\n速度提升(40)\n保温(Large)\n护甲(44)")
elseif inst.level >=2800 and inst.level <3000 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.46)
     inst.components.insulator.insulation = (TUNING.INSULATION_LARGE)
    inst.components.equippable.walkspeedmult = 1.40
inst.components.talker:Say("-[兔子帽(LV28)]\n速度提升(40)\n保温(Large)\n护甲(46)")
elseif inst.level >=3000 and inst.level <4000 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.48)
     inst.components.insulator.insulation = (TUNING.INSULATION_LARGE)
    inst.components.equippable.walkspeedmult = 1.40
inst.components.talker:Say("-[兔子帽(LV29)]\n速度提升(40)\n保温(Large)\n护甲(48)")
elseif inst.level >=4000 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.50)
     inst.components.insulator.insulation = (TUNING.INSULATION_LARGE * 2)
    inst.components.equippable.walkspeedmult = 1.40
inst.components.talker:Say("-[兔子帽(LV30)]\n速度提升(45)\n保温(Great)\n护甲(50)")
end
elseif not inst.broken and inst.boost then
  if inst.level >=0 and inst.level <10 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.11)
    inst.components.insulator.insulation = TUNING.INSULATION_MED
    inst.components.equippable.walkspeedmult = 1.4
inst.components.talker:Say("-[兔子帽(LV1)]\n速度提升(40)\n保温(MED)\n护甲(11)")
  elseif inst.level >=10 and inst.level <30 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.12)
    inst.components.insulator.insulation = TUNING.INSULATION_MED
    inst.components.equippable.walkspeedmult = 1.4
inst.components.talker:Say("-[兔子帽(LV2)]\n速度提升(40)\n保温(MED)\n护甲(12)")
 elseif inst.level >=30 and inst.level <50 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.13)
     inst.components.insulator.insulation = TUNING.INSULATION_MED
    inst.components.equippable.walkspeedmult = 1.4
inst.components.talker:Say("-[兔子帽(LV3)]\n速度提升(40)\n保温(MED)\n护甲(13)")
 elseif inst.level >=50 and inst.level <70 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.14)
     inst.components.insulator.insulation = TUNING.INSULATION_MED
    inst.components.equippable.walkspeedmult = 1.4
inst.components.talker:Say("-[兔子帽(LV4)]\n速度提升(40)\n保温(MED)\n护甲(14)")
  elseif inst.level >=70 and inst.level <90 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.15)
     inst.components.insulator.insulation = TUNING.INSULATION_MED
    inst.components.equippable.walkspeedmult = 1.4
inst.components.talker:Say("-[兔子帽(LV5)]\n速度提升(40)\n保温(MED)\n护甲(15)")
 elseif inst.level >=90 and inst.level <120 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.16)
     inst.components.insulator.insulation = TUNING.INSULATION_MED
    inst.components.equippable.walkspeedmult = 1.4
inst.components.talker:Say("-[兔子帽(LV6)]\n速度提升(40)\n保温(MED)\n护甲(16)")
 elseif inst.level >=120 and inst.level <150 then
  inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.17)
      inst.components.insulator.insulation = TUNING.INSULATION_MED
    inst.components.equippable.walkspeedmult = 1.4
inst.components.talker:Say("-[兔子帽(LV7)]\n速度提升(40)\n保温(MED)\n护甲(17)")
elseif inst.level >=150 and inst.level <180 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.18)
    inst.components.insulator.insulation = TUNING.INSULATION_MED
    inst.components.equippable.walkspeedmult = 1.4
inst.components.talker:Say("-[兔子帽(LV8)]\n速度提升(40)\n保温(MED)\n护甲(18)")
elseif inst.level >=180 and inst.level <210 then
inst.components.armor:InitCondition(
9999999999999999999999999999999999999999999999999999999999999, 0.19)
    inst.components.insulator.insulation = TUNING.INSULATION_MED
    inst.components.equippable.walkspeedmult = 1.4
inst.components.talker:Say("-[兔子帽(LV9)]\n速度提升(40)\n保温(MED)\n护甲(19)")
elseif inst.level >=210 and inst.level <250 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.20)
     inst.components.insulator.insulation = TUNING.INSULATION_MED
    inst.components.equippable.walkspeedmult = 1.4
inst.components.talker:Say("-[兔子帽(LV10)]\n速度提升(60)\n保温(Large)\n护甲(20)")
elseif inst.level >=250 and inst.level <350 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.21)
     inst.components.insulator.insulation = TUNING.INSULATION_LARGE
    inst.components.equippable.walkspeedmult = 1.6
inst.components.talker:Say("-[兔子帽(LV11)]\n速度提升(60)\n保温(Large)\n护甲(21)")
elseif inst.level >=350 and inst.level <450 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.22)
      inst.components.insulator.insulation = TUNING.INSULATION_LARGE
    inst.components.equippable.walkspeedmult = 1.6
inst.components.talker:Say("-[兔子帽(LV12)]\n速度提升(60)\n保温(Large)\n护甲(22)")
elseif inst.level >=450 and inst.level <550 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.23)
      inst.components.insulator.insulation = TUNING.INSULATION_LARGE
    inst.components.equippable.walkspeedmult = 1.6
inst.components.talker:Say("-[兔子帽(LV13)]\n速度提升(60)\n保温(Large)\n护甲(23)")
elseif inst.level >=550 and inst.level <650 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.24)
      inst.components.insulator.insulation = TUNING.INSULATION_LARGE
    inst.components.equippable.walkspeedmult = 1.6
inst.components.talker:Say("-[兔子帽(LV14)]\n速度提升(60)\n保温(Large)\n护甲(24)")
elseif inst.level >=650 and inst.level <750 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.25)
      inst.components.insulator.insulation = TUNING.INSULATION_LARGE
    inst.components.equippable.walkspeedmult = 1.6
inst.components.talker:Say("-[兔子帽(LV15)]\n速度提升(60)\n保温(Large)\n护甲(25)")
elseif inst.level >=750 and inst.level <850 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.26)
      inst.components.insulator.insulation = TUNING.INSULATION_LARGE
    inst.components.equippable.walkspeedmult = 1.6
inst.components.talker:Say("-[兔子帽(LV16)]\n速度提升(60)\n保温(Large)\n护甲(26)")
elseif inst.level >=850 and inst.level <950 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.27)
      inst.components.insulator.insulation = TUNING.INSULATION_LARGE
    inst.components.equippable.walkspeedmult = 1.6
inst.components.talker:Say("-[兔子帽(LV17)]\n速度提升(60)\n保温(Large)\n护甲(27)")
elseif inst.level >=950 and inst.level <1050 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.28)
     inst.components.insulator.insulation = TUNING.INSULATION_LARGE
    inst.components.equippable.walkspeedmult = 1.6
inst.components.talker:Say("-[兔子帽(LV18)]\n速度提升(60)\n保温(Large)\n护甲(28)")
elseif inst.level >=1050 and inst.level <1200 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.29)
      inst.components.insulator.insulation = TUNING.INSULATION_LARGE
    inst.components.equippable.walkspeedmult = 1.6
inst.components.talker:Say("-[兔子帽(LV19)]\n速度提升(60)\n保温(Large)\n护甲(29)")
elseif inst.level >=1200 and inst.level <1400 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.30)
      inst.components.insulator.insulation = TUNING.INSULATION_LARGE
    inst.components.equippable.walkspeedmult = 1.6
inst.components.talker:Say("-[兔子帽(LV20)]\n速度提升(80)\n保温(Large)\n护甲(30)")
elseif inst.level >=1400 and inst.level <1600 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.32)
       inst.components.insulator.insulation = (TUNING.INSULATION_LARGE)
    inst.components.equippable.walkspeedmult = 1.8
inst.components.talker:Say("-[兔子帽(LV21)]\n速度提升(80)\n保温(Large)\n护甲(32)")
elseif inst.level >=1600 and inst.level <1800 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.34)
        inst.components.insulator.insulation = (TUNING.INSULATION_LARGE)
    inst.components.equippable.walkspeedmult = 1.8
inst.components.talker:Say("-[兔子帽(LV22)]\n速度提升(80)\n保温(Large)\n护甲(34)")
elseif inst.level >=1800 and inst.level <2000 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.36)
        inst.components.insulator.insulation = (TUNING.INSULATION_LARGE)
    inst.components.equippable.walkspeedmult = 1.8
inst.components.talker:Say("-[兔子帽(LV23)]\n速度提升(80)\n保温(Large)\n护甲(36)")
elseif inst.level >=2000 and inst.level <2200 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.38)
        inst.components.insulator.insulation = (TUNING.INSULATION_LARGE)
    inst.components.equippable.walkspeedmult = 1.8
inst.components.talker:Say("-[兔子帽(LV24)]\n速度提升(80)\n保温(Large)\n护甲(38)")
elseif inst.level >=2200 and inst.level <2400 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.40)
        inst.components.insulator.insulation = (TUNING.INSULATION_LARGE)
    inst.components.equippable.walkspeedmult = 1.8
inst.components.talker:Say("-[兔子帽(LV25)]\n速度提升(80)\n保温(Large)\n护甲(40)")
elseif inst.level >=2400 and inst.level <2600 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.42)
       inst.components.insulator.insulation = (TUNING.INSULATION_LARGE)
    inst.components.equippable.walkspeedmult = 1.8
inst.components.talker:Say("-[兔子帽(LV26)]\n速度提升(80)\n保温(Large)\n护甲(42)")
elseif inst.level >=2600 and inst.level <2800 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.44)
       inst.components.insulator.insulation = (TUNING.INSULATION_LARGE)
    inst.components.equippable.walkspeedmult = 1.8
inst.components.talker:Say("-[兔子帽(LV27)]\n速度提升(80)\n保温(Large)\n护甲(44)")
elseif inst.level >=2800 and inst.level <3000 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.46)
       inst.components.insulator.insulation = (TUNING.INSULATION_LARGE)
    inst.components.equippable.walkspeedmult = 1.8
inst.components.talker:Say("-[兔子帽(LV28)]\n速度提升(80)\n保温(Large)\n护甲(46)")
elseif inst.level >=3000 and inst.level <4000 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.48)
       inst.components.insulator.insulation = (TUNING.INSULATION_LARGE)
    inst.components.equippable.walkspeedmult = 1.8
inst.components.talker:Say("-[兔子帽(LV29)]\n速度提升(80)\n保温(Large)\n护甲(48)")
elseif inst.level >=4000 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.50)
       inst.components.insulator.insulation = (TUNING.INSULATION_LARGE * 2)
    inst.components.equippable.walkspeedmult = 1.9
inst.components.talker:Say("-[兔子帽(LV30)]\n速度提升(90)\n保温(Great)\n护甲(50)")
end
end
end

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
	inst.components.talker:Say("-[兔子帽] \n幸运点数! +(2)\n[成长点数]".. (inst.level))
    elseif  math.random() < expchance2 and inst.level <= 4005 then
	inst.level = inst.level + 5
	levelexp(inst)
	inst.components.talker:Say("-[兔子帽] \n幸运点数! +(5)\n[成长点数]".. (inst.level))
	elseif  math.random() < expchance3 and inst.level <= 4005 then
	inst.level = inst.level + 8
	levelexp(inst)
	inst.components.talker:Say("-[兔子帽] \n幸运点数! +(8)\n[成长点数]".. (inst.level))
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
inst.components.fueled:StartConsuming()        

if not inst.boost then
        owner.AnimState:OverrideSymbol("swap_hat", "hat_mbunny", "swap_hat")
        owner.AnimState:Show("HAT")
       -- owner.AnimState:Show("HAT_HAIR")
        owner.AnimState:Hide("HAIR_NOHAT")
        owner.AnimState:Show("HAIR")
elseif inst.boost then
        owner.AnimState:OverrideSymbol("swap_hat", "hat_mbunny2", "swap_hat")
        owner.AnimState:Show("HAT")
       -- owner.AnimState:Show("HAT_HAIR")
        owner.AnimState:Hide("HAIR_NOHAT")
        owner.AnimState:Show("HAIR")
        end
    UpgradeArmor(inst)
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

		end 
	    end

    inst:ListenForEvent("attacked", inst.expfn, owner)

end

    local function onunequip(inst, owner)
    UpgradeArmor(inst)
	inst.boost = false 
inst.components.fueled:StopConsuming()        
    inst:RemoveEventCallback("attacked", inst.expfn, owner)
    if inst.task then inst.task:Cancel() inst.task = nil end

         owner.AnimState:Hide("HAT")
        owner.AnimState:Hide("HAT_HAIR")
        owner.AnimState:Show("HAIR_NOHAT")
        owner.AnimState:Show("HAIR")

    end

local function consume(inst, owner)
if not inst.broken and inst.boost then
inst.components.fueled:DoDelta(-15000)
end
end

  local function gogleon(inst, data, owner, fname_override)
  local owner = inst.components.inventoryitem.owner
if owner and inst.broken then
	inst.boost = false 
	owner.components.talker:Say("Bunny Hat is Broken !")
	inst.components.talker:Say("-[Broken BunnyScout]\nDurability(0)\n速度提升(0)")
    inst.components.equippable.walkspeedmult = 1
        owner.AnimState:OverrideSymbol("swap_hat", "hat_mbunny", "swap_hat")
        owner.AnimState:Show("HAT")
       -- owner.AnimState:Show("HAT_HAIR")
        owner.AnimState:Hide("HAIR_NOHAT")
        owner.AnimState:Show("HAIR")
        inst.components.useableitem:StopUsingItem()
end
if owner and not inst.boost and not inst.broken then
	inst.boost = true 
	owner.components.talker:Say("Goggle on !")
    inst.task = inst:DoPeriodicTask(1, function() consume(inst, owner) end)
        owner.AnimState:OverrideSymbol("swap_hat", "hat_mbunny2", "swap_hat")
        owner.AnimState:Show("HAT")
       -- owner.AnimState:Show("HAT_HAIR")
        owner.AnimState:Hide("HAIR_NOHAT")
        owner.AnimState:Show("HAIR")
		UpgradeArmor(inst)

        inst.components.useableitem:StopUsingItem()

-----------
elseif owner and inst.boost and not inst.broken then
	inst.boost = false 
	owner.components.talker:Say("Goggle off !")
    if inst.task then inst.task:Cancel() inst.task = nil end
        owner.AnimState:OverrideSymbol("swap_hat", "hat_mbunny", "swap_hat")
        owner.AnimState:Show("HAT")
       -- owner.AnimState:Show("HAT_HAIR")
        owner.AnimState:Hide("HAIR_NOHAT")
        owner.AnimState:Show("HAIR")
		UpgradeArmor(inst)
        inst.components.useableitem:StopUsingItem()
end
end

---------------hat fn sim
	
local function fn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

     MakeInventoryPhysics(inst)  
   
    inst:AddTag("hat")

     inst.AnimState:SetBank("beehat")
     inst.AnimState:SetBuild("hat_mbunny")
     inst.AnimState:PlayAnimation("anim")    
      		inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "hat_mbunny.tex") 	
		
	inst:AddComponent("talker")
    inst.components.talker.fontsize = 20
    inst.components.talker.font = TALKINGFONT
    inst.components.talker.colour = Vector3(0.8, 1, 0.65, 1)
    inst.components.talker.offset = Vector3(-200,-220,0)
    inst.components.talker.symbol = "swap_object"
	
	inst.entity:SetPristine()
    if not TheWorld.ismastersim then
        return inst
		end		
		
    inst:AddComponent("inspectable")
    	
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/hat_mbunny.xml"

    inst:AddComponent("armor")
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.11)
inst.boost = false 

            inst:AddComponent("useableitem")
		inst.components.useableitem:SetOnUseFn(gogleon)
        inst:AddComponent("equippable")
        inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
        inst.components.equippable:SetOnEquip( onequip )
        inst.components.equippable:SetOnUnequip( onunequip )

        inst:AddComponent("insulator")
 
	inst.level = 0
	inst:ListenForEvent("levelup", levelexp)
	inst.OnSave = onsave
	inst.OnPreLoad = onpreload

        inst:AddComponent("fueled")
       inst.components.fueled.fueltype = "CHEMICAL"
        inst.components.fueled:InitializeFuelLevel(15000000)
       inst.components.fueled:SetDepletedFn(OnDurability)
        inst.components.fueled.ontakefuelfn = TakeItem
        inst.components.fueled.accepting = true
inst.components.fueled:StartConsuming()        

    return inst
end
---------------------------------
return Prefab( "common/inventory/hat_mbunny", fn, assets ) 
