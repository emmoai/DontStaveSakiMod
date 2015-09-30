local assets=
{
	Asset("ANIM", "anim/frosthammer.zip"),
	Asset("ANIM", "anim/swap_frosthammer.zip"),
	Asset("ATLAS", "images/inventoryimages/frosthammer.xml"),
	Asset("IMAGE", "images/inventoryimages/frosthammer.tex"),
}

local prefabs =
{}

local function levelexp(inst,data)

	local max_exp = 4100
	local exp = math.min(inst.level, max_exp)

if inst.level > 4005 then
--inst.components.talker:Say("-[Frost Hammer]-\n[�ɳ�����]".. (inst.level))
end
if inst.level >=0 and inst.level <10 then
inst.components.talker:Say("-[��˪֮��] \n��һ��[10]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=10 and inst.level <30 then
inst.components.talker:Say("-[��˪֮��] \n��һ��[30]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=30 and inst.level <50 then
inst.components.talker:Say("-[��˪֮��] \n��һ��[50]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=50 and inst.level <70 then
inst.components.talker:Say("-[��˪֮��] \n��һ��[70]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=70 and inst.level <90 then
inst.components.talker:Say("-[��˪֮��] \n��һ��[90]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=90 and inst.level <120 then
inst.components.talker:Say("-[��˪֮��] \n��һ��[120]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=120 and inst.level <150 then
inst.components.talker:Say("-[��˪֮��] \n��һ��[150]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=150 and inst.level <180 then
inst.components.talker:Say("-[��˪֮��] \n��һ��[180]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=180 and inst.level <210 then
inst.components.talker:Say("-[��˪֮��] \n��һ��[210]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=210 and inst.level <250 then
inst.components.talker:Say("-[��˪֮��] \n��һ��[250]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=250 and inst.level <350 then
inst.components.talker:Say("-[��˪֮��] \n��һ��[350]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=350 and inst.level <450 then
inst.components.talker:Say("-[��˪֮��] \n��һ��[450]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=450 and inst.level <550 then
inst.components.talker:Say("-[��˪֮��] \n��һ��[550]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=550 and inst.level <650 then
inst.components.talker:Say("-[��˪֮��] \n��һ��[650]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=650 and inst.level <750 then
inst.components.talker:Say("-[��˪֮��] \n��һ��[750]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=750 and inst.level <850 then
inst.components.talker:Say("-[��˪֮��] \n��һ��[850]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=850 and inst.level <950 then
inst.components.talker:Say("-[��˪֮��] \n��һ��[950]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=950 and inst.level <1050 then
inst.components.talker:Say("-[��˪֮��] \n��һ��[1050]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=1050 and inst.level <1200 then
inst.components.talker:Say("-[��˪֮��] \n��һ��[1200]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=1200 and inst.level <1400 then
inst.components.talker:Say("-[��˪֮��] \n��һ��[1500]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=1400 and inst.level <1600 then
inst.components.talker:Say("-[��˪֮��] \n��һ��[1600]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=1600 and inst.level <1800 then
inst.components.talker:Say("-[��˪֮��] \n��һ��[1800]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=1800 and inst.level <2000 then
inst.components.talker:Say("-[��˪֮��] \n��һ��[2000]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=2000 and inst.level <2200 then
inst.components.talker:Say("-[��˪֮��] \n��һ��[2200]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=2200 and inst.level <2400 then
inst.components.talker:Say("-[��˪֮��] \n��һ��[2400]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=2400 and inst.level <2600 then
inst.components.talker:Say("-[��˪֮��] \n��һ��[2600]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=2600 and inst.level <2800 then
inst.components.talker:Say("-[��˪֮��] \n��һ��[2800]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=2800 and inst.level <3000 then
inst.components.talker:Say("-[��˪֮��] \n��һ��[3000]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=3000 and inst.level <4000 then
inst.components.talker:Say("-[��˪֮��] \n��һ��[4000]\n[�ɳ�����]".. (inst.level))
elseif inst.level >=4000 and inst.level <4005 then
inst.components.talker:Say("-[��˪֮��] \n[MAX]")
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
	inst.components.talker:Say("-Broken Frost Hammer \n�˺�(1)")
  
elseif not inst.broken then

 if inst.level >=0 and inst.level <10 then
    inst.components.weapon:SetDamage(40)
	inst.components.talker:Say("-��˪֮��(LV1)\n�˺�(40)\n����(20)")
 elseif inst.level >=10 and inst.level <30 then
    inst.components.weapon:SetDamage(41)
	inst.components.talker:Say("-��˪֮��(LV2)\n�˺�(41)\n����(20)")
 elseif inst.level >=30 and inst.level <50 then
    inst.components.weapon:SetDamage(42)
	inst.components.talker:Say("-��˪֮��(LV3)\n�˺�(42)\n����(20)")
 elseif inst.level >=50 and inst.level <70 then
    inst.components.weapon:SetDamage(43)
	inst.components.talker:Say("-��˪֮��(LV4)]\n�˺�(43)\n����(20)")
  elseif inst.level >=70 and inst.level <90 then
    inst.components.weapon:SetDamage(44)
	inst.components.talker:Say("-��˪֮��(LV5)\n�˺�(44)\n����(20)")
 elseif inst.level >=90 and inst.level <120 then
    inst.components.weapon:SetDamage(45)
	inst.components.talker:Say("-��˪֮��(LV6)\n�˺�(45)\n����(20)")
 elseif inst.level >=120 and inst.level <150 then
    inst.components.weapon:SetDamage(46)
	inst.components.talker:Say("-��˪֮��(LV7)\n�˺�(46)\n����(20)")
elseif inst.level >=150 and inst.level <180 then
    inst.components.weapon:SetDamage(47)
	inst.components.talker:Say("-��˪֮��(LV8)\n�˺�(47)\n����(20)")
elseif inst.level >=180 and inst.level <210 then
    inst.components.weapon:SetDamage(48)
	inst.components.talker:Say("-��˪֮��(LV9)\n�˺�(48)\n����(20)")
elseif inst.level >=210 and inst.level <250 then
    inst.components.weapon:SetDamage(49)
	inst.components.talker:Say("-��˪֮��(LV10)\n�˺�(49)\n����(40)")
elseif inst.level >=250 and inst.level <350 then
    inst.components.weapon:SetDamage(50)
	inst.components.talker:Say("-��˪֮��(LV11)\n�˺�(50)\n����(40)")
elseif inst.level >=350 and inst.level <450 then
    inst.components.weapon:SetDamage(51)
	inst.components.talker:Say("-��˪֮��(LV12)\n�˺�(51)\n����(40)")
elseif inst.level >=450 and inst.level <550 then
    inst.components.weapon:SetDamage(52)
	inst.components.talker:Say("-��˪֮��(LV13)\n�˺�(52)\n����(40)")
elseif inst.level >=550 and inst.level <650 then
    inst.components.weapon:SetDamage(53)
	inst.components.talker:Say("-��˪֮��(LV14)\n�˺�(53)\n����(40)")
elseif inst.level >=650 and inst.level <750 then
    inst.components.weapon:SetDamage(54)
	inst.components.talker:Say("-��˪֮��(LV15)\n�˺�(54)\n����(40)")
elseif inst.level >=750 and inst.level <850 then
    inst.components.weapon:SetDamage(55)
	inst.components.talker:Say("-��˪֮��(LV16)\n�˺�(55)\n����(40)")
elseif inst.level >=850 and inst.level <950 then
    inst.components.weapon:SetDamage(56)
	inst.components.talker:Say("-��˪֮��(LV17)\n�˺�(56)\n����(40)")
elseif inst.level >=950 and inst.level <1050 then
    inst.components.weapon:SetDamage(57)
	inst.components.talker:Say("-��˪֮��(LV18)\n�˺�(57)\n����(40)")
elseif inst.level >=1050 and inst.level <1200 then
    inst.components.weapon:SetDamage(58)
	inst.components.talker:Say("-��˪֮��(LV19)\n�˺�(58)\n����(40)")
elseif inst.level >=1200 and inst.level <1400 then
    inst.components.weapon:SetDamage(59)
	inst.components.talker:Say("-��˪֮��(LV20)\n�˺�(59)\n����(60)")
elseif inst.level >=1400 and inst.level <1600 then
    inst.components.weapon:SetDamage(60)
	inst.components.talker:Say("-��˪֮��(LV21)\n�˺�(60)\n����(60)")
elseif inst.level >=1600 and inst.level <1800 then
    inst.components.weapon:SetDamage(61)
	inst.components.talker:Say("-��˪֮��(LV22)\n�˺�(61)\n����(60)")
elseif inst.level >=1800 and inst.level <2000 then
    inst.components.weapon:SetDamage(62)
	inst.components.talker:Say("-��˪֮��(LV23)\n�˺�(62)\n����(60)")
elseif inst.level >=2000 and inst.level <2200 then
    inst.components.weapon:SetDamage(63)
	inst.components.talker:Say("-��˪֮��(LV24)\n�˺�(63)\n����(60)")
elseif inst.level >=2200 and inst.level <2400 then
    inst.components.weapon:SetDamage(64)
	inst.components.talker:Say("-��˪֮��(LV25)\n�˺�(64)\n����(60)")
elseif inst.level >=2400 and inst.level <2600 then
    inst.components.weapon:SetDamage(65)
	inst.components.talker:Say("-��˪֮��(LV26)\n�˺�(65)\n����(60)")
elseif inst.level >=2600 and inst.level <2800 then
    inst.components.weapon:SetDamage(66)
	inst.components.talker:Say("-��˪֮��(LV27)\n�˺�(66)\n����(60)")
elseif inst.level >=2800 and inst.level <3000 then
    inst.components.weapon:SetDamage(67)
	inst.components.talker:Say("-��˪֮��(LV28)\n�˺�(67)\n����(60)")
elseif inst.level >=3000 and inst.level <4000 then
    inst.components.weapon:SetDamage(68)
	inst.components.talker:Say("-��˪֮��(LV29)\n�˺�(68)\n����(60)")
elseif inst.level >=4000 then
    inst.components.weapon:SetDamage(70)
	inst.components.talker:Say("-��˪֮��(Max30)\n�˺�(70)\n����(60)")
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
	inst.components.talker:Say("-[��˪֮��] \n���˵���! +(2)\n[�ɳ�����]".. (inst.level))
    elseif  math.random() < expchance2 and inst.level <= 4005 then
	inst.level = inst.level + 5
	levelexp(inst)
	inst.components.talker:Say("-[��˪֮��] \n���˵���! +(5)\n[�ɳ�����]".. (inst.level))
	elseif  math.random() < expchance3 and inst.level <= 4005 then
	inst.level = inst.level + 8
	levelexp(inst)
	inst.components.talker:Say("-[��˪֮��] \n���˵���! +(8)\n[�ɳ�����]".. (inst.level))
	elseif  math.random() < expchance0 and inst.level <= 4005 then
	inst.level = inst.level + 1
	levelexp(inst)
    end
end
-------- --------
local function OnLoad(inst, data)
    Upgradedamage(inst)
end

local function onattack_FROST(inst, attacker, target)
local player = inst.components.inventoryitem.owner
local freezechance1 = 0.3
local freezechance2 = 0.45
local freezechance3 = 0.6
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
	inst.components.talker:Say("-�𻵵ĺ�˪֮��\n�˺�(1)")
    end

	if  math.random() < freezechance1 and target.components.freezable and inst.boost and inst.level <250 then
        target.components.freezable:AddColdness(0.25)
        target.components.freezable:SpawnShatterFX()
	elseif math.random() < freezechance2 and target.components.freezable and inst.boost and inst.level >=250 and inst.level <1400 then
        target.components.freezable:AddColdness(0.45)
        target.components.freezable:SpawnShatterFX()
	elseif math.random() < freezechance3 and target.components.freezable and inst.boost and inst.level >=1400 then
        target.components.freezable:AddColdness(0.65)
        target.components.freezable:SpawnShatterFX()	
	
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
--------

local function summoning(staff, target, pos)
--local player = inst.components.inventoryitem.owner
    local caster = staff.components.inventoryitem.owner
if caster.components.sanity.current >= 40 then
     local light1 = SpawnPrefab("splash")
    local monster = SpawnPrefab("tentacle_frost")
 
     light1.Transform:SetPosition(pos.x, pos.y, pos.z)
    monster.Transform:SetPosition(pos.x, pos.y, pos.z)
  
caster.components.sanity:DoDelta(-25)
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


local function Release_Frost(inst, data)
	inst.boost = false
	inst.components.talker:Say("-[��˪]\n�ٶȽ���(50)\n�ٻ�����\n��˪һ��")
	inst.components.equippable.walkspeedmult = 0.5
     inst:AddComponent("heater")
     inst.components.heater.iscooler = true
     inst.components.heater.equippedheat = -1
	     inst:AddComponent("reticule")
    inst.components.reticule.targetfn = yellow_reticuletargetfn
    inst.components.reticule.ease = true

    inst:AddComponent("spellcaster")
    inst.components.spellcaster:SetSpellFn(summoning)
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
	 
local function Preserved_Frost(inst, data)
	inst.boost = true
	inst.components.talker:Say("-[��˪�ػ�]\n�ٶȽ���(20)\n��˪һ��")
    inst.components.equippable.walkspeedmult = 0.8
       inst:RemoveComponent("spellcaster")
      inst:RemoveComponent("heater")
	  end 
	  
	
local function OnOpen(inst)
  inst.SoundEmitter:PlaySound("dontstarve/common/gem_shatter")
	Release_Frost(inst)
	inst.boost = false
end 

local function OnClose(inst) 
  inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")
	Preserved_Frost(inst)
	inst.boost = true
    end
 
local function OnDropped(inst,data)
    end
local function OnPutInInventory(inst)
    Upgradedamage(inst)
    end 
	
local function onequip(inst, owner) 
 
    Upgradedamage(inst)

    owner.AnimState:OverrideSymbol("swap_object", "swap_frosthammer", "swap_umbrella")
    owner.AnimState:Show("ARM_carry") 
    owner.AnimState:Hide("ARM_normal") 
    --[[if inst.components.container ~= nil then
        inst.components.container:Open(owner)
    end]]
end

local function onunequip(inst, owner) 
    Upgradedamage(inst)
    inst:RemoveComponent("spellcaster")
    if inst.task then inst.task:Cancel() inst.task = nil end
    if inst.sanity then inst.sanity:Cancel() inst.sanity = nil end
    owner.AnimState:Hide("ARM_carry") 
    owner.AnimState:Show("ARM_normal") 
    if inst.components.container ~= nil then
        inst.components.container:Close(owner)
    end
end
 
--[[
local slotpos_2 = {}

for y = 0, 1 do
table.insert(slotpos_2, Vector3(-126, -y*75 + 114 ,-126 +75, -y*75 + 114 ))

	--table.insert(slotpos_2, Vector3(-162, -y*75 + 114 ,0))
	--table.insert(slotpos_2, Vector3( -162 +75, -y*75 + 114 ,0))

end]]
--[[
local function itemtest(inst, item, slot)
	if not item:HasTag("tstonehammer") then
			return true
end
end]]

local function fn()
local inst = CreateEntity()
	
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

	MakeInventoryPhysics(inst)  
    inst.AnimState:SetBank("umbrella")
    inst.AnimState:SetBuild("frosthammer")
    inst.AnimState:PlayAnimation("idle")
	
    inst.entity:AddMiniMapEntity()
	inst.MiniMapEntity:SetIcon( "frosthammer.tex" )
	
   inst:AddComponent("talker")
    inst.components.talker.fontsize = 20
    inst.components.talker.font = TALKINGFONT
    inst.components.talker.colour = Vector3(0.7, 0.85, 1, 1)
    inst.components.talker.offset = Vector3(200,-250,0)
    inst.components.talker.symbol = "swap_object"

    inst:AddComponent("tool")
    inst.components.tool:SetAction(ACTIONS.HAMMER)
    inst.OnLoad = OnLoad
	    inst:AddComponent("waterproofer")
    inst.components.waterproofer.effectiveness = 0

     inst:AddComponent("weapon")
    inst.components.weapon:SetOnAttack(Upgradedamage)
	inst.components.weapon:SetOnAttack(onattack_FROST)
    inst.components.weapon:SetRange(1.65)
	
   if not TheWorld.ismastersim then
		inst:DoTaskInTime(0, function()	inst.replica.container:WidgetSetup("frostsmall") end)
		return inst
	end
inst.entity:SetPristine()
	-------
    
    inst:AddComponent("inspectable")
        inst:AddComponent("inventoryitem")
  --  inst.components.inventoryitem:SetOnDroppedFn(OnDropped)
    inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)
    	inst.components.inventoryitem.atlasname = "images/inventoryimages/frosthammer.xml"
 
   ---------------------  
	inst:AddTag("fridge")
         inst:AddTag("backpack")
	       inst:AddTag("waterproofer")
     ----------------------
     inst:AddComponent("container")
     inst.components.container:WidgetSetup("frostsmall")
     inst.components.container.onopenfn = OnOpen
     inst.components.container.onclosefn = OnClose

    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )

------------------------

        inst:AddComponent("fueled")
       inst.components.fueled.fueltype = "CHEMICAL"
       inst.components.fueled:InitializeFuelLevel(30000000)
		
       inst.components.fueled:SetDepletedFn(OnDurability)
        inst.components.fueled.ontakefuelfn = TakeItem
        inst.components.fueled.accepting = true
inst.components.fueled:StopConsuming()        
inst.boost = true 

	inst.level = 0
inst:ListenForEvent("levelup", levelexp)
	inst.OnSave = onsave
	inst.OnPreLoad = onpreload
	inst.components.equippable.walkspeedmult = 0.8
    inst.components.equippable.runspeedmult = 0.8
	
    MakeHauntableLaunch(inst)
 
    return inst
end


return Prefab( "common/inventory/frosthammer", fn, assets, prefabs) 
