_G = GLOBAL
local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local STRINGS = GLOBAL.STRINGS
local TECH = GLOBAL.TECH

local require = GLOBAL.require
require "behaviours/doaction"

--- List of all prefabs
PrefabFiles = {"gear_axe","gear_mace","sparks2","gear_hat","gear_mask","gear_armor","gear_helmet","gear_wings","sentinel","ws_03","bulbo","gear_torch",}

--- List of all assets
Assets = {
    Asset("ATLAS", "images/inventoryimages/gear_axe.xml"),
    Asset("IMAGE", "images/inventoryimages/gear_axe.tex"),
	
    Asset("ATLAS", "images/inventoryimages/gear_mace.xml"),
    Asset("IMAGE", "images/inventoryimages/gear_mace.tex"),	
	
    Asset("ATLAS", "images/inventoryimages/gear_hat.xml"),
    Asset("IMAGE", "images/inventoryimages/gear_hat.tex"),	
	
    Asset("ATLAS", "images/inventoryimages/gear_mask.xml"),
    Asset("IMAGE", "images/inventoryimages/gear_mask.tex"),	
	
    Asset("ATLAS", "images/inventoryimages/gear_armor.xml"),
    Asset("IMAGE", "images/inventoryimages/gear_armor.tex"),	

    Asset("ATLAS", "images/inventoryimages/gear_helmet.xml"),
    Asset("IMAGE", "images/inventoryimages/gear_helmet.tex"),	

    Asset("ATLAS", "images/inventoryimages/gear_wings.xml"),
    Asset("IMAGE", "images/inventoryimages/gear_wings.tex"),	

    Asset("ATLAS", "images/inventoryimages/sentinel.xml"),	
	Asset("IMAGE", "images/inventoryimages/sentinel.tex"),
	
	Asset("ATLAS", "images/inventoryimages/gear_torch.xml"),	
	Asset("IMAGE", "images/inventoryimages/gear_torch.tex"),	
	
	Asset("ATLAS", "images/inventoryimages/ws_03.xml"),	
	Asset("IMAGE", "images/inventoryimages/ws_03.tex"),
	
	Asset("ATLAS", "images/inventoryimages/gear_tab.xml"),
	
    Asset( "ATLAS", "images/inventoryimages/gears.xml" ),	
}

local nm,rec,gen, ch = _G.STRINGS.NAMES, _G.STRINGS.RECIPE_DESC, _G.STRINGS.CHARACTERS.GENERIC.DESCRIBE, _G.STRINGS.CHARACTERS

--- Strings for items
nm.GEAR_AXE = "���ָ�"
rec.GEAR_AXE = "Make even better axe - gear axe!"

nm.GEAR_MACE = "���ִ�"
rec.GEAR_MACE = "Heavy and lethal mace!"

nm.GEAR_HAT = "����ñ"
rec.GEAR_HAT = "Fabulous and elegant hat!"

nm.GEAR_MASK = "�������"
rec.GEAR_MASK = "Evil doctor mask, just for you!"

nm.GEAR_ARMOR = "����¯"
rec.GEAR_ARMOR = "Heavy and mobile fireplace!"

nm.GEAR_HELMET = "����ͷ��"
rec.GEAR_HELMET = "Massive welder's mask!"

nm.GEAR_WINGS = "���ֳ��"
rec.GEAR_WINGS = "Flightless, but makes you run faster!"

nm.SENTINEL = "����֩��"
rec.SENTINEL = "Make your own gear minions!"

nm.WS_03 = "����֩����"
rec.WS_03 = "Powerful servant could be yours!"

nm.GEAR_TORCH = "����"
rec.GEAR_TORCH = "Fancy mix of torch and lightbulb."

nm.BULBO = "Bulber"

nm.GEAR_TAB = "GEARS"

STRINGS.TABS.GEAR_TAB = "����"
GLOBAL.RECIPETABS['GEAR_TAB'] = {str = "GEAR_TAB", sort=1, icon = "gear_tab.tex", icon_atlas = "images/inventoryimages/gear_tab.xml"}


gen.GEAR_AXE = "Time for chopping!"
gen.GEAR_MACE = "That should be very useful!"
gen.GEAR_HAT = "I love this hat!"
gen.GEAR_MASK = "It's very, very creepy."
gen.GEAR_ARMOR = "It's quite heavy, but I will be heated!"
gen.GEAR_HELMET = "There is a name on it.. Kovac."
gen.GEAR_WINGS = "Now I only need wind."
gen.SENTINEL = "He was produced via machine."
gen.WS_03 = "I'm lucky that he is on my side."
gen.BULBO = "I never thought that these creatures are hiding here."
gen.GEAR_TORCH = "I used lightbulb in a right way."

--- Willow - items strings
ch.WILLOW.DESCRIBE.GEAR_AXE = "���ķ����ͺ���."
ch.WILLOW.DESCRIBE.GEAR_MACE = "��������Ҫ�ҵ�һ������."
ch.WILLOW.DESCRIBE.GEAR_HAT = "�һᰮ����ñ�Ӷ����ĵ���."
ch.WILLOW.DESCRIBE.GEAR_MASK = "��������,��ϲ����."
ch.WILLOW.DESCRIBE.GEAR_ARMOR = "�Ҿ���ϲ��������������¯."
ch.WILLOW.DESCRIBE.GEAR_HELMET = "����������վ�ڻ���?!"
ch.WILLOW.DESCRIBE.GEAR_WINGS = "�ҿ����յ������Ч��. ��,�Ҳ���."
ch.WILLOW.DESCRIBE.SENTINEL = "����������ս��."
ch.WILLOW.DESCRIBE.WS_03 = "��������һЩ��Ȥ�Ķ���!"
ch.WILLOW.DESCRIBE.BULBO = "Stop turning off this light! I want to hug you!"
ch.WILLOW.DESCRIBE.GEAR_TORCH = "�������Ĺⱻ���������С������."

--- Wolfgang - items strings
ch.WOLFGANG.DESCRIBE.GEAR_AXE = "Ư���Ŀ�!"
ch.WOLFGANG.DESCRIBE.GEAR_MACE = "�ֶ�������ڸ�ǿ����!"
ch.WOLFGANG.DESCRIBE.GEAR_HAT = "Ư����ñ�Ӵ���ǿ����ֶ����ͷ��."
ch.WOLFGANG.DESCRIBE.GEAR_MASK = "���ǿ��µġ���ĺܿ���."
ch.WOLFGANG.DESCRIBE.GEAR_ARMOR = "Я�����Ǹ��ܺõĶ���!"
ch.WOLFGANG.DESCRIBE.GEAR_HELMET = "�ֶ�����ǲ����赲��!"
ch.WOLFGANG.DESCRIBE.GEAR_WINGS = "�����������ֶ����,�ҿ϶�!"
ch.WOLFGANG.DESCRIBE.SENTINEL = "������ô����!�˺�!"
ch.WOLFGANG.DESCRIBE.WS_03 = "ǿ��Ļ����ˣ������ֶ����!"
ch.WOLFGANG.DESCRIBE.BULBO = "I could crush him with one finger!"
ch.WOLFGANG.DESCRIBE.GEAR_TORCH = "�⽫�����ұ���ڰ�."

--- Wendy - items strings
ch.WENDY.DESCRIBE.GEAR_AXE = "ıɱ��������û�л��ڣ�����."
ch.WENDY.DESCRIBE.GEAR_MACE = "�ҿ���ͳ���������..����һ��С����."
ch.WENDY.DESCRIBE.GEAR_HAT = "�ҿ�������һ�������Ů��."
ch.WENDY.DESCRIBE.GEAR_MASK = "�ڰ���������ߴ�����һ������ѻ."
ch.WENDY.DESCRIBE.GEAR_ARMOR = "����������˲��顣��ϲ����!"
ch.WENDY.DESCRIBE.GEAR_HELMET = "�Ҿ������Լ���ͷ�����˵���."
ch.WENDY.DESCRIBE.GEAR_WINGS = "��ϣ�����ǿ��Դӹ�ͷ������."
ch.WENDY.DESCRIBE.SENTINEL = "��ϣ���Ծ��ղ�Ҫ����."
ch.WENDY.DESCRIBE.WS_03 = "��������ʿ."
ch.WENDY.DESCRIBE.BULBO = "This tiny spider got electrified."
ch.WENDY.DESCRIBE.GEAR_TORCH = "����վ���Һͺڰ�֮��."

--- WX-78 - items strings
ch.WX78.DESCRIBE.GEAR_AXE = "����û�л���."
ch.WX78.DESCRIBE.GEAR_MACE = "�����豸����."
ch.WX78.DESCRIBE.GEAR_HAT = "���ŵ�ͷ��."
ch.WX78.DESCRIBE.GEAR_MASK = "�����Բ�ֵ,�������ֵ."
ch.WX78.DESCRIBE.GEAR_ARMOR = "�ع�Դ."
ch.WX78.DESCRIBE.GEAR_HELMET = "�ͻ����ܸ�."
ch.WX78.DESCRIBE.GEAR_WINGS = "Ŀ�����������ٶ�."
ch.WX78.DESCRIBE.SENTINEL = "�ػ��߻�����׼��."
ch.WX78.DESCRIBE.WS_03 = "��е����׼���ж�."
ch.WX78.DESCRIBE.BULBO = "ELECTRICAL INSECT IS IN RANGE."
ch.WX78.DESCRIBE.GEAR_TORCH = "ʹ��һ�����ݵ���;��."

--- Wickerbottom - items strings
ch.WICKERBOTTOM.DESCRIBE.GEAR_AXE = "�������͵ĸ�ͷ, �����ڳ���."
ch.WICKERBOTTOM.DESCRIBE.GEAR_MACE = "������ص��������Ǵ���ͷ���ԵĹ�������."
ch.WICKERBOTTOM.DESCRIBE.GEAR_HAT = "�������跨�����˷��."
ch.WICKERBOTTOM.DESCRIBE.GEAR_MASK = "�Ҳ���������������ʽ."
ch.WICKERBOTTOM.DESCRIBE.GEAR_ARMOR = "���ṩ�������ʹ����Ĺ�."
ch.WICKERBOTTOM.DESCRIBE.GEAR_HELMET = "���ֱ�����ʽ�ƺ�����."
ch.WICKERBOTTOM.DESCRIBE.GEAR_WINGS = "���ʵ����."
ch.WICKERBOTTOM.DESCRIBE.SENTINEL = "���Ǻܸ��ӵ��豸�����������˵�Ѿ��㹻��."
ch.WICKERBOTTOM.DESCRIBE.WS_03 = "�Ҵ�����һ��ǿ��Ļ�е�豸����."
ch.WICKERBOTTOM.DESCRIBE.BULBO = "An interesting way to use light bulbs."
ch.WICKERBOTTOM.DESCRIBE.GEAR_TORCH = "�ǲ����л���?"

--- Woodie - items strings
ch.WOODIE.DESCRIBE.GEAR_AXE = "�⼸�����ҵ�¶��һ����."
ch.WOODIE.DESCRIBE.GEAR_MACE = "�����ľ���Ƴ�..��һЩ����."
ch.WOODIE.DESCRIBE.GEAR_HAT = "�������ܺã��ұ���˵."
ch.WOODIE.DESCRIBE.GEAR_MASK = "����������ߡ�����������һֻ�������."
ch.WOODIE.DESCRIBE.GEAR_ARMOR = "���������ҿ��������Ͽ���."
ch.WOODIE.DESCRIBE.GEAR_HELMET = "�⽫��ֹ�ҿ���ʱ��˺����Ƭ."
ch.WOODIE.DESCRIBE.GEAR_WINGS = "�ҿ��ܿ���ȥ�ܱ������."
ch.WOODIE.DESCRIBE.SENTINEL = "���ᱣ���ң������ҿ��Կ�."
ch.WOODIE.DESCRIBE.WS_03 = "�����Կ��ҵ���?!"
ch.WOODIE.DESCRIBE.BULBO = "It's scary to cut trees, if something like this is sitting on them!"
ch.WOODIE.DESCRIBE.GEAR_TORCH = "��̫�н���."

--- Waxwell - items strings
ch.WAXWELL.DESCRIBE.GEAR_AXE = "ʹ���������͵ĸ�ͷ�ǲ���ô������."
ch.WAXWELL.DESCRIBE.GEAR_MACE = "��ϣ�����ܳ��ش��."
ch.WAXWELL.DESCRIBE.GEAR_HAT = "�һ��ƽʱ������."
ch.WAXWELL.DESCRIBE.GEAR_MASK = "���ʺ��ҵı�΢�˸�ֻ�ǿ���Ц."
ch.WAXWELL.DESCRIBE.GEAR_ARMOR = "̫����ˣ��Ҳ���˵������������."
ch.WAXWELL.DESCRIBE.GEAR_HELMET = "��ʱ������������..һ��ʱ��."
ch.WAXWELL.DESCRIBE.GEAR_WINGS = "�Ҳ��������Ҵ��������."
ch.WAXWELL.DESCRIBE.SENTINEL = "�ҿ��Դ����׳�۵Ķ���."
ch.WAXWELL.DESCRIBE.WS_03 = "���ڣ�����һ�����صķ���!"
ch.WAXWELL.DESCRIBE.BULBO = "I almost forgot about this pity creation."
ch.WAXWELL.DESCRIBE.GEAR_TORCH = "���������ǹ�."

	if GLOBAL.IsDLCEnabled(GLOBAL.REIGN_OF_GIANTS) then 

--- Wigfrid - items strings
ch.WATHGRITHR.DESCRIBE.GEAR_AXE = "�����Ե�ʱ�ָ�ͷ!"
ch.WATHGRITHR.DESCRIBE.GEAR_MACE = "������������֣�����ò���."
ch.WATHGRITHR.DESCRIBE.GEAR_HAT = "��Ӧ����������?"
ch.WATHGRITHR.DESCRIBE.GEAR_MASK = "��Ҫ������������������ħ����."
ch.WATHGRITHR.DESCRIBE.GEAR_ARMOR = "��̽���У���������ů."
ch.WATHGRITHR.DESCRIBE.GEAR_HELMET = "���Ǻ��ѹ�����������ͷ����."
ch.WATHGRITHR.DESCRIBE.GEAR_WINGS = "�ҿ���ֱ�ӷɵ��߶�����!"
ch.WATHGRITHR.DESCRIBE.SENTINEL = "���������ҵ�ū��!"
ch.WATHGRITHR.DESCRIBE.WS_03 = "ǿ���֩���������!"
ch.WATHGRITHR.DESCRIBE.BULBO = "You are no match for me!"
ch.WATHGRITHR.DESCRIBE.GEAR_TORCH = "���ڷ���!"

--- Webber - items strings
ch.WEBBER.DESCRIBE.GEAR_AXE = "���ǿ��Կ�����������."
ch.WEBBER.DESCRIBE.GEAR_MACE = "���������˵̫������."
ch.WEBBER.DESCRIBE.GEAR_HAT = "���׻�ϲ���Ƕ�ñ��!"
ch.WEBBER.DESCRIBE.GEAR_MASK = "��֩�룬����ѻ."
ch.WEBBER.DESCRIBE.GEAR_ARMOR = "���ǿ�����һ��ȡ��!"
ch.WEBBER.DESCRIBE.GEAR_HELMET = "���Ǳ����������Ǻ���."
ch.WEBBER.DESCRIBE.GEAR_WINGS = "��õķ�ʽ������-ʹ��˿��."
ch.WEBBER.DESCRIBE.SENTINEL = "��������һ��!"
ch.WEBBER.DESCRIBE.WS_03 = "��������һ������������!"
ch.WEBBER.DESCRIBE.BULBO = "Just like spider, but with a bulb on the head!"
ch.WEBBER.DESCRIBE.GEAR_TORCH = "����������!"
	end

--- All recipes

local gear_axerecipe = Recipe( "gear_axe", { Ingredient("axe", 1),Ingredient("gears", 1) }, RECIPETABS.GEAR_TAB, TECH.SCIENCE_ONE)
gear_axerecipe.atlas = "images/inventoryimages/gear_axe.xml"

local gear_torchrecipe = Recipe( "gear_torch", { Ingredient("lightbulb", 1),Ingredient("trinket_6", 1),Ingredient("twigs", 4) }, RECIPETABS.GEAR_TAB, TECH.SCIENCE_ONE)
gear_torchrecipe.atlas = "images/inventoryimages/gear_torch.xml"

local gear_macerecipe = Recipe( "gear_mace", { Ingredient("gears", 3),Ingredient("boards", 2) }, RECIPETABS.GEAR_TAB, TECH.SCIENCE_TWO)
gear_macerecipe.atlas = "images/inventoryimages/gear_mace.xml"

local gear_hatrecipe = Recipe( "gear_hat", { Ingredient("tophat", 1),Ingredient("gears", 2),Ingredient("goldnugget", 2) }, RECIPETABS.GEAR_TAB, TECH.SCIENCE_TWO)
gear_hatrecipe.atlas = "images/inventoryimages/gear_hat.xml"

local gear_maskrecipe = Recipe( "gear_mask", { Ingredient("feather_crow", 3),Ingredient("gears", 1),Ingredient("silk", 6) }, RECIPETABS.GEAR_TAB, TECH.MAGIC_TWO)
gear_maskrecipe.atlas = "images/inventoryimages/gear_mask.xml"

local gear_armorrecipe = Recipe( "gear_armor", { Ingredient("trinket_11", 1),Ingredient("gears", 3),Ingredient("charcoal", 5) }, RECIPETABS.GEAR_TAB, TECH.SCIENCE_TWO)
gear_armorrecipe.atlas = "images/inventoryimages/gear_armor.xml"

local gear_helmetrecipe = Recipe( "gear_helmet", { Ingredient("beehat", 1),Ingredient("gears", 1),Ingredient("marble", 3) }, RECIPETABS.GEAR_TAB, TECH.SCIENCE_TWO)
gear_helmetrecipe.atlas = "images/inventoryimages/gear_helmet.xml"

local gear_wingsrecipe = Recipe( "gear_wings", { Ingredient("trinket_5", 1),Ingredient("gears", 3),Ingredient("silk", 8) }, RECIPETABS.GEAR_TAB, TECH.MAGIC_TWO)
gear_wingsrecipe.atlas = "images/inventoryimages/gear_wings.xml"

local sentinelerecipe = Recipe( "sentinel", { Ingredient("gears", 1),Ingredient("boards", 2),Ingredient("flint", 4) }, RECIPETABS.GEAR_TAB, TECH.SCIENCE_TWO)
sentinelerecipe.atlas = "images/inventoryimages/sentinel.xml"

local ws_03recipe = Recipe( "ws_03", { Ingredient("spiderhat",1), Ingredient("gears", 6),Ingredient("boards", 6) }, RECIPETABS.GEAR_TAB, TECH.SCIENCE_TWO)
ws_03recipe.atlas = "images/inventoryimages/ws_03.xml"


--- All minimap atlases

function AddMap(inst)
        local minimap = inst.entity:AddMiniMapEntity()
        minimap:SetIcon( inst.prefab .. ".tex" )
end

AddPrefabPostInit("gears", AddMap)

AddMinimapAtlas("images/inventoryimages/gears.xml")
AddMinimapAtlas("images/inventoryimages/gear_axe.xml")
AddMinimapAtlas("images/inventoryimages/gear_mace.xml")
AddMinimapAtlas("images/inventoryimages/gear_hat.xml")
AddMinimapAtlas("images/inventoryimages/gear_mask.xml")
AddMinimapAtlas("images/inventoryimages/gear_armor.xml")
AddMinimapAtlas("images/inventoryimages/gear_helmet.xml")
AddMinimapAtlas("images/inventoryimages/gear_wings.xml")
AddMinimapAtlas("images/inventoryimages/sentinel.xml")
AddMinimapAtlas("images/inventoryimages/ws_03.xml")
AddMinimapAtlas("images/inventoryimages/gear_torch.xml")


--[[
local function Sentinel( inst )
	inst:DoTaskInTime( 0, function() 
		local controls = inst.HUD.controls
		local Sentinel_Health = require "widgets/sentinel_health"
		controls.petStatus = controls:AddChild(Sentinel_Health(inst))
		controls.petStatus:SetPosition(0, -250, 0)
	end)
end
--AddSimPostInit( Sentinel )
function AddPlayersPostInit(fn)
	for i,v in ipairs(_G.DST_CHARACTERLIST) do -- DST_CHARACTERLIST + ROG_CHARACTERLIST
		AddPrefabPostInit(v,fn)
	end
	for i,v in ipairs(_G.MODCHARACTERLIST) do
		AddPrefabPostInit(v,fn)
	end
end
AddPlayersPostInit( Sentinel )
--]]



------------------------------------------------- SERVER ONLY PART --------------------------------
if _G.TheNet and _G.TheNet:GetIsServer() then


--modimport "steam_loot.lua"
local function AddBulboLoot(prefab,chance)
	if not chance then chance = 0.02 end
	AddPrefabPostInit(prefab,function(inst)
		while chance>0 do
			inst.components.lootdropper:AddChanceLoot('bulbo',chance>1 and 1 or chance)
			if chance>1 then chance=chance-1 else chance=0 end
		end
	end)
end

AddBulboLoot("rook", 4.5)
AddBulboLoot("bishop", 2.75)
AddBulboLoot("knight", 1.25)
AddBulboLoot("pighouse", 0.3)
AddBulboLoot("rabbithouse", 0.2)
AddBulboLoot("mermhouse", 0.06)
AddBulboLoot("evergreen")
AddBulboLoot("evergreen_sparse")
AddBulboLoot("rock1")
AddBulboLoot("rock2")
AddBulboLoot("rock_flintless")
AddBulboLoot("rock_flintless_med")
AddBulboLoot("rock_flintless_low")
AddBulboLoot("rock_moon")

--No stalagmite in DST :(

--AddBulboLoot("stalagmite")
--AddBulboLoot("stalagmite_low")
--AddBulboLoot("stalagmite_med")
--AddBulboLoot("stalagmite_full")
--AddBulboLoot("stalagmite_tall", 0.04)
--AddBulboLoot("stalagmite_tall_full", 0.04)
--AddBulboLoot("stalagmite_tall_med")
--AddBulboLoot("stalagmite_tall_low")


--- Trade for WS's
function addtradablecomponenttoprefab(inst)
	if not inst.components.tradable then
		inst:AddComponent("tradable")
	end
end	 

AddPrefabPostInit("gears", addtradablecomponenttoprefab)


local lootdropper_comp = require "components/lootdropper"
local old_GenerateLoot = lootdropper_comp.GenerateLoot
local AllRecipes = _G.AllRecipes
function lootdropper_comp:GenerateLoot(...)
	if self.inst.components.norecipelootdrop then
		local save_recipe = AllRecipes[self.inst.prefab]
		AllRecipes[self.inst.prefab] = false
		local temp_res = old_GenerateLoot(self,...)
		AllRecipes[self.inst.prefab] = save_recipe
		return temp_res
	end
	return old_GenerateLoot(self,...)
end


function HF_addtradablecomponenttoprefab(inst)
	if not inst.components.tradable then
		inst:AddComponent("tradable")
	end
end	 

AddPrefabPostInit("gear_axe", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("gear_mace", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("gear_torch", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("gear_helmet", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("gear_mask", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("gear_hat", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("gear_armor", HF_addtradablecomponenttoprefab)
AddPrefabPostInit("gear_wings", HF_addtradablecomponenttoprefab)

--Items that can restore health for robots (as food).
local gear_items = {
	gears = 150,
	lighter = 60,
	trinket_5 = 175,
	trinket_6 = 125,
	trinket_11 = 175,
	transistor = 75,
}

----------- Test player

local function IsGoodLeader(player,sentinel)
	return player and player:IsValid() and player.userid
		and player.components.health and player.components.health.currenthealth>player.components.health.minhealth
		and (not player:HasTag('playerghost'))
		and ((not sentinel.mems_enemy[player.userid]) or sentinel.mems_enemy[player.userid]+20 < _G.GetTime())
		and sentinel:GetDistanceSqToInst(player) < 65*65
end

-------------- Targeting

local share_target_leader --static variable for saving leader (little hack)
local function test_share_target(dude) --Share target only for player's followers.
	return dude:HasTag("gear_sentinel")
		and dude.components.follower
		and dude.components.follower.leader == share_target_leader
end

local function OnAttacked(inst, data)
    local attacker = data.attacker

	if attacker then
		if attacker:HasTag("player") and attacker.userid then
			inst.mems_enemy[attacker.userid] = _G.GetTime()
		end
		inst.components.combat:SetTarget(attacker)
		share_target_leader = inst.components.follower.leader
		inst.components.combat:ShareTarget(attacker, 30, test_share_target, 15)
	end
end

local function OnNewTarget(inst, data)
	share_target_leader = inst.components.follower.leader
    inst.components.combat:ShareTarget(data.target, 30, test_share_target, 15)
end

local function OnKeepTarget(inst, target)
    return inst.components.combat:CanTarget(target) 
end

------------ Feeding

local function OnGetItemFromPlayer(inst, giver, item)
	if (gear_items[item.prefab]) then 
        inst.components.health:DoDelta(gear_items[item.prefab]) 
        inst.SoundEmitter:PlaySound("dontstarve/creatures/bishop/charge") 
        inst.components.follower:SetLeader(giver)
	    inst.components.talker:Say("HEALTH RESTORED!")
    end
end

local function ShouldAcceptItem(inst, item, giver)
	if (gear_items[item.prefab]) then   
		return true
    end
end

local function OnRefuseItem(inst, giver, item)
    local playerprefab = giver
    if playerprefab then
		inst.components.talker:Say("ERROR!")
        inst.SoundEmitter:PlaySound("dontstarve/creatures/bishop/hurt") 		
    end
end


----------Lightning ---------
local function OnLightning(inst)
	if inst.components.health and inst.components.health.currenthealth < inst.components.health.maxhealth then
		local sparks = _G.SpawnPrefab("sparks")
		sparks.Transform:SetPosition(inst.Transform:GetWorldPosition() )  
		local small_puff = _G.SpawnPrefab("small_puff")
		small_puff.Transform:SetPosition(inst.Transform:GetWorldPosition() )	
		inst.components.health:DoDelta(200)
	end
end

---fix a non-RoG bug with inventory for Sentinels
if not TUNING.LIGHTNING_GOAT_DAMAGE then --non-RoG
	local lt_comp = require "components/playerlightningtarget"
	local old_CanBeHit = lt_comp.CanBeHit
	function lt_comp:CanBeHit(...)
		if not self.inst.components.inventory then
			return true
		end
		return old_CanBeHit(self,...)
	end
end

---------- Main pet init function ---------
function MakeGearPet(prefab)
	AddPrefabPostInit(prefab,function(inst)
		--common init
		--inst.gear_items = gear_items

		inst.components.combat:SetKeepTargetFunction(OnKeepTarget)	

		inst.components.trader.onaccept = OnGetItemFromPlayer	
		inst.components.trader:SetAcceptTest(ShouldAcceptItem)	
		inst.components.trader.onrefuse = OnRefuseItem			

		inst:ListenForEvent("attacked", OnAttacked)
		inst:ListenForEvent("newcombattarget", OnNewTarget)
		
		
		--remember targets
		inst.mems = {} --database
		inst.mems_enemy = {} --database of enemy players.
		inst.OnSave = function(inst, data) --support of save and load of the game
			data.mems = inst.mems
		end
		inst.OnLoad = function(inst, data)
			if data then
				inst.mems = data.mems or {}
			end
		end
		--Add moisture
		if TUNING.LIGHTNING_GOAT_DAMAGE then --RoG
			inst:AddComponent("moisture")
		end
		
		--Regen from lightning strike
		inst:AddComponent("playerlightningtarget")
		if inst.components.playerlightningtarget.onstrikefn then --RoG
			inst.components.playerlightningtarget.onstrikefn = OnLightning
			inst.components.playerlightningtarget.hitchance = 0.5
		else
			inst:ListenForEvent("lightningstrike", OnLightning)
		end


		--Will find new master every 3 sec
		inst:DoPeriodicTask(3+math.random()*0.2,function(inst)
			local f = inst.components.follower
			if not IsGoodLeader(f.leader,inst) then
				--Try to find new leader
				local master, dist = inst:GetNearestPlayer(true)
				if dist and dist<25*25 and IsGoodLeader(master,inst) then
					if f.leader and f.leader:IsValid() then
						inst.components.talker:Say("FIRMWARE UPDATED!")
					else
						inst.components.talker:Say(math.random() < 0.5 and "ACCESS GRANTED!" or "NEW ADMINISTRATOR!")
					end
					f:SetLeader(master)
					if inst.components.combat.target == master then
						--Cancel target
						inst.components.combat:SetTarget(nil)
					end
				elseif f.leader then --if has bad leader
					--Must forget current dead leader.
					f:SetLeader(nil)
					inst.components.talker:Say(math.random() < 0.5 and "RESET FIRMWARE!" or "HARD RESET!")
					inst.inlove = 0 --Support of Tell Me mod
				end
			elseif f.leader and f.leader.userid and inst.mems[f.leader.userid] then --and math.random() < 0.3 then
				--Try to find old good masters (only if leader exists)
				local love, master = inst.mems[f.leader.userid]
				for i,v in ipairs(_G.AllPlayers) do
					if v~=f.leader and IsGoodLeader(v,inst) and inst.mems[v.userid] and inst.mems[v.userid]>love then
						love = inst.mems[v.userid]
						master = v
					end
				end
				if master then --found better master!
					--BETRAY
					local old_master = f.leader
					f:SetLeader(master)
					inst.components.talker:Say(math.random() < 0.5 and "SYSTEM PANIC!" or "WRONG PASSWORD!")
					inst.inlove = love
					--should change target if in PvP
					if inst.components.combat.target == master then
						--Reverse target
						inst.components.combat:SetTarget(old_master)
					end
				end
			end
			
			--little regen
			if _G.TheWorld.state.israining or not ((not inst.components.moisture) or inst.components.moisture:GetMoisture() == 0) then
				inst.components.health:DoDelta(-0.125) -- -20 per day
			elseif inst.components.health:GetPercent() < 0.999 then
				inst.components.health:DoDelta(1) -- +160 per day. x8 faster.
			end
			
			--remember current master
			if f.leader and f.leader.userid then
				if not inst.mems[f.leader.userid] then
					inst.mems[f.leader.userid]=0
				end
				inst.inlove = inst.mems[f.leader.userid] + 3
				inst.mems[f.leader.userid] = inst.inlove
				
			end

		end) --End of DoPeriodicTask
	end) --End of AddPrefabPostInit
end --End of MakeGearPet

MakeGearPet("sentinel")
MakeGearPet("ws_03")


----------------------------------------- END OF SERVER PART -----------------------------------------
end




