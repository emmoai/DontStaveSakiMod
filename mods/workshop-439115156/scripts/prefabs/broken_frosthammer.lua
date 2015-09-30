local assets=
{
	Asset("ANIM", "anim/swap_frostpocket.zip"),
	Asset("ANIM", "anim/swap_frostback.zip"),
	Asset("ATLAS", "images/inventoryimages/broken_frosthammer.xml"),
	Asset("IMAGE", "images/inventoryimages/broken_frosthammer.tex"),
}

local function levelexp(inst,data)

	local max_exp = 4100
	local exp = math.min(inst.level, max_exp)

if inst.level > 4005 then
--inst.components.talker:Say("-[Frost Armor]-\n[�ɳ�����]".. (inst.level))
end
if inst.level >=0 and inst.level <10 then
inst.components.talker:Say("-[��˪����] \n��һ��:[10]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=10 and inst.level <30 then
inst.components.talker:Say("-[��˪����] \n��һ��:[30]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=30 and inst.level <50 then
inst.components.talker:Say("-[��˪����] \n��һ��:[50]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=50 and inst.level <70 then
inst.components.talker:Say("-[��˪����] \n��һ��:[70]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=70 and inst.level <90 then
inst.components.talker:Say("-[��˪����] \n��һ��:[90]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=90 and inst.level <120 then
inst.components.talker:Say("-[��˪����] \n��һ��:[120]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=120 and inst.level <150 then
inst.components.talker:Say("-[��˪����] \n��һ��:[150]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=150 and inst.level <180 then
inst.components.talker:Say("-[��˪����] \n��һ��:[180]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=180 and inst.level <210 then
inst.components.talker:Say("-[��˪����] \n��һ��:[210]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=210 and inst.level <250 then
inst.components.talker:Say("-[��˪����] \n��һ��:[250]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=250 and inst.level <350 then
inst.components.talker:Say("-[��˪����] \n��һ��:[350]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=350 and inst.level <450 then
inst.components.talker:Say("-[��˪����] \n��һ��:[450]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=450 and inst.level <550 then
inst.components.talker:Say("-[��˪����] \n��һ��:[550]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=550 and inst.level <650 then
inst.components.talker:Say("-[��˪����] \n��һ��:[650]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=650 and inst.level <750 then
inst.components.talker:Say("-[��˪����] \n��һ��:[750]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=750 and inst.level <850 then
inst.components.talker:Say("-[��˪����] \n��һ��:[850]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=850 and inst.level <950 then
inst.components.talker:Say("-[��˪����] \n��һ��:[950]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=950 and inst.level <1050 then
inst.components.talker:Say("-[��˪����] \n��һ��:[1050]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=1050 and inst.level <1200 then
inst.components.talker:Say("-[��˪����] \n��һ��:[1200]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=1200 and inst.level <1400 then
inst.components.talker:Say("-[��˪����] \n��һ��:[1500]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=1400 and inst.level <1600 then
inst.components.talker:Say("-[��˪����] \n��һ��:[1600]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=1600 and inst.level <1800 then
inst.components.talker:Say("-[��˪����] \n��һ��:[1800]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=1800 and inst.level <2000 then
inst.components.talker:Say("-[��˪����] \n��һ��:[2000]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=2000 and inst.level <2200 then
inst.components.talker:Say("-[��˪����] \n��һ��:[2200]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=2200 and inst.level <2400 then
inst.components.talker:Say("-[��˪����] \n��һ��:[2400]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=2400 and inst.level <2600 then
inst.components.talker:Say("-[��˪����] \n��һ��:[2600]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=2600 and inst.level <2800 then
inst.components.talker:Say("-[��˪����] \n��һ��:[2800]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=2800 and inst.level <3000 then
inst.components.talker:Say("-[��˪����] \n��һ��:[3000]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=3000 and inst.level <4000 then
inst.components.talker:Say("-[��˪����] \n��һ��:[4000]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=4000 and inst.level <4005 then
inst.components.talker:Say("-[��˪����] \n[MAX]")
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
 inst.components.fueled:StopConsuming()        
    inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0)
inst.components.talker:Say("-[Broken FrostArmor]\nArmor (0)\nDurability (0)")
  
elseif not inst.broken then

 if inst.level >=0 and inst.level <10 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.03)
inst.components.talker:Say("-[��˪���� (LV1)]\n����(3)\n����(20)")
  elseif inst.level >=10 and inst.level <30 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.06)
inst.components.talker:Say("-[��˪���� (LV2)]\n����(6)\n����(20)")
 elseif inst.level >=30 and inst.level <50 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.09)
inst.components.talker:Say("-[��˪���� (LV3)]\n����(9)\n����(20)")
 elseif inst.level >=50 and inst.level <70 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.12)
inst.components.talker:Say("-[��˪���� (LV4)]\n����(12)\n����(20)")
  elseif inst.level >=70 and inst.level <90 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.15)
inst.components.talker:Say("-[��˪���� (LV5)]\n����(15)\n����(20)")
 elseif inst.level >=90 and inst.level <120 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.18)
inst.components.talker:Say("-[��˪���� (LV6)]\n����(18)\n����(20)")
 elseif inst.level >=120 and inst.level <150 then
  inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.21)
inst.components.talker:Say("-[��˪���� (LV7)]\n����(21)\n����(20)")
elseif inst.level >=150 and inst.level <180 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.24)
inst.components.talker:Say("-[��˪���� (LV8)]\n����(24)\n����(20)")
elseif inst.level >=180 and inst.level <210 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.27)
inst.components.talker:Say("-[��˪���� (LV9)]\n����(27)\n����(20)")
elseif inst.level >=210 and inst.level <250 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.3)
inst.components.talker:Say("-[��˪���� (LV10)]\n����(30)\n����(30)")
elseif inst.level >=250 and inst.level <350 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.33)
inst.components.talker:Say("-[��˪���� (LV11)]\n����(33)\n����(30)")
elseif inst.level >=350 and inst.level <450 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.36)
inst.components.talker:Say("-[��˪���� (LV12)]\n����(36)\n����(30)")
elseif inst.level >=450 and inst.level <550 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.39)
inst.components.talker:Say("-[��˪���� (LV13)]\n����(39)\n����(30)")
elseif inst.level >=550 and inst.level <650 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.42)
inst.components.talker:Say("-[��˪���� (LV14)]\n����(42)\n����(30)")
elseif inst.level >=650 and inst.level <750 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.45)
inst.components.equippable.walkspeedmult = 1.15
inst.components.talker:Say("-[��˪���� (LV15)]\n����(45)\n����(30)\n�ٶ�����15)\n�Բлظ�\n(�е�)")
elseif inst.level >=750 and inst.level <850 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.48)
 inst.components.equippable.walkspeedmult = 1.15
inst.components.talker:Say("-[��˪���� (LV16)]\n����(48)\n����(30)\n�ٶ�����15)\n�Բлظ�\n(�е�)")
elseif inst.level >=850 and inst.level <950 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.51)
 inst.components.equippable.walkspeedmult = 1.15
inst.components.talker:Say("-[��˪���� (LV17)]\n����(51)\n����(30)\n�ٶ�����15)\n�Բлظ�\n(�е�)")
elseif inst.level >=950 and inst.level <1050 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.54)
inst.components.equippable.walkspeedmult = 1.15
inst.components.talker:Say("-[��˪���� (LV18)]\n����(54)\n����(30)\n�ٶ�����15)\n�Բлظ�\n(�е�)")
elseif inst.level >=1050 and inst.level <1200 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.57)
 inst.components.equippable.walkspeedmult = 1.15
inst.components.talker:Say("-[��˪���� (LV19)]\n����(57)\n����(30)\n�ٶ�����15)\n�Բлظ�\n(�е�)")
elseif inst.level >=1200 and inst.level <1400 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.60)
 inst.components.equippable.walkspeedmult = 1.15
inst.components.talker:Say("-[��˪���� (LV20)]\n����(60)\n����(40)\n�ٶ�����15)\n�Բлظ�\n(�е�)")
elseif inst.level >=1400 and inst.level <1600 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.63)
 inst.components.equippable.walkspeedmult = 1.15
inst.components.talker:Say("-[��˪���� (LV21)]\n����(63)\n����(40)\n�ٶ�����15)\n�Բлظ�\n(�е�)")
elseif inst.level >=1600 and inst.level <1800 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.66)
 inst.components.equippable.walkspeedmult = 1.15
inst.components.talker:Say("-[��˪���� (LV22)]\n����(66)\n����(40)\n�ٶ�����15)\n�Բлظ�\n(�е�)")
elseif inst.level >=1800 and inst.level <2000 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.69)
 inst.components.equippable.walkspeedmult = 1.15
inst.components.talker:Say("-[��˪���� (LV23)]\n����(69)\n����(40)\n�ٶ�����15)\n�Բлظ�\n(�е�)")
elseif inst.level >=2000 and inst.level <2200 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.72)
 inst.components.equippable.walkspeedmult = 1.15
inst.components.talker:Say("-[��˪���� (LV24)]\n����(72)\n����(40)\n�ٶ�����15)\n�Բлظ�\n(�е�)")
elseif inst.level >=2200 and inst.level <2400 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.75)
 inst.components.equippable.walkspeedmult = 1.15
inst.components.talker:Say("-[��˪���� (LV25)]\n����(75)\n����(40)\n�ٶ�����15)\n�Բлظ�\n(�е�)")
elseif inst.level >=2400 and inst.level <2600 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.78)
inst.components.equippable.walkspeedmult = 1.15
inst.components.talker:Say("-[��˪���� (LV26)]\n����(78)\n����(40)\n�ٶ�����15)\n�Բлظ�\n(�е�)")
elseif inst.level >=2600 and inst.level <2800 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.80)
inst.components.equippable.walkspeedmult = 1.15
inst.components.talker:Say("-[��˪���� (LV27)]\n����(80)\n����(40)\n�ٶ�����15)\n�Բлظ�\n(�е�)")
elseif inst.level >=2800 and inst.level <3000 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.82)
inst.components.equippable.walkspeedmult = 1.15
inst.components.talker:Say("-[��˪���� (LV28)]\n����(82)\n����(40)\n�ٶ�����15)\n�Բлظ�\n(�е�)")
elseif inst.level >=3000 and inst.level <4000 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.84)
inst.components.equippable.walkspeedmult = 1.15
inst.components.talker:Say("-[��˪���� (LV29)]\n����(84)\n����(40)\n�ٶ�����15)\n�Բлظ�\n(�е�)")
elseif inst.level >=4000 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.85)
inst.components.equippable.walkspeedmult = 1.15
inst.components.talker:Say("-[��˪���� (LV30)]\n����(85)\n����(40)\n�ٶ�����(20)")
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
	inst.components.talker:Say("-[��˪����] \nLucky Points ! +(2)\n[�ɳ�����]".. (inst.level))
    elseif  math.random() < expchance2 and inst.level <= 4005 then
	inst.level = inst.level + 5
	levelexp(inst)
	inst.components.talker:Say("-[��˪����] \nLucky Points ! +(5)\n[�ɳ�����]".. (inst.level))
	elseif  math.random() < expchance3 and inst.level <= 4005 then
	inst.level = inst.level + 8
	levelexp(inst)
	inst.components.talker:Say("-[��˪����] \nLucky Points ! +(8)\n[�ɳ�����]".. (inst.level))
	elseif  math.random() < expchance0 and inst.level <= 4005 then
	inst.level = inst.level + 1
	levelexp(inst)
    end
end
-------- --------

local function OnLoad(inst, data)
    UpgradeArmor(inst)
end

--------

local function OnPutInInventory(inst)
    UpgradeArmor(inst)
    end 
	
local function onequip(inst, owner) 
   
        inst.components.container:Open(owner) 
	 UpgradeArmor(inst)
	inst.components.fueled:StartConsuming() 
	owner.AnimState:OverrideSymbol("swap_body", "swap_frostpocket", "backpack")
	owner.AnimState:OverrideSymbol("swap_body", "swap_frostpocket", "swap_body")
if inst.level <750 then
	owner.AnimState:OverrideSymbol("swap_body", "swap_frostpocket", "backpack")
     owner.AnimState:OverrideSymbol("swap_body", "swap_frostpocket", "swap_body")
	 	--inst.components.equippable.dapperness = TUNING.DAPPERNESS_SMALL
elseif inst.level >=750 then	
	owner.AnimState:OverrideSymbol("swap_body", "swap_frostback", "backpack")
     owner.AnimState:OverrideSymbol("swap_body", "swap_frostback", "swap_body")
	 	inst.components.equippable.dapperness = TUNING.DAPPERNESS_MED
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

		end 
	    end

    inst.freezefn = function(attacked, data)
	local freezechance1 = 0.2
	local freezechance2 = 0.3
	local freezechance3 = 0.4
	local freezechance1b = 0.6
	local freezechance2b = 0.8
	local freezechance3b = 1
	       if data and math.random() < freezechance1 and not inst.boost and data.attacker and data.attacker.components.freezable and inst.level <250 then 
            data.attacker.components.freezable:AddColdness(0.2)
            data.attacker.components.freezable:SpawnShatterFX()
        elseif data and math.random() < freezechance2 and not inst.boost and data.attacker and data.attacker.components.freezable and inst.level >=250 and inst.level <1400 then
            data.attacker.components.freezable:AddColdness(0.3)
            data.attacker.components.freezable:SpawnShatterFX()
        elseif data and math.random() < freezechance3 and not inst.boost and data.attacker and data.attacker.components.freezable and inst.level >=1400 then
            data.attacker.components.freezable:AddColdness(0.4)
            data.attacker.components.freezable:SpawnShatterFX()
			
        elseif data and math.random() < freezechance1b and inst.boost and data.attacker and data.attacker.components.freezable and inst.level <250 then 
            data.attacker.components.freezable:AddColdness(0.6)
            data.attacker.components.freezable:SpawnShatterFX()
        elseif data and math.random() < freezechance2b and inst.boost and data.attacker and data.attacker.components.freezable and inst.level >=250 and inst.level <1400 then
            data.attacker.components.freezable:AddColdness(0.9)
            data.attacker.components.freezable:SpawnShatterFX()
        elseif data and math.random() < freezechance3b and inst.boost and data.attacker and data.attacker.components.freezable and inst.level >=1400 then
            data.attacker.components.freezable:AddColdness(1.2)
            data.attacker.components.freezable:SpawnShatterFX()
            end end
    inst:ListenForEvent("attacked", inst.freezefn, owner)
    inst:ListenForEvent("attacked", inst.expfn, owner)
end

	
local function OnOpen(inst,data)
inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")
         --inst.components.container:Open(owner)
  end

local function OnClose(inst,data)
inst.SoundEmitter:PlaySound("dontstarve/common/gem_shatter")
         --inst.components.container:Close(owner)
end

local function onunequip(inst, owner) 
inst.components.fueled:StopConsuming()        
    owner.AnimState:ClearOverrideSymbol("swap_body")
    owner.AnimState:ClearOverrideSymbol("backpack")
         inst:RemoveEventCallback("attacked", inst.freezefn, owner)
		inst:RemoveEventCallback("attacked", inst.expfn, owner)
        inst.components.container:Close(owner)
		   UpgradeArmor(inst)
 end

local function fn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
   MakeInventoryPhysics(inst)  
      	
    inst.AnimState:SetBank("backpack1")
    inst.AnimState:SetBuild("swap_frostback")
    inst.AnimState:PlayAnimation("anim")
	       inst:AddTag("waterproofer")
		inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "broken_frosthammer.tex" )
	inst:AddComponent("talker")
    inst.components.talker.fontsize = 20
    inst.components.talker.font = TALKINGFONT
    inst.components.talker.colour = Vector3(0.7, 0.85, 1, 1)
    inst.components.talker.offset = Vector3(0,100,0)
    inst.components.talker.symbol = "swap_object"
	
 if not TheWorld.ismastersim then
		--inst:DoTaskInTime(0, function() inst.replica.container:WidgetSetup("frostbox") end)
		return inst
	end
inst.entity:SetPristine()

    inst:AddComponent("inspectable")
    	inst.boost = true
	    inst:AddComponent("inventoryitem")
	   inst.components.inventoryitem.foleysound = "dontstarve/movement/foley/krampuspack"
	inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)
    inst.components.inventoryitem.atlasname = "images/inventoryimages/broken_frosthammer.xml"

   inst.components.inventoryitem.cangoincontainer = false
 
    inst:AddComponent("armor")
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.03)

    inst:AddComponent("container")
    inst.components.container:WidgetSetup("piggyback")
   -- inst.components.container:WidgetSetup("frostbox")
		
    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
	
    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )

    inst:AddTag("fridge")
    inst:AddTag("backpack")
	
  inst:AddComponent("insulator")
  inst.components.insulator:SetSummer()
  inst.components.insulator.insulation = TUNING.INSULATION_SMALL
 
 
    inst.OnLoad = OnLoad
    inst:AddComponent("waterproofer")
    inst.components.waterproofer.effectiveness = 0

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

return Prefab( "common/inventory/broken_frosthammer", fn, assets) 
