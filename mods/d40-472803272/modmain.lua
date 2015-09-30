-- Import the lib use.
modimport("libs/use.lua")

-- Import the mod environment as our environment.
env = use "libs/mod_env"

use "data/widgets/controls"
use "data/screens/chatinputscreen"
use "data/screens/consolescreen"

PrefabFiles = {
	"plutia", 
	"personal_dogoo_eyebone",
	"personal_dogoo",
	"galientsword",
	"wilsondoll",
	"willowdoll",
	"wendydoll",
	"wxdoll",
	"wickerdoll",
	"wolfgangdoll",
	"wesdoll",
	"wigfriddoll",
	"waxwelldoll",
	"woodiedoll",
	"webberdoll",
	"balloon2",
	"ghost2"
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/plutia.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/plutia.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/plutia.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/plutia.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/plutia_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/plutia_silho.xml" ),

    Asset( "IMAGE", "bigportraits/plutia.tex" ),
    Asset( "ATLAS", "bigportraits/plutia.xml" ),
	
	Asset( "IMAGE", "images/map_icons/plutia.tex" ),
	Asset( "ATLAS", "images/map_icons/plutia.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_plutia.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_plutia.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_plutia.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_plutia.xml" ),
	
	Asset( "ATLAS", "images/hud/plutiatab.xml" ),
	
    Asset("SOUNDPACKAGE", "sound/plutia.fev"),
	Asset("SOUND", "sound/plutia.fsb"),
	
    Asset("SOUNDPACKAGE", "sound/iris.fev"),
	Asset("SOUND", "sound/iris.fsb"),

}

RemapSoundEvent( "dontstarve/characters/plutia/death_voice", "plutia/sound/death_voice" )
RemapSoundEvent( "dontstarve/characters/plutia/hurt", "plutia/sound/hurt" )
RemapSoundEvent( "dontstarve/characters/plutia/talk_LP", "plutia/sound/talk_LP" )

RemapSoundEvent( "dontstarve/characters/iris/death_voice", "iris/sound/death_voice" )
RemapSoundEvent( "dontstarve/characters/iris/hurt", "iris/sound/hurt" )
RemapSoundEvent( "dontstarve/characters/iris/talk_LP", "iris/sound/talk_LP" )

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
local resolvefilepath = GLOBAL.resolvefilepath

local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local Recipe = GLOBAL.Recipe
local TECH = GLOBAL.TECH

GLOBAL.TUNING.PLUTIA = {}
GLOBAL.TUNING.PLUTIA.KEYTHREE = GetModConfigData("key3") or 122

--Transformation

local function IrisFn(inst)

local player = GLOBAL.ThePlayer

if inst:HasTag("playerghost") then return end
if inst.transformed then
inst.AnimState:SetBuild("plutia")
	inst.SoundEmitter:PlaySound("dontstarve/sanity/creature2/taunt")
	local x, y, z = inst.Transform:GetWorldPosition()
	local fx = SpawnPrefab("lightning")
	fx.Transform:SetPosition(x, y, z)
	SpawnPrefab("statue_transition").Transform:SetPosition(inst:GetPosition():Get())
inst.components.locomotor.walkspeed = 6
inst.components.locomotor.runspeed = 8.5
inst.components.health.absorb = 0.10
inst.components.combat.damagemultiplier = 1
inst.Transform:SetScale(0.8, 0.8, 0.8)
inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE)
inst.soundsname = "plutia"

inst.components.talker:Say("Poiiiiiiiiiiiiiiii!", 2.5,true) 

else
inst.AnimState:SetBuild("irisheart")
	inst.SoundEmitter:PlaySound("dontstarve/sanity/creature2/taunt")
	local x, y, z = inst.Transform:GetWorldPosition()
	local fx = SpawnPrefab("lightning")
	fx.Transform:SetPosition(x, y, z)
	SpawnPrefab("statue_transition_2").Transform:SetPosition(inst:GetPosition():Get())
inst.components.locomotor.walkspeed = 7
inst.components.locomotor.runspeed = 9.5
inst.components.health.absorb = 0.80
inst.components.combat.damagemultiplier = 1.5
inst.Transform:SetScale(1, 1, 1)
inst.components.hunger:SetRate(1)
inst.soundsname = "iris"

inst.components.talker:Say("I have business to attend to.", 2.5,true) 


end
 
inst.transformed = not inst.transformed

inst.components.health:DoDelta(-20)
return true
 
end
 
AddModRPCHandler("Plutia", "IRIS", IrisFn)

--Max Health Penalty
local function HealthPostInit(self)
	local OldRecalculatePenalty = self.RecalculatePenalty
	local function RecalculatePenalty(self, forceupdatewidget)
		local mult = GLOBAL.TUNING.REVIVE_HEALTH_PENALTY_AS_MULTIPLE_OF_EFFIGY
		mult = mult * GLOBAL.TUNING.EFFIGY_HEALTH_PENALTY
		local maxrevives = (self.maxhealth - 50)/mult
		if self.numrevives > maxrevives then
			self.numrevives = maxrevives
		end
		OldRecalculatePenalty(self, forceupdatewidget)
	end
	self.RecalculatePenalty = RecalculatePenalty
end

AddComponentPostInit('health', HealthPostInit) 

-- Custom items
STRINGS.NAMES.PERSONAL_DOGOO = "Personal Dogoo"
STRINGS.NAMES.PERSONAL_DOGOO_EYEBONE = "Personal Dogoo Bone"

GLOBAL.STRINGS.NAMES.GALIENTSWORD = "Éß±Þ½£" 
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.GALIENTSWORD = "A dangerous weapon of a sadist!"

GLOBAL.STRINGS.NAMES.BALLOON2 = "Pseudo Wes Balloon" 
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.BALLOON2 = "Not good as the actual Wes's Balloons, but it'll do."

GLOBAL.STRINGS.NAMES.GHOST2 = "Pseudo Abigail Ghost" 
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.GHOST2 = "It's a fake Abigail ghost. It's less cute."

-- Custom Items dolls
STRINGS.RECIPE_DESC.WILSONDOLL = "A doll of a Scientist!" 
STRINGS.RECIPE_DESC.WXDOLL = "A robot-like doll!"
STRINGS.RECIPE_DESC.WILLOWDOLL = "A firey cute doll!" 
STRINGS.RECIPE_DESC.WENDYDOLL = "A pessimistic doll!"
STRINGS.RECIPE_DESC.WICKERDOLL = "An insomniac doll!"
STRINGS.RECIPE_DESC.WOLFGANGDOLL = "A mighty stuffed doll!"
STRINGS.RECIPE_DESC.WOODIEDOLL = "A Wooden Doll!"
STRINGS.RECIPE_DESC.WEBBERDOLL = "A Sticky and Web-like doll!" 
STRINGS.RECIPE_DESC.WAXWELLDOLL = "A doll with ill intent?!"
STRINGS.RECIPE_DESC.WIGFRIDDOLL = "This doll is just acting!"
STRINGS.RECIPE_DESC.WESDOLL = "A doll with a pale face!"

GLOBAL.STRINGS.NAMES.WILSONDOLL = "Íþ¶ûÑ·ÍÞÍÞ"
GLOBAL.STRINGS.NAMES.WXDOLL = "»úÆ÷ÈËÍÞÍÞ"
GLOBAL.STRINGS.NAMES.WILLOWDOLL = "»ðÅ®ÍÞÍÞ"
GLOBAL.STRINGS.NAMES.WENDYDOLL = "ÎÂµÏÍÞÍÞ"
GLOBAL.STRINGS.NAMES.WICKERDOLL = "ÀÏÄÌÄÌÍÞÍÞ"
GLOBAL.STRINGS.NAMES.WOLFGANGDOLL = "ÎÖ¶û·ò¸ÔÍÞÍÞ"
GLOBAL.STRINGS.NAMES.WOODIEDOLL = "·¥Ä¾¹¤ÍÞÍÞ"
GLOBAL.STRINGS.NAMES.WEBBERDOLL = "Ö©ÖëÈËÍÞÍÞ"
GLOBAL.STRINGS.NAMES.WAXWELLDOLL = "Âó¿ËË¹Íþ¶ûÍÞÍÞ"
GLOBAL.STRINGS.NAMES.WIGFRIDDOLL = "Å®ÎäÉñÍÞÍÞ"
GLOBAL.STRINGS.NAMES.WESDOLL= "Ð¡³óÍÞÍÞ"

GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.WILSONDOLL = "A cute snuggly scientist!"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.WXDOLL = "Cold yet loving robot!"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.WILLOWDOLL = "I feel warm just looking at it!"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.WENDYDOLL = "Gloomy yet loving lolita!"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.WICKERDOLL = "Can't sleep with this one..."
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.WOLFGANGDOLL = "It's stuffed with meat!"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.WOODIEDOLL = "I swear this doll transforms sometimes..."
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.WEBBERDOLL = "It's sticky to the touch! Yuck!"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.WAXWELLDOLL = "This doll says to bring misfortune to other dolls.."
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.WIGFRIDDOLL = "Crafted with Heroic Spirit, Bravery, and Plunder!"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.WESDOLL = "This doll is eerily silent. For a doll that is!"

--Mini Maps
AddMinimapAtlas("images/inventoryimages/galientsword.xml")
AddMinimapAtlas("images/inventoryimages/personal_dogoo.xml")
AddMinimapAtlas("images/inventoryimages/wilsondoll.xml")
AddMinimapAtlas("images/inventoryimages/willowdoll.xml")
AddMinimapAtlas("images/inventoryimages/wickerdoll.xml")
AddMinimapAtlas("images/inventoryimages/wolfgangdoll.xml")
AddMinimapAtlas("images/inventoryimages/wxdoll.xml")
AddMinimapAtlas("images/inventoryimages/wendydoll.xml")
AddMinimapAtlas("images/inventoryimages/woodiedoll.xml")
AddMinimapAtlas("images/inventoryimages/webberdoll.xml")
AddMinimapAtlas("images/inventoryimages/waxwelldoll.xml")
AddMinimapAtlas("images/inventoryimages/wigfriddoll.xml")
AddMinimapAtlas("images/inventoryimages/wesdoll.xml")

-- An dogoobone is given every time player is spawned/loaded. It's not saved
local function GiveDogoobone(inst)
	local dogoobone = GLOBAL.SpawnPrefab("personal_dogoo_eyebone")
	if dogoobone then
		dogoobone.owner = inst
		inst.dogoobone = dogoobone
		inst.components.inventory.ignoresound = true
		inst.components.inventory:GiveItem(dogoobone)
		inst.components.inventory.ignoresound = false
		dogoobone.components.named:SetName(inst.name.."'s Dogoo Bone")
	return dogoobone
	end
end
local function GetSpawnPoint(pt)
	local theta = math.random() * 2 * GLOBAL.PI
	local radius = 4
	local offset = GLOBAL.FindWalkableOffset(pt, theta, radius, 12, true)
	return offset ~= nil and (pt + offset) or nil
end
local function PersonalDogoo(inst)
	if not inst:HasTag("specialdogooowner") then
		return
	end

	local OnDespawn_prev = inst.OnDespawn
	local OnDespawn_new = function(inst)
		-- Remove dogoo
		if inst.dogoo then
			-- Don't allow dogoo to despawn with irreplaceable items
			inst.dogoo.components.container:DropEverythingWithTag("irreplaceable")
			
			-- We need time to save before despawning.
			inst.dogoo:DoTaskInTime(0.1, function(inst)
				if inst and inst:IsValid() then
					inst:Remove()
				end
			end)
			
		end
		
		if inst.dogoobone then
			-- Dogoobone drops from whatever its in
			local owner = inst.dogoobone.components.inventoryitem.owner
			if owner then
				if owner.components.container then
					owner.components.container:DropItem(inst.dogoobone)
				elseif owner.components.inventory then
					owner.components.inventory:DropItem(inst.dogoobone)
				end
			end
			-- Remove dogoobone
			inst.dogoobone:DoTaskInTime(0.1, function(inst)
				if inst and inst:IsValid() then
					inst:Remove()
				end
			end)
		else
			print("Error: Player has no linked dogoobone!")
		end
		if OnDespawn_prev then
			return OnDespawn_prev(inst)
		end
	end
	inst.OnDespawn = OnDespawn_new
	
	local OnSave_prev = inst.OnSave
	local OnSave_new = function(inst, data)
		local references = OnSave_prev and OnSave_prev(inst, data)
		if inst.dogoo then
			-- Save dogoo
			local refs = {}
			if not references then
				references = {}
			end
			data.dogoo, refs = inst.dogoo:GetSaveRecord()
			if refs then
				for k,v in pairs(refs) do
					table.insert(references, v)
				end 
			end				
		end
		if inst.dogoobone then
			-- Save dogoobone
			local refs = {}
			if not references then
				references = {}
			end
			data.dogoobone, refs = inst.dogoobone:GetSaveRecord()
			if refs then
				for k,v in pairs(refs) do
					table.insert(references, v)
				end 
			end	
		end
		return references
	end
    inst.OnSave = OnSave_new
	
	local OnLoad_prev = inst.OnLoad
	local OnLoad_new = function(inst, data, newents)
		if data.dogoo ~= nil then
			-- Load dogoo
			inst.dogoo = GLOBAL.SpawnSaveRecord(data.dogoo, newents)
		else
			--print("Warning: No dogoo was loaded from save file!")
		end
		
		if data.dogoobone ~= nil then
			-- Load dogoo
			inst.dogoobone = GLOBAL.SpawnSaveRecord(data.dogoobone, newents)
			
			-- Look for dogoobone at spawn point and re-equip
			inst:DoTaskInTime(0, function(inst)
				if inst.dogoobone and inst:IsNear(inst.dogoobone,4) then
					inst.components.inventory:GiveItem(inst.dogoobone)
				end
			end)
		else
			print("Warning: No dogoobone was loaded from save file!")
		end
		
		-- Create new dogoobone if none loaded
		if not inst.dogoobone then
			GiveDogoobone(inst)
		end
		
		inst.dogoobone.owner = inst
		
		
		if OnLoad_prev then
			return OnLoad_prev(inst, data, newents)
		end
	end
    inst.OnLoad = OnLoad_new
	
	local OnNewSpawn_prev = inst.OnNewSpawn
	local OnNewSpawn_new = function(inst)
		-- Give new dogoobone. Let dogoo spawn naturally.
		GiveDogoobone(inst)
		if OnNewSpawn_prev then
			return OnNewSpawn_prev(inst)
		end
	end
    inst.OnNewSpawn = OnNewSpawn_new
	
	if GLOBAL.TheNet:GetServerGameMode() == "wilderness" then
		local function ondeath(inst, data)
			-- Kill player's dogoo in wilderness mode :(
			if inst.dogoo then
				inst.dogoo.components.health:Kill()
			end
			if inst.dogoobone then
				inst.dogoobone:Remove()
			end
		end
		inst:ListenForEvent("death", ondeath)
	end
	
	-- Debug function to return dogoobone
	inst.ReturnDogoobone = function()
		if inst.dogoobone and inst.dogoobone:IsValid() then
			if inst.dogoobone.components.inventoryitem.owner ~= inst then
				inst.components.inventory:GiveItem(inst.dogoobone)
			end
		else
			GiveDogoobone(inst)
		end
		if inst.dogoo and not inst:IsNear(inst.dogoo, 20) then
			local pt = inst:GetPosition()
			local spawn_pt = GetSpawnPoint(pt)
			if spawn_pt ~= nil then
				inst.dogoo.Physics:Teleport(spawn_pt:Get())
				inst.dogoo:FacePoint(pt:Get())
			end
		end
	end
end

GLOBAL.c_returndogoobone = function(inst)
	if not inst then
		inst = GLOBAL.ThePlayer or GLOBAL.AllPlayers[1]
	end
	if not inst or not inst.ReturnDogoobone then 
		print("Error: Cannot return dogoobone")
		return 
	end
	inst:ReturnDogoobone()
end

AddPlayerPostInit(PersonalDogoo)

--No One Enters Chester cept the one with the dogoo bone!

local function HasDogooBone(doer)
    if doer.components.inventory and doer.components.inventory:FindItem(function(item)
            if item.prefab == "personal_dogoo_eyebone" then return true end
        end) ~= nil then
        return true
    else
        return false
    end
end
 
local oldACTIONSTORE = GLOBAL.ACTIONS.STORE.fn
GLOBAL.ACTIONS.STORE.fn = function(act)
    if act.target and act.target.prefab == "personal_dogoo" and act.target.components.container ~= nil and act.invobject.components.inventoryitem ~= nil and act.doer.components.inventory ~= nil then
        print(act.doer.name,"is trying to do something with a Dogoo")
        if HasDogooBone(act.doer) then
            print(act.doer.name,"has Dogoo Bone, proceed")
            return oldACTIONSTORE(act)
        else
            print(act.doer.name,"doesn't has the Dogoo Bone, exit")
            if act.doer.components.talker then act.doer.components.talker:Say("No Can Do!") end
                        return true
        end
    else
        return oldACTIONSTORE(act)
    end
end

local old_RUMMAGE = GLOBAL.ACTIONS.RUMMAGE.fn 
GLOBAL.ACTIONS.RUMMAGE.fn = function(act)
    if act.target and act.target.prefab == "personal_dogoo" then  
        print("GLOBAL.ACTIONS.RUMMAGE--"..tostring(act.doer.components.inventory))
        result = act.doer.components.inventory:FindItem(function(item)
            if item.prefab == "personal_dogoo_eyebone" then 
               print("GLOBAL.ACTIONS.RUMMAGE--"..tostring(item).."--ok--") 
               return true
            end
        end)
        if result then 
            return old_RUMMAGE(act)
        else
            print("GLOBAL.ACTIONS.RUMMAGE--"..tostring(item).."--fail--") 
            act.doer:DoTaskInTime(1, function ()
                act.doer.components.talker:Say("No Can Do!")
            end)
            return false
        end
    else
        return old_RUMMAGE(act)
    end
end

--Plutia Tab

plutiastab = AddRecipeTab("Plutia", 998, "images/hud/plutiatab.xml", "plutiatab.tex", "plutiabuilder")

--Plutia Recipes

local wilsondoll_recipe = AddRecipe("wilsondoll",
{GLOBAL.Ingredient("beefalowool", 4), GLOBAL.Ingredient("silk", 2)},
plutiastab, TECH.NONE,
nil, nil, nil, nil, nil,
"images/inventoryimages/wilsondoll.xml", "wilsondoll.tex")
wilsondoll_recipe.tagneeded = false
wilsondoll_recipe.builder_tag = "plutiabuilder"

local willowdoll_recipe = AddRecipe("willowdoll",
{GLOBAL.Ingredient("beefalowool", 4), GLOBAL.Ingredient("silk", 2), GLOBAL.Ingredient("charcoal", 1)},
plutiastab, TECH.NONE,
nil, nil, nil, nil, nil,
"images/inventoryimages/willowdoll.xml", "willowdoll.tex")
willowdoll_recipe.tagneeded = false
willowdoll_recipe.builder_tag = "plutiabuilder"

local wendydoll_recipe = AddRecipe("wendydoll",
{GLOBAL.Ingredient("beefalowool", 4), GLOBAL.Ingredient("silk", 2), GLOBAL.Ingredient("petals", 3)},
plutiastab, TECH.NONE,
nil, nil, nil, nil, nil,
"images/inventoryimages/wendydoll.xml", "wendydoll.tex")
wendydoll_recipe.tagneeded = false
wendydoll_recipe.builder_tag = "plutiabuilder"

local wxdoll_recipe = AddRecipe("wxdoll",
{GLOBAL.Ingredient("beefalowool", 4), GLOBAL.Ingredient("silk", 2), GLOBAL.Ingredient("goldnugget", 1)},
plutiastab, TECH.NONE,
nil, nil, nil, nil, nil,
"images/inventoryimages/wxdoll.xml", "wxdoll.tex")
wxdoll_recipe.tagneeded = false
wxdoll_recipe.builder_tag = "plutiabuilder"

local wickerdoll_recipe = AddRecipe("wickerdoll",
{GLOBAL.Ingredient("beefalowool", 4), GLOBAL.Ingredient("silk", 2), GLOBAL.Ingredient("papyrus", 1)},
plutiastab, TECH.NONE,
nil, nil, nil, nil, nil,
"images/inventoryimages/wickerdoll.xml", "wickerdoll.tex")
wickerdoll_recipe.tagneeded = false
wickerdoll_recipe.builder_tag = "plutiabuilder"

local wolfgangdoll_recipe = AddRecipe("wolfgangdoll",
{GLOBAL.Ingredient("beefalowool", 4), GLOBAL.Ingredient("silk", 2), GLOBAL.Ingredient("meat", 1)},
plutiastab, TECH.NONE,
nil, nil, nil, nil, nil,
"images/inventoryimages/wolfgangdoll.xml", "wolfgangdoll.tex")
wolfgangdoll_recipe.tagneeded = false
wolfgangdoll_recipe.builder_tag = "plutiabuilder"

local wigfriddoll_recipe = AddRecipe("wigfriddoll",
{GLOBAL.Ingredient("beefalowool", 4), GLOBAL.Ingredient("silk", 2), GLOBAL.Ingredient("footballhat", 1), GLOBAL.Ingredient("armorwood", 1)},
plutiastab, TECH.NONE,
nil, nil, nil, nil, nil,
"images/inventoryimages/wigfriddoll.xml", "wigfriddoll.tex")
wigfriddoll_recipe.tagneeded = false
wigfriddoll_recipe.builder_tag = "plutiabuilder"

local waxwelldoll_recipe = AddRecipe("waxwelldoll",
{GLOBAL.Ingredient("beefalowool", 4), GLOBAL.Ingredient("silk", 2), GLOBAL.Ingredient("nightmarefuel", 12)},
plutiastab, TECH.NONE,
nil, nil, nil, nil, nil,
"images/inventoryimages/waxwelldoll.xml", "waxwelldoll.tex")
waxwelldoll_recipe.tagneeded = false
waxwelldoll_recipe.builder_tag = "plutiabuilder"

local woodiedoll_recipe = AddRecipe("woodiedoll",
{GLOBAL.Ingredient("beefalowool", 4), GLOBAL.Ingredient("silk", 2), GLOBAL.Ingredient("log", 20)},
plutiastab, TECH.NONE,
nil, nil, nil, nil, nil,
"images/inventoryimages/woodiedoll.xml", "woodiedoll.tex")
woodiedoll_recipe.tagneeded = false
woodiedoll_recipe.builder_tag = "plutiabuilder"

local webberdoll_recipe = AddRecipe("webberdoll",
{GLOBAL.Ingredient("beefalowool", 4), GLOBAL.Ingredient("silk", 6)},
plutiastab, TECH.NONE,
nil, nil, nil, nil, nil,
"images/inventoryimages/webberdoll.xml", "webberdoll.tex")
webberdoll_recipe.tagneeded = false
webberdoll_recipe.builder_tag = "plutiabuilder"

local wesdoll_recipe = AddRecipe("wesdoll",
{GLOBAL.Ingredient("beefalowool", 4), GLOBAL.Ingredient("silk", 2)},
plutiastab, TECH.NONE,
nil, nil, nil, nil, nil,
"images/inventoryimages/wesdoll.xml", "wesdoll.tex")
wesdoll_recipe.tagneeded = false
wesdoll_recipe.builder_tag = "plutiabuilder"



-- The character select screen lines
STRINGS.CHARACTER_TITLES.plutia = "ÆÕÂ³Â¶ÌØ"
STRINGS.CHARACTER_NAMES.plutia = "Plutia"
STRINGS.CHARACTER_DESCRIPTIONS.plutia = "*³¬´ÎÔªÓÎÏ·º£ÍõÐÇ.Å®Éñ\n*ÎÒÏëË¯»á,ÎÒÓÐºÜ¶àÐ¡»ï°é\n*Å°´ý¿ñ£¨ÈË¸ñ·ÖÁÑ£©"	
STRINGS.CHARACTER_QUOTES.plutia = "\"ÄÜ²»ÄÜÈÃÎÒ¶àÍæÒ»»áÄØ£¬ÍæÍêÁËÔÚÉ±ËÀÄã...\""

-- Custom speech strings
STRINGS.CHARACTERS.PLUTIA = require "speech_plutia"

-- The character's name as appears in-game 
STRINGS.NAMES.PLUTIA = "Plutia"

-- The default responses of examining the character
STRINGS.CHARACTERS.GENERIC.DESCRIBE.PLUTIA = 
{
	GENERIC = "It's Plutia!",
	ATTACKER = "That Plutia looks shifty...",
	MURDERER = "Murderer!",
	REVIVER = "Plutia, friend of ghosts.",
	GHOST = "Plutia could use a heart.",
}


AddMinimapAtlas("images/map_icons/plutia.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("plutia", "FEMALE")

