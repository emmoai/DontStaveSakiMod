local assets=
{
	Asset("ANIM", "anim/hat_mprincess.zip"),
  Asset("ATLAS", "images/inventoryimages/hat_mprincess.xml"),
  Asset("IMAGE", "images/inventoryimages/hat_mprincess.tex"),
  	Asset("ANIM", "anim/hat_mcrown.zip"),
}
--------------
local function healowner(inst, owner)
if inst.healing1 and not inst.broken then
    if (owner.components.health and owner.components.health:IsHurt())then
        owner.components.health:DoDelta(1,false)
end end end
--------------growable
local function levelexp(inst,data)

	local max_exp = 4100
	local exp = math.min(inst.level, max_exp)

if inst.level > 4005 then
--inst.components.talker:Say("-[��������]-\n[�ɳ�����]".. (inst.level))
end
if inst.level >=0 and inst.level <10 then
inst.components.talker:Say("-[��������] \n��һ��:[10]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=10 and inst.level <30 then
inst.components.talker:Say("-[��������] \n��һ��:[30]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=30 and inst.level <50 then
inst.components.talker:Say("-[��������] \n��һ��:[50]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=50 and inst.level <70 then
inst.components.talker:Say("-[��������] \n��һ��:[70]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=70 and inst.level <90 then
inst.components.talker:Say("-[��������] \n��һ��:[90]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=90 and inst.level <120 then
inst.components.talker:Say("-[��������] \n��һ��:[120]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=120 and inst.level <150 then
inst.components.talker:Say("-[��������] \n��һ��:[150]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=150 and inst.level <180 then
inst.components.talker:Say("-[��������] \n��һ��:[180]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=180 and inst.level <210 then
inst.components.talker:Say("-[��������] \n��һ��:[210]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=210 and inst.level <250 then
inst.components.talker:Say("-[��������] \n��һ��:[250]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=250 and inst.level <350 then
inst.components.talker:Say("-[��������] \n��һ��:[350]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=350 and inst.level <450 then
inst.components.talker:Say("-[��������] \n��һ��:[450]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=450 and inst.level <550 then
inst.components.talker:Say("-[��������] \n��һ��:[550]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=550 and inst.level <650 then
inst.components.talker:Say("-[��������] \n��һ��:[650]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=650 and inst.level <750 then
inst.components.talker:Say("-[��������] \n��һ��:[750]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=750 and inst.level <850 then
inst.components.talker:Say("-[��������] \n��һ��:[850]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=850 and inst.level <950 then
inst.components.talker:Say("-[��������] \n��һ��:[950]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=950 and inst.level <1050 then
inst.components.talker:Say("-[��������] \n��һ��:[1050]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=1050 and inst.level <1200 then
inst.components.talker:Say("-[��������] \n��һ��:[1200]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=1200 and inst.level <1400 then
inst.components.talker:Say("-[��������] \n��һ��:[1500]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=1400 and inst.level <1600 then
inst.components.talker:Say("-[Ů����] \n��һ��:[1600]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=1600 and inst.level <1800 then
inst.components.talker:Say("-[Ů����] \n��һ��:[1800]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=1800 and inst.level <2000 then
inst.components.talker:Say("-[Ů����] \n��һ��:[2000]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=2000 and inst.level <2200 then
inst.components.talker:Say("-[Ů����] \n��һ��:[2200]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=2200 and inst.level <2400 then
inst.components.talker:Say("-[Ů����] \n��һ��:[2400]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=2400 and inst.level <2600 then
inst.components.talker:Say("-[Ů����] \n��һ��:[2600]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=2600 and inst.level <2800 then
inst.components.talker:Say("-[Ů����] \n��һ��:[2800]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=2800 and inst.level <3000 then
inst.components.talker:Say("-[Ů����] \n��һ��:[3000]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=3000 and inst.level <4000 then
inst.components.talker:Say("-[Ů����] \n��һ��:[4000]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=4000 and inst.level <4005 then
inst.components.talker:Say("-[Ů����] \n[MAX]")
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
inst.healing1 = false
elseif not inst.components.fueled:IsEmpty() then
inst.broken = false
end
if inst.broken then
inst.components.fueled:StopConsuming()        
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0)
inst.components.talker:Say("-[�𻵵�����]\n�Բлظ�(Small)\n����(0)\n�;�(0)")
  
elseif not inst.broken and not inst.shield then

 if inst.level >=0 and inst.level <10 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.11)
inst.components.talker:Say("-[������(LV1)]\n�Բлظ�(Small)\n����(11)")
  elseif inst.level >=10 and inst.level <30 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.12)
inst.components.talker:Say("-[������(LV2)]\n�Բлظ�(Small)\n����(12)")
 elseif inst.level >=30 and inst.level <50 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.13)
inst.components.talker:Say("-[������(LV3)]\n�Բлظ�(Small)\n����(13)")
 elseif inst.level >=50 and inst.level <70 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.14)
inst.components.talker:Say("-[������(LV4)]\n�Բлظ�(Small)\n����(14)")
  elseif inst.level >=70 and inst.level <90 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.15)
inst.components.talker:Say("-[������(LV5)]\n�Բлظ�(Small)\n����(15)")
 elseif inst.level >=90 and inst.level <120 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.16)
inst.components.talker:Say("-[������(LV6)]\n�Բлظ�(Small)\n����(16)")
 elseif inst.level >=120 and inst.level <150 then
  inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.17)
inst.components.talker:Say("-[������(LV7)]\n�Բлظ�(Small)\n����(17)")
elseif inst.level >=150 and inst.level <180 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.18)
inst.components.talker:Say("-[������(LV8)]\n�Բлظ�(Small)\n����(18)")
elseif inst.level >=180 and inst.level <210 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.19)
inst.components.talker:Say("-[������(LV9)]\n�Բлظ�(Small)\n����(19)")
elseif inst.level >=210 and inst.level <250 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.20)
inst.components.talker:Say("-[������(LV10)]\n�Բлظ�(Small)\n����(20)")
elseif inst.level >=250 and inst.level <350 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.21)
inst.components.talker:Say("-[������(LV11)]\n�Բлظ�(Small)\n����(21)")
elseif inst.level >=350 and inst.level <450 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.22)
inst.components.talker:Say("-[������(LV12)]\n�Բлظ�(Small)\n����(22)")
elseif inst.level >=450 and inst.level <550 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.23)
inst.components.talker:Say("-[������(LV13)]\n�Բлظ�(Small)\n����(23)")
elseif inst.level >=550 and inst.level <650 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.24)
inst.components.talker:Say("-[������(LV14)]\n�Բлظ�(Small)\n����(24)")
elseif inst.level >=650 and inst.level <750 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.25)
inst.components.talker:Say("-[������(LV15)]\n�Բлظ�(Small)\n����(25)")
elseif inst.level >=750 and inst.level <850 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.26)
inst.components.talker:Say("-[������(LV16)]\n�Բлظ�(Small)\n����(26)")
elseif inst.level >=850 and inst.level <950 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.27)
inst.components.talker:Say("-[������(LV17)]\n�Բлظ�(Small)\n����(27)")
elseif inst.level >=950 and inst.level <1050 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.28)
inst.components.talker:Say("-[������(LV18)]\n�Բлظ�(Small)\n����(28)")
elseif inst.level >=1050 and inst.level <1200 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.29)
inst.components.talker:Say("-[������(LV19)]\n�Բлظ�(Small)\n����(29)")
elseif inst.level >=1200 and inst.level <1400 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.30)
inst.components.talker:Say("-[Ů����(LV20)]\n�Բлظ�(MED)\nHP�ظ�(slow)\n����(30)")
elseif inst.level >=1400 and inst.level <1600 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.32)
inst.components.talker:Say("-[Ů����(LV21)]\n�Բлظ�(MED)\nHP�ظ�(slow)\n����(32)")
elseif inst.level >=1600 and inst.level <1800 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.34)
inst.components.talker:Say("-[Ů����(LV22)]\n�Բлظ�(MED)\nHP�ظ�(slow)\n����(34)")
elseif inst.level >=1800 and inst.level <2000 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.36)
inst.components.talker:Say("-[Ů����(LV23)]\n�Բлظ�(MED)\nHP�ظ�(slow)\n����(36)")
elseif inst.level >=2000 and inst.level <2200 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.38)
inst.components.talker:Say("-[Ů����(LV24)]\n�Բлظ�(MED)\nHP�ظ�(slow)\n����(38)")
elseif inst.level >=2200 and inst.level <2400 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.40)
inst.components.talker:Say("-[Ů����(LV25)]\n�Բлظ�(MED)\nHP�ظ�(slow)\n����(40)")
elseif inst.level >=2400 and inst.level <2600 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.42)
inst.components.talker:Say("-[Ů����(LV26)]\n�Բлظ�(MED)\nHP�ظ�(slow)\n����(42)")
elseif inst.level >=2600 and inst.level <2800 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.44)
inst.components.talker:Say("-[Ů����(LV27)]\n�Բлظ�(MED)\nHP�ظ�(slow)\n����(44)")
elseif inst.level >=2800 and inst.level <3000 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.46)
inst.components.talker:Say("-[Ů����(LV28)]\n�Բлظ�(MED)\nHP�ظ�(slow)\n����(46)")
elseif inst.level >=3000 and inst.level <4000 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.48)
inst.components.talker:Say("-[Ů����(LV29)]\n�Բлظ�(MED)\nHP�ظ�(slow)\n����(48)")
elseif inst.level >=4000 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.50)
inst.components.talker:Say("-[Ů����(LV30)]\n�Բлظ�(MED)\nHP�ظ�(slow)\n����(50)")
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
	inst.components.talker:Say("-[��������] \n���˵���! +(2)\n[�ɳ�����]".. (inst.level))
    elseif  math.random() < expchance2 and inst.level <= 4005 then
	inst.level = inst.level + 5
	levelexp(inst)
	inst.components.talker:Say("-[��������] \n���˵���! +(5)\n[�ɳ�����]".. (inst.level))
	elseif  math.random() < expchance3 and inst.level <= 4005 then
	inst.level = inst.level + 8
	levelexp(inst)
	inst.components.talker:Say("-[��������] \n���˵���! +(8)\n[�ɳ�����]".. (inst.level))
	elseif  math.random() < expchance0 and inst.level <= 4005 then
	inst.level = inst.level + 1
	levelexp(inst)
    end
end
-------- --------

local function OnLoad(inst, data)
    UpgradeArmor(inst)
end
---------------------------------------shield on
local function consume(inst, owner)
if not inst.broken and inst.shield then
inst.components.fueled:DoDelta(-15000)
end
end

local function on_shield(inst, owner)
if inst.shield and not inst.broken then
inst.components.talker:Say("[��������]\n����(100)")
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 1)
    inst.task = inst:DoPeriodicTask(1, function() consume(inst, owner) end)
	
	elseif inst.shield and inst.broken then
inst.components.talker:Say("[��������]\n����(0)")
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0)
    --inst.task = inst:DoPeriodicTask(1, function() consume(inst, owner) end)
end end

local function off_shield(inst)
if inst.shield then
inst.shield = false
UpgradeArmor(inst)
end end
--------------Shield hat
    local function stopusingshield(inst, data)
        local hat = inst.components.inventory and inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
        if hat and not (data.statename == "hide_idle" or data.statename == "hide") then
		inst.shield = false
        hat.components.useableitem:StopUsingItem()
        end
    end
local function OnPutInInventory(inst)
inst.healing1 = false
      UpgradeArmor(inst)
    end 
		
    local function onequipcrown(inst, owner)
	   UpgradeArmor(inst)
	   	inst.components.fueled:StartConsuming() 
     owner.AnimState:OverrideSymbol("swap_hat", "hat_mprincess", "swap_hat")
     owner.AnimState:Show("HAT")
       -- owner.AnimState:Show("HAT_HAIR")
        owner.AnimState:Hide("HAIR_NOHAT")
        owner.AnimState:Show("HAIR")
	if inst.level <1200 then --750 LV16
	inst.components.equippable.dapperness = TUNING.DAPPERNESS_SMALL
	elseif inst.level >=1200 then	--1400 LV21
	inst.healing1 = true
     owner.AnimState:OverrideSymbol("swap_hat", "hat_mcrown", "swap_hat")
        owner.AnimState:Show("HAT")
        owner.AnimState:Show("HAT_HAIR")
        owner.AnimState:Hide("HAIR_NOHAT")
        owner.AnimState:Hide("HAIR")
	inst.components.equippable.dapperness = TUNING.DAPPERNESS_MED
			if inst.healing1 and not inst.broken then
		    inst.heal = inst:DoPeriodicTask(60, function() healowner(inst, owner) end)
 		end end

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
if data and data.attacker and math.random() < expchance then
inst.components.fueled:DoDelta(-50000)
	inst.level = inst.level + 1
			levelexp(inst)
	end end 
	   inst:ListenForEvent("attacked", inst.expfn, owner)
	inst:ListenForEvent("newstate", stopusingshield, owner) 
	end

    local function onunequipcrown(inst, owner)
	inst.healing1 = false

	inst.components.fueled:StopConsuming()
        owner.AnimState:Hide("HAT")
        owner.AnimState:Hide("HAT_HAIR")
        owner.AnimState:Show("HAIR_NOHAT")
        owner.AnimState:Show("HAIR")

            owner.AnimState:Show("HEAD")
            owner.AnimState:Hide("HEAD_HAIR")
	inst.shield = false
		if inst.consume then inst.consume:Cancel() inst.consume = nil end
	    if inst.healowner then inst.healowner:Cancel() inst.healowner = nil end
	       inst:RemoveEventCallback("newstate", stopusingshield, owner)
		   
inst:RemoveEventCallback("attacked", inst.expfn, owner)
inst:RemoveEventCallback("newstate", stopusingshield, owner) 
    end
 
 local function onuseshield(inst)
	inst.shield = true
	on_shield(inst)
local owner = inst.components.inventoryitem.owner
        if owner then
            owner.sg:GoToState("hide")
owner.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
        end
    end

local function offuseshield(inst)
   if inst.consume then inst.consume:Cancel() inst.consume = nil end
	off_shield(inst)
	inst.healing1 = false
	end

---------------bushhat end
	
local function fn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

     MakeInventoryPhysics(inst)  

    inst.AnimState:SetBank("bushhat")
    inst.AnimState:SetBuild("hat_mprincess")
    inst.AnimState:PlayAnimation("anim")
	
    inst:AddTag("hat")
    inst:AddTag("metal")
	inst:AddTag("hide")
	inst:AddTag("waterproofer")
	inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "hat_mprincess.tex" )
	
 
    inst:AddComponent("talker")
    inst.components.talker.fontsize = 20
    inst.components.talker.font = TALKINGFONT
     inst.components.talker.colour = Vector3(1, 0.8, 0.95, 1)
    inst.components.talker.offset = Vector3(-200,-220,0)
    inst.components.talker.symbol = "swap_object"
	

	  inst.entity:SetPristine()
	    if not TheWorld.ismastersim then
        return inst
    end
	
    inst:AddComponent("inspectable")
 	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)
    inst.components.inventoryitem.atlasname = "images/inventoryimages/hat_mprincess.xml"
    inst.components.inventoryitem.foleysound = "dontstarve/movement/foley/bushhat"
    inst:AddComponent("armor")
	inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.11)
	   inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(0)
    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
  
    inst:AddComponent("useableitem")
       inst.components.useableitem:SetOnUseFn(onuseshield)
       inst.components.useableitem:SetOnStopUseFn(offuseshield)
       inst.components.equippable:SetOnEquip( onequipcrown )
       inst.components.equippable:SetOnUnequip( onunequipcrown )
 
    inst.OnLoad = OnLoad

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
return Prefab( "common/inventory/hat_mprincess", fn, assets ) 
