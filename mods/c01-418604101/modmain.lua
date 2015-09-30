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
nm.GEAR_AXE = "齿轮斧"
rec.GEAR_AXE = "Make even better axe - gear axe!"

nm.GEAR_MACE = "齿轮锤"
rec.GEAR_MACE = "Heavy and lethal mace!"

nm.GEAR_HAT = "齿轮帽"
rec.GEAR_HAT = "Fabulous and elegant hat!"

nm.GEAR_MASK = "齿轮面具"
rec.GEAR_MASK = "Evil doctor mask, just for you!"

nm.GEAR_ARMOR = "齿轮炉"
rec.GEAR_ARMOR = "Heavy and mobile fireplace!"

nm.GEAR_HELMET = "齿轮头盔"
rec.GEAR_HELMET = "Massive welder's mask!"

nm.GEAR_WINGS = "齿轮翅膀"
rec.GEAR_WINGS = "Flightless, but makes you run faster!"

nm.SENTINEL = "齿轮蜘蛛"
rec.SENTINEL = "Make your own gear minions!"

nm.WS_03 = "齿轮蜘蛛王"
rec.WS_03 = "Powerful servant could be yours!"

nm.GEAR_TORCH = "灯杖"
rec.GEAR_TORCH = "Fancy mix of torch and lightbulb."

nm.BULBO = "Bulber"

nm.GEAR_TAB = "GEARS"

STRINGS.TABS.GEAR_TAB = "齿轮"
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
ch.WILLOW.DESCRIBE.GEAR_AXE = "它的锋利和寒冷."
ch.WILLOW.DESCRIBE.GEAR_MACE = "现在我需要找到一个靶子."
ch.WILLOW.DESCRIBE.GEAR_HAT = "我会爱上这帽子顶部的灯泡."
ch.WILLOW.DESCRIBE.GEAR_MASK = "它是幽灵,我喜欢它."
ch.WILLOW.DESCRIBE.GEAR_ARMOR = "我就是喜欢坐下来看看这炉."
ch.WILLOW.DESCRIBE.GEAR_HELMET = "它可以让我站在火中?!"
ch.WILLOW.DESCRIBE.GEAR_WINGS = "我可以烧掉它提高效率. 不,我不能."
ch.WILLOW.DESCRIBE.SENTINEL = "他将帮助我战斗."
ch.WILLOW.DESCRIBE.WS_03 = "我制造了一些有趣的东西!"
ch.WILLOW.DESCRIBE.BULBO = "Stop turning off this light! I want to hug you!"
ch.WILLOW.DESCRIBE.GEAR_TORCH = "高容量的光被容纳在这个小灯泡里."

--- Wolfgang - items strings
ch.WOLFGANG.DESCRIBE.GEAR_AXE = "漂亮的砍!"
ch.WOLFGANG.DESCRIBE.GEAR_MACE = "沃尔夫冈现在更强大了!"
ch.WOLFGANG.DESCRIBE.GEAR_HAT = "漂亮的帽子戴在强大的沃尔夫冈头上."
ch.WOLFGANG.DESCRIBE.GEAR_MASK = "这是可怕的。真的很可怕."
ch.WOLFGANG.DESCRIBE.GEAR_ARMOR = "携带这是个很好的锻炼!"
ch.WOLFGANG.DESCRIBE.GEAR_HELMET = "沃尔夫冈是不可阻挡的!"
ch.WOLFGANG.DESCRIBE.GEAR_WINGS = "它不会升起沃尔夫冈,我肯定!"
ch.WOLFGANG.DESCRIBE.SENTINEL = "你是那么脆弱!退后!"
ch.WOLFGANG.DESCRIBE.WS_03 = "强大的机器人！正如沃尔夫冈!"
ch.WOLFGANG.DESCRIBE.BULBO = "I could crush him with one finger!"
ch.WOLFGANG.DESCRIBE.GEAR_TORCH = "这将帮助我避免黑暗."

--- Wendy - items strings
ch.WENDY.DESCRIBE.GEAR_AXE = "谋杀的树从来没有花哨，现在."
ch.WENDY.DESCRIBE.GEAR_MACE = "我可以统治这个世界..至少一个小部分."
ch.WENDY.DESCRIBE.GEAR_HAT = "我看起来像一个温柔的女孩."
ch.WENDY.DESCRIBE.GEAR_MASK = "黑暗美丽的面具创造于一个死乌鸦."
ch.WENDY.DESCRIBE.GEAR_ARMOR = "它看起来如此不祥。我喜欢它!"
ch.WENDY.DESCRIBE.GEAR_HELMET = "我觉得像自己的头掉到了地上."
ch.WENDY.DESCRIBE.GEAR_WINGS = "我希望他们可以从骨头里制造."
ch.WENDY.DESCRIBE.SENTINEL = "我希望苍井空不要嫉妒."
ch.WENDY.DESCRIBE.WS_03 = "这死亡骑士."
ch.WENDY.DESCRIBE.BULBO = "This tiny spider got electrified."
ch.WENDY.DESCRIBE.GEAR_TORCH = "它正站在我和黑暗之间."

--- WX-78 - items strings
ch.WX78.DESCRIBE.GEAR_AXE = "活物没有机会."
ch.WX78.DESCRIBE.GEAR_MACE = "粉碎设备就绪."
ch.WX78.DESCRIBE.GEAR_HAT = "优雅的头罩."
ch.WX78.DESCRIBE.GEAR_MASK = "降低脑残值,提高生命值."
ch.WX78.DESCRIBE.GEAR_ARMOR = "重光源."
ch.WX78.DESCRIBE.GEAR_HELMET = "耐火性能高."
ch.WX78.DESCRIBE.GEAR_WINGS = "目标允许增加速度."
ch.WX78.DESCRIBE.SENTINEL = "守护者机器人准备."
ch.WX78.DESCRIBE.WS_03 = "机械驱逐舰准备行动."
ch.WX78.DESCRIBE.BULBO = "ELECTRICAL INSECT IS IN RANGE."
ch.WX78.DESCRIBE.GEAR_TORCH = "使用一个灯泡的新途径."

--- Wickerbottom - items strings
ch.WICKERBOTTOM.DESCRIBE.GEAR_AXE = "特殊类型的斧头, 制作于齿轮."
ch.WICKERBOTTOM.DESCRIBE.GEAR_MACE = "这个奇特的武器不是从土头土脑的工人做的."
ch.WICKERBOTTOM.DESCRIBE.GEAR_HAT = "至少我设法保持了风格."
ch.WICKERBOTTOM.DESCRIBE.GEAR_MASK = "我不相信那种治愈方式."
ch.WICKERBOTTOM.DESCRIBE.GEAR_ARMOR = "它提供热量，和大量的光."
ch.WICKERBOTTOM.DESCRIBE.GEAR_HELMET = "这种保护方式似乎很重."
ch.WICKERBOTTOM.DESCRIBE.GEAR_WINGS = "这个实用吗."
ch.WICKERBOTTOM.DESCRIBE.SENTINEL = "不是很复杂的设备，但这对我来说已经足够了."
ch.WICKERBOTTOM.DESCRIBE.WS_03 = "我创建了一个强大的机械设备保护."
ch.WICKERBOTTOM.DESCRIBE.BULBO = "An interesting way to use light bulbs."
ch.WICKERBOTTOM.DESCRIBE.GEAR_TORCH = "是不是有机的?"

--- Woodie - items strings
ch.WOODIE.DESCRIBE.GEAR_AXE = "这几乎和我的露西一样好."
ch.WOODIE.DESCRIBE.GEAR_MACE = "由珍贵木材制成..和一些垃圾."
ch.WOODIE.DESCRIBE.GEAR_HAT = "看起来很好，我必须说."
ch.WOODIE.DESCRIBE.GEAR_MASK = "我讨厌那面具。它看起来像一只讨厌的鸟."
ch.WOODIE.DESCRIBE.GEAR_ARMOR = "哈！现在我可以在晚上砍树."
ch.WOODIE.DESCRIBE.GEAR_HELMET = "这将防止我砍树时被撕成碎片."
ch.WOODIE.DESCRIBE.GEAR_WINGS = "我可能看上去很笨穿这个."
ch.WOODIE.DESCRIBE.SENTINEL = "他会保护我，所以我可以砍."
ch.WOODIE.DESCRIBE.WS_03 = "他可以砍我的树?!"
ch.WOODIE.DESCRIBE.BULBO = "It's scary to cut trees, if something like this is sitting on them!"
ch.WOODIE.DESCRIBE.GEAR_TORCH = "不太有嚼劲."

--- Waxwell - items strings
ch.WAXWELL.DESCRIBE.GEAR_AXE = "使用这种类型的斧头是不那么丢脸的."
ch.WAXWELL.DESCRIBE.GEAR_MACE = "我希望它能沉重打击."
ch.WAXWELL.DESCRIBE.GEAR_HAT = "我会比平时更迷人."
ch.WAXWELL.DESCRIBE.GEAR_MASK = "它适合我的卑微人格。只是开玩笑."
ch.WAXWELL.DESCRIBE.GEAR_ARMOR = "太糟糕了，我不能说服别人来帮我."
ch.WAXWELL.DESCRIBE.GEAR_HELMET = "有时你必须牺牲风格..一段时间."
ch.WAXWELL.DESCRIBE.GEAR_WINGS = "我不能相信我创造了这个."
ch.WAXWELL.DESCRIBE.SENTINEL = "我可以创造更壮观的东西."
ch.WAXWELL.DESCRIBE.WS_03 = "现在，这是一个严重的发明!"
ch.WAXWELL.DESCRIBE.BULBO = "I almost forgot about this pity creation."
ch.WAXWELL.DESCRIBE.GEAR_TORCH = "查利讨厌那光."

	if GLOBAL.IsDLCEnabled(GLOBAL.REIGN_OF_GIANTS) then 

--- Wigfrid - items strings
ch.WATHGRITHR.DESCRIBE.GEAR_AXE = "毁灭性的时髦斧头!"
ch.WATHGRITHR.DESCRIBE.GEAR_MACE = "它看起来很奇怪，但打得不错."
ch.WATHGRITHR.DESCRIBE.GEAR_HAT = "那应该让我满意?"
ch.WATHGRITHR.DESCRIBE.GEAR_MASK = "我要依靠力量，而不是在魔法上."
ch.WATHGRITHR.DESCRIBE.GEAR_ARMOR = "在探险中，这会给我温暖."
ch.WATHGRITHR.DESCRIBE.GEAR_HELMET = "这是很难攻击这种重型头盔的."
ch.WATHGRITHR.DESCRIBE.GEAR_WINGS = "我可以直接飞到瓦尔哈拉!"
ch.WATHGRITHR.DESCRIBE.SENTINEL = "他现在是我的奴隶!"
ch.WATHGRITHR.DESCRIBE.WS_03 = "强大的蜘蛛在我身边!"
ch.WATHGRITHR.DESCRIBE.BULBO = "You are no match for me!"
ch.WATHGRITHR.DESCRIBE.GEAR_TORCH = "它在发光!"

--- Webber - items strings
ch.WEBBER.DESCRIBE.GEAR_AXE = "我们可以砍树用这个风格."
ch.WEBBER.DESCRIBE.GEAR_MACE = "这对我们来说太复杂了."
ch.WEBBER.DESCRIBE.GEAR_HAT = "父亲会喜欢那顶帽子!"
ch.WEBBER.DESCRIBE.GEAR_MASK = "半蜘蛛，半乌鸦."
ch.WEBBER.DESCRIBE.GEAR_ARMOR = "我们可以在一起取热!"
ch.WEBBER.DESCRIBE.GEAR_HELMET = "我们被保护。我们很慢."
ch.WEBBER.DESCRIBE.GEAR_WINGS = "最好的方式创造翅膀-使用丝绸."
ch.WEBBER.DESCRIBE.SENTINEL = "他和我们一样!"
ch.WEBBER.DESCRIBE.WS_03 = "我们做了一个完美的朋友!"
ch.WEBBER.DESCRIBE.BULBO = "Just like spider, but with a bulb on the head!"
ch.WEBBER.DESCRIBE.GEAR_TORCH = "真正的朋友!"
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




