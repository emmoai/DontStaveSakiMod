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
--inst.components.talker:Say("-[公主王冠]-\n[成长点数]".. (inst.level))
end
if inst.level >=0 and inst.level <10 then
inst.components.talker:Say("-[公主王冠] \n下一级:[10]\n[成长点数]".. (inst.level))
elseif inst.level >=10 and inst.level <30 then
inst.components.talker:Say("-[公主王冠] \n下一级:[30]\n[成长点数]".. (inst.level))
elseif inst.level >=30 and inst.level <50 then
inst.components.talker:Say("-[公主王冠] \n下一级:[50]\n[成长点数]".. (inst.level))
elseif inst.level >=50 and inst.level <70 then
inst.components.talker:Say("-[公主王冠] \n下一级:[70]\n[成长点数]".. (inst.level))
elseif inst.level >=70 and inst.level <90 then
inst.components.talker:Say("-[公主王冠] \n下一级:[90]\n[成长点数]".. (inst.level))
elseif inst.level >=90 and inst.level <120 then
inst.components.talker:Say("-[公主王冠] \n下一级:[120]\n[成长点数]".. (inst.level))
elseif inst.level >=120 and inst.level <150 then
inst.components.talker:Say("-[公主王冠] \n下一级:[150]\n[成长点数]".. (inst.level))
elseif inst.level >=150 and inst.level <180 then
inst.components.talker:Say("-[公主王冠] \n下一级:[180]\n[成长点数]".. (inst.level))
elseif inst.level >=180 and inst.level <210 then
inst.components.talker:Say("-[公主王冠] \n下一级:[210]\n[成长点数]".. (inst.level))
elseif inst.level >=210 and inst.level <250 then
inst.components.talker:Say("-[公主王冠] \n下一级:[250]\n[成长点数]".. (inst.level))
elseif inst.level >=250 and inst.level <350 then
inst.components.talker:Say("-[公主王冠] \n下一级:[350]\n[成长点数]".. (inst.level))
elseif inst.level >=350 and inst.level <450 then
inst.components.talker:Say("-[公主王冠] \n下一级:[450]\n[成长点数]".. (inst.level))
elseif inst.level >=450 and inst.level <550 then
inst.components.talker:Say("-[公主王冠] \n下一级:[550]\n[成长点数]".. (inst.level))
elseif inst.level >=550 and inst.level <650 then
inst.components.talker:Say("-[公主王冠] \n下一级:[650]\n[成长点数]".. (inst.level))
elseif inst.level >=650 and inst.level <750 then
inst.components.talker:Say("-[公主王冠] \n下一级:[750]\n[成长点数]".. (inst.level))
elseif inst.level >=750 and inst.level <850 then
inst.components.talker:Say("-[公主王冠] \n下一级:[850]\n[成长点数]".. (inst.level))
elseif inst.level >=850 and inst.level <950 then
inst.components.talker:Say("-[公主王冠] \n下一级:[950]\n[成长点数]".. (inst.level))
elseif inst.level >=950 and inst.level <1050 then
inst.components.talker:Say("-[公主王冠] \n下一级:[1050]\n[成长点数]".. (inst.level))
elseif inst.level >=1050 and inst.level <1200 then
inst.components.talker:Say("-[公主王冠] \n下一级:[1200]\n[成长点数]".. (inst.level))
elseif inst.level >=1200 and inst.level <1400 then
inst.components.talker:Say("-[公主王冠] \n下一级:[1500]\n[成长点数]".. (inst.level))
elseif inst.level >=1400 and inst.level <1600 then
inst.components.talker:Say("-[女王冠] \n下一级:[1600]\n[成长点数]".. (inst.level))
elseif inst.level >=1600 and inst.level <1800 then
inst.components.talker:Say("-[女王冠] \n下一级:[1800]\n[成长点数]".. (inst.level))
elseif inst.level >=1800 and inst.level <2000 then
inst.components.talker:Say("-[女王冠] \n下一级:[2000]\n[成长点数]".. (inst.level))
elseif inst.level >=2000 and inst.level <2200 then
inst.components.talker:Say("-[女王冠] \n下一级:[2200]\n[成长点数]".. (inst.level))
elseif inst.level >=2200 and inst.level <2400 then
inst.components.talker:Say("-[女王冠] \n下一级:[2400]\n[成长点数]".. (inst.level))
elseif inst.level >=2400 and inst.level <2600 then
inst.components.talker:Say("-[女王冠] \n下一级:[2600]\n[成长点数]".. (inst.level))
elseif inst.level >=2600 and inst.level <2800 then
inst.components.talker:Say("-[女王冠] \n下一级:[2800]\n[成长点数]".. (inst.level))
elseif inst.level >=2800 and inst.level <3000 then
inst.components.talker:Say("-[女王冠] \n下一级:[3000]\n[成长点数]".. (inst.level))
elseif inst.level >=3000 and inst.level <4000 then
inst.components.talker:Say("-[女王冠] \n下一级:[4000]\n[成长点数]".. (inst.level))
elseif inst.level >=4000 and inst.level <4005 then
inst.components.talker:Say("-[女王冠] \n[MAX]")
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
inst.components.talker:Say("-[损坏的王冠]\n脑残回复(Small)\n护甲(0)\n耐久(0)")
  
elseif not inst.broken and not inst.shield then

 if inst.level >=0 and inst.level <10 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.11)
inst.components.talker:Say("-[公主冠(LV1)]\n脑残回复(Small)\n护甲(11)")
  elseif inst.level >=10 and inst.level <30 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.12)
inst.components.talker:Say("-[公主冠(LV2)]\n脑残回复(Small)\n护甲(12)")
 elseif inst.level >=30 and inst.level <50 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.13)
inst.components.talker:Say("-[公主冠(LV3)]\n脑残回复(Small)\n护甲(13)")
 elseif inst.level >=50 and inst.level <70 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.14)
inst.components.talker:Say("-[公主冠(LV4)]\n脑残回复(Small)\n护甲(14)")
  elseif inst.level >=70 and inst.level <90 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.15)
inst.components.talker:Say("-[公主冠(LV5)]\n脑残回复(Small)\n护甲(15)")
 elseif inst.level >=90 and inst.level <120 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.16)
inst.components.talker:Say("-[公主冠(LV6)]\n脑残回复(Small)\n护甲(16)")
 elseif inst.level >=120 and inst.level <150 then
  inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.17)
inst.components.talker:Say("-[公主冠(LV7)]\n脑残回复(Small)\n护甲(17)")
elseif inst.level >=150 and inst.level <180 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.18)
inst.components.talker:Say("-[公主冠(LV8)]\n脑残回复(Small)\n护甲(18)")
elseif inst.level >=180 and inst.level <210 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.19)
inst.components.talker:Say("-[公主冠(LV9)]\n脑残回复(Small)\n护甲(19)")
elseif inst.level >=210 and inst.level <250 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.20)
inst.components.talker:Say("-[公主冠(LV10)]\n脑残回复(Small)\n护甲(20)")
elseif inst.level >=250 and inst.level <350 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.21)
inst.components.talker:Say("-[公主冠(LV11)]\n脑残回复(Small)\n护甲(21)")
elseif inst.level >=350 and inst.level <450 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.22)
inst.components.talker:Say("-[公主冠(LV12)]\n脑残回复(Small)\n护甲(22)")
elseif inst.level >=450 and inst.level <550 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.23)
inst.components.talker:Say("-[公主冠(LV13)]\n脑残回复(Small)\n护甲(23)")
elseif inst.level >=550 and inst.level <650 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.24)
inst.components.talker:Say("-[公主冠(LV14)]\n脑残回复(Small)\n护甲(24)")
elseif inst.level >=650 and inst.level <750 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.25)
inst.components.talker:Say("-[公主冠(LV15)]\n脑残回复(Small)\n护甲(25)")
elseif inst.level >=750 and inst.level <850 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.26)
inst.components.talker:Say("-[公主冠(LV16)]\n脑残回复(Small)\n护甲(26)")
elseif inst.level >=850 and inst.level <950 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.27)
inst.components.talker:Say("-[公主冠(LV17)]\n脑残回复(Small)\n护甲(27)")
elseif inst.level >=950 and inst.level <1050 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.28)
inst.components.talker:Say("-[公主冠(LV18)]\n脑残回复(Small)\n护甲(28)")
elseif inst.level >=1050 and inst.level <1200 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.29)
inst.components.talker:Say("-[公主冠(LV19)]\n脑残回复(Small)\n护甲(29)")
elseif inst.level >=1200 and inst.level <1400 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.30)
inst.components.talker:Say("-[女王冠(LV20)]\n脑残回复(MED)\nHP回复(slow)\n护甲(30)")
elseif inst.level >=1400 and inst.level <1600 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.32)
inst.components.talker:Say("-[女王冠(LV21)]\n脑残回复(MED)\nHP回复(slow)\n护甲(32)")
elseif inst.level >=1600 and inst.level <1800 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.34)
inst.components.talker:Say("-[女王冠(LV22)]\n脑残回复(MED)\nHP回复(slow)\n护甲(34)")
elseif inst.level >=1800 and inst.level <2000 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.36)
inst.components.talker:Say("-[女王冠(LV23)]\n脑残回复(MED)\nHP回复(slow)\n护甲(36)")
elseif inst.level >=2000 and inst.level <2200 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.38)
inst.components.talker:Say("-[女王冠(LV24)]\n脑残回复(MED)\nHP回复(slow)\n护甲(38)")
elseif inst.level >=2200 and inst.level <2400 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.40)
inst.components.talker:Say("-[女王冠(LV25)]\n脑残回复(MED)\nHP回复(slow)\n护甲(40)")
elseif inst.level >=2400 and inst.level <2600 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.42)
inst.components.talker:Say("-[女王冠(LV26)]\n脑残回复(MED)\nHP回复(slow)\n护甲(42)")
elseif inst.level >=2600 and inst.level <2800 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.44)
inst.components.talker:Say("-[女王冠(LV27)]\n脑残回复(MED)\nHP回复(slow)\n护甲(44)")
elseif inst.level >=2800 and inst.level <3000 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.46)
inst.components.talker:Say("-[女王冠(LV28)]\n脑残回复(MED)\nHP回复(slow)\n护甲(46)")
elseif inst.level >=3000 and inst.level <4000 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.48)
inst.components.talker:Say("-[女王冠(LV29)]\n脑残回复(MED)\nHP回复(slow)\n护甲(48)")
elseif inst.level >=4000 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.50)
inst.components.talker:Say("-[女王冠(LV30)]\n脑残回复(MED)\nHP回复(slow)\n护甲(50)")
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
	inst.components.talker:Say("-[公主王冠] \n幸运点数! +(2)\n[成长点数]".. (inst.level))
    elseif  math.random() < expchance2 and inst.level <= 4005 then
	inst.level = inst.level + 5
	levelexp(inst)
	inst.components.talker:Say("-[公主王冠] \n幸运点数! +(5)\n[成长点数]".. (inst.level))
	elseif  math.random() < expchance3 and inst.level <= 4005 then
	inst.level = inst.level + 8
	levelexp(inst)
	inst.components.talker:Say("-[公主王冠] \n幸运点数! +(8)\n[成长点数]".. (inst.level))
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
inst.components.talker:Say("[立场护盾]\n护甲(100)")
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 1)
    inst.task = inst:DoPeriodicTask(1, function() consume(inst, owner) end)
	
	elseif inst.shield and inst.broken then
inst.components.talker:Say("[立场护盾]\n护甲(0)")
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
