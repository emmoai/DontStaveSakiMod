local assets=
{
	Asset("ANIM", "anim/armor_mushaa.zip"),
  Asset("ATLAS", "images/inventoryimages/armor_mushaa.xml"),
  Asset("IMAGE", "images/inventoryimages/armor_mushaa.tex"),

}



local function levelexp(inst,data)

	local max_exp = 4100
	local exp = math.min(inst.level, max_exp)

if inst.level >= 4005 then
--inst.components.talker:Say("-[暮莎护甲]-\n[经验]".. (inst.level))
end
if inst.level >=0 and inst.level <10 then
inst.components.talker:Say("-[暮莎护甲] \n下一等级[10]\n[经验]".. (inst.level))
elseif inst.level >=10 and inst.level <30 then
inst.components.talker:Say("-[暮莎护甲] \n下一等级[30]\n[经验]".. (inst.level))
elseif inst.level >=30 and inst.level <50 then
inst.components.talker:Say("-[暮莎护甲] \n下一等级[50]\n[经验]".. (inst.level))
elseif inst.level >=50 and inst.level <70 then
inst.components.talker:Say("-[暮莎护甲] \n下一等级[70]\n[经验]".. (inst.level))
elseif inst.level >=70 and inst.level <90 then
inst.components.talker:Say("-[暮莎护甲] \n下一等级[90]\n[经验]".. (inst.level))
elseif inst.level >=90 and inst.level <120 then
inst.components.talker:Say("-[暮莎护甲] \n下一等级[120]\n[经验]".. (inst.level))
elseif inst.level >=120 and inst.level <150 then
inst.components.talker:Say("-[暮莎护甲] \n下一等级[150]\n[经验]".. (inst.level))
elseif inst.level >=150 and inst.level <180 then
inst.components.talker:Say("-[暮莎护甲] \n下一等级[180]\n[经验]".. (inst.level))
elseif inst.level >=180 and inst.level <210 then
inst.components.talker:Say("-[暮莎护甲] \n下一等级[210]\n[经验]".. (inst.level))
elseif inst.level >=210 and inst.level <250 then
inst.components.talker:Say("-[暮莎护甲] \n下一等级[250]\n[经验]".. (inst.level))
elseif inst.level >=250 and inst.level <350 then
inst.components.talker:Say("-[暮莎护甲] \n下一等级[350]\n[经验]".. (inst.level))
elseif inst.level >=350 and inst.level <450 then
inst.components.talker:Say("-[暮莎护甲] \n下一等级[450]\n[经验]".. (inst.level))
elseif inst.level >=450 and inst.level <550 then
inst.components.talker:Say("-[暮莎护甲] \n下一等级[550]\n[经验]".. (inst.level))
elseif inst.level >=550 and inst.level <650 then
inst.components.talker:Say("-[暮莎护甲] \n下一等级[650]\n[经验]".. (inst.level))
elseif inst.level >=650 and inst.level <750 then
inst.components.talker:Say("-[暮莎护甲] \n下一等级[750]\n[经验]".. (inst.level))
elseif inst.level >=750 and inst.level <850 then
inst.components.talker:Say("-[暮莎护甲] \n下一等级[850]\n[经验]".. (inst.level))
elseif inst.level >=850 and inst.level <950 then
inst.components.talker:Say("-[暮莎护甲] \n下一等级[950]\n[经验]".. (inst.level))
elseif inst.level >=950 and inst.level <1050 then
inst.components.talker:Say("-[暮莎护甲] \n下一等级[1050]\n[经验]".. (inst.level))
elseif inst.level >=1050 and inst.level <1200 then
inst.components.talker:Say("-[暮莎护甲] \n下一等级[1200]\n[经验]".. (inst.level))
elseif inst.level >=1200 and inst.level <1400 then
inst.components.talker:Say("-[暮莎护甲] \n下一等级[1500]\n[经验]".. (inst.level))
elseif inst.level >=1400 and inst.level <1600 then
inst.components.talker:Say("-[暮莎护甲] \n下一等级[1600]\n[经验]".. (inst.level))
elseif inst.level >=1600 and inst.level <1800 then
inst.components.talker:Say("-[暮莎护甲] \n下一等级[1800]\n[经验]".. (inst.level))
elseif inst.level >=1800 and inst.level <2000 then
inst.components.talker:Say("-[暮莎护甲] \n下一等级[2000]\n[经验]".. (inst.level))
elseif inst.level >=2000 and inst.level <2200 then
inst.components.talker:Say("-[暮莎护甲] \n下一等级[2200]\n[经验]".. (inst.level))
elseif inst.level >=2200 and inst.level <2400 then
inst.components.talker:Say("-[暮莎护甲] \n下一等级[2400]\n[经验]".. (inst.level))
elseif inst.level >=2400 and inst.level <2600 then
inst.components.talker:Say("-[暮莎护甲] \n下一等级[2600]\n[经验]".. (inst.level))
elseif inst.level >=2600 and inst.level <2800 then
inst.components.talker:Say("-[暮莎护甲] \n下一等级[2800]\n[经验]".. (inst.level))
elseif inst.level >=2800 and inst.level <3000 then
inst.components.talker:Say("-[暮莎护甲] \n下一等级[3000]\n[经验]".. (inst.level))
elseif inst.level >=3000 and inst.level <4000 then
inst.components.talker:Say("-[暮莎护甲] \n下一等级[4000]\n[经验]".. (inst.level))
elseif inst.level >=4000 and inst.level <4005 then
inst.components.talker:Say("-[暮莎护甲] \n[MAX]")
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
inst.components.talker:Say("-[Broken Musha-Armor]\n经验 (0)\nDurability (0)")
  
elseif not inst.broken then

 if inst.level >=0 and inst.level <10 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.5)
inst.components.talker:Say("-[暮莎护甲 (LV1)]\n经验 (50)")
  elseif inst.level >=10 and inst.level <30 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.51)
inst.components.talker:Say("-[暮莎护甲 (LV2)]\n经验 (51)")
 elseif inst.level >=30 and inst.level <50 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.52)
inst.components.talker:Say("-[暮莎护甲 (LV3)]\n经验 (52)")
 elseif inst.level >=50 and inst.level <70 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.53)
inst.components.talker:Say("-[暮莎护甲 (LV4)]\n经验 (53)")
  elseif inst.level >=70 and inst.level <90 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.54)
inst.components.talker:Say("-[暮莎护甲 (LV5)]\n经验 (54)")
 elseif inst.level >=90 and inst.level <120 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.55)
inst.components.talker:Say("-[暮莎护甲 (LV6)]\n经验 (55)")
 elseif inst.level >=120 and inst.level <150 then
  inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.56)
inst.components.talker:Say("-[暮莎护甲 (LV7)]\n经验 (56)")
elseif inst.level >=150 and inst.level <180 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.57)
inst.components.talker:Say("-[暮莎护甲 (LV8)]\n经验 (57)")
elseif inst.level >=180 and inst.level <210 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.58)
inst.components.talker:Say("-[暮莎护甲 (LV9)]\n经验 (58)")
elseif inst.level >=210 and inst.level <250 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.59)
inst.components.talker:Say("-[暮莎护甲 (LV10)]\n经验 (59)")
elseif inst.level >=250 and inst.level <350 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.60)
inst.components.talker:Say("-[暮莎护甲 (LV11)]\n经验 (60)")
elseif inst.level >=350 and inst.level <450 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.61)
inst.components.talker:Say("-[暮莎护甲 (LV12)]\n经验 (61)")
elseif inst.level >=450 and inst.level <550 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.62)
inst.components.talker:Say("-[暮莎护甲 (LV13)]\n经验 (62)")
elseif inst.level >=550 and inst.level <650 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.63)
inst.components.talker:Say("-[暮莎护甲 (LV14)]\n经验 (63)")
elseif inst.level >=650 and inst.level <750 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.64)
inst.components.talker:Say("-[暮莎护甲 (LV15)]\n经验 (64)")
elseif inst.level >=750 and inst.level <850 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.65)
inst.components.talker:Say("-[暮莎护甲 (LV16)]\n经验 (65)")
elseif inst.level >=850 and inst.level <950 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.66)
inst.components.talker:Say("-[暮莎护甲 (LV17)]\n经验 (66)")
elseif inst.level >=950 and inst.level <1050 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.67)
inst.components.talker:Say("-[暮莎护甲 (LV18)]\n经验 (67)")
elseif inst.level >=1050 and inst.level <1200 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.68)
inst.components.talker:Say("-[暮莎护甲 (LV19)]\n经验 (68)")
elseif inst.level >=1200 and inst.level <1400 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.69)
inst.components.talker:Say("-[暮莎护甲 (LV20)]\n经验 (69)")
elseif inst.level >=1400 and inst.level <1600 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.70)
inst.components.talker:Say("-[暮莎护甲 (LV21)]\n经验 (70)")
elseif inst.level >=1600 and inst.level <1800 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.71)
inst.components.talker:Say("-[暮莎护甲 (LV22)]\n经验 (71)")
elseif inst.level >=1800 and inst.level <2000 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.72)
inst.components.talker:Say("-[暮莎护甲 (LV23)]\n经验 (72)")
elseif inst.level >=2000 and inst.level <2200 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.73)
inst.components.talker:Say("-[暮莎护甲 (LV24)]\n经验 (73)")
elseif inst.level >=2200 and inst.level <2400 then
 inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.74)
inst.components.talker:Say("-[暮莎护甲 (LV25)]\n经验 (74)")
elseif inst.level >=2400 and inst.level <2600 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.75)
inst.components.talker:Say("-[暮莎护甲 (LV26)]\n经验 (75)")
elseif inst.level >=2600 and inst.level <2800 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.76)
inst.components.talker:Say("-[暮莎护甲 (LV27)]\n经验 (76)")
elseif inst.level >=2800 and inst.level <3000 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.77)
inst.components.talker:Say("-[暮莎护甲 (LV28)]\n经验 (77)")
elseif inst.level >=3000 and inst.level <4000 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.78)
inst.components.talker:Say("-[暮莎护甲 (LV29)]\n经验 (78)")
elseif inst.level >=4000 then
inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.80)
inst.components.talker:Say("-[暮莎护甲 (LV30)]\n经验 (80)")
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
	inst.components.talker:Say("-[暮莎护甲] \n幸运点! +(2)\n[经验]".. (inst.level))
    elseif  math.random() < expchance2 and inst.level <= 4005 then
	inst.level = inst.level + 5
	levelexp(inst)
	inst.components.talker:Say("-[暮莎护甲] \n幸运点! +(5)\n[经验]".. (inst.level))
	elseif  math.random() < expchance3 and inst.level <= 4005 then
	inst.level = inst.level + 8
	levelexp(inst)
	inst.components.talker:Say("-[暮莎护甲] \n幸运点! +(8)\n[经验]".. (inst.level))
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

local function OnOpen(inst,data)

         inst.components.container:Open(owner)
 end

local function OnClose(inst,data)

         inst.components.container:Close(owner)
    end


local function onequip(inst, owner) 
    UpgradeArmor(inst)
	inst.components.container:Open(owner)
	inst.components.fueled:StartConsuming() 
   owner.AnimState:OverrideSymbol("swap_body", "armor_mushaa", "swap_body")
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
inst.components.fueled:StopConsuming()        
      UpgradeArmor(inst)
    owner.AnimState:ClearOverrideSymbol("swap_body")
    owner.AnimState:ClearOverrideSymbol("backpack")
    --owner.components.inventory:SetOverflow(nil)
    inst.components.container:Close(owner)
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
    inst.AnimState:SetBuild("armor_mushaa")
    inst.AnimState:PlayAnimation("anim")
	
		inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "armor_mushaa.tex" )
   inst:AddComponent("talker")
    inst.components.talker.fontsize = 20
    inst.components.talker.font = TALKINGFONT
    inst.components.talker.colour = Vector3(0.9, 1, 0.75, 1)
    inst.components.talker.offset = Vector3(0,100,0)
    inst.components.talker.symbol = "swap_object"
	    inst:AddTag("metal")
	    inst:AddTag("backpack")
    inst.entity:SetPristine()
  
	    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
    	inst.boost = true
      inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.foleysound = "dontstarve/movement/foley/backpack"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/armor_mushaa.xml"
	
	   
    --inst.components.inventoryitem.cangoincontainer = false
 
    inst:AddComponent("armor")
	inst.components.armor:InitCondition(9999999999999999999999999999999999999999999999999999999999999, 0.5)

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )

   
    inst:AddComponent("container")
     inst.components.container:WidgetSetup("icepack")

  --[[inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose]]

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

return Prefab( "common/inventory/armor_mushaa", fn, assets) 
