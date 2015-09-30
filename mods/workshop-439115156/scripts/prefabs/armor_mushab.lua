local assets=
{
	Asset("ANIM", "anim/armor_mushab.zip"),
  Asset("ATLAS", "images/inventoryimages/armor_mushab.xml"),
  Asset("IMAGE", "images/inventoryimages/armor_mushab.tex")

}

--------------
local function healowner(inst, owner)
    if (owner.components.health and owner.components.health:IsHurt())
    and (owner.components.hunger and owner.components.hunger.current > 160)then
        owner.components.health:DoDelta(2,false)
elseif (owner.components.health and owner.components.health:IsHurt())
    and (owner.components.hunger and owner.components.hunger.current < 160 and owner.components.hunger and owner.components.hunger.current > 30  )then
        owner.components.health:DoDelta(1,false)
        owner.components.sanity:DoDelta(1,false)
elseif (owner.components.health and owner.components.health:IsHurt())
    and (owner.components.hunger and owner.components.hunger.current < 30 )then
        owner.components.sanity:DoDelta(2,false)
    end
end
--------------growable
local function levelexp(inst,data)

	local max_exp = 4100
	local exp = math.min(inst.level, max_exp)

if inst.level > 4005 then

end
if inst.level >=0 and inst.level <10 then
inst.components.talker:Say("-[公主护甲] \n下一级:[10]\n[成长点数]".. (inst.level))
elseif inst.level >=10 and inst.level <30 then
inst.components.talker:Say("-[公主护甲] \n下一级:[30]\n[成长点数]".. (inst.level))
elseif inst.level >=30 and inst.level <50 then
inst.components.talker:Say("-[公主护甲] \n下一级:[50]\n[成长点数]".. (inst.level))
elseif inst.level >=50 and inst.level <70 then
inst.components.talker:Say("-[公主护甲] \n下一级:[70]\n[成长点数]".. (inst.level))
elseif inst.level >=70 and inst.level <90 then
inst.components.talker:Say("-[公主护甲] \n下一级:[90]\n[成长点数]".. (inst.level))
elseif inst.level >=90 and inst.level <120 then
inst.components.talker:Say("-[公主护甲] \n下一级:[120]\n[成长点数]".. (inst.level))
elseif inst.level >=120 and inst.level <150 then
inst.components.talker:Say("-[公主护甲] \n下一级:[150]\n[成长点数]".. (inst.level))
elseif inst.level >=150 and inst.level <180 then
inst.components.talker:Say("-[公主护甲] \n下一级:[180]\n[成长点数]".. (inst.level))
elseif inst.level >=180 and inst.level <210 then
inst.components.talker:Say("-[公主护甲] \n下一级:[210]\n[成长点数]".. (inst.level))
elseif inst.level >=210 and inst.level <250 then
inst.components.talker:Say("-[公主护甲] \n下一级:[250]\n[成长点数]".. (inst.level))
elseif inst.level >=250 and inst.level <350 then
inst.components.talker:Say("-[公主护甲] \n下一级:[350]\n[成长点数]".. (inst.level))
elseif inst.level >=350 and inst.level <450 then
inst.components.talker:Say("-[公主护甲] \n下一级:[450]\n[成长点数]".. (inst.level))
elseif inst.level >=450 and inst.level <550 then
inst.components.talker:Say("-[公主护甲] \n下一级:[550]\n[成长点数]".. (inst.level))
elseif inst.level >=550 and inst.level <650 then
inst.components.talker:Say("-[公主护甲] \n下一级:[650]\n[成长点数]".. (inst.level))
elseif inst.level >=650 and inst.level <750 then
inst.components.talker:Say("-[公主护甲] \n下一级:[750]\n[成长点数]".. (inst.level))
elseif inst.level >=750 and inst.level <850 then
inst.components.talker:Say("-[公主护甲] \n下一级:[850]\n[成长点数]".. (inst.level))
elseif inst.level >=850 and inst.level <950 then
inst.components.talker:Say("-[公主护甲] \n下一级:[950]\n[成长点数]".. (inst.level))
elseif inst.level >=950 and inst.level <1050 then
inst.components.talker:Say("-[公主护甲] \n下一级:[1050]\n[成长点数]".. (inst.level))
elseif inst.level >=1050 and inst.level <1200 then
inst.components.talker:Say("-[公主护甲] \n下一级:[1200]\n[成长点数]".. (inst.level))
elseif inst.level >=1200 and inst.level <1400 then
inst.components.talker:Say("-[公主护甲] \n下一级:[1500]\n[成长点数]".. (inst.level))
elseif inst.level >=1400 and inst.level <1600 then
inst.components.talker:Say("-[公主护甲] \n下一级:[1600]\n[成长点数]".. (inst.level))
elseif inst.level >=1600 and inst.level <1800 then
inst.components.talker:Say("-[公主护甲] \n下一级:[1800]\n[成长点数]".. (inst.level))
elseif inst.level >=1800 and inst.level <2000 then
inst.components.talker:Say("-[公主护甲] \n下一级:[2000]\n[成长点数]".. (inst.level))
elseif inst.level >=2000 and inst.level <2200 then
inst.components.talker:Say("-[公主护甲] \n下一级:[2200]\n[成长点数]".. (inst.level))
elseif inst.level >=2200 and inst.level <2400 then
inst.components.talker:Say("-[公主护甲] \n下一级:[2400]\n[成长点数]".. (inst.level))
elseif inst.level >=2400 and inst.level <2600 then
inst.components.talker:Say("-[公主护甲] \n下一级:[2600]\n[成长点数]".. (inst.level))
elseif inst.level >=2600 and inst.level <2800 then
inst.components.talker:Say("-[公主护甲] \n下一级:[2800]\n[成长点数]".. (inst.level))
elseif inst.level >=2800 and inst.level <3000 then
inst.components.talker:Say("-[公主护甲] \n下一级:[3000]\n[成长点数]".. (inst.level))
elseif inst.level >=3000 and inst.level <4000 then
inst.components.talker:Say("-[公主护甲] \n下一级:[4000]\n[成长点数]".. (inst.level))
elseif inst.level >=4000 and inst.level <4005 then
inst.components.talker:Say("-[公主护甲] \n[MAX]")
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
inst.components.talker:Say("-[损坏的冰霜甲]\n护甲 (0)\n耐久 (0)")
  
elseif not inst.broken then

 if inst.level >=0 and inst.level <10 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.34)
inst.components.talker:Say("-[公主护甲(LV1)]\n护甲 (34)\n冻结(20)\n再生")
  elseif inst.level >=10 and inst.level <30 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.36)
inst.components.talker:Say("-[公主护甲(LV2)]\n护甲 (36)\n冻结(20)\n再生")
 elseif inst.level >=30 and inst.level <50 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.38)
inst.components.talker:Say("-[公主护甲(LV3)]\n护甲 (38)\n冻结(20)\n再生")
 elseif inst.level >=50 and inst.level <70 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.40)
inst.components.talker:Say("-[公主护甲(LV4)]\n护甲 (40)\n冻结(20)\n再生")
  elseif inst.level >=70 and inst.level <90 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.42)
inst.components.talker:Say("-[公主护甲(LV5)]\n护甲 (42)\n冻结(20)\n再生")
 elseif inst.level >=90 and inst.level <120 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.44)
inst.components.talker:Say("-[公主护甲(LV6)]\n护甲 (44)\n冻结(20)\n再生")
 elseif inst.level >=120 and inst.level <150 then
  inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.46)
inst.components.talker:Say("-[公主护甲(LV7)]\n护甲 (46)\n冻结(20)\n再生")
elseif inst.level >=150 and inst.level <180 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.48)
inst.components.talker:Say("-[公主护甲(LV8)]\n护甲 (48)\n冻结(20)\n再生")
elseif inst.level >=180 and inst.level <210 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.50)
inst.components.talker:Say("-[公主护甲(LV9)]\n护甲 (50)\n冻结(20)\n再生")
elseif inst.level >=210 and inst.level <250 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.52)
inst.components.talker:Say("-[公主护甲(LV10)]\n护甲 (52)\n冻结(30)\n再生")
elseif inst.level >=250 and inst.level <350 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.54)
inst.components.talker:Say("-[公主护甲(LV11)]\n护甲 (54)\n冻结(30)\n再生")
elseif inst.level >=350 and inst.level <450 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.56)
inst.components.talker:Say("-[公主护甲(LV12)]\n护甲 (56)\n冻结(30)\n再生")
elseif inst.level >=450 and inst.level <550 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.58)
inst.components.talker:Say("-[公主护甲(LV13)]\n护甲 (58)\n冻结(30)\n再生")
elseif inst.level >=550 and inst.level <650 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.60)
inst.components.talker:Say("-[公主护甲(LV14)]\n护甲 (60)\n冻结(30)\n再生")
elseif inst.level >=650 and inst.level <750 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.62)

inst.components.talker:Say("-[公主护甲(LV15)]\n护甲 (62)\n冻结(30)\n再生")
elseif inst.level >=750 and inst.level <850 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.64)
 
inst.components.talker:Say("-[公主护甲(LV16)]\n护甲 (64)\n冻结(30)\n再生")
elseif inst.level >=850 and inst.level <950 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.66)
 
inst.components.talker:Say("-[公主护甲(LV17)]\n护甲 (66)\n冻结(30)\n再生")
elseif inst.level >=950 and inst.level <1050 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.68)

inst.components.talker:Say("-[公主护甲(LV18)]\n护甲 (68)\n冻结(30)\n再生")
elseif inst.level >=1050 and inst.level <1200 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.70)
 
inst.components.talker:Say("-[公主护甲(LV19)]\n护甲 (70)\n冻结(30)\n再生")
elseif inst.level >=1200 and inst.level <1400 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.72)
 
inst.components.talker:Say("-[公主护甲(LV20)]\n护甲 (72)\n冻结(40)\n再生")
elseif inst.level >=1400 and inst.level <1600 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.74)
 
inst.components.talker:Say("-[公主护甲(LV21)]\n护甲 (74)\n冻结(40)\n再生")
elseif inst.level >=1600 and inst.level <1800 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.76)
 
inst.components.talker:Say("-[公主护甲(LV22)]\n护甲 (76)\n冻结(40)\n再生")
elseif inst.level >=1800 and inst.level <2000 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.78)
 
inst.components.talker:Say("-[公主护甲(LV23)]\n护甲 (78)\n冻结(40)\n再生")
elseif inst.level >=2000 and inst.level <2200 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.80)
 
inst.components.talker:Say("-[公主护甲(LV24)]\n护甲 (80)\n冻结(40)\n再生")
elseif inst.level >=2200 and inst.level <2400 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.82)
 
inst.components.talker:Say("-[公主护甲(LV25)]\n护甲 (82)\n冻结(40)\n再生")
elseif inst.level >=2400 and inst.level <2600 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.84)

inst.components.talker:Say("-[公主护甲(LV26)]\n护甲 (84)\n冻结(40)\n再生")
elseif inst.level >=2600 and inst.level <2800 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.86)

inst.components.talker:Say("-[公主护甲(LV27)]\n护甲 (86)\n冻结(40)\n再生")
elseif inst.level >=2800 and inst.level <3000 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.88)

inst.components.talker:Say("-[公主护甲(LV28)]\n护甲 (88)\n冻结(40)\n再生")
elseif inst.level >=3000 and inst.level <4000 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.90)

inst.components.talker:Say("-[公主护甲(LV29)]\n护甲 (90)\n冻结(40)\n再生")
elseif inst.level >=4000 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.92)

inst.components.talker:Say("-[公主护甲(LV30)]\n护甲 (92)\n冻结(40)\n再生")
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
	inst.components.talker:Say("-[公主护甲] \n幸运点数! +(2)\n[成长点数]".. (inst.level))
    elseif  math.random() < expchance2 and inst.level <= 4005 then
	inst.level = inst.level + 5
	levelexp(inst)
	inst.components.talker:Say("-[公主护甲] \n幸运点数! +(5)\n[成长点数]".. (inst.level))
	elseif  math.random() < expchance3 and inst.level <= 4005 then
	inst.level = inst.level + 8
	levelexp(inst)
	inst.components.talker:Say("-[公主护甲] \n幸运点数! +(8)\n[成长点数]".. (inst.level))
	elseif  math.random() < expchance0 and inst.level <= 4005 then
	inst.level = inst.level + 1
	levelexp(inst)
    end
end
-------- --------

local function OnLoad(inst, data)
    UpgradeArmor(inst)
end

------

local function OnOpen(inst)
    inst.SoundEmitter:PlaySound("dontstarve/wilson/lighter_on")
	    if inst.components.container ~= nil then
        inst.components.container:Open(owner)
    end
end 

local function OnClose(inst) 
    inst.SoundEmitter:PlaySound("dontstarve/wilson/lighter_on")
	    if inst.components.container ~= nil then
        inst.components.container:Close(owner)
    end
end 
--

local function onequip(inst, owner) 
    UpgradeArmor(inst)
inst.components.fueled:StartConsuming()        
    owner.AnimState:OverrideSymbol("swap_body", "armor_mushab", "swap_body")

    inst.components.container:Open(owner)

    inst.task = inst:DoPeriodicTask(12, function() healowner(inst, owner) end)

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
	local freezechance1b = 0.4
	local freezechance2b = 0.6
	local freezechance3b = 0.8
	       if data and math.random() < freezechance1 and data.attacker and data.attacker.components.freezable and inst.level <250 then 
            data.attacker.components.freezable:AddColdness(0.2)
            data.attacker.components.freezable:SpawnShatterFX()
        elseif data and math.random() < freezechance2 and data.attacker and data.attacker.components.freezable and inst.level >=250 and inst.level <1400 then
            data.attacker.components.freezable:AddColdness(0.3)
            data.attacker.components.freezable:SpawnShatterFX()
        elseif data and math.random() < freezechance3 and data.attacker and data.attacker.components.freezable and inst.level >=1400 then
            data.attacker.components.freezable:AddColdness(0.4)
            data.attacker.components.freezable:SpawnShatterFX()
		            end end
    inst:ListenForEvent("attacked", inst.freezefn, owner)
    inst:ListenForEvent("attacked", inst.expfn, owner)
	

end

local function onunequip(inst, owner) 
inst.components.fueled:StopConsuming()        
      UpgradeArmor(inst)
    owner.AnimState:ClearOverrideSymbol("swap_body")
    owner.AnimState:ClearOverrideSymbol("backpack")
    if inst.task then inst.task:Cancel() inst.task = nil end

    inst.components.container:Close(owner)
	    if inst.components.container ~= nil then
        inst.components.container:Close(owner)
    end
    inst:RemoveEventCallback("attacked", inst.freezefn, owner)
    inst:RemoveEventCallback("attacked", inst.expfn, owner)
end

local function fn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
   MakeInventoryPhysics(inst)  

    inst.AnimState:SetBank("armor_wood")
    inst.AnimState:SetBuild("armor_mushab")
    inst.AnimState:PlayAnimation("anim")
    
    inst:AddTag("metal")
	    inst:AddTag("backpack")
	inst:AddTag("waterproofer")
			inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "armor_mushab.tex" )
	
    inst:AddComponent("talker")
    inst.components.talker.fontsize = 20
    inst.components.talker.font = TALKINGFONT
    inst.components.talker.colour = Vector3(1, 0.8, 0.95, 1)
    inst.components.talker.offset = Vector3(0,100,0)
    inst.components.talker.symbol = "swap_object"	
		
    inst.entity:SetPristine()
	
	    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
   inst.components.inventoryitem.foleysound = "dontstarve/movement/foley/jewlery"
	inst.components.inventoryitem.cangoincontainer = false
	inst.components.inventoryitem.atlasname = "images/inventoryimages/armor_mushab.xml"

----------------------
    inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(0)

    inst:AddComponent("container")
    inst.components.container:WidgetSetup("piggyback")
	
     inst:AddComponent("insulator")
    inst.components.insulator:SetInsulation(TUNING.INSULATION_MED)
    inst.components.insulator:SetSummer()

 -------------------------   
    inst:AddComponent("armor")
	inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.34)
    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY
    
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )

    inst.OnLoad = OnLoad


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

return Prefab( "common/inventory/armor_mushab", fn, assets) 
