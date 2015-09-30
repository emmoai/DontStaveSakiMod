PrefabFiles = {
    "bow",
	"quiver",
	"sparkles",
	"zupalexsingredients",
}

Assets = {
    Asset( "ANIM", "anim/bow_attack.zip" ),
	Asset("SOUNDPACKAGE", "sound/bow_shoot.fev"),
    Asset("SOUND", "sound/bow_shoot_bank00.fsb"),
	
	Asset("ATLAS", "images/tabimages/archery_tab.xml"),
    Asset("IMAGE", "images/tabimages/archery_tab.tex"),
	
	Asset("ATLAS", "images/tabimages/quiver_slot.xml"),
    Asset("IMAGE", "images/tabimages/quiver_slot.tex"),
}

local require = GLOBAL.require

local STRINGS = GLOBAL.STRINGS
local RECIPETABS = GLOBAL.RECIPETABS
local Recipe = GLOBAL.Recipe
local GIngredient = GLOBAL.Ingredient
local TECH = GLOBAL.TECH

local FRAMES = GLOBAL.FRAMES
local ACTIONS = GLOBAL.ACTIONS
local State = GLOBAL.State
local EventHandler = GLOBAL.EventHandler
local ActionHandler = GLOBAL.ActionHandler
local TimeEvent = GLOBAL.TimeEvent
local EQUIPSLOTS = GLOBAL.EQUIPSLOTS

local BOWREQTWIGS = GetModConfigData("BowTwigs_req")
local BOWREQSILK = GetModConfigData("BowSilk_req")
local BOWTECHLEVEL = GetModConfigData("BowTechLevel")

local CROSSBOWREQBOARDS = GetModConfigData("CrossbowBoards_req")
local CROSSBOWREQSILK = GetModConfigData("CrossbowSilk_req")
local CROSSBOWREQHAMMER = GetModConfigData("CrossbowHammer_req")
local CROSSBOWTECHLEVEL = GetModConfigData("CrossbowTechLevel")

local MAGICBOWREQLIVINGLOG = GetModConfigData("MagicBowLivingLog_req")
local MAGICBOWREQGEM = GetModConfigData("MagicBowPurpleGem_req")
local MAGICBOWREQGLOMMER = GetModConfigData("MagicBowGlommerFlower_req")
local MAGICBOWTECHLEVEL = GetModConfigData("MagicBowTechLevel")

local QUIVERREQPIGSKIN = GetModConfigData("QuiverPigskin_req")
local QUIVERREQROPE = GetModConfigData("QuiverRope_req")
local QUIVERTECHLEVEL = GetModConfigData("QuiverTechLevel")

local ARROWHEADTYPE = GetModConfigData("ArrowHeadType")
local ARROWREQHEAD = GetModConfigData("ArrowHead_req")
local ARROWREQLOG = GetModConfigData("ArrowLog_req")
local ARROWREQFEATHER = GetModConfigData("ArrowFeather_req")
local ARROWCRAFTNUM = GetModConfigData("ArrowCraftAmount")
local ARROWTECHLEVEL = GetModConfigData("ArrowTechLevel")

local GOLDARROWREQHEAD = GetModConfigData("GoldArrowHead_req")
local GOLDARROWREQLOG = GetModConfigData("GoldArrowLog_req")
local GOLDARROWREQFEATHER = GetModConfigData("GoldArrowFeather_req")
local GOLDARROWCRAFTNUM = GetModConfigData("GoldArrowCraftAmount")
local GOLDARROWTECHLEVEL = GetModConfigData("GoldArrowTechLevel")

local MOONSTONEARROWREQHEAD = GetModConfigData("MoonstoneArrowHead_req")
local MOONSTONEARROWREQLOG = GetModConfigData("MoonstoneArrowLog_req")
local MOONSTONEARROWREQFEATHER = GetModConfigData("MoonstoneArrowFeather_req")
local MOONSTONEARROWCRAFTNUM = GetModConfigData("MoonstoneArrowCraftAmount")
local MOONSTONEARROWTECHLEVEL = GetModConfigData("MoonstoneArrowTechLevel")

local FIREARROWHEADTYPE = GetModConfigData("FireArrowHeadType")
local FIREARROWREQHEAD = GetModConfigData("FireArrowHead_req")
local FIREARROWREQGRASS = GetModConfigData("FireArrowGrass_req")
local FIREARROWREQLOG = GetModConfigData("FireArrowLog_req")
local FIREARROWREQFEATHER = GetModConfigData("FireArrowFeather_req")
local FIREARROWCRAFTNUM = GetModConfigData("FireArrowCraftAmount")
local FIREARROWTECHLEVEL = GetModConfigData("FireArrowTechLevel")

local ICEARROWHEADTYPE = GetModConfigData("IceArrowHeadType")
local ICEARROWREQHEAD = GetModConfigData("IceArrowHead_req")
local ICEARROWREQLOG = GetModConfigData("IceArrowLog_req")
local ICEARROWREQFEATHER = GetModConfigData("IceArrowFeather_req")
local ICEARROWCRAFTNUM = GetModConfigData("IceArrowCraftAmount")
local ICEARROWTECHLEVEL = GetModConfigData("IceArrowTechLevel")

local BOLTHEADTYPE = GetModConfigData("BoltHeadType")
local BOLTREQHEAD = GetModConfigData("BoltHead_req")
local BOLTREQLOG = GetModConfigData("BoltLog_req")
local BOLTREQFEATHER = GetModConfigData("BoltFeather_req")
local BOLTCRAFTNUM = GetModConfigData("BoltCraftAmount")
local BOLTTECHLEVEL = GetModConfigData("BoltTechLevel")

local EXPLOSIVEBOLTHEADTYPE = GetModConfigData("ExplosiveBoltHeadType")
local EXPLOSIVEBOLTREQHEAD = GetModConfigData("ExplosiveBoltHead_req")
local EXPLOSIVEBOLTREQLOG = GetModConfigData("ExplosiveBoltLog_req")
local EXPLOSIVEBOLTREQFEATHER = GetModConfigData("ExplosiveBoltFeather_req")
local EXPLOSIVEBOLTREQMOSQUITO = GetModConfigData("ExplosiveBoltMosquitoSack_req")
local EXPLOSIVEBOLTCRAFTNUM = GetModConfigData("ExplosiveBoltCraftAmount")
local EXPLOSIVEBOLTTECHLEVEL = GetModConfigData("ExplosiveBoltTechLevel")

GLOBAL.TUNING.BOWUSES = GetModConfigData("BowUses")
GLOBAL.TUNING.BOWDMG = GetModConfigData("BowDmg")
GLOBAL.TUNING.BOWRANGE = GetModConfigData("BowRange")

GLOBAL.TUNING.COLLISIONSAREON = GetModConfigData("ActivateCollisions")

GLOBAL.TUNING.CROSSBOWDMGMOD = GetModConfigData("CrossbowDmgMod")
GLOBAL.TUNING.CROSSBOWRANGEMOD = GetModConfigData("CrossbowRangeMod")
GLOBAL.TUNING.CROSSBOWACCMOD = GetModConfigData("CrossbowAccMod")

GLOBAL.TUNING.MAGICBOWDMGMOD = GetModConfigData("MagicBowDmgMod")

GLOBAL.TUNING.GOLDARROWDMGMOD = GetModConfigData("GoldArrowDmgMod")
GLOBAL.TUNING.MOONSTONEARROWDMGMOD = GetModConfigData("MoonstoneArrowDmgMod")

GLOBAL.TUNING.FIREARROWDMGMOD = GetModConfigData("FireArrowDmgMod")
GLOBAL.TUNING.ICEARROWDMGMOD = GetModConfigData("IceArrowDmgMod")

GLOBAL.TUNING.EXPLOSIVEBOLTRAD = GetModConfigData("ExplosiveBoltRadius")
GLOBAL.TUNING.EXPLOSIVEBOLTDMG = GetModConfigData("ExplosiveBoltExpDmg")

GLOBAL.TUNING.HITREC = GetModConfigData("ArrowHitRecovery")
GLOBAL.TUNING.MISSREC = GetModConfigData("ArrowMissRecovery")

GLOBAL.TUNING.BOWMISSCHANCESMALL = GetModConfigData("BowMissChanceSmall")
GLOBAL.TUNING.BOWMISSCHANCEBIG = GetModConfigData("BowMissChanceBig")

GLOBAL.TUNING.CRITCHANCEPVE = GetModConfigData("CritPvE")
GLOBAL.TUNING.CRITDMGMODPVE = GetModConfigData("CritDmgModPvE")
GLOBAL.TUNING.CRITCHANCEPVP = GetModConfigData("CritPvP")
GLOBAL.TUNING.CRITDMGMODPVP = GetModConfigData("CritDmgModPvP")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local function ReturnTechLevel(modcfg)
	if modcfg == "NONE" then
		return TECH.NONE
	elseif modcfg == "SCIENCE_ONE" then
		return TECH.SCIENCE_ONE
	elseif modcfg == "SCIENCE_TWO" then
		return TECH.SCIENCE_TWO		
	elseif modcfg == "MAGIC_TWO" then
		return TECH.MAGIC_TWO			
	elseif modcfg == "MAGIC_THREE" then
		return TECH.MAGIC_THREE			
	end
end

local archerytab = AddRecipeTab("Archery", 6, "images/tabimages/archery_tab.xml", "archery_tab.tex", nil)

local QUIVERrecipeIngredients = {}

QUIVERrecipeIngredients[#QUIVERrecipeIngredients + 1]= GIngredient("pigskin", QUIVERREQPIGSKIN);
QUIVERrecipeIngredients[#QUIVERrecipeIngredients + 1] = GIngredient("rope", QUIVERREQROPE);

AddRecipe("quiver", QUIVERrecipeIngredients , archerytab, ReturnTechLevel(QUIVERTECHLEVEL), nil, nil, nil, 1, nil, "images/inventoryimages/quiver.xml", "quiver.tex")

local BOWrecipeIngredients = {}

BOWrecipeIngredients[#BOWrecipeIngredients + 1]= GIngredient("twigs", BOWREQTWIGS);
BOWrecipeIngredients[#BOWrecipeIngredients + 1] = GIngredient("silk", BOWREQSILK);

AddRecipe("bow", BOWrecipeIngredients , archerytab, ReturnTechLevel(BOWTECHLEVEL), nil, nil, nil, 1, nil, "images/inventoryimages/bow.xml", "bow.tex")

local ARROWrecipeIngredients = {}

ARROWrecipeIngredients[#ARROWrecipeIngredients + 1]= GIngredient(ARROWHEADTYPE, ARROWREQHEAD);
ARROWrecipeIngredients[#ARROWrecipeIngredients + 1] = GIngredient("log", ARROWREQLOG);
if ARROWREQFEATHER > 0 then
	ARROWrecipeIngredients[#ARROWrecipeIngredients + 1] = GIngredient("feather_crow", ARROWREQFEATHER);
end

AddRecipe("arrow", ARROWrecipeIngredients , archerytab, ReturnTechLevel(ARROWTECHLEVEL), nil, nil, nil, ARROWCRAFTNUM, nil, "images/inventoryimages/arrow.xml", "arrow.tex")

local GOLDARROWrecipeIngredients = {}

GOLDARROWrecipeIngredients[#GOLDARROWrecipeIngredients + 1]= GIngredient("goldnugget", GOLDARROWREQHEAD);
GOLDARROWrecipeIngredients[#GOLDARROWrecipeIngredients + 1] = GIngredient("log", GOLDARROWREQLOG);
if GOLDARROWREQFEATHER > 0 then
	GOLDARROWrecipeIngredients[#GOLDARROWrecipeIngredients + 1] = GIngredient("feather_crow", GOLDARROWREQFEATHER);
end

AddRecipe("goldarrow", GOLDARROWrecipeIngredients , archerytab, ReturnTechLevel(GOLDARROWTECHLEVEL), nil, nil, nil, GOLDARROWCRAFTNUM, nil, "images/inventoryimages/goldarrow.xml", "goldarrow.tex")

local MOONSTONEARROWrecipeIngredients = {}

MOONSTONEARROWrecipeIngredients[#MOONSTONEARROWrecipeIngredients + 1]= GIngredient("moonrocknugget", MOONSTONEARROWREQHEAD);
MOONSTONEARROWrecipeIngredients[#MOONSTONEARROWrecipeIngredients + 1] = GIngredient("log", MOONSTONEARROWREQLOG);
if MOONSTONEARROWREQFEATHER > 0 then
	MOONSTONEARROWrecipeIngredients[#MOONSTONEARROWrecipeIngredients + 1] = GIngredient("feather_crow", MOONSTONEARROWREQFEATHER);
end

AddRecipe("moonstonearrow", MOONSTONEARROWrecipeIngredients , archerytab, ReturnTechLevel(MOONSTONEARROWTECHLEVEL), nil, nil, nil, MOONSTONEARROWCRAFTNUM, nil, "images/inventoryimages/moonstonearrow.xml", "moonstonearrow.tex")

local FIREARROWrecipeIngredients = {}

FIREARROWrecipeIngredients[#FIREARROWrecipeIngredients + 1] = GIngredient("log", FIREARROWREQLOG);
FIREARROWrecipeIngredients[#FIREARROWrecipeIngredients + 1]= GIngredient(FIREARROWHEADTYPE, FIREARROWREQHEAD);
if FIREARROWREQFEATHER > 0 then
	FIREARROWrecipeIngredients[#FIREARROWrecipeIngredients + 1] = GIngredient("feather_robin", FIREARROWREQFEATHER);
end
if FIREARROWREQGRASS > 0 then
	FIREARROWrecipeIngredients[#FIREARROWrecipeIngredients + 1] = GIngredient("cutgrass", FIREARROWREQGRASS);
end

AddRecipe("firearrow", FIREARROWrecipeIngredients , archerytab, ReturnTechLevel(FIREARROWTECHLEVEL), nil, nil, nil, FIREARROWCRAFTNUM, nil, "images/inventoryimages/firearrow.xml", "firearrow.tex")

local ICEARROWrecipeIngredients = {}

ICEARROWrecipeIngredients[#ICEARROWrecipeIngredients + 1] = GIngredient("log", ICEARROWREQLOG);
ICEARROWrecipeIngredients[#ICEARROWrecipeIngredients + 1]= GIngredient(ICEARROWHEADTYPE, ICEARROWREQHEAD);
if ICEARROWREQFEATHER > 0 then
	ICEARROWrecipeIngredients[#ICEARROWrecipeIngredients + 1] = GIngredient("feather_robin_winter", ICEARROWREQFEATHER);
end

AddRecipe("icearrow", ICEARROWrecipeIngredients , archerytab, ReturnTechLevel(ICEARROWTECHLEVEL), nil, nil, nil, ICEARROWCRAFTNUM, nil, "images/inventoryimages/icearrow.xml", "icearrow.tex")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local CROSSBOWrecipeIngredients = {}

CROSSBOWrecipeIngredients[#CROSSBOWrecipeIngredients + 1]= GIngredient("boards", CROSSBOWREQBOARDS);
CROSSBOWrecipeIngredients[#CROSSBOWrecipeIngredients + 1] = GIngredient("silk", CROSSBOWREQSILK);
if CROSSBOWREQHAMMER > 0 then
	CROSSBOWrecipeIngredients[#CROSSBOWrecipeIngredients + 1] = GIngredient("hammer", CROSSBOWREQHAMMER);
end

AddRecipe("crossbow", CROSSBOWrecipeIngredients , archerytab, ReturnTechLevel(CROSSBOWTECHLEVEL), nil, nil, nil, 1, nil, "images/inventoryimages/crossbow.xml", "crossbow.tex")

local BOLTrecipeIngredients = {}

BOLTrecipeIngredients[#BOLTrecipeIngredients + 1]= GIngredient("log", BOLTREQLOG);
if BOLTREQFEATHER > 0 then
	BOLTrecipeIngredients[#BOLTrecipeIngredients + 1] = GIngredient("feather_crow", BOLTREQFEATHER);
end
BOLTrecipeIngredients[#BOLTrecipeIngredients + 1] = GIngredient(BOLTHEADTYPE, BOLTREQHEAD);

AddRecipe("bolt", BOLTrecipeIngredients , archerytab, ReturnTechLevel(BOLTTECHLEVEL), nil, nil, nil, BOLTCRAFTNUM, nil, "images/inventoryimages/bolt.xml", "bolt.tex")

local EXPLOSIVEBOLTrecipeIngredients = {}

EXPLOSIVEBOLTrecipeIngredients[#EXPLOSIVEBOLTrecipeIngredients + 1]= GIngredient("log", EXPLOSIVEBOLTREQLOG);
if EXPLOSIVEBOLTREQFEATHER > 0 then
	EXPLOSIVEBOLTrecipeIngredients[#EXPLOSIVEBOLTrecipeIngredients + 1] = GIngredient("feather_crow", EXPLOSIVEBOLTREQFEATHER);
end
if EXPLOSIVEBOLTREQMOSQUITO > 0 then
	EXPLOSIVEBOLTrecipeIngredients[#EXPLOSIVEBOLTrecipeIngredients + 1] = GIngredient("mosquitosack", EXPLOSIVEBOLTREQMOSQUITO);
end
EXPLOSIVEBOLTrecipeIngredients[#BOLTrecipeIngredients + 1] = GIngredient(EXPLOSIVEBOLTHEADTYPE, EXPLOSIVEBOLTREQHEAD);

AddRecipe("explosivebolt", EXPLOSIVEBOLTrecipeIngredients , archerytab, ReturnTechLevel(EXPLOSIVEBOLTTECHLEVEL), nil, nil, nil, EXPLOSIVEBOLTCRAFTNUM, nil, "images/inventoryimages/explosivebolt.xml", "explosivebolt.tex")

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local MAGICBOWrecipeIngredients = {}

MAGICBOWrecipeIngredients[#MAGICBOWrecipeIngredients + 1] = GIngredient("livinglog", MAGICBOWREQLIVINGLOG);
MAGICBOWrecipeIngredients[#MAGICBOWrecipeIngredients + 1] = GIngredient("purplegem", MAGICBOWREQGEM);
if MAGICBOWREQGLOMMER then
	MAGICBOWrecipeIngredients[#MAGICBOWrecipeIngredients + 1] = GIngredient("glommerflower", 1);
end

AddRecipe("magicbow", MAGICBOWrecipeIngredients , archerytab, ReturnTechLevel(MAGICBOWTECHLEVEL), nil, nil, nil, 1, nil, "images/inventoryimages/magicbow.xml", "magicbow.tex")

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local FIREFLIESBALLrecipeIngredients = {}

FIREFLIESBALLrecipeIngredients[#FIREFLIESBALLrecipeIngredients + 1] = GIngredient("fireflies", 1);
FIREFLIESBALLrecipeIngredients[#FIREFLIESBALLrecipeIngredients + 1] = GIngredient("honey", 3);

AddRecipe("z_firefliesball", FIREFLIESBALLrecipeIngredients , archerytab, ReturnTechLevel(MAGICBOWTECHLEVEL), nil, nil, nil, 1, nil, "images/inventoryimages/firefliesball.xml", "firefliesball.tex")

local BLUEGOOPrecipeIngredients = {}

BLUEGOOPrecipeIngredients[#BLUEGOOPrecipeIngredients + 1] = GIngredient("spidergland", 1);
BLUEGOOPrecipeIngredients[#BLUEGOOPrecipeIngredients + 1] = GIngredient("blue_cap", 1);

AddRecipe("z_bluegoop", BLUEGOOPrecipeIngredients , archerytab, ReturnTechLevel(MAGICBOWTECHLEVEL), nil, nil, nil, 1, nil, "images/inventoryimages/bluegoop.xml", "bluegoop.tex")

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

STRINGS.NAMES.BOW = "木弓"
STRINGS.RECIPE_DESC.BOW = "Useful if you can aim."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BOW = "我曾经是个好箭手.自从我膝盖中了一箭."

STRINGS.NAMES.QUIVER = "箭筒"
STRINGS.RECIPE_DESC.QUIVER = "Store your arrows!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.QUIVER = "有了这玩意儿, 我看上去像个专业的了."

STRINGS.NAMES.ARROW = "石箭矢"
STRINGS.RECIPE_DESC.ARROW = "Do not throw it bare handed."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.ARROW = "可能是最实用的箭矢了"

STRINGS.NAMES.GOLDARROW = "金箭矢"
STRINGS.RECIPE_DESC.GOLDARROW = "Hunt with style."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.GOLDARROW = "我敢肯定我能很好的使用它..."

STRINGS.NAMES.MOONSTONEARROW = "月箭矢"
STRINGS.RECIPE_DESC.MOONSTONEARROW = "Expensive but efficient."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MOONSTONEARROW = "锐利和闪亮!"

STRINGS.NAMES.FIREARROW = "火箭矢"
STRINGS.RECIPE_DESC.FIREARROW = "Better be careful with that."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.FIREARROW = "我应该避免在我的营地中间使用它..."

STRINGS.NAMES.ICEARROW = "冰箭矢"
STRINGS.RECIPE_DESC.ICEARROW = "Stay cool."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.ICEARROW = "我应该把它放在冰箱里?"

STRINGS.NAMES.CROSSBOW = "弩"
STRINGS.RECIPE_DESC.CROSSBOW = "Heavy and powerful."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.CROSSBOW = "这玩意儿比我还大."

STRINGS.NAMES.BOLT = "蜂刺弩箭"
STRINGS.RECIPE_DESC.BOLT = "Not a toothpick."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BOLT = "如此之大的武器用个这么小的弹丸..."

STRINGS.NAMES.EXPLOSIVEBOLT = "爆炸弩箭"
STRINGS.RECIPE_DESC.EXPLOSIVEBOLT = "Do not use point blank."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.EXPLOSIVEBOLT = "这真是一个好创意!"

STRINGS.NAMES.MAGICBOW = "魔法弓"
STRINGS.RECIPE_DESC.MAGICBOW = "Just like in fairy tails."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MAGICBOW = "还有一种燃料可以装填.我不告诉你"

STRINGS.NAMES.Z_FIREFLIESBALL = "萤火虫球"
STRINGS.RECIPE_DESC.Z_FIREFLIESBALL = "Do not eat"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.Z_FIREFLIESBALL = "它可能有某种用途。但不要问我是什么."

STRINGS.NAMES.Z_BLUEGOOP = "蓝汞"
STRINGS.RECIPE_DESC.Z_BLUEGOOP = "Do not shoot at your foes."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.Z_BLUEGOOP = "小时候妈妈给我们涂在膝盖上的治伤口的."

-------------------------------------QUIVER EXTRA EQUIP SLOT-------------------------------------------------------------------------------------------------------------------------------------------------

GLOBAL.EQUIPSLOTS.QUIVER = "quiver"

AddGlobalClassPostConstruct("widgets/inventorybar", "Inv", function(self, owner)
--															local inventory = self.owner.replica.inventory
--															local num_slot = inventory:GetNumSlots()
--															local extraslot = num_slot - 18 + 1 -- 18 is the regular amount, +1 since I will add one later
															
															self.bg:SetScale(1.15+0.05,1,1)
															self.bgcover:SetScale(1.15+0.05,1,1)
					
															self:AddEquipSlot(GLOBAL.EQUIPSLOTS.QUIVER, "images/tabimages/quiver_slot.xml", "quiver_slot.tex",99)
														end
)


-------------------------------------NEW ACTIONS--------------------------------------------------------------------------------------

local global_facing

local global_havearrow
local global_targetisok
local global_targetislimbo
local global_havequiver
local global_projtypeok
local global_xbowisarmed
local global_finishedarming
local global_conditions_fulfilled

local global_isbowmagic
local global_magicweaponhasfuel

local allowedprojbow = { "arrow", "goldarrow", "moonstonearrow", "firearrow", "icearrow" }
local allowedprojcrossbow = { "bolt", "explosivebolt" }

local function DoZRangedAttack(act)
--	print("I entered the  ACTION ZRANGEDATTACK !")
	local equippedbow = act.doer.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
--	local proj = equippedbow.components.zupalexsrangedweapons.projectile
	local quiver = act.doer.replica.inventory:GetEquippedItem(EQUIPSLOTS.QUIVER)
	
	
	local ArrowsInInv = false
	
	global_havearrow = false
	global_havequiver = false
	global_projtypeok = false
	global_targetislimbo = true
	
	local target = act.target
	local attackerpos = act.doer:GetPosition()
			
	if target == nil or target:HasTag("wall") then
		for k,v in pairs(GLOBAL.TheSim:FindEntities(attackerpos.x, attackerpos.y, attackerpos.z, 25)) do
			if v.replica and v.replica.combat and v.replica.combat:CanBeAttacked(act.doer) and
			act.doer.replica and act.doer.replica.combat and act.doer.replica.combat:CanTarget(v)
			and not v:HasTag("wall") and not act.doer:HasTag("player") then
				target = v
				break
			end
		end
	end
	
	if target and not target:IsInLimbo()  then
		global_targetislimbo = false	
--		print("target is not in limbo")

		if equippedbow:HasTag("bow") and equippedbow:HasTag("magic") then
			if equippedbow.components.fueled ~= nil and not equippedbow.components.fueled:IsEmpty() then
				equippedbow.components.zupalexsrangedweapons:LaunchProjectile(act.doer, target)
				equippedbow.components.zupalexsrangedweapons:OnAttack(act.doer, target)
			end
		elseif quiver ~= nil and quiver.replica.container ~= nil then
			global_havequiver = true
			local projinquiver = quiver.replica.container:GetItemInSlot(1)
			
	--		ArrowsInInv = quiver.replica.container:Has(proj,1)
	--		if ArrowsInInv then
			if projinquiver ~= nil then
	--			print("I can get the quiver and the arrow in the action!")
				global_havearrow = true
				
				for k, v in pairs(equippedbow.components.zupalexsrangedweapons.allowedprojectiles) do
	--				print("Projectile in quiver : ", projinquiver.prefab, "   / found : ", v)
					if projinquiver.prefab == v then
	--					print("found a matching projectile")
						global_projtypeok = true
						break
					end
				end	
				
				if global_projtypeok then
					if not target:HasTag("wall") then
						equippedbow.components.zupalexsrangedweapons:SetProjectile(projinquiver.prefab)
						equippedbow.components.zupalexsrangedweapons:LaunchProjectile(act.doer, target)
						equippedbow.components.zupalexsrangedweapons:OnAttack(act.doer, target)
					end
				end
			end
		end
	end
		
	return true
end

local BOWATTACK = GLOBAL.Action(4,		-- priority
								nil,	-- instant (set to not instant)
								false,	-- right mouse button
								GLOBAL.TUNING.BOWRANGE,	-- distance check
								nil,	-- ghost valid (set to not ghost valid)
								nil,	-- ghost exclusive
								true,	-- can force action
								nil)	-- Range check function
BOWATTACK.str = "弓射击"
BOWATTACK.id = "BOWATTACK"
BOWATTACK.fn = DoZRangedAttack


AddAction(BOWATTACK)

local CROSSBOWATTACK = GLOBAL.Action(4,		-- priority
								nil,	-- instant (set to not instant)
								false,	-- right mouse button
								GLOBAL.TUNING.BOWRANGE*GLOBAL.TUNING.CROSSBOWRANGEMOD,	-- distance check
								nil,	-- ghost valid (set to not ghost valid)
								nil,	-- ghost exclusive
								true,	-- can force action
								nil)	-- Range check function
CROSSBOWATTACK.str = "弩射击"
CROSSBOWATTACK.id = "CROSSBOWATTACK"
CROSSBOWATTACK.fn = DoZRangedAttack

AddAction(CROSSBOWATTACK)

local function ClearUseArrowTags(inst)
	inst:RemoveTag("use_arrow")
	inst:RemoveTag("use_firearrow")
end

local CHANGEARROWTYPE = GLOBAL.Action(5,		-- priority
								nil,	-- instant (set to not instant)
								true,	-- right mouse button
								nil,		-- distance check
								nil,	-- ghost valid (set to not ghost valid)
								nil,	-- ghost exclusive
								nil,	-- can force action
								nil)	-- Range check function
CHANGEARROWTYPE.str = "更换"
CHANGEARROWTYPE.id = "CHANGEARROWTYPE"
CHANGEARROWTYPE.fn = function(act)
--	print("I entered the  ACTION CHANGEARROWTYPE!")

	local quiver = act.doer.replica.inventory:GetEquippedItem(EQUIPSLOTS.QUIVER)
	local useditem = act.invobject
	local inventory = act.doer.components.inventory
					
--	print("Used object is : ", useditem.prefab)
	
	if useditem ~= nil and quiver.replica.container ~= nil and quiver:HasTag("zupalexsrangedweapons") then
--		print("I have a quiver and a used item")
		local slotitem = quiver.replica.container:GetItemInSlot(1)
			if useditem ~= slotitem then
				if slotitem == nil and
				quiver.replica.container:CanTakeItemInSlot(useditem, 1) and
				(quiver.replica.container:AcceptsStacks() or
				useditem.components.stackable == nil or
				not useditem.components.stackable:IsStack()) 
				then
--					print("there is nothing in the quiver and I put new arrows")
--					inventory:RemoveItem(useditem, true)
--					quiver.components.container:GiveItem(useditem, 1)	
					local newactivearrow = GLOBAL.SpawnPrefab(string.lower(useditem.prefab))
					newactivearrow.components.stackable:SetStackSize(useditem.components.stackable.stacksize)
					quiver.components.container:GiveItem(newactivearrow, 1)
					useditem:Remove()
			elseif useditem ~= nil and
				slotitem ~= nil and
				quiver.replica.container:CanTakeItemInSlot(useditem, 1) and
				slotitem.prefab == useditem.prefab and
				slotitem.components.stackable ~= nil and
				quiver.replica.container:AcceptsStacks() 
				then	
--					print("there is something in the quiver and i add to the existing stack")
					local currentactivestack = useditem.components.stackable.stacksize
					local currentstackinquiver = slotitem.components.stackable.stacksize
					local stackoverflow = currentactivestack - slotitem.components.stackable:RoomLeft()
					
--					print("inv stack = ", currentactivestack, "     /     quiver stack = ", currentstackinquiver, "     /     overflow = ", stackoverflow)
					
					if stackoverflow <= 0 then
						slotitem.components.stackable:SetStackSize(currentactivestack + currentstackinquiver)
						useditem:Remove()
					else
						slotitem.components.stackable:SetStackSize(slotitem.components.stackable.maxsize)
						useditem.components.stackable:SetStackSize(stackoverflow)
--						print("quiver stack old = ", currentstackinquiver, "     /     quiver stack new = ", slotitem.components.stackable.stacksize, "     /     leftover = ", useditem.components.stackable.stacksize)
					end
			elseif useditem ~= nil and
				slotitem ~= nil and
				quiver.replica.container:CanTakeItemInSlot(useditem, slot) and
				not (slotitem.prefab == useditem.prefab and
					slotitem.components.stackable ~= nil and
					quiver.replica.container:AcceptsStacks()) and
				not (useditem.components.stackable ~= nil and
					useditem.components.stackable:IsStack() and
					not quiver.replica.container:AcceptsStacks()) 
				then
--					print("there is something in the quiver and i swap the two stacks")
					
					local newactivearrow = GLOBAL.SpawnPrefab(useditem.prefab)
					newactivearrow.components.stackable:SetStackSize(useditem.components.stackable.stacksize)
					
					local previnquiver = GLOBAL.SpawnPrefab(slotitem.prefab)
					previnquiver.components.stackable:SetStackSize(slotitem.components.stackable.stacksize)							
							
					slotitem:Remove()
					useditem:Remove()
					quiver.components.container:GiveItem(newactivearrow, 1)	
					inventory:GiveItem(previnquiver)
					
					
					local foundemptyslot = false
			end
		end
	end
	
	return true
end

AddAction(CHANGEARROWTYPE)

local ARMCROSSBOW = GLOBAL.Action(	5,		-- priority
									nil,	-- instant (set to not instant)
									true,	-- right mouse button
									nil,		-- distance check
									nil,	-- ghost valid (set to not ghost valid)
									nil,	-- ghost exclusive
									nil,	-- can force action
									nil)	-- Range check function
ARMCROSSBOW.str = "上弦"
ARMCROSSBOW.id = "ARMCROSSBOW"
ARMCROSSBOW.fn = function(act)
--	print("I entered the  ACTION ARMCROSSBOW!")
	local crossbow = act.invobject

	if crossbow.components.zupalexsrangedweapons ~= nil and crossbow:HasTag("zupalexsrangedweapons") and crossbow:HasTag("crossbow") then
		if not crossbow:HasTag("readytoshoot") then
			crossbow.components.zupalexsrangedweapons:OnArmed(act.doer)
		end
	end

	return true
end

AddAction(ARMCROSSBOW)

local bow_attack = State({
    name = "bow",
    tags = { "attack", "notalking", "abouttoattack", "autopredict" },

    onenter = function(inst)
        local buffaction = inst:GetBufferedAction()
        local target = buffaction ~= nil and buffaction.target or nil
		local equip = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
		local wornhat = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
		local quiver = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.QUIVER)
		local projinquiver = nil
		
		inst.components.combat:SetTarget(target)
		inst.components.locomotor:Stop()
	
		global_isbowmagic = false	
		global_magicweaponhasfuel = false
		
		if equip:HasTag("magic") then
			global_isbowmagic = true
			
			if equip:HasTag("hasfuel") then
				global_magicweaponhasfuel = true
			end
		end
		
		global_havequiver = false
		global_havearrow = false	
		global_projtypeok = false

--		local cooldown = inst.components.combat.min_attack_period + .5 * FRAMES
		local cooldown = 60 * FRAMES
		
--		print("I am in the state and the quiver is : ", quiver)

		if not global_isbowmagic then
			if quiver ~= nil and quiver.replica.container ~= nil then
				global_havequiver = true
				projinquiver = quiver.replica.container:GetItemInSlot(1)
			end
			
			if projinquiver ~= nil then
				global_havearrow = true
				for k, v in pairs(allowedprojbow) do
	--				print("Projectile in quiver (state) : ", projinquiver.prefab, "   / found : ", v)
					if projinquiver.prefab == v then
	--					print("found a matching projectile in state")
						global_projtypeok = true
						break
					end
				end
			end
		end
		
		if target ~= nil and not target:HasTag("wall") then
			global_targetisok = true
		else
			global_targetisok = false
		end

		global_conditions_fulfilled = false
		if ((global_havequiver and global_havearrow and global_projtypeok) or (global_isbowmagic and global_magicweaponhasfuel)) and global_targetisok then
			global_conditions_fulfilled = true
		end
		
--		print("Conditions status is : ", global_havequiver, "   ", global_havearrow, "   ", global_targetisok, "   ", global_projtypeok, "   => ", global_conditions_fulfilled)
		
		if not global_conditions_fulfilled then
			inst.AnimState:PlayAnimation("idle", true)
		end
		
--		print("have arrow : ", global_havearrow, "   /   target is ok : ", global_targetisok)			
		
	    if equip ~= nil and equip.components.zupalexsrangedweapons ~= nil and global_conditions_fulfilled then
			inst.components.combat:StartAttack()
		
--			print("And I found the BOW on the host!")
			inst.AnimState:PlayAnimation("bow_attack")

			inst.xoffsetBS = -70
			inst.yoffsetBS = 90
			inst.zoffsetBS = 0
			
			if inst.AnimState:GetCurrentFacing() == GLOBAL.FACING_UP then
				inst.zoffsetBS = -0.1
				if wornhat ~= nil then
--					print("hat and face up")
					inst.AnimState:Hide("timeline_0")
				else
--					print("no hat and face up")
					inst.AnimState:Hide("timeline_15")
				end
			elseif inst.AnimState:GetCurrentFacing() == GLOBAL.FACING_DOWN then
				inst.xoffsetBS = -65
				inst.yoffsetBS = 85
				if wornhat ~= nil then
--					print("hat and face down")
					inst.AnimState:Hide("timeline_3")
				else
--				print("no hat and face down")
				inst.AnimState:Hide("timeline_16")
				end
			else
				if wornhat ~= nil then
--					print("hat and face side")
					inst.AnimState:Hide("timeline_3")
				else
--				print("no hat and face side")
				inst.AnimState:Hide("timeline_16")
				end
			end
        end

		inst.sg:SetTimeout(cooldown)
		
        if target ~= nil and target:IsValid() then
            inst:FacePoint(target.Transform:GetWorldPosition())
            inst.sg.statemem.attacktarget = target
        end
    end,

    timeline =
    {		
		TimeEvent(0 * FRAMES, function(inst)
									if global_conditions_fulfilled then
										if global_isbowmagic then
											inst.beamstring = GLOBAL.SpawnPrefab("beamstring")
											inst.beamstring.Transform:SetPosition(inst:GetPosition():Get())
											inst.beamstring:SetFollowTarget(inst, "swap_beamstring", inst.xoffsetBS, inst.yoffsetBS, inst.zoffsetBS)
											inst.beamstring.AnimState:PlayAnimation("drawandshoot")
											inst.beamstring.AnimState:SetLayer(GLOBAL.LAYER_WORLD)
--											inst.beamstring.AnimState:SetSortOrder(0)
	
											inst.SoundEmitter:PlaySound("bow_shoot/magicbow_shoot/buzz", "buzz")
										else
											inst.SoundEmitter:PlaySound("bow_shoot/bow_shoot/bow_draw")
										end
									else
										inst.sg:RemoveStateTag("abouttoattack")
										inst:ClearBufferedAction()
									end
								end),	
	
		TimeEvent(8 * FRAMES, function(inst)
									if global_conditions_fulfilled then
										if global_isbowmagic then
											inst.SoundEmitter:PlaySound("bow_shoot/magicbow_shoot/shot")
										else
											inst.SoundEmitter:PlaySound("bow_shoot/bow_shoot/bow_shoot")
										end
									end
								end),	
	
		TimeEvent(14 * FRAMES, function(inst)
									if global_conditions_fulfilled then
										inst:PerformBufferedAction()
										inst.sg:RemoveStateTag("abouttoattack")
									end
								end),
							
		TimeEvent(15 * FRAMES, function(inst)
									if not global_conditions_fulfilled then
										inst.AnimState:PlayAnimation("idle")
									elseif global_isbowmagic then
										inst.SoundEmitter:KillSound("buzz")
									end
								end),
    },

    ontimeout = function(inst)
        inst.sg:RemoveStateTag("attack")
        inst.sg:AddStateTag("idle")
    end,

    events =
    {
        EventHandler("equip", function(inst) inst.sg:GoToState("idle") end),
        EventHandler("unequip", function(inst) inst.sg:GoToState("idle") end),
        EventHandler("animqueueover", function(inst)
            if inst.AnimState:AnimDone() then
                inst.sg:GoToState("idle")
            end
        end),
    },

    onexit = function(inst)
--		print("I exit the SG of the host NOW")
        inst.components.combat:SetTarget(nil)
        if inst.sg:HasStateTag("abouttoattack") then
            inst.components.combat:CancelAttack()
        end
		
		if global_isbowmagic and inst.beamstring ~= nil then
			inst.beamstring:Remove()
		end
		
		
		if inst.components.talker then
			if not global_isbowmagic then
				if not global_havequiver then
					local noquiver_message = "I should first get a quiver!"
					inst.components.talker:Say(noquiver_message)
				elseif not global_havearrow then
					local noammo_message = "My quiver is empty!"
					inst.components.talker:Say(noammo_message)
				elseif not global_projtypeok then
					local badammo_message = "This won't fit it my current weapon..."
					inst.components.talker:Say(badammo_message)
				elseif global_targetislimbo then
					local targetinlimbo_message = "It's too late now..."
					inst.components.talker:Say(targetinlimbo_message)
				elseif not global_targetisok then
					local fail_message = "There's no potential target on sight."
					inst.components.talker:Say(fail_message)
				end
			else
				if not global_magicweaponhasfuel then
					local nomagicfuel_message = "It looks like this stuff ran out of juice."
					inst.components.talker:Say(nomagicfuel_message)
				end
			end
		end
		
		inst.AnimState:Show("timeline_0")
		inst.AnimState:Show("timeline_3")
		inst.AnimState:Show("timeline_15")
		inst.AnimState:Show("timeline_16")
    end,		
})

AddStategraphState("wilson", bow_attack)


local crossbow_attack = State({
    name = "crossbow",
    tags = { "attack", "notalking", "abouttoattack", "autopredict" },

    onenter = function(inst)
        local buffaction = inst:GetBufferedAction()
        local target = buffaction ~= nil and buffaction.target or nil
		local equip = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
		local wornhat = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
		local quiver = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.QUIVER)
		local projinquiver = nil
		
		inst.components.combat:SetTarget(target)
		inst.components.locomotor:Stop()
		
		local ArrowsInInv = false
		
--		local cooldown = inst.components.combat.min_attack_period + .5 * FRAMES
		local cooldown = 50 * FRAMES
		
--		print("I am in the state and the quiver is : ", quiver)
		
		if quiver ~= nil and quiver.replica.container ~= nil then
			global_havequiver = true
			projinquiver = quiver.replica.container:GetItemInSlot(1)
		else
			global_havequiver = false
		end
		
		global_projtypeok = false
		if projinquiver ~= nil then
			global_havearrow = true
			for k, v in pairs(allowedprojcrossbow) do
--				print("Projectile in quiver (state) : ", projinquiver.prefab, "   / found : ", v)
				if projinquiver.prefab == v then
--					print("found a matching projectile in state")
					global_projtypeok = true
					break
				end
			end		
		else
			global_havearrow = false
		end
		
		if equip:HasTag("zupalexsrangedweapons") and equip:HasTag("crossbow") and equip:HasTag("readytoshoot") then
			global_xbowisarmed = true
		else
			global_xbowisarmed = false
		end
		
		if target ~= nil and not target:HasTag("wall") then
			global_targetisok = true
		else
			global_targetisok = false
		end
			
		global_conditions_fulfilled = false	
		if global_havequiver and global_havearrow and global_targetisok and global_projtypeok and global_xbowisarmed then
			global_conditions_fulfilled = true
		end
		
--		print("Conditions status is : ", global_havequiver, "   ", global_havearrow, "   ", global_targetisok, "   ", global_projtypeok, "   => ", global_conditions_fulfilled)
		
		if not global_conditions_fulfilled then
			inst.AnimState:PlayAnimation("idle", true)
		end
			
--		print("have arrow : ", global_havearrow, "   /   target is ok : ", global_targetisok)			
			
	    if equip ~= nil and equip.components.zupalexsrangedweapons ~= nil and global_conditions_fulfilled then
			inst.components.combat:StartAttack()
		
--			print("And I found the BOW on the host!")
			inst.AnimState:PlayAnimation("crossbow_attack")

			if wornhat ~= nil then
				if inst.AnimState:GetCurrentFacing() == GLOBAL.FACING_UP then
--					print("hat and face up")
					inst.AnimState:Hide("timeline_0")
				elseif inst.AnimState:GetCurrentFacing() == GLOBAL.FACING_DOWN then
--					print("hat and face down")
					inst.AnimState:Hide("timeline_3")
				else
--					print("hat and face side")
					inst.AnimState:Hide("timeline_3")
				end
			else
				if inst.AnimState:GetCurrentFacing() == GLOBAL.FACING_UP then
--					print("no hat and face up")
					inst.AnimState:Hide("timeline_15")
				elseif inst.AnimState:GetCurrentFacing() == GLOBAL.FACING_DOWN then
--					print("no hat and face down")
					inst.AnimState:Hide("timeline_16")
				else
--					print("no hat and face side")
					inst.AnimState:Hide("timeline_16")
				end
			end
        end

		inst.sg:SetTimeout(cooldown)
		
        if target ~= nil and target:IsValid() then
            inst:FacePoint(target.Transform:GetWorldPosition())
            inst.sg.statemem.attacktarget = target
        end
    end,

    timeline =
    {	
		TimeEvent(0 * FRAMES, function(inst)
									if not global_conditions_fulfilled then
										inst.sg:RemoveStateTag("abouttoattack")
										inst:ClearBufferedAction()
									end
								end),
	
		TimeEvent(15 * FRAMES, function(inst)
									if not global_conditions_fulfilled then
										inst.AnimState:PlayAnimation("idle")
									end
								end),
	
		TimeEvent(18 * FRAMES, function(inst)
									if global_conditions_fulfilled then
										inst.SoundEmitter:PlaySound("bow_shoot/bow_shoot/bow_shoot", nil, nil, true)
									end
								end),	
	
		TimeEvent(23 * FRAMES, function(inst)
									if global_conditions_fulfilled then
										inst.sg:RemoveStateTag("abouttoattack")
										inst:PerformBufferedAction()
									end
								end),
    },

    ontimeout = function(inst)
        inst.sg:RemoveStateTag("attack")
        inst.sg:AddStateTag("idle")
    end,

    events =
    {
        EventHandler("equip", function(inst) inst.sg:GoToState("idle") end),
        EventHandler("unequip", function(inst) inst.sg:GoToState("idle") end),
        EventHandler("animqueueover", function(inst)
            if inst.AnimState:AnimDone() then
                inst.sg:GoToState("idle")
            end
        end),
    },

    onexit = function(inst)
--		print("I exit the SG of the host NOW")
        inst.components.combat:SetTarget(nil)
        if inst.sg:HasStateTag("abouttoattack") then
            inst.components.combat:CancelAttack()
        end
		
		if inst.components.talker then
			if not global_havequiver then
				local noquiver_message = "I should first get a quiver!"
				inst.components.talker:Say(noquiver_message)
			elseif not global_havearrow then
				local noammo_message = "My quiver is empty!"
				inst.components.talker:Say(noammo_message)
			elseif not global_projtypeok then
				local badammo_message = "This won't fit it my current weapon..."
				inst.components.talker:Say(badammo_message)
			elseif not global_xbowisarmed then
				local xbownotarmed_message = "I won't shoot far if I don't arm it first..."
				inst.components.talker:Say(xbownotarmed_message)
			elseif global_targetislimbo then
				local targetinlimbo_message = "It's too late now..."
				inst.components.talker:Say(targetinlimbo_message)
			elseif not global_targetisok then
				local fail_message = "There's no potential target on sight."
				inst.components.talker:Say(fail_message)
			end
		end
		
		inst.AnimState:Show("timeline_0")
		inst.AnimState:Show("timeline_3")
		inst.AnimState:Show("timeline_15")
		inst.AnimState:Show("timeline_16")
    end,		
})

AddStategraphState("wilson", crossbow_attack)

local crossbow_arm = State({
    name = "crossbow_arm",
    tags = { "doing", "busy" },

    onenter = function(inst)
		local equip = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
		local wornhat = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
		
		inst.components.locomotor:Stop()
		inst.sg.statemem.action = inst.bufferedaction
		
		global_finishedarming = false
		
		local cooldown = 80 * FRAMES
			
		if equip:HasTag("zupalexsrangedweapons") and equip:HasTag("crossbow") and not equip:HasTag("readytoshoot") then
			global_xbowisarmed = false
		else
			global_xbowisarmed = true
		end
			
		global_conditions_fulfilled = false	
		if not global_xbowisarmed then
			global_conditions_fulfilled = true
		end
		
--		print("Conditions status is : ", global_havequiver, "   ", global_havearrow, "   ", global_targetisok, "   ", global_projtypeok, "   => ", global_conditions_fulfilled)
		
		local playerposx, playerposy, playerposz = inst.Transform:GetWorldPosition()
		inst:ForceFacePoint(playerposx, playerposy-50, playerposz)
		
		if not global_conditions_fulfilled then
			inst.AnimState:PlayAnimation("idle", true)
		else	
			inst.AnimState:PlayAnimation("crossbow_arm")

			if wornhat ~= nil then
				inst.AnimState:Hide("timeline_3")
			else
				inst.AnimState:Hide("timeline_16")
			end
        end
		
		inst.sg:SetTimeout(cooldown)
    end,

    timeline =
    {	
		TimeEvent(0 * FRAMES, function(inst)
									if not global_conditions_fulfilled then
										inst.sg:RemoveStateTag("abouttoattack")
										inst:ClearBufferedAction()
									end
								end),
	
		TimeEvent(15 * FRAMES, function(inst)
									inst.sg:RemoveStateTag("busy")
									if not global_conditions_fulfilled then
										inst.AnimState:PlayAnimation("idle")
									end
								end),
	
		TimeEvent(31 * FRAMES, function(inst)
									if global_conditions_fulfilled then
										inst.SoundEmitter:PlaySound("bow_shoot/bow_shoot/bow_draw", nil, nil, true)
										inst.AnimState:OverrideSymbol("swap_object", "swap_crossbow", "swap_crossbow_armed")
									end
								end),	
	
		TimeEvent(62 * FRAMES, function(inst)
									if global_conditions_fulfilled then
										inst:PerformBufferedAction()
										global_finishedarming = true
									end
								end),
    },

    ontimeout = function(inst)
		inst.AnimState:OverrideSymbol("swap_object", "swap_crossbow", "swap_crossbow")
        inst.sg:GoToState("idle", true)
    end,

    events =
    {
        EventHandler("equip", function(inst) inst.sg:GoToState("idle") end),
        EventHandler("unequip", function(inst) inst.sg:GoToState("idle") end),
        EventHandler("animqueueover", function(inst)
            if inst.AnimState:AnimDone() then
                inst.sg:GoToState("idle")
            end
        end),
    },

    onexit = function(inst)
		if inst.bufferedaction == inst.sg.statemem.action then
            inst:ClearBufferedAction()
        end
        inst.sg.statemem.action = nil
	
		if not global_finishedarming and not global_xbowisarmed then
			inst.AnimState:OverrideSymbol("swap_object", "swap_crossbow", "swap_crossbow")
		end
	
		if inst.components.talker then
			if global_xbowisarmed then
				local alreadyarmed_message = "If I pull even more on this stuff it will break..."
				inst.components.talker:Say(alreadyarmed_message)
			end
		end
		
		inst.AnimState:Show("timeline_0")
		inst.AnimState:Show("timeline_3")
		inst.AnimState:Show("timeline_15")
		inst.AnimState:Show("timeline_16")
    end,		
})

AddStategraphState("wilson", crossbow_arm)

local bow_attack_client = State({
        name = "bow",
        tags = { "attack", "notalking", "abouttoattack", "autopredict" },

    onenter = function(inst)
        local buffaction = inst:GetBufferedAction()
        local target = buffaction ~= nil and buffaction.target or nil
		local equip = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
		local wornhat = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
		local quiver = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.QUIVER)
		local projinquiver = nil
		
        inst.components.locomotor:Stop()
		
--		print("I am in the StateGraph for the client !")

		global_isbowmagic = false	
		global_magicweaponhasfuel = false
		
		if equip:HasTag("magic") then
			global_isbowmagic = true
			
			if equip:HasTag("hasfuel") then
				global_magicweaponhasfuel = true
			end
		end
		
		global_havequiver = false
		global_havearrow = false	
		global_projtypeok = false

--		local cooldown = inst.components.combat.min_attack_period + .5 * FRAMES
		local cooldown = 60 * FRAMES
		
--		print("I am in the state and the quiver is : ", quiver)

		if not global_isbowmagic then
			if quiver ~= nil and quiver.replica.container ~= nil then
				global_havequiver = true
				projinquiver = quiver.replica.container:GetItemInSlot(1)
			end
			
			if projinquiver ~= nil then
				global_havearrow = true
				for k, v in pairs(allowedprojbow) do
	--				print("Projectile in quiver (state) : ", projinquiver.prefab, "   / found : ", v)
					if projinquiver.prefab == v then
	--					print("found a matching projectile in state")
						global_projtypeok = true
						break
					end
				end
			end
		end
		
		if target ~= nil and not target:HasTag("wall") then
			global_targetisok = true
		else
			global_targetisok = false
		end

		global_conditions_fulfilled = false
		if ((global_havequiver and global_havearrow and global_projtypeok) or (global_isbowmagic and global_magicweaponhasfuel)) and global_targetisok then
			global_conditions_fulfilled = true
		end
		
--		print("Conditions status is : ", global_havequiver, "   ", global_havearrow, "   ", global_targetisok, "   ", global_projtypeok, "   => ", global_conditions_fulfilled)
		
		if not global_conditions_fulfilled then
			inst.AnimState:PlayAnimation("idle", true)
		end
		
	    if equip ~= nil and equip:HasTag("bow") and global_conditions_fulfilled then
		    inst.replica.combat:StartAttack()
		
--			inst.AnimState:PlayAnimation("bow_attack")
			
			inst.xoffsetBS = -70
			inst.yoffsetBS = 90
			inst.zoffsetBS = 0
			
			if inst.AnimState:GetCurrentFacing() == GLOBAL.FACING_UP then
				inst.zoffsetBS = -0.1
				if wornhat ~= nil then
--					print("hat and face up")
					inst.AnimState:Hide("timeline_0")
				else
--					print("no hat and face up")
					inst.AnimState:Hide("timeline_15")
				end
			elseif inst.AnimState:GetCurrentFacing() == GLOBAL.FACING_DOWN then
				inst.xoffsetBS = -65
				inst.yoffsetBS = 85
				if wornhat ~= nil then
--					print("hat and face down")
					inst.AnimState:Hide("timeline_3")
				else
--				print("no hat and face down")
				inst.AnimState:Hide("timeline_16")
				end
			else
				if wornhat ~= nil then
--					print("hat and face side")
					inst.AnimState:Hide("timeline_3")
				else
--				print("no hat and face side")
				inst.AnimState:Hide("timeline_16")
				end
			end
        end

		inst.sg:SetTimeout(cooldown) 

        if target ~= nil and target:IsValid() then
            inst:FacePoint(target.Transform:GetWorldPosition())
            inst.sg.statemem.attacktarget = target
        end
		
		if buffaction ~= nil then
			inst:PerformPreviewBufferedAction()
		end
    end,

    timeline =
    {
		TimeEvent(0 * FRAMES, function(inst)
									if global_conditions_fulfilled then
										if global_isbowmagic then
											inst.SoundEmitter:PlaySound("bow_shoot/magicbow_shoot/buzz", "buzz", nil, true)
										else
											inst.SoundEmitter:PlaySound("bow_shoot/bow_shoot/bow_draw")
										end
									else
										inst.sg:RemoveStateTag("abouttoattack")
										inst:ClearBufferedAction()
									end
							end),	

		TimeEvent(2 * FRAMES, function(inst)
									if global_conditions_fulfilled then
										inst.AnimState:PlayAnimation("bow_attack")
									end
							end),
							
		TimeEvent(8 * FRAMES, function(inst)
									if global_conditions_fulfilled then
										if global_isbowmagic then
											inst.SoundEmitter:PlaySound("bow_shoot/magicbow_shoot/shot", nil, nil, true)
										else
										inst.SoundEmitter:PlaySound("bow_shoot/bow_shoot/bow_shoot", nil, nil, true)
										end
									end
							end),	
							
		TimeEvent(14 * FRAMES, function(inst)
								if global_conditions_fulfilled then
									inst:ClearBufferedAction()
									inst.sg:RemoveStateTag("abouttoattack")
								end
							end),
							
		TimeEvent(15 * FRAMES, function(inst)
									if not global_conditions_fulfilled then
										inst.AnimState:PlayAnimation("idle")
									elseif global_isbowmagic then
										inst.SoundEmitter:KillSound("buzz")
									end
								end),
    },

    ontimeout = function(inst)
        inst.sg:RemoveStateTag("attack")
        inst.sg:AddStateTag("idle")
    end,

    events =
    {
        EventHandler("equip", function(inst) inst.sg:GoToState("idle") end),
        EventHandler("unequip", function(inst) inst.sg:GoToState("idle") end),
        EventHandler("animqueueover", function(inst)
            if inst.AnimState:AnimDone() then
                inst.sg:GoToState("idle")
            end
        end),
    },

    onexit = function(inst)
        if inst.sg:HasStateTag("abouttoattack") then
            inst.replica.combat:CancelAttack()
        end
		
		if inst.components.talker then
			if not global_isbowmagic then
				if not global_havequiver then
					local noquiver_message = "I should first get a quiver!"
					inst.components.talker:Say(noquiver_message)
				elseif not global_havearrow then
					local noammo_message = "My quiver is empty!"
					inst.components.talker:Say(noammo_message)
				elseif not global_projtypeok then
					local badammo_message = "This won't fit it my current weapon..."
					inst.components.talker:Say(badammo_message)
				elseif global_targetislimbo then
					local targetinlimbo_message = "It's too late now..."
					inst.components.talker:Say(targetinlimbo_message)
				elseif not global_targetisok then
					local fail_message = "There's no potential target on sight."
					inst.components.talker:Say(fail_message)
				end
			else
				if not global_magicweaponhasfuel then
					local nomagicfuel_message = "It looks like this stuff ran out of juice."
					inst.components.talker:Say(nomagicfuel_message)
				end
			end
		end
		
		inst.AnimState:Show("timeline_0")
		inst.AnimState:Show("timeline_3")
		inst.AnimState:Show("timeline_15")
		inst.AnimState:Show("timeline_16")
    end,		
})

AddStategraphState("wilson_client", bow_attack_client)

local crossbow_attack_client = State({
        name = "crossbow",
        tags = { "attack", "notalking", "abouttoattack", "autopredict" },

    onenter = function(inst)
        local buffaction = inst:GetBufferedAction()
        local target = buffaction ~= nil and buffaction.target or nil
		local equip = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
		local wornhat = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
		local quiver = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.QUIVER)
		local projinquiver = nil
		
        inst.components.locomotor:Stop()
        local cooldown = 50 * FRAMES
		
--		print("I am in the StateGraph for the client !")
		
		local ArrowsInInv
		
		if quiver ~= nil and quiver.replica.container ~= nil then
			global_havequiver = true
			projinquiver = quiver.replica.container:GetItemInSlot(1)
		else
			global_havequiver = false
		end
		
		global_projtypeok = false
		if projinquiver ~= nil then
			global_havearrow = true
			for k, v in pairs(allowedprojcrossbow) do
				if projinquiver.prefab == v then
					global_projtypeok = true
					break
				end
			end
		else
			global_havearrow = false
		end
		
		if equip:HasTag("zupalexsrangedweapons") and equip:HasTag("crossbow") and equip:HasTag("readytoshoot") then
			global_xbowisarmed = true
		else
			global_xbowisarmed = false
		end
		
		if target ~= nil and not target:HasTag("wall") then
			global_targetisok = true
		else
			global_targetisok = false
		end
		
		global_conditions_fulfilled = false	
		if global_havequiver and global_havearrow and global_targetisok and global_projtypeok and global_xbowisarmed then
			global_conditions_fulfilled = true
		end
		
--		print("Conditions status is : ", global_havequiver, "   ", global_havearrow, "   ", global_targetisok, "   ", global_projtypeok, "   => ", global_conditions_fulfilled)
		
		if not global_conditions_fulfilled then
			inst.AnimState:PlayAnimation("idle", true)
		end
		
	    if equip ~= nil and equip:HasTag("crossbow") and global_conditions_fulfilled then
		    inst.replica.combat:StartAttack()
		
			inst.AnimState:PlayAnimation("crossbow_attack")
			
			if wornhat ~= nil then
				if inst.AnimState:GetCurrentFacing() == GLOBAL.FACING_UP then
--					print("hat and face up")
					inst.AnimState:Hide("timeline_0")
				elseif inst.AnimState:GetCurrentFacing() == GLOBAL.FACING_DOWN then
--					print("hat and face down")
					inst.AnimState:Hide("timeline_3")
				else
--					print("hat and face side")
					inst.AnimState:Hide("timeline_3")
				end
			else
				if inst.AnimState:GetCurrentFacing() == GLOBAL.FACING_UP then
--					print("no hat and face up")
					inst.AnimState:Hide("timeline_15")
				elseif inst.AnimState:GetCurrentFacing() == GLOBAL.FACING_DOWN then
--					print("no hat and face down")
					inst.AnimState:Hide("timeline_16")
				else
--					print("no hat and face side")
					inst.AnimState:Hide("timeline_16")
				end
			end
        end

		inst.sg:SetTimeout(cooldown) 

        if target ~= nil and target:IsValid() then
            inst:FacePoint(target.Transform:GetWorldPosition())
            inst.sg.statemem.attacktarget = target
        end
		
		if buffaction ~= nil then
			inst:PerformPreviewBufferedAction()
		end
    end,

    timeline =
    {
		TimeEvent(0 * FRAMES, function(inst)
									if not global_conditions_fulfilled then
										inst.sg:RemoveStateTag("abouttoattack")
										inst:ClearBufferedAction()
									end
								end),
	
		TimeEvent(15 * FRAMES, function(inst)
									if not global_conditions_fulfilled then
										inst.AnimState:PlayAnimation("idle")
									end
								end),
	
		TimeEvent(18 * FRAMES, function(inst)
									if global_conditions_fulfilled then
										inst.SoundEmitter:PlaySound("bow_shoot/bow_shoot/bow_shoot", nil, nil, true)
									end
								end),	
	
		TimeEvent(23 * FRAMES, function(inst)
									if global_conditions_fulfilled then
									inst:ClearBufferedAction()
									inst.sg:RemoveStateTag("abouttoattack")
									end
								end),
    },

    ontimeout = function(inst)
        inst.sg:RemoveStateTag("attack")
        inst.sg:AddStateTag("idle")
    end,

    events =
    {
        EventHandler("equip", function(inst) inst.sg:GoToState("idle") end),
        EventHandler("unequip", function(inst) inst.sg:GoToState("idle") end),
        EventHandler("animqueueover", function(inst)
            if inst.AnimState:AnimDone() then
                inst.sg:GoToState("idle")
            end
        end),
    },

    onexit = function(inst)
        if inst.sg:HasStateTag("abouttoattack") then
            inst.replica.combat:CancelAttack()
        end
		
		if inst.components.talker then
			if not global_havequiver then
				local noquiver_message = "I should first get a quiver!"
				inst.components.talker:Say(noquiver_message)
			elseif not global_havearrow then
				local noammo_message = "My quiver is empty!"
				inst.components.talker:Say(noammo_message)
			elseif not global_projtypeok then
				local badammo_message = "This won't fit it my current weapon..."
				inst.components.talker:Say(badammo_message)
			elseif not global_xbowisarmed then
				local xbownotarmed_message = "I won't shoot far if I don't arm it first..."
				inst.components.talker:Say(xbownotarmed_message)
			elseif global_targetislimbo then
				local targetinlimbo_message = "It's too late now..."
				inst.components.talker:Say(targetinlimbo_message)
			elseif not global_targetisok then
				local fail_message = "There's no potential target on sight."
				inst.components.talker:Say(fail_message)
			end
		end
		
		inst.AnimState:Show("timeline_0")
		inst.AnimState:Show("timeline_3")
		inst.AnimState:Show("timeline_15")
		inst.AnimState:Show("timeline_16")
    end,		
})

AddStategraphState("wilson_client", crossbow_attack_client)

local crossbow_arm_client = State({
    name = "crossbow_arm",
    tags = { "doing", "busy" },

    onenter = function(inst)
		local equip = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
		local wornhat = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
		
		inst.components.locomotor:Stop()
		inst.sg.statemem.action = inst.bufferedaction
		
		local cooldown = 80 * FRAMES
			
		global_finishedarming = false
			
		if equip:HasTag("zupalexsrangedweapons") and equip:HasTag("crossbow") and not equip:HasTag("readytoshoot") then
			global_xbowisarmed = false
		else
			global_xbowisarmed = true
		end
			
		global_conditions_fulfilled = false	
		if not global_xbowisarmed then
			global_conditions_fulfilled = true
		end
		
--		print("Conditions status is : ", global_havequiver, "   ", global_havearrow, "   ", global_targetisok, "   ", global_projtypeok, "   => ", global_conditions_fulfilled)
		
		local playerposx, playerposy, playerposz = inst.Transform:GetWorldPosition()
		inst:ForceFacePoint(playerposx, playerposy-50, playerposz)
		
		if not global_conditions_fulfilled then
			inst.AnimState:PlayAnimation("idle", true)
		else	
			inst.AnimState:PlayAnimation("crossbow_arm")

			if wornhat ~= nil then
				inst.AnimState:Hide("timeline_3")
			else
				inst.AnimState:Hide("timeline_16")
			end
        end

		inst.sg:SetTimeout(cooldown)
		
		inst:PerformPreviewBufferedAction()
    end,

    timeline =
    {		
		TimeEvent(15 * FRAMES, function(inst)
									inst.sg:RemoveStateTag("busy")
									if not global_conditions_fulfilled then
										inst.AnimState:PlayAnimation("idle")
									end
								end),
	
		TimeEvent(31 * FRAMES, function(inst)
									if global_conditions_fulfilled then
										inst.SoundEmitter:PlaySound("bow_shoot/bow_shoot/bow_draw", nil, nil, true)
										inst.AnimState:OverrideSymbol("swap_object", "swap_crossbow", "swap_crossbow_armed")
									end
								end),	
	
		TimeEvent(62 * FRAMES, function(inst)
									if global_conditions_fulfilled then
										inst.sg:RemoveStateTag("busy")
										global_finishedarming = true
									end
								end),
    },

    ontimeout = function(inst)
        inst:ClearBufferedAction()
		inst.AnimState:OverrideSymbol("swap_object", "swap_crossbow", "swap_crossbow")
        inst.sg:GoToState("idle", true)
    end,

    events =
    {
        EventHandler("equip", function(inst) inst.sg:GoToState("idle") end),
        EventHandler("unequip", function(inst) inst.sg:GoToState("idle") end),
        EventHandler("animqueueover", function(inst)
            if inst.AnimState:AnimDone() then
                inst.sg:GoToState("idle")
            end
        end),
    },

    onexit = function(inst)	
		if inst.components.talker then
			if global_xbowisarmed then
				local alreadyarmed_message = "If I pull even more on this stuff it will break..."
				inst.components.talker:Say(alreadyarmed_message)
			end
		end
		
		if not global_finishedarming and not global_xbowisarmed then
			inst.AnimState:OverrideSymbol("swap_object", "swap_crossbow", "swap_crossbow")
		end
		
		inst.AnimState:Show("timeline_0")
		inst.AnimState:Show("timeline_3")
		inst.AnimState:Show("timeline_15")
		inst.AnimState:Show("timeline_16")
    end,		
})

AddStategraphState("wilson_client", crossbow_arm_client)

AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.BOWATTACK, function(inst, action)
--																		inst.sg.mem.localchainattack = not action.forced or nil
																		if not inst.components.health:IsDead() and not inst.sg:HasStateTag("attack") then
																			local weapon = inst.components.combat ~= nil and inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) or nil
																			return (weapon:HasTag("bow") and weapon:HasTag("zupalexsrangedweapons") and "bow")
																		end
																	end
													)
)

AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.CROSSBOWATTACK, function(inst, action)
--																		inst.sg.mem.localchainattack = not action.forced or nil
																		if not inst.components.health:IsDead() and not inst.sg:HasStateTag("attack") then
																			local weapon = inst.components.combat ~= nil and inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) or nil
																			return (weapon:HasTag("crossbow") and weapon:HasTag("zupalexsrangedweapons") and "crossbow")
																		end
																	end
													)
)

AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.CHANGEARROWTYPE, "doshortaction"))

AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.ARMCROSSBOW, function(inst, action)
																			local weapon = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
																			return (weapon:HasTag("crossbow") and weapon:HasTag("zupalexsrangedweapons") and "crossbow_arm")
																		end
													)
)

AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.BOWATTACK, function(inst, action)
--																				inst.sg.mem.localchainattack = not action.forced or nil
																				if not inst.sg:HasStateTag("attack") then
																					local weapon = inst.replica.combat ~= nil and inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) or nil
																					return (weapon:HasTag("bow") and weapon:HasTag("zupalexsrangedweapons") and "bow")
																				end
																			end
															)
)

AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.CROSSBOWATTACK, function(inst, action)
--																				inst.sg.mem.localchainattack = not action.forced or nil
																				if not inst.sg:HasStateTag("attack") then
																					local weapon = inst.replica.combat ~= nil and inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) or nil
																					return (weapon:HasTag("crossbow") and weapon:HasTag("zupalexsrangedweapons") and "crossbow")
																				end
																			end
															)
)

AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.CHANGEARROWTYPE, "doshortaction"))

AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.ARMCROSSBOW, function(inst, action)
																					local weapon = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
																					return (weapon:HasTag("crossbow") and weapon:HasTag("zupalexsrangedweapons") and "crossbow_arm")
																				end
															)
)

local function bow_attack_equipped(inst, doer, target, actions, right)
local isPvPon = GLOBAL.TheNet:GetPVPEnabled()

	if not target:HasTag("wall")
		and not doer.replica.combat:IsAlly(target)
		and doer.replica.combat ~= nil
		and not target:HasTag("chester")
		and doer.replica.combat:CanTarget(target)
		and target.replica.combat:CanBeAttacked(doer)
		then
			if not right then
				if (not isPvPon and not (doer:HasTag("player") and target:HasTag("player"))) or
					isPvPon or
					inst:HasTag("healer")
					then
						if inst:HasTag("bow") then
							table.insert(actions, BOWATTACK)
						elseif inst:HasTag("crossbow") then
							table.insert(actions, CROSSBOWATTACK)
						end
				end
			end
	end
end

local function bow_attack_useitem(inst, doer, target, actions, right)
    if inst.replica.inventoryitem ~= nil and
        target.replica.container ~= nil and
        target.replica.container:CanBeOpened() then
        -- put weapons into chester, don't attack him unless forcing attack with key press
        table.insert(actions, ACTIONS.STORE)
	elseif target.replica.combat ~= nil and
			target.replica.combat:CanBeAttacked(doer) and
			not doer.replica.combat:IsAlly(target) and
			not (doer:HasTag("player") and target:HasTag("player")) and
			not (inst:HasTag("tranquilizer") and not target:HasTag("sleeper")) and
			not (inst:HasTag("lighter") and (target:HasTag("canlight") or target:HasTag("nolight"))) then
				if inst:HasTag("bow") then
					table.insert(actions, BOWATTACK)
				elseif inst:HasTag("crossbow") then
					table.insert(actions, CROSSBOWATTACK)
				end
	end
end


local function bow_attack_inventory(inst, doer, actions, right)
	local quiver = doer.replica.inventory:GetEquippedItem(EQUIPSLOTS.QUIVER)
	local equiphand = doer.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
	
	if inst.replica.inventoryitem ~= nil then
--		local iteminquiver = quiver.replica.container:GetItemInSlot(1)
		if quiver ~= nil and
			inst:HasTag("zupalexsrangedweapons") and (inst:HasTag("arrow") or inst:HasTag("bolt")) and
			quiver:HasTag("zupalexsrangedweapons") and quiver.replica.container~= nil
			then
				table.insert(actions, CHANGEARROWTYPE)
		elseif inst:HasTag("zupalexsrangedweapons") and inst:HasTag("crossbow") and inst == equiphand then
			table.insert(actions, ARMCROSSBOW)
		end
	end
end       
	
AddComponentAction("EQUIPPED", "zupalexsrangedweapons", bow_attack_equipped)
AddComponentAction("USEITEM", "zupalexsrangedweapons", bow_attack_useitem)
AddComponentAction("INVENTORY", "zupalexsrangedweapons", bow_attack_inventory)

GLOBAL.FUELTYPE["ZUPALEX"] = "ZUPALEX"

AddModRPCHandler("Archery Mod", "RequestUnequip", function(player, eslot, slip)
													local inventory = player.components.inventory
													local eitem = inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
													if inventory ~= nil then
														inventory:Unequip(eslot, slip)
														inventory:DropItem(eitem)
													end
												end
)

AddModRPCHandler("Archery Mod", "CallOnUnequipBow", function(player, inst)
															inst._hostATKchanged:set(false)
													end
)