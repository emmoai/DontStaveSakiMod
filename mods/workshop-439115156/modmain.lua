-----------
local require = GLOBAL.require
local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
Recipe = GLOBAL.Recipe
local STRINGS = GLOBAL.STRINGS
local ACTIONS = GLOBAL.ACTIONS
TECH = GLOBAL.TECH
local IsServer = GLOBAL.TheNet:GetIsServer()
local containers = require("containers")
ACTIONS.GIVE.priority = 3
ACTIONS.ADDFUEL.priority = 4
local ThePlayer = GLOBAL.ThePlayer
-----------
local TheInput = GLOBAL.TheInput
local IsServer = GLOBAL.TheNet:GetIsServer()
-----------specific
modimport("libs/env.lua")
use "data/actions/init"
use "data/components/init"
-----------
local oldwidgetsetup = containers.widgetsetup
containers.widgetsetup = function(container, prefab)
if not prefab and container.inst.prefab == "armor_mushaa" then
prefab = "icepack" end
if not prefab and container.inst.prefab == "broken_frosthammer" then
prefab = "piggyback" end
if not prefab and container.inst.prefab == "armor_mushab" then
prefab = "piggyback" end
  if not prefab and container.inst.prefab == "musha_tall3" then  prefab = "chester" end   if not prefab and container.inst.prefab == "musha_tallrrr1" then  prefab = "chester" end   if not prefab and container.inst.prefab == "musha_tallrrr2" then  prefab = "chester" end   if not prefab and container.inst.prefab == "musha_tallrrr3" then  prefab = "chester" end   if not prefab and container.inst.prefab == "musha_tallrrr4" then  prefab = "chester" end   if not prefab and container.inst.prefab == "musha_tallrrr5" then  prefab = "chester" end   if not prefab and container.inst.prefab == "musha_tallrrrice" then  prefab = "chester" end 
oldwidgetsetup(container, prefab)
end
 
PrefabFiles = {
"musha",
"mushasword_frost",
"mushasword_base",
"mushasword",
"frosthammer",
"tentacle_frost",
"broken_frosthammer",
"armor_mushaa",
"armor_mushab",
"hat_mprincess",
"hat_mbunny",
"hat_mphoenix",
"musha_flute",

"musha_small",
"musha_egg",
"musha_egg1",
"musha_egg2",
"musha_egg3",
"musha_eggs1",
"musha_eggs2",
"musha_eggs3",
"musha_egg8",

"ghosthound",	
"ghosthound2",	
"shadowmusha",

"cristal",
"forcefieldfxx",
"glowdust"
}
Assets = {
Asset( "ANIM", "anim/musha_normal.zip"),
Asset( "ANIM", "anim/musha_battle.zip"),
Asset( "ANIM", "anim/musha.zip"),
Asset( "ANIM", "anim/musha_hunger.zip"),
Asset( "ANIM", "anim/musha_hunger.zip"),

Asset("ANIM", "anim/musha_egg8.zip"),
Asset("ANIM", "anim/musha_egg.zip"),
Asset("ANIM", "anim/musha_egg1.zip"),
Asset("ANIM", "anim/musha_egg2.zip"),
Asset("ANIM", "anim/musha_egg3.zip"),
Asset("ANIM", "anim/musha_eggs1.zip"),
Asset("ANIM", "anim/musha_eggs2.zip"),
Asset("ANIM", "anim/musha_eggs3.zip"),
Asset("ANIM", "anim/musha_ice.zip"),
Asset("ANIM", "anim/musha_small.zip"),
Asset("ANIM", "anim/musha_teen.zip"),
Asset("ANIM", "anim/musha_tall.zip"),
Asset("ANIM", "anim/musha_tall2.zip"),
Asset("ANIM", "anim/musha_tall3.zip"),
Asset("ANIM", "anim/musha_tall4.zip"),
Asset("ANIM", "anim/musha_tall5.zip"),

Asset("ANIM", "anim/frosthammer.zip"),
Asset("ANIM", "anim/swap_frosthammer.zip"),
Asset("ANIM", "anim/broken_frosthammer.zip"),
Asset("ANIM", "anim/swap_frostback.zip"),
Asset("ANIM", "anim/swap_frostpocket.zip"),
Asset("ANIM", "anim/hat_mbunny.zip"),
Asset("ANIM", "anim/hat_mbunny2.zip"),
Asset("ANIM", "anim/hat_mphoenix.zip"),
Asset("ANIM", "anim/hat_mphoenix2.zip"),
Asset("ANIM", "anim/hat_mcrown.zip"),
Asset("ANIM", "anim/hat_mprincess.zip"),
Asset("ANIM", "anim/ghosthound.zip"),
Asset("ANIM", "anim/armor_mushaa.zip"),
Asset("ANIM", "anim/armor_mushab.zip"),
--box 

Asset("ANIM", "anim/ui_chest_yamche0.zip"),
Asset("ANIM", "anim/ui_chest_yamche1.zip"),
Asset("ANIM", "anim/ui_chest_yamche2.zip"),
Asset("ANIM", "anim/hat_yamche.zip"),
Asset("ANIM", "anim/ui_frostsmall.zip"),
Asset("ANIM", "anim/ui_chest_frosthammer.zip"),
Asset("ANIM", "anim/ui_chest_frosthammer2.zip"),
Asset("ANIM", "anim/ui_mushab_2x3.zip"),

Asset("ANIM", "anim/forcefieldx.zip"),
Asset("ANIM", "anim/glowdust.zip"),
Asset("ANIM", "anim/cristal.zip"),
Asset("ANIM", "anim/exp.zip"),
Asset("ANIM", "anim/musha_flute.zip"),
Asset("ANIM", "anim/mushasword_base.zip"),
Asset("ANIM", "anim/mushasword_frost.zip"),
Asset("ANIM", "anim/mushasword.zip"),
Asset("ANIM", "anim/mushasword2.zip"),
Asset("ANIM", "anim/mushasword3.zip"),
Asset("ANIM", "anim/mushasword4.zip"),
Asset("ANIM", "anim/swap_mushasword_base.zip"),
Asset("ANIM", "anim/swap_mushasword_frost1.zip"),
Asset("ANIM", "anim/swap_mushasword_frost2.zip"),
Asset("ANIM", "anim/swap_mushasword_frost3.zip"),
Asset("ANIM", "anim/swap_mushasword.zip"),
Asset("ANIM", "anim/swap_mushasword2.zip"),
Asset("ANIM", "anim/swap_mushasword3.zip"),
Asset("ANIM", "anim/swap_mushasword4.zip"),
Asset("ANIM", "anim/tentacle_frost.zip"),
Asset("IMAGE", "images/inventoryimages/musha_egg.tex"),
Asset("IMAGE", "images/inventoryimages/musha_egg1.tex"),
Asset("IMAGE", "images/inventoryimages/musha_egg2.tex"),
Asset("IMAGE", "images/inventoryimages/musha_egg3.tex"),
Asset("IMAGE", "images/inventoryimages/musha_eggs1.tex"),
Asset("IMAGE", "images/inventoryimages/musha_eggs2.tex"),
Asset("IMAGE", "images/inventoryimages/musha_eggs3.tex"),
Asset("IMAGE", "images/inventoryimages/musha_egg_cracked.tex"),
Asset("IMAGE", "images/inventoryimages/musha_egg_cracked1.tex"),
Asset("IMAGE", "images/inventoryimages/musha_egg_cracked2.tex"),
Asset("IMAGE", "images/inventoryimages/musha_egg_cracked3.tex"),
Asset("IMAGE", "images/inventoryimages/musha_egg_crackeds1.tex"),
Asset("IMAGE", "images/inventoryimages/musha_egg_crackeds2.tex"),
Asset("IMAGE", "images/inventoryimages/musha_egg_crackeds3.tex"),
Asset("IMAGE", "images/inventoryimages/musha_egg_cooked.tex"),
Asset("IMAGE", "images/inventoryimages/musha_egg8.tex"),
Asset("IMAGE", "images/inventoryimages/musha_egg_cracked8.tex"),
Asset("IMAGE", "images/inventoryimages/musha_small.tex"),
Asset("IMAGE", "images/inventoryimages/musha_teen.tex"),
Asset("IMAGE", "images/inventoryimages/musha_tall.tex"),
Asset("IMAGE", "images/inventoryimages/frosthammer.tex"),
Asset("IMAGE", "images/inventoryimages/broken_frosthammer.tex"),
Asset("IMAGE", "images/inventoryimages/frostback.tex"),
Asset("IMAGE", "images/inventoryimages/hat_mbunny.tex"),
Asset("IMAGE", "images/inventoryimages/hat_mphoenix.tex"),
Asset("IMAGE", "images/inventoryimages/hat_mcrown.tex"),
Asset("IMAGE", "images/inventoryimages/hat_mprincess.tex"),
Asset("IMAGE", "images/inventoryimages/armor_mushaa.tex"),
Asset("IMAGE", "images/inventoryimages/armor_mushab.tex"),
Asset("IMAGE", "images/inventoryimages/musha_flute.tex"),
Asset("IMAGE", "images/inventoryimages/mushasword_base.tex"),
Asset("IMAGE", "images/inventoryimages/mushasword_frost.tex"),
Asset("IMAGE", "images/inventoryimages/mushasword.tex"),
Asset("IMAGE", "images/inventoryimages/mushasword2.tex"),
Asset("IMAGE", "images/inventoryimages/mushasword3.tex"),
Asset("IMAGE", "images/inventoryimages/mushasword4.tex"),
Asset("IMAGE", "images/inventoryimages/blade_b.tex"),
Asset("IMAGE", "images/inventoryimages/blade_1.tex"),
Asset("IMAGE", "images/inventoryimages/blade_2.tex"),
Asset("IMAGE", "images/inventoryimages/blade_3.tex"),
Asset("IMAGE", "images/inventoryimages/blade_4.tex"),
Asset("IMAGE", "images/inventoryimages/blade_f.tex"),
Asset("IMAGE", "images/inventoryimages/glowdust.tex"),
Asset("IMAGE", "images/inventoryimages/cristal.tex"),
Asset("IMAGE", "images/inventoryimages/exp.tex"),
Asset("ATLAS", "images/inventoryimages/frosthammer.xml"),
Asset("ATLAS", "images/inventoryimages/broken_frosthammer.xml"),
Asset("ATLAS", "images/inventoryimages/hat_mbunny.xml"),
Asset("ATLAS", "images/inventoryimages/hat_mcrown.xml"),
Asset("ATLAS", "images/inventoryimages/hat_mprincess.xml"),
Asset("ATLAS", "images/inventoryimages/armor_mushaa.xml"),
Asset("ATLAS", "images/inventoryimages/armor_mushab.xml"),
Asset("ATLAS", "images/inventoryimages/musha_flute.xml"),
Asset("ATLAS", "images/inventoryimages/mushasword_base.xml"),
Asset("ATLAS", "images/inventoryimages/mushasword.xml"),
Asset("ATLAS", "images/inventoryimages/mushasword2.xml"),
Asset("ATLAS", "images/inventoryimages/mushasword3.xml"),
Asset("ATLAS", "images/inventoryimages/mushasword4.xml"),
Asset("ATLAS", "images/inventoryimages/blade_f.xml"),
Asset("ATLAS", "images/inventoryimages/blade_b.xml"),
Asset("ATLAS", "images/inventoryimages/blade_1.xml"),
Asset("ATLAS", "images/inventoryimages/blade_2.xml"),
Asset("ATLAS", "images/inventoryimages/blade_3.xml"),
Asset("ATLAS", "images/inventoryimages/blade_4.xml"),
Asset("ATLAS", "images/musha.xml"),
Asset("ATLAS", "images/mushas.xml"),
Asset( "ATLAS", "images/saveslot_portraits/musha.xml" ),
Asset( "ATLAS", "images/selectscreen_portraits/musha.xml" ),
Asset( "ATLAS", "images/selectscreen_portraits/musha_silho.xml" ),
Asset( "ATLAS", "bigportraits/musha.xml" ),
Asset("ATLAS", "images/inventoryimages/frosthammer.xml"),
Asset("ATLAS", "images/inventoryimages/broken_frosthammer.xml"),
Asset("ATLAS", "images/inventoryimages/frostback.xml"),
Asset("ATLAS", "images/inventoryimages/hat_mbunny.xml"),
Asset("ATLAS", "images/inventoryimages/hat_mphoenix.xml"),
Asset("ATLAS", "images/inventoryimages/hat_mcrown.xml"),
Asset("ATLAS", "images/inventoryimages/hat_mprincess.xml"),
Asset("ATLAS", "images/inventoryimages/armor_mushaa.xml"),
Asset("ATLAS", "images/inventoryimages/armor_mushab.xml"),
Asset("ATLAS", "images/inventoryimages/musha_flute.xml"),
Asset("ATLAS", "images/inventoryimages/mushasword_base.xml"),
Asset("ATLAS", "images/inventoryimages/mushasword_frost.xml"),
Asset("ATLAS", "images/inventoryimages/mushasword.xml"),
Asset("ATLAS", "images/inventoryimages/mushasword2.xml"),
Asset("ATLAS", "images/inventoryimages/mushasword3.xml"),
Asset("ATLAS", "images/inventoryimages/mushasword4.xml"),
Asset("ATLAS", "images/inventoryimages/blade_b.xml"),
Asset("ATLAS", "images/inventoryimages/blade_1.xml"),
Asset("ATLAS", "images/inventoryimages/blade_2.xml"),
Asset("ATLAS", "images/inventoryimages/blade_3.xml"),
Asset("ATLAS", "images/inventoryimages/blade_4.xml"),
Asset("ATLAS", "images/inventoryimages/musha_egg8.xml"),
Asset("ATLAS", "images/inventoryimages/musha_egg_cracked8.xml"),
Asset("ATLAS", "images/inventoryimages/musha_egg.xml"),
Asset("ATLAS", "images/inventoryimages/musha_egg1.xml"),
Asset("ATLAS", "images/inventoryimages/musha_egg2.xml"),
Asset("ATLAS", "images/inventoryimages/musha_egg3.xml"),
Asset("ATLAS", "images/inventoryimages/musha_egg_cracked.xml"),
Asset("ATLAS", "images/inventoryimages/musha_egg_cracked1.xml"),
Asset("ATLAS", "images/inventoryimages/musha_egg_cracked2.xml"),
Asset("ATLAS", "images/inventoryimages/musha_egg_cracked3.xml"),
Asset("ATLAS", "images/inventoryimages/musha_eggs1.xml"),
Asset("ATLAS", "images/inventoryimages/musha_eggs2.xml"),
Asset("ATLAS", "images/inventoryimages/musha_eggs3.xml"),
Asset("ATLAS", "images/inventoryimages/musha_egg_cracked.xml"),
Asset("ATLAS", "images/inventoryimages/musha_egg_crackeds1.xml"),
Asset("ATLAS", "images/inventoryimages/musha_egg_crackeds2.xml"),
Asset("ATLAS", "images/inventoryimages/musha_egg_crackeds3.xml"),
Asset("ATLAS", "images/inventoryimages/musha_egg_cooked.xml"),
Asset("ATLAS", "images/inventoryimages/musha_small.xml"),
Asset("ATLAS", "images/inventoryimages/musha_teen.xml"),
Asset("ATLAS", "images/inventoryimages/musha_tall.xml"),
Asset("ATLAS", "images/inventoryimages/glowdust.xml"),
Asset("ATLAS", "images/inventoryimages/cristal.xml"),
Asset("ATLAS", "images/inventoryimages/exp.xml"),
-----------------
Asset( "IMAGE", "images/saveslot_portraits/musha.tex"),
Asset( "ATLAS", "images/saveslot_portraits/musha.xml"),
Asset( "IMAGE", "images/saveslot_portraits/musha.tex" ),
Asset( "ATLAS", "images/saveslot_portraits/musha.xml" ),
Asset( "IMAGE", "images/selectscreen_portraits/musha.tex" ),
Asset( "ATLAS", "images/selectscreen_portraits/musha.xml" ),
Asset( "IMAGE", "bigportraits/musha.tex" ),
Asset( "ATLAS", "bigportraits/musha.xml" ),
Asset( "IMAGE", "images/musha.tex" ),
Asset( "ATLAS", "images/musha.xml" ),
Asset( "IMAGE", "images/avatars/avatar_musha.tex" ),
Asset( "ATLAS", "images/avatars/avatar_musha.xml" ),
Asset( "IMAGE", "images/avatars/avatar_ghost_musha.tex" ),
Asset( "ATLAS", "images/avatars/avatar_ghost_musha.xml" ),
}
AddMinimapAtlas("images/inventoryimages/hat_mphoenix.xml")
AddMinimapAtlas("images/inventoryimages/hat_mbunny.xml")
AddMinimapAtlas("images/inventoryimages/hat_mprincess.xml")
AddMinimapAtlas("images/inventoryimages/armor_mushaa.xml")
AddMinimapAtlas("images/inventoryimages/armor_mushab.xml")
AddMinimapAtlas("images/musha.xml")
AddMinimapAtlas("images/mushas.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg8.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg_cracked8.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg_cracked.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg1.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg_cracked1.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg2.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg_cracked2.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg3.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg_cracked3.xml")
AddMinimapAtlas("images/inventoryimages/musha_eggs1.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg_crackeds1.xml")
AddMinimapAtlas("images/inventoryimages/musha_eggs2.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg_crackeds2.xml")
AddMinimapAtlas("images/inventoryimages/musha_eggs3.xml")
AddMinimapAtlas("images/inventoryimages/musha_egg_crackeds3.xml")
AddMinimapAtlas("images/inventoryimages/musha_small.xml")
AddMinimapAtlas("images/inventoryimages/musha_teen.xml")
AddMinimapAtlas("images/inventoryimages/musha_tall.xml")
AddMinimapAtlas("images/inventoryimages/frosthammer.xml")
--AddMinimapAtlas("images/inventoryimages/frostback.xml")
AddMinimapAtlas("images/inventoryimages/broken_frosthammer.xml")
AddMinimapAtlas("images/inventoryimages/mushasword_base.xml")
AddMinimapAtlas("images/inventoryimages/mushasword.xml")
--AddMinimapAtlas("images/inventoryimages/mushasword2.xml")
--AddMinimapAtlas("images/inventoryimages/mushasword3.xml")
--AddMinimapAtlas("images/inventoryimages/mushasword4.xml")
AddMinimapAtlas("images/inventoryimages/blade_f.xml")
AddMinimapAtlas("images/inventoryimages/blade_b.xml")
AddMinimapAtlas("images/inventoryimages/blade_1.xml")
--AddMinimapAtlas("images/inventoryimages/blade_2.xml")
--AddMinimapAtlas("images/inventoryimages/blade_3.xml")
--AddMinimapAtlas("images/inventoryimages/blade_4.xml")
AddMinimapAtlas("images/inventoryimages/cristal.xml")
AddMinimapAtlas("images/inventoryimages/exp.xml")
------------------box
--small icebox1
local params = {}
local OVERRIDE_WIDGETSETUP = false
local containers_widgetsetup_base = containers.widgetsetup
function containers.widgetsetup(container, prefab)
    local t = params[prefab or container.inst.prefab]
    if t ~= nil then
        for k, v in pairs(t) do
            container[k] = v
        end
        container:SetNumSlots(container.widget.slotpos ~= nil and #container.widget.slotpos or 0)
        if OVERRIDE_WIDGETSETUP then
            container.type = "frostsmall"
        end
    else
        containers_widgetsetup_base(container, prefab)
    end
end
local function frostsmall()
    local container =
    {
        widget =
        {
            slotpos = {},
            animbank = "ui_backpack_2x4",
            animbuild = "ui_chest_frosthammer",
            pos = GLOBAL.Vector3(-5, 100, 0),
            side_align_tip = 160,
        },
		 issidewidget = true,
        type = "chest",
    }
    
	for y = 0, 1 do
		table.insert(container.widget.slotpos, GLOBAL.Vector3(-126, -y*75 + 114 ,-126 +75, -y*75 + 114 ))

end
    return container
end
params.frostsmall = frostsmall()
for k, v in pairs(params) do
    containers.MAXITEMSLOTS = math.max(containers.MAXITEMSLOTS, v.widget.slotpos ~= nil and #v.widget.slotpos or 0)
end
local containers_widgetsetup_custom = containers.widgetsetup
local MAXITEMSLOTS = containers.MAXITEMSLOTS
AddPrefabPostInit("world_network", function(inst)
    if containers.widgetsetup ~= containers_widgetsetup_custom then
        OVERRIDE_WIDGETSETUP = true
        local containers_widgetsetup_base2 = containers.widgetsetup
        function containers.widgetsetup(container, prefab)
            containers_widgetsetup_base2(container, prefab)
            if container.type == "frostsmall" then
                container.type = "chest"
            end end end
    if containers.MAXITEMSLOTS < MAXITEMSLOTS then
        containers.MAXITEMSLOTS = MAXITEMSLOTS
    end
end)

function params.frostsmall.itemtestfn(container, item, slot)
    return not item:HasTag("heatrock") 

end
--------------------------------------------------
--icebox1
local params = {}
local OVERRIDE_WIDGETSETUP = false
local containers_widgetsetup_base = containers.widgetsetup
function containers.widgetsetup(container, prefab)
    local t = params[prefab or container.inst.prefab]
    if t ~= nil then
        for k, v in pairs(t) do
            container[k] = v
        end
        container:SetNumSlots(container.widget.slotpos ~= nil and #container.widget.slotpos or 0)
        if OVERRIDE_WIDGETSETUP then
            container.type = "frostbox"
        end
    else
        containers_widgetsetup_base(container, prefab)
    end
end
local function frostbox()
    local container =
    {
        widget =
        {
            slotpos = {},
            animbank = "ui_backpack_2x4",
            animbuild = "ui_chest_frosthammer2",
            pos = GLOBAL.Vector3(-5, -70, 0),
            side_align_tip = 160,
        },
		 issidewidget = true,
			type = "pack",
    }
    	for y = 0, 4 do
	table.insert(container.widget.slotpos, GLOBAL.Vector3(-162, -y*58 + 124 ,0))
	table.insert(container.widget.slotpos, GLOBAL.Vector3(-162 +75, -y*58 + 124 ,0))

end
    return container
end
params.frostbox = frostbox()
for k, v in pairs(params) do
    containers.MAXITEMSLOTS = math.max(containers.MAXITEMSLOTS, v.widget.slotpos ~= nil and #v.widget.slotpos or 0)
end
local containers_widgetsetup_custom = containers.widgetsetup
local MAXITEMSLOTS = containers.MAXITEMSLOTS
AddPrefabPostInit("world_network", function(inst)
    if containers.widgetsetup ~= containers_widgetsetup_custom then
        OVERRIDE_WIDGETSETUP = true
        local containers_widgetsetup_base2 = containers.widgetsetup
        function containers.widgetsetup(container, prefab)
            containers_widgetsetup_base2(container, prefab)
            if container.type == "frostbox" then
                container.type = "pack"
            end end end
    if containers.MAXITEMSLOTS < MAXITEMSLOTS then
        containers.MAXITEMSLOTS = MAXITEMSLOTS
    end
end)

function params.frostbox.itemtestfn(container, item, slot)
    return not item:HasTag("heatrock") 

end
--------------------------------------------------

--box1
local params = {}
local OVERRIDE_WIDGETSETUP = false
local containers_widgetsetup_base = containers.widgetsetup
function containers.widgetsetup(container, prefab)
    local t = params[prefab or container.inst.prefab]
    if t ~= nil then
        for k, v in pairs(t) do
            container[k] = v
        end
        container:SetNumSlots(container.widget.slotpos ~= nil and #container.widget.slotpos or 0)
        if OVERRIDE_WIDGETSETUP then
            container.type = "chest_yamche0"
        end
    else
        containers_widgetsetup_base(container, prefab)
    end
end
local function chest_yamche0()
    local container =
    {
        widget =
        {
            slotpos = {},
            animbank = "ui_chest_3x2",
            animbuild = "ui_chest_yamche0",
            pos = GLOBAL.Vector3(0, 200, 0),
            side_align_tip = 160,
        },
        type = "chest",
    }
    for y = 1, 0, -1 do
        table.insert(container.widget.slotpos, GLOBAL.Vector3(74*y-74*2+70, 0))
 
end
    return container
end
params.chest_yamche0 = chest_yamche0()
for k, v in pairs(params) do
    containers.MAXITEMSLOTS = math.max(containers.MAXITEMSLOTS, v.widget.slotpos ~= nil and #v.widget.slotpos or 0)
end
local containers_widgetsetup_custom = containers.widgetsetup
local MAXITEMSLOTS = containers.MAXITEMSLOTS
AddPrefabPostInit("world_network", function(inst)
    if containers.widgetsetup ~= containers_widgetsetup_custom then
        OVERRIDE_WIDGETSETUP = true
        local containers_widgetsetup_base2 = containers.widgetsetup
        function containers.widgetsetup(container, prefab)
            containers_widgetsetup_base2(container, prefab)
            if container.type == "chest_yamche0" then
                container.type = "chest"
            end end end
    if containers.MAXITEMSLOTS < MAXITEMSLOTS then
        containers.MAXITEMSLOTS = MAXITEMSLOTS
    end
end)
---------------------------------------------------------------
--box2
local params = {}
local OVERRIDE_WIDGETSETUP = false
local containers_widgetsetup_base = containers.widgetsetup
function containers.widgetsetup(container, prefab)
    local t = params[prefab or container.inst.prefab]
    if t ~= nil then
        for k, v in pairs(t) do
            container[k] = v
        end
        container:SetNumSlots(container.widget.slotpos ~= nil and #container.widget.slotpos or 0)
        if OVERRIDE_WIDGETSETUP then
            container.type = "chest_yamche1"
        end
    else
        containers_widgetsetup_base(container, prefab)
    end
end
local function chest_yamche1()
    local container =
    {
        widget =
        {
            slotpos = {},
            animbank = "ui_chest_3x3",
            animbuild = "ui_chest_yamche1",
            pos = GLOBAL.Vector3(0, 200, 0),
            side_align_tip = 160,
        },
        type = "chest",
    }
 for y = 1, 0, -1 do
    for x = 0, 1 do
        table.insert(container.widget.slotpos, GLOBAL.Vector3(80*x-80*2+78, 80*y-80*2+80,0))
    end
end
    return container
end
params.chest_yamche1 = chest_yamche1()
for k, v in pairs(params) do
    containers.MAXITEMSLOTS = math.max(containers.MAXITEMSLOTS, v.widget.slotpos ~= nil and #v.widget.slotpos or 0)
end
local containers_widgetsetup_custom = containers.widgetsetup
local MAXITEMSLOTS = containers.MAXITEMSLOTS
AddPrefabPostInit("world_network", function(inst)
    if containers.widgetsetup ~= containers_widgetsetup_custom then
        OVERRIDE_WIDGETSETUP = true
        local containers_widgetsetup_base2 = containers.widgetsetup
        function containers.widgetsetup(container, prefab)
            containers_widgetsetup_base2(container, prefab)
            if container.type == "chest_yamche1" then
                container.type = "chest"
            end end end
    if containers.MAXITEMSLOTS < MAXITEMSLOTS then
        containers.MAXITEMSLOTS = MAXITEMSLOTS
    end
end)
---------------------------------------------------------------
--box3
local params = {}
local OVERRIDE_WIDGETSETUP = false
local containers_widgetsetup_base = containers.widgetsetup
function containers.widgetsetup(container, prefab)
    local t = params[prefab or container.inst.prefab]
    if t ~= nil then
        for k, v in pairs(t) do
            container[k] = v
        end
        container:SetNumSlots(container.widget.slotpos ~= nil and #container.widget.slotpos or 0)
        if OVERRIDE_WIDGETSETUP then
            container.type = "chest_yamche2"
        end
    else
        containers_widgetsetup_base(container, prefab)
    end
end
local function chest_yamche2()
    local container =
    {
        widget =
        {
            slotpos = {},
            animbank = "ui_chest_3x3",
            animbuild = "ui_chest_yamche2",
            pos = GLOBAL.Vector3(0, 200, 0),
            side_align_tip = 160,
        },
        type = "chest",
    }
		
for y = 2, 0, -1 do
    for x = 0, 1 do
        table.insert(container.widget.slotpos, GLOBAL.Vector3(80*x-80*2+78, 80*y-80*2+80,0))
    end
end
    return container
end
params.chest_yamche2 = chest_yamche2()
for k, v in pairs(params) do
    containers.MAXITEMSLOTS = math.max(containers.MAXITEMSLOTS, v.widget.slotpos ~= nil and #v.widget.slotpos or 0)
end
local containers_widgetsetup_custom = containers.widgetsetup
local MAXITEMSLOTS = containers.MAXITEMSLOTS
AddPrefabPostInit("world_network", function(inst)
    if containers.widgetsetup ~= containers_widgetsetup_custom then
        OVERRIDE_WIDGETSETUP = true
        local containers_widgetsetup_base2 = containers.widgetsetup
        function containers.widgetsetup(container, prefab)
            containers_widgetsetup_base2(container, prefab)
            if container.type == "chest_yamche2" then
                container.type = "chest"
        end end end
    if containers.MAXITEMSLOTS < MAXITEMSLOTS then
        containers.MAXITEMSLOTS = MAXITEMSLOTS
    end
end)
---------------------------------------------------------------
--box5
local params = {}
local OVERRIDE_WIDGETSETUP = false
local containers_widgetsetup_base = containers.widgetsetup
function containers.widgetsetup(container, prefab)
    local t = params[prefab or container.inst.prefab]
    if t ~= nil then
        for k, v in pairs(t) do
            container[k] = v
        end
        container:SetNumSlots(container.widget.slotpos ~= nil and #container.widget.slotpos or 0)
        if OVERRIDE_WIDGETSETUP then
            container.type = "chest_yamche4"
        end
    else
        containers_widgetsetup_base(container, prefab)
    end
end
local function chest_yamche4()
    local container =
    {
        widget =
        {
            slotpos = {},
            animbank = "ui_chest_3x3",
            animbuild = "ui_chest_3x3",
            pos = GLOBAL.Vector3(0, 200, 0),
            side_align_tip = 160,
        },
        type = "chest",
    }
for y = 3, 0, -1 do
    for x = 0, 2 do
        table.insert(container.widget.slotpos, GLOBAL.Vector3(75*x-75*2+75, 60*y-60*2+32,0))
    end
end
    return container
end
params.chest_yamche4 = chest_yamche4()
for k, v in pairs(params) do
    containers.MAXITEMSLOTS = math.max(containers.MAXITEMSLOTS, v.widget.slotpos ~= nil and #v.widget.slotpos or 0)
end
local containers_widgetsetup_custom = containers.widgetsetup
local MAXITEMSLOTS = containers.MAXITEMSLOTS
AddPrefabPostInit("world_network", function(inst)
    if containers.widgetsetup ~= containers_widgetsetup_custom then
        OVERRIDE_WIDGETSETUP = true
        local containers_widgetsetup_base2 = containers.widgetsetup
        function containers.widgetsetup(container, prefab)
            containers_widgetsetup_base2(container, prefab)
            if container.type == "chest_yamche4" then
                container.type = "chest"
        end end end
    if containers.MAXITEMSLOTS < MAXITEMSLOTS then
        containers.MAXITEMSLOTS = MAXITEMSLOTS
    end
end)
---------------------------------------------------------------
--box6
local params = {}
local OVERRIDE_WIDGETSETUP = false
local containers_widgetsetup_base = containers.widgetsetup
function containers.widgetsetup(container, prefab)
    local t = params[prefab or container.inst.prefab]
    if t ~= nil then
        for k, v in pairs(t) do
            container[k] = v
        end
        container:SetNumSlots(container.widget.slotpos ~= nil and #container.widget.slotpos or 0)
        if OVERRIDE_WIDGETSETUP then
            container.type = "chest_yamche5"
        end
    else
        containers_widgetsetup_base(container, prefab)
    end
end
local function chest_yamche5()
    local container =
    {
        widget =
        {
            slotpos = {},
            animbank = "ui_chest_3x3",
            animbuild = "ui_chest_3x3",
            pos = GLOBAL.Vector3(0, 200, 0),
            side_align_tip = 160,
        },
        type = "chest",
    }
for y = 3, 0, -1 do
    for x = 0, 3 do
        table.insert(container.widget.slotpos, GLOBAL.Vector3(60*x-60*2+30, 60*y-60*2+30,0))
    end
end
    return container
end
params.chest_yamche5 = chest_yamche5()
for k, v in pairs(params) do
    containers.MAXITEMSLOTS = math.max(containers.MAXITEMSLOTS, v.widget.slotpos ~= nil and #v.widget.slotpos or 0)
end
local containers_widgetsetup_custom = containers.widgetsetup
local MAXITEMSLOTS = containers.MAXITEMSLOTS
AddPrefabPostInit("world_network", function(inst)
    if containers.widgetsetup ~= containers_widgetsetup_custom then
        OVERRIDE_WIDGETSETUP = true
        local containers_widgetsetup_base2 = containers.widgetsetup
        function containers.widgetsetup(container, prefab)
            containers_widgetsetup_base2(container, prefab)
            if container.type == "chest_yamche5" then
                container.type = "chest"
    end end end
    if containers.MAXITEMSLOTS < MAXITEMSLOTS then
        containers.MAXITEMSLOTS = MAXITEMSLOTS
    end
end)
---------------------------------------------------------------
------------------
STRINGS.NAMES.MUSHA = "暮莎"
STRINGS.CHARACTER_TITLES.musha = "可爱的精灵公主"
STRINGS.CHARACTER_NAMES.musha = "暮莎"
STRINGS.CHARACTER_DESCRIPTIONS.musha = "[升级以解锁技能]\n等级(L) 技能(K) 小凤(Z,V,B) 视力(P)\n光亮(R) 护盾(C) 表演(X)"
STRINGS.CHARACTER_QUOTES.musha = "\" 我是伟大的暮莎公主! \""
STRINGS.CHARACTERS.MUSHA= require "speech_musha"

--STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA = "Feels good.."
STRINGS.CHARACTERS.MUSHA.DESCRIBE.MUSHA = {"她很漂亮", "很像我.."}
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.MUSHA = ("也许她能加入我的图书俱乐部.")
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.MUSHA = ("皇家血脉? Hmm...")
STRINGS.CHARACTERS.WOODIE.DESCRIBE.MUSHA = ("她能传送吗?..不, 也许不能")
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.MUSHA = ("弱小的力量 .. 看起来在帮助我们.")
STRINGS.CHARACTERS.WENDY.DESCRIBE.MUSHA = ("我感受到了强大的灵力..")
STRINGS.CHARACTERS.WX78.DESCRIBE.MUSHA = ("哦~我的心.")
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA = 
{
GENERIC = "感觉很好!",
ATTACKER = "撕碎他们",
MURDERER = "刺客!",
REVIVER = "我回来了..",
GHOST = "走开!",
}
--STRINGS.CHARACTERS.MUSHA.ANNOUNCE_NOSANITY = ""	

-----------[[--recipe--]]-----------

local bladeb = Ingredient( "mushasword_base", 1)
bladeb.atlas = "images/inventoryimages/mushasword_base.xml"
local armora = Ingredient( "armor_mushaa", 1)
armora.atlas = "images/inventoryimages/armor_mushaa.xml"
local phoenixb = Ingredient( "mushasword", 1)
phoenixb.atlas = "images/inventoryimages/mushasword.xml"
local phoenix_egg = Ingredient( "musha_egg", 1)
phoenix_egg.atlas = "images/inventoryimages/musha_egg.xml"
local glowdust = Ingredient( "glowdust", 1)
glowdust.atlas = "images/inventoryimages/glowdust.xml"
local glowdust3 = Ingredient( "glowdust", 3)
glowdust3.atlas = "images/inventoryimages/glowdust.xml"
local glowdust5 = Ingredient( "glowdust", 5)
glowdust5.atlas = "images/inventoryimages/glowdust.xml"
local glowdust10 = Ingredient( "glowdust", 10)
glowdust10.atlas = "images/inventoryimages/glowdust.xml"
----
----
local mushasword_base = AddRecipe("mushasword_base", { glowdust, GLOBAL.Ingredient("goldnugget", 2)}, RECIPETABS.WAR, TECH.NONE, nil, nil, nil, nil, nil, "images/inventoryimages/mushasword_base.xml", "mushasword_base.tex" )
mushasword_base.tagneeded = false
mushasword_base.builder_tag ="musha"

local mushasword = AddRecipe("mushasword", {bladeb, GLOBAL.Ingredient("redgem", 5), GLOBAL.Ingredient("feather_robin", 6)}, RECIPETABS.WAR, TECH.NONE, nil, nil, nil, nil, nil, "images/inventoryimages/mushasword.xml", "mushasword.tex" )
mushasword.tagneeded = false
mushasword.builder_tag ="musha"

local mushasword_frost = AddRecipe("mushasword_frost", {bladeb, GLOBAL.Ingredient("bluegem", 3), GLOBAL.Ingredient("ice", 12)}, RECIPETABS.WAR, TECH.NONE, nil, nil, nil, nil, nil, "images/inventoryimages/mushasword_frost.xml", "mushasword_frost.tex" )
mushasword_frost.tagneeded = false
mushasword_frost.builder_tag ="musha"

local frosthammer = AddRecipe("frosthammer", {GLOBAL.Ingredient( "deerclops_eyeball", 1), GLOBAL.Ingredient( "bluegem", 6), GLOBAL.Ingredient("livinglog", 2), GLOBAL.Ingredient("gears", 2)}, RECIPETABS.WAR, TECH.NONE, nil, nil, nil, nil, nil, "images/inventoryimages/frosthammer.xml", "frosthammer.tex" )
frosthammer.tagneeded = false
frosthammer.builder_tag ="musha"

local armor_mushaa = AddRecipe("armor_mushaa", {glowdust3, GLOBAL.Ingredient("goldnugget", 20), GLOBAL.Ingredient("nitre", 5)}, RECIPETABS.WAR, TECH.NONE, nil, nil, nil, nil, nil, "images/inventoryimages/armor_mushaa.xml", "armor_mushaa.tex" )
armor_mushaa.tagneeded = false
armor_mushaa.builder_tag ="musha"		

local broken_frosthammer = AddRecipe("broken_frosthammer", {armora, GLOBAL.Ingredient("bluegem", 3), GLOBAL.Ingredient("butterfly", 10),GLOBAL.Ingredient("gears", 3)}, RECIPETABS.WAR, TECH.NONE, nil, nil, nil, nil, nil, "images/inventoryimages/broken_frosthammer.xml", "broken_frosthammer.tex" )
broken_frosthammer.tagneeded = true
broken_frosthammer.builder_tag ="musha"	

local armor_mushab = AddRecipe("armor_mushab", {armora, GLOBAL.Ingredient("purplegem", 5), GLOBAL.Ingredient("greengem", 5),GLOBAL.Ingredient("orangegem", 5)}, RECIPETABS.WAR, TECH.NONE, nil, nil, nil, nil, nil, "images/inventoryimages/armor_mushab.xml", "armor_mushab.tex" )
armor_mushab.tagneeded = false
armor_mushab.builder_tag ="musha"	

--manrabbit_tail
local hat_mbunny = AddRecipe("hat_mbunny", {GLOBAL.Ingredient("walrus_tusk", 2), GLOBAL.Ingredient("purplegem", 2), GLOBAL.Ingredient("rabbit", 2),GLOBAL.Ingredient("beefalowool", 15)}, RECIPETABS.WAR, TECH.NONE, nil, nil, nil, nil, nil, "images/inventoryimages/hat_mbunny.xml", "hat_mbunny.tex" )
hat_mbunny.tagneeded = false
hat_mbunny.builder_tag ="musha"

local hat_mprincess = AddRecipe("hat_mprincess", {glowdust5, GLOBAL.Ingredient("purplegem", 3), GLOBAL.Ingredient("goldnugget", 40)}, RECIPETABS.WAR, TECH.NONE, nil, nil, nil, nil, nil, "images/inventoryimages/hat_mprincess.xml", "hat_mprincess.tex" )
hat_mprincess.tagneeded = false
hat_mprincess.builder_tag ="musha"	
--phoenixb
local hat_mphoenix = AddRecipe("hat_mphoenix", { armora, GLOBAL.Ingredient("panflute", 1), GLOBAL.Ingredient("redgem", 20), GLOBAL.Ingredient("feather_robin", 10)}, RECIPETABS.WAR, TECH.NONE, nil, nil, nil, nil, nil, "images/inventoryimages/hat_mphoenix.xml", "hat_mphoenix.tex" )
hat_mphoenix.tagneeded = false
hat_mphoenix.builder_tag ="musha"
--magic
--flute
local musha_flute = AddRecipe("musha_flute", { glowdust5, GLOBAL.Ingredient("horn", 1), GLOBAL.Ingredient("spidergland", 10)}, RECIPETABS.MAGIC, TECH.NONE, nil, nil, nil, nil, nil, "images/inventoryimages/musha_flute.xml", "musha_flute.tex" )
musha_flute.tagneeded = false
musha_flute.builder_tag ="musha"
--glowdust
local glowdust = AddRecipe("glowdust", { GLOBAL.Ingredient("berries", 10),GLOBAL.Ingredient("goldnugget", 1)}, RECIPETABS.MAGIC, TECH.NONE, nil, nil, nil, nil, nil, "images/inventoryimages/glowdust.xml", "glowdust.tex" )
glowdust.tagneeded = false
glowdust.builder_tag ="musha"
--phoenix_egg
local musha_egg = AddRecipe("musha_egg", { GLOBAL.Ingredient("purplegem", 3), GLOBAL.Ingredient("redgem", 3), GLOBAL.Ingredient("bluegem", 2)}, RECIPETABS.MAGIC, TECH.NONE, nil, nil, nil, nil, nil, "images/inventoryimages/musha_egg.xml", "musha_egg.tex" )
musha_egg.tagneeded = false
musha_egg.builder_tag ="musha"

local musha_eggs1 = AddRecipe("musha_eggs1", { phoenix_egg, GLOBAL.Ingredient("goldnugget", 1)}, RECIPETABS.MAGIC, TECH.NONE, nil, nil, nil, nil, nil, "images/inventoryimages/musha_eggs1.xml", "musha_eggs1.tex" )
musha_eggs1.tagneeded = false
musha_eggs1.builder_tag ="musha"

local musha_eggs2 = AddRecipe("musha_eggs2", { phoenix_egg, GLOBAL.Ingredient("goldnugget", 10)}, RECIPETABS.MAGIC, TECH.NONE, nil, nil, nil, nil, nil, "images/inventoryimages/musha_eggs2.xml", "musha_eggs2.tex" )
musha_eggs2.tagneeded = false
musha_eggs2.builder_tag ="musha"

local musha_eggs3 = AddRecipe("musha_eggs3", { phoenix_egg, GLOBAL.Ingredient("goldnugget", 20)}, RECIPETABS.MAGIC, TECH.NONE, nil, nil, nil, nil, nil, "images/inventoryimages/musha_eggs3.xml", "musha_eggs3.tex" )
musha_eggs3.tagneeded = false
musha_eggs3.builder_tag ="musha"

local musha_egg1 = AddRecipe("musha_egg1", { phoenix_egg, GLOBAL.Ingredient("goldnugget", 40)}, RECIPETABS.MAGIC, TECH.NONE, nil, nil, nil, nil, nil, "images/inventoryimages/musha_egg1.xml", "musha_egg1.tex" )
musha_egg1.tagneeded = false
musha_egg1.builder_tag ="musha"
--crystal
local cristal = AddRecipe("cristal", { glowdust10, GLOBAL.Ingredient("bluegem", 1)}, RECIPETABS.MAGIC, TECH.NONE, nil, nil, nil, nil, nil, "images/inventoryimages/cristal.xml", "cristal.tex" )
cristal.tagneeded = false
cristal.builder_tag ="musha"

--nitre
--function rockss(inst)
--[[AddRecipe("nitre", {Ingredient( "goldnugget",1),}, RECIPETABS.REFINE, {SCIENCE=0})]]
AddRecipe("bluegem", {Ingredient( "redgem",1),Ingredient( "nitre",1)}, RECIPETABS.REFINE, {SCIENCE=0})
AddRecipe("redgem", {Ingredient( "bluegem",1),Ingredient( "nitre",1)}, RECIPETABS.REFINE, {SCIENCE=0})
----BOOK----

--end
--AddPrefabPostInit("musha", rockss)
--elemental
local function elemental( inst )
inst:AddComponent("fuel")
inst.components.fuel.fuelvalue = TUNING.SMALL_FUEL
--inst.components.fuel.fuelvalue = TUNING.MED_LARGE_FUEL
inst.components.fuel.fueltype = "CHEMICAL"
inst:AddTag("test")
end
AddPrefabPostInit("rocks",elemental)
AddPrefabPostInit("goldnugget",elemental)
AddPrefabPostInit("flint",elemental)
AddPrefabPostInit("moonrocknugget",elemental)
AddPrefabPostInit("marble",elemental)
AddPrefabPostInit("stinger",elemental)
function gruefix(inst)
inst:AddTag("gruef")
end
AddPrefabPostInit("grue", gruefix)

--active key
-- Import the lib use.
modimport("libs/use.lua")

-- Import the mod environment as our environment.
use "libs/mod_env"(env)
-- Imports to keep the keyhandler from working while typing in chat.
use "data/widgets/controls"
use "data/screens/chatinputscreen"
use "data/screens/consolescreen"

GLOBAL.TUNING.MUSHA = {}
GLOBAL.TUNING.MUSHA.KEY = GetModConfigData("key") or 108  --L
GLOBAL.TUNING.MUSHA.KEY2 = GetModConfigData("key2") or 114  --R
GLOBAL.TUNING.MUSHA.KEY3 = GetModConfigData("key3") or 99  --C
GLOBAL.TUNING.MUSHA.KEY4 = GetModConfigData("key4") or 120  --X  
GLOBAL.TUNING.MUSHA.KEY5 = GetModConfigData("key5") or 107  --K
GLOBAL.TUNING.MUSHA.KEY6 = GetModConfigData("key6") or 122  --Z
GLOBAL.TUNING.MUSHA.KEY7 = GetModConfigData("key7") or 112  --P
GLOBAL.TUNING.MUSHA.KEY8 = GetModConfigData("key8") or 118  --V
GLOBAL.TUNING.MUSHA.KEY9 = GetModConfigData("key9") or 98  --B
local function on_yamcheinfo(inst)
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 25, {"yamcheb"})
for k,v in pairs(ents) do
if inst.components.leader:IsFollower(v) then
v.yamcheinfo = true
v.yamche = true
end end end
local function INFO(inst)
--Active info level?
local TheInput = TheInput
local max_exp = 999997000
local level = math.min(inst.level, max_exp)
inst.components.talker:Say("[Next: Level Up] \n EXP ".. (inst.level))	
on_yamcheinfo(inst)
if inst.level <5 then
inst.components.talker:Say("Level 1 \nNext :EXP[5]\n EXP ".. (inst.level))
elseif inst.level >=5 and inst.level <9  then
inst.components.talker:Say("Level 2 \nNext :EXP[10]\n EXP ".. (inst.level))
elseif inst.level >=10 and inst.level <29  then
inst.components.talker:Say("Level 3 \nNext :EXP[30]\n EXP ".. (inst.level))
elseif inst.level >=30 and inst.level <49  then
inst.components.talker:Say("Level 4 \nNext :EXP[50]\n EXP ".. (inst.level))
elseif inst.level >=50 and inst.level <79  then
inst.components.talker:Say("Level 5 \nNext :EXP[80]\n EXP ".. (inst.level))
elseif inst.level >=80 and inst.level <124  then
inst.components.talker:Say("Level 6 \nNext :EXP[125]\n EXP ".. (inst.level))
elseif inst.level >=125 and inst.level <199  then
inst.components.talker:Say("Level 7 \nNext :EXP[200]\n EXP ".. (inst.level))
elseif inst.level >=200 and inst.level <339  then
inst.components.talker:Say("Level 8 \nNext :EXP[340]\n EXP ".. (inst.level))
elseif inst.level >=340 and inst.level <429  then
inst.components.talker:Say("Level 9 \nNext :EXP[430]\n EXP ".. (inst.level))
elseif inst.level >=430 and inst.level <529  then
inst.components.talker:Say("Level 10 \nNext :EXP[530]\n EXP ".. (inst.level))
elseif inst.level >=530 and inst.level <639  then
inst.components.talker:Say("Level 11 \nNext :EXP[640]\n EXP ".. (inst.level))
elseif inst.level >=640 and inst.level <759  then
inst.components.talker:Say("Level 12 \nNext :EXP[760]\n EXP ".. (inst.level))
elseif inst.level >=760 and inst.level <889  then
inst.components.talker:Say("Level 13 \nNext :EXP[890]\n EXP ".. (inst.level))
elseif inst.level >=890 and inst.level <1029  then
inst.components.talker:Say("Level 14 \nNext :EXP[1030]\n EXP ".. (inst.level))
elseif inst.level >=1030 and inst.level <1179  then
inst.components.talker:Say("Level 15 \nNext :EXP[1180]\n EXP ".. (inst.level))
elseif inst.level >=1180 and inst.level <1339  then
inst.components.talker:Say("Level 16 \nNext :EXP[1340]\n EXP ".. (inst.level))
elseif inst.level >=1340 and inst.level <1509  then
inst.components.talker:Say("Level 17 \nNext :EXP[1510]\n EXP ".. (inst.level))
elseif inst.level >=1510 and inst.level <1689  then
inst.components.talker:Say("Level 18 \nNext :EXP[1690]\n EXP ".. (inst.level))
elseif inst.level >=1690 and inst.level <1879  then
inst.components.talker:Say("Level 19 \nNext :EXP[1880]\n EXP ".. (inst.level))
elseif inst.level >=1880 and inst.level <2079  then
inst.components.talker:Say("Level 20 \nNext :EXP[2080]\n EXP ".. (inst.level))
elseif inst.level >=2080 and inst.level <2289  then
inst.components.talker:Say("Level 21 \nNext :EXP[2289]\n EXP ".. (inst.level))
elseif inst.level >=2290 and inst.level <2499  then
inst.components.talker:Say("Level 22 \nNext :EXP[2500]\n EXP ".. (inst.level))
elseif inst.level >=2500 and inst.level <2849  then
inst.components.talker:Say("Level 23 \nNext :EXP[2850]\n EXP ".. (inst.level))
elseif inst.level >=2850 and inst.level <3199  then
inst.components.talker:Say("Level 24 \nNext :EXP[3200]\n EXP ".. (inst.level))
elseif inst.level >=3200 and inst.level <3699  then
inst.components.talker:Say("Level 25 \nNext :EXP[3700]\n EXP ".. (inst.level))
elseif inst.level >=3700 and inst.level <4199  then
inst.components.talker:Say("Level 26 \nNext :EXP[4200]\n EXP ".. (inst.level))
elseif inst.level >=4200 and inst.level <4699  then
inst.components.talker:Say("Level 27 \nNext :EXP[4700]\n EXP ".. (inst.level))
elseif inst.level >=4700 and inst.level <5499 then
inst.components.talker:Say("Level 28 \nNext :EXP[5500]\n EXP ".. (inst.level))
elseif inst.level >=5500 and inst.level <6999 then
inst.components.talker:Say("Level 29 \nNext :EXP[7000]\n EXP ".. (inst.level))
elseif inst.level >=7000  then
inst.components.talker:Say("Level 30 \n[MAX]\n Extra EXP ".. (inst.level -7000))
end
end
AddModRPCHandler("musha", "INFO", INFO)

--active skill?
local function INFO2(inst)
local TheInput = TheInput
local max_exp = 999997000
local level = math.min(inst.level, max_exp)

if inst.level >=0 and inst.level <=4 then --level[1]
inst.components.talker:Say("[------主动技能------] \n[*]强力光亮 [1/4]-(R)\n[*]立场护盾     [1/4]-(C)\n[*]演奏      [1/1]-(X)\n\n[------被动技能------] \n[*]女武神       [0/14] \n[*]狂怒         [1/4] \n[*]静电立场 [0/5] \n[*]会心一击   [0/7] \n[*]双倍伤害 [0/1]")
elseif inst.level >4 and inst.level <10 then --level[2]
inst.components.talker:Say("[------主动技能------] \n[*]强力光亮 [1/4]-(R)\n[*]立场护盾     [1/4]-(C)\n[*]演奏      [1/1]-(X)\n\n[------被动技能------] \n[*]女武神       [0/14] \n[*]狂怒         [1/4] \n[*]静电立场 [1/5] \n[*]会心一击   [0/7] \n[*]双倍伤害 [0/1]")
elseif inst.level >10 and inst.level <30  then --level[3]
inst.components.talker:Say("[------主动技能------] \n[*]强力光亮 [1/4]-(R)\n[*]立场护盾     [1/4]-(C)\n[*]演奏      [1/1]-(X)\n\n[------被动技能------] \n[*]女武神       [0/14] \n[*]狂怒         [1/4] \n[*]静电立场 [1/5] \n[*]会心一击   [1/7] \n[*]双倍伤害 [0/1]")
elseif inst.level >=30 and inst.level <50  then --level[4]
inst.components.talker:Say("[------主动技能------] \n[*]强力光亮 [1/4]-(R)\n[*]立场护盾     [1/4]-(C)\n[*]演奏      [1/1]-(X)\n\n[------被动技能------] \n[*]女武神       [1/14] \n[*]狂怒         [1/4] \n[*]静电立场 [1/5] \n[*]会心一击   [1/7] \n[*]双倍伤害 [0/1]")
elseif inst.level >=50 and inst.level <80  then --level[5]
inst.components.talker:Say("[------主动技能------] \n[*]强力光亮 [1/4]-(R)\n[*]立场护盾     [1/4]-(C)\n[*]演奏      [1/1]-(X)\n\n[------被动技能------] \n[*]女武神       [2/14] \n[*]狂怒         [1/4] \n[*]静电立场 [1/5] \n[*]会心一击   [1/7] \n[*]双倍伤害 [0/1]")
elseif inst.level >=80 and inst.level <124  then --level[6]
inst.components.talker:Say("[------主动技能------] \n[*]强力光亮 [1/4]-(R)\n[*]立场护盾     [1/4]-(C)\n[*]演奏      [1/1]-(X)\n\n[------被动技能------] \n[*]女武神       [2/14] \n[*]狂怒         [1/4] \n[*]静电立场 [2/5] \n[*]会心一击   [1/7] \n[*]双倍伤害 [0/1]")
elseif inst.level >=125 and inst.level <200  then --level[7]
inst.components.talker:Say("[------主动技能------] \n[*]强力光亮 [1/4]-(R)\n[*]立场护盾     [1/4]-(C)\n[*]演奏      [1/1]-(X)\n\n[------被动技能------] \n[*]女武神       [2/14] \n[*]狂怒         [1/4] \n[*]静电立场 [2/5] \n[*]会心一击   [2/7] \n[*]双倍伤害 [0/1]")
elseif inst.level >=200 and inst.level <340  then --level[8]
inst.components.talker:Say("[------主动技能------] \n[*]强力光亮 [1/4]-(R)\n[*]立场护盾     [1/4]-(C)\n[*]演奏      [1/1]-(X)\n\n[------被动技能------] \n[*]女武神       [3/14] \n[*]狂怒         [1/4] \n[*]静电立场 [2/5] \n[*]会心一击   [2/7] \n[*]双倍伤害 [0/1]")
elseif inst.level >=340 and inst.level <430  then --level[9]
inst.components.talker:Say("[------主动技能------] \n[*]强力光亮 [1/4]-(R)\n[*]立场护盾     [1/4]-(C)\n[*]演奏      [1/1]-(X)\n\n[------被动技能------] \n[*]女武神       [4/14] \n[*]狂怒         [1/4] \n[*]静电立场 [2/5] \n[*]会心一击   [2/7] \n[*]双倍伤害 [0/1]")
elseif inst.level >=430 and inst.level <530  then --level[10]
inst.components.talker:Say("[------主动技能------] \n[*]强力光亮 [2/4]-(R)\n[*]立场护盾     [2/4]-(C)\n[*]演奏      [1/1]-(X)\n\n[------被动技能------] \n[*]女武神       [4/14] \n[*]狂怒         [1/4] \n[*]静电立场 [3/5] \n[*]会心一击   [2/7] \n[*]双倍伤害 [0/1]")
elseif inst.level >=530 and inst.level <640  then --level[11]
inst.components.talker:Say("[------主动技能------] \n[*]强力光亮 [2/4]-(R)\n[*]立场护盾     [2/4]-(C)\n[*]演奏      [1/1]-(X)\n\n[------被动技能------] \n[*]女武神       [4/14] \n[*]狂怒         [1/4] \n[*]静电立场 [3/5] \n[*]会心一击   [3/7] \n[*]双倍伤害 [0/1]")
elseif inst.level >=640 and inst.level <760  then --level[12]
inst.components.talker:Say("[------主动技能------] \n[*]强力光亮 [2/4]-(R)\n[*]立场护盾     [2/4]-(C)\n[*]演奏      [1/1]-(X)\n\n[------被动技能------] \n[*]女武神       [4/14] \n[*]狂怒         [2/4] \n[*]静电立场 [3/5] \n[*]会心一击   [3/7] \n[*]双倍伤害 [0/1]")
elseif inst.level >=760 and inst.level <890  then --level[13]
inst.components.talker:Say("[------主动技能------] \n[*]强力光亮 [2/4]-(R)\n[*]立场护盾     [2/4]-(C)\n[*]演奏      [1/1]-(X)\n\n[------被动技能------] \n[*]女武神       [5/14] \n[*]狂怒         [2/4] \n[*]静电立场 [3/5] \n[*]会心一击   [3/7] \n[*]双倍伤害 [0/1]")
elseif inst.level >=890 and inst.level <1030  then --level[14]
inst.components.talker:Say("[------主动技能------] \n[*]强力光亮 [2/4]-(R)\n[*]立场护盾     [2/4]-(C)\n[*]演奏      [1/1]-(X)\n\n[------被动技能------] \n[*]女武神       [6/14] \n[*]狂怒         [2/4] \n[*]静电立场 [3/5] \n[*]会心一击   [3/7] \n[*]双倍伤害 [0/1]")
elseif inst.level >=1030 and inst.level <1180  then --level[15]
inst.components.talker:Say("[------主动技能------] \n[*]强力光亮 [2/4]-(R)\n[*]立场护盾     [2/4]-(C)\n[*]演奏      [1/1]-(X)\n\n[------被动技能------] \n[*]女武神       [6/14] \n[*]狂怒         [2/4] \n[*]静电立场 [4/5] \n[*]会心一击   [3/7] \n[*]双倍伤害 [0/1]")
elseif inst.level >=1180 and inst.level <1340  then --level[16]
inst.components.talker:Say("[------主动技能------] \n[*]强力光亮 [2/4]-(R)\n[*]立场护盾     [2/4]-(C)\n[*]演奏      [1/1]-(X)\n\n[------被动技能------] \n[*]女武神       [6/14] \n[*]狂怒         [2/4] \n[*]静电立场 [4/5] \n[*]会心一击   [4/7] \n[*]双倍伤害 [0/1]")	
elseif inst.level >=1340 and inst.level <1510  then --level[17]
inst.components.talker:Say("[------主动技能------] \n[*]强力光亮 [2/4]-(R)\n[*]立场护盾     [2/4]-(C)\n[*]演奏      [1/1]-(X)\n\n[------被动技能------] \n[*]女武神       [7/14] \n[*]狂怒         [2/4] \n[*]静电立场 [4/5] \n[*]会心一击   [4/7] \n[*]双倍伤害 [0/1]")	
elseif inst.level >=1510 and inst.level <1690  then --level[18]
inst.components.talker:Say("[------主动技能------] \n[*]强力光亮 [2/4]-(R)\n[*]立场护盾     [2/4]-(C)\n[*]演奏      [1/1]-(X)\n\n[------被动技能------] \n[*]女武神       [8/14] \n[*]狂怒         [2/4] \n[*]静电立场 [4/5] \n[*]会心一击   [4/7] \n[*]双倍伤害 [0/1]")	
elseif inst.level >=1690 and inst.level <1880  then --level[19]
inst.components.talker:Say("[------主动技能------] \n[*]强力光亮 [2/4]-(R)\n[*]立场护盾     [2/4]-(C)\n[*]演奏      [1/1]-(X)\n\n[------被动技能------] \n[*]女武神       [8/14] \n[*]狂怒         [3/4] \n[*]静电立场 [4/5] \n[*]会心一击   [4/7] \n[*]双倍伤害 [0/1]")	
elseif inst.level >=1880 and inst.level <2080  then --level[20]
inst.components.talker:Say("[------主动技能------] \n[*]强力光亮 [3/4]-(R)\n[*]立场护盾     [3/4]-(C)\n[*]演奏      [1/1]-(X)\n\n[------被动技能------] \n[*]女武神       [8/14] \n[*]狂怒         [3/4] \n[*]静电立场 [4/5] \n[*]会心一击   [5/7] \n[*]双倍伤害 [0/1]")	
elseif inst.level >=2080 and inst.level <2290  then --level[21]
inst.components.talker:Say("[------主动技能------] \n[*]强力光亮 [3/4]-(R)\n[*]立场护盾     [3/4]-(C)\n[*]演奏      [1/1]-(X)\n\n[------被动技能------] \n[*]女武神       [8/14] \n[*]狂怒         [3/4] \n[*]静电立场 [5/5] \n[*]会心一击   [5/7] \n[*]双倍伤害 [0/1]")	
elseif inst.level >=2290 and inst.level <2500  then --level[22]
inst.components.talker:Say("[------主动技能------] \n[*]强力光亮 [3/4]-(R)\n[*]立场护盾     [3/4]-(C)\n[*]演奏      [1/1]-(X)\n\n[------被动技能------] \n[*]女武神       [9/14] \n[*]狂怒         [3/4] \n[*]静电立场 [5/5] \n[*]会心一击   [5/7] \n[*]双倍伤害 [0/1]")	
elseif inst.level >=2500 and inst.level <2850  then --level[23]
inst.components.talker:Say("[------主动技能------] \n[*]强力光亮 [3/4]-(R)\n[*]立场护盾     [3/4]-(C)\n[*]演奏      [1/1]-(X)\n\n[------被动技能------] \n[*]女武神       [10/14] \n[*]狂怒         [3/4] \n[*]静电立场 [5/5] \n[*]会心一击   [5/7] \n[*]双倍伤害 [0/1]")	
elseif inst.level >=2850 and inst.level <3200  then --level[24]
inst.components.talker:Say("[------主动技能------] \n[*]强力光亮 [3/4]-(R)\n[*]立场护盾     [3/4]-(C)\n[*]演奏      [1/1]-(X)\n\n[------被动技能------] \n[*]女武神       [10/14] \n[*]狂怒         [4/4] \n[*]静电立场 [5/5] \n[*]会心一击   [5/7] \n[*]双倍伤害 [0/1]")
elseif inst.level >=3200 and inst.level <3700  then --level[25]
inst.components.talker:Say("[------主动技能------] \n[*]强力光亮 [3/4]-(R)\n[*]立场护盾     [3/4]-(C)\n[*]演奏      [1/1]-(X)\n\n[------被动技能------] \n[*]女武神       [10/14] \n[*]狂怒         [4/4] \n[*]静电立场 [5/5] \n[*]会心一击   [6/7] \n[*]双倍伤害 [0/1]")
elseif inst.level >=3700 and inst.level <4200  then --level[26]
inst.components.talker:Say("[------主动技能------] \n[*]强力光亮 [3/4]-(R)\n[*]立场护盾     [3/4]-(C)\n[*]演奏      [1/1]-(X)\n\n[------被动技能------] \n[*]女武神       [11/14] \n[*]狂怒         [4/4] \n[*]静电立场 [5/5] \n[*]会心一击   [6/7] \n[*]双倍伤害 [0/1]")	
elseif inst.level >=4200 and inst.level <4700  then --level[27]
inst.components.talker:Say("[------主动技能------] \n[*]强力光亮 [3/4]-(R)\n[*]立场护盾     [3/4]-(C)\n[*]演奏      [1/1]-(X)\n\n[------被动技能------] \n[*]女武神       [11/14] \n[*]狂怒         [4/4] \n[*]静电立场 [5/5] \n[*]会心一击   [7/7] \n[*]双倍伤害 [0/1]")	
elseif inst.level >=4700 and inst.level <5500 then --level[28]
inst.components.talker:Say("[------主动技能------] \n[*]强力光亮 [3/4]-(R)\n[*]立场护盾     [3/4]-(C)\n[*]演奏      [1/1]-(X)\n\n[------被动技能------] \n[*]女武神       [12/14] \n[*]狂怒         [4/4] \n[*]静电立场 [5/5] \n[*]会心一击   [7/7] \n[*]双倍伤害 [0/1]")	
elseif inst.level >=5500 and inst.level <7000 then --level[29]
inst.components.talker:Say("[------主动技能------] \n[*]强力光亮 [3/4]-(R)\n[*]立场护盾     [3/4]-(C)\n[*]演奏      [1/1]-(X)\n\n[------被动技能------] \n[*]女武神       [13/14] \n[*]狂怒         [4/4] \n[*]静电立场 [5/5] \n[*]会心一击   [7/7] \n[*]双倍伤害 [0/1]")	
elseif inst.level >=7000  then --level[30]
inst.components.talker:Say("[------主动技能------] \n[*]强力光亮 [4/4]-(R)\n[*]立场护盾     [4/4]-(C)\n[*]演奏      [1/1]-(X)\n\n[------被动技能------] \n[*]女武神       [14/14] \n[*]狂怒         [4/4] \n[*]静电立场 [5/5] \n[*]会心一击   [7/7] \n[*]双倍伤害 [1/1]")	
end
end
AddModRPCHandler("musha", "INFO2", INFO2)
--exp kill

local function spawnspirit(inst, x, y, z, scale)
    local fx = SpawnPrefab("wathgrithr_spirit")
    fx.Transform:SetPosition(x, y, z)
    fx.Transform:SetScale(scale, scale, scale)
end

local function onkilll(inst, data)
local smallScale = 0.5
local medScale = 0.7
local largeScale = 1.1

	local victim = data.victim
	   if not (victim:HasTag("prey") or
            victim:HasTag("veggie") or
            victim:HasTag("eyeplant") or
            victim:HasTag("insect") or			
            victim:HasTag("structure")) then
    local delta = victim.components.combat.defaultdamage * 0.25
		   if math.random() < 0.7 then
    				inst.level = inst.level + 1
 		--inst.components.health:DoDelta(delta, false, "battleborn")
		inst.components.sanity:DoDelta(delta)
			inst.components.talker:Say("Extra [EXP](+1) \n".. (inst.level))	
			
            local time = victim.components.health.destroytime or 2
            local x, y, z = victim.Transform:GetWorldPosition()
            local scale = (victim:HasTag("smallcreature") and smallScale)
                        or (victim:HasTag("largecreature") and largeScale)
                        or medScale
					inst:DoTaskInTime(time, spawnspirit, x, y, z, scale)
				 	   if not inst.berserk and math.random() < 0.05 then
					   --inst.components.talker:Say("Come to me! Ghost puppy")
					     scheduler:ExecuteInTime(1, function() SpawnPrefab("statue_transition_2").Transform:SetPosition(victim:GetPosition():Get()) SpawnPrefab("ghosthound2").Transform:SetPosition(victim:GetPosition():Get()) end) end
					end					
				end
		  if (victim:HasTag("prey") or
              victim:HasTag("insect") or			
            victim:HasTag("frog")) then
    local delta = victim.components.combat.defaultdamage * 0.1
		   if math.random() < 0.15 then
    				inst.level = inst.level + 1
 			inst.components.sanity:DoDelta(delta)
			inst.components.talker:Say("Lightning kill \nExtra [EXP](+1) \n".. (inst.level))					
            local time = victim.components.health.destroytime or 2
            local x, y, z = victim.Transform:GetWorldPosition()
            local scale = (victim:HasTag("smallcreature") and smallScale)
                        or (victim:HasTag("largecreature") and largeScale)
                        or medScale
					inst:DoTaskInTime(time, spawnspirit, x, y, z, scale)
					end end 	
							  if (victim:HasTag("epic") ) then
    local delta = victim.components.combat.defaultdamage * 0.1
		   if math.random() <= 1 then
    				inst.level = inst.level + 10
 			inst.components.sanity:DoDelta(delta)
			inst.components.talker:Say("Lightning kill \nExtra [EXP](+1) \n".. (inst.level))		
			inst.components.talker:Say("Kill Epic Monster\n [EXP] + 10 ")
            local time = victim.components.health.destroytime or 2
            local x, y, z = victim.Transform:GetWorldPosition()
            local scale = (victim:HasTag("smallcreature") and smallScale)
                        or (victim:HasTag("largecreature") and largeScale)
                        or medScale
					inst:DoTaskInTime(time, spawnspirit, x, y, z, scale)
					end end 	
							  if ( victim:HasTag("deerclops") or 
							  victim:HasTag("bearger") or
							  victim:HasTag("moose") or 
							  victim:HasTag("dragonfly")  ) then
    local delta = victim.components.combat.defaultdamage * 0.1
		   if math.random() <= 1 then
    				inst.level = inst.level + 25
 			inst.components.sanity:DoDelta(delta)
			inst.components.talker:Say("Lightning kill \nExtra [EXP](+1) \n".. (inst.level))		
			inst.components.talker:Say("Kill Giant\n [EXP] + 35 ")
            local time = victim.components.health.destroytime or 2
            local x, y, z = victim.Transform:GetWorldPosition()
            local scale = (victim:HasTag("smallcreature") and smallScale)
                        or (victim:HasTag("largecreature") and largeScale)
                        or medScale
					inst:DoTaskInTime(time, spawnspirit, x, y, z, scale)
					end 
					end 	
					inst:RemoveEventCallback("killed", onkilll)
				end 

--active lightning strike
local function on_hitLightnings_9(inst, data)
local other = data.target
if other and other.components.health and inst.level <=430 and not other:HasTag("player") then
SpawnPrefab("lightning").Transform:SetPosition(other:GetPosition():Get())
SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
SpawnPrefab("groundpoundring_fx").Transform:SetPosition(other:GetPosition():Get())
other.components.health:DoDelta(-40)
inst.components.sanity:DoDelta(-12)
inst.components.combat:SetRange(2)
inst.AnimState:SetBloomEffectHandle( "" )
inst.switch = false
inst:RemoveEventCallback("onhitother", on_hitLightnings_9)
elseif other and other.components.health and inst.level > 430 and inst.level <= 1880 and not other:HasTag("player") then
SpawnPrefab("lightning").Transform:SetPosition(other:GetPosition():Get())
SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
SpawnPrefab("groundpoundring_fx").Transform:SetPosition(other:GetPosition():Get())
other.components.health:DoDelta(-60)
inst.components.sanity:DoDelta(-16)
inst.components.combat:SetRange(2)
inst.AnimState:SetBloomEffectHandle( "" )
inst.switch = false
inst:RemoveEventCallback("onhitother", on_hitLightnings_9)
elseif other and other.components.health and inst.level > 1880 and inst.level <= 6999 and not other:HasTag("player") then
SpawnPrefab("lightning").Transform:SetPosition(other:GetPosition():Get())
SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
SpawnPrefab("groundpoundring_fx").Transform:SetPosition(other:GetPosition():Get())
other.components.health:DoDelta(-80)
inst.components.sanity:DoDelta(-20)
inst.components.combat:SetRange(2)
inst.AnimState:SetBloomEffectHandle( "" )
inst.switch = false
inst:RemoveEventCallback("onhitother", on_hitLightnings_9)
elseif other and other.components.health and inst.level >= 7000 and not other:HasTag("player") then
SpawnPrefab("lightning").Transform:SetPosition(other:GetPosition():Get())
SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
SpawnPrefab("groundpoundring_fx").Transform:SetPosition(other:GetPosition():Get())
other.components.health:DoDelta(-100)
inst.components.sanity:DoDelta(-24)
inst.components.combat:SetRange(2)
inst.AnimState:SetBloomEffectHandle( "" )
inst.switch = false
inst:RemoveEventCallback("onhitother", on_hitLightnings_9)
elseif other and other.components.health and other:HasTag("player") then
--SpawnPrefab("lightning").Transform:SetPosition(other:GetPosition():Get())
--SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
--SpawnPrefab("groundpoundring_fx").Transform:SetPosition(other:GetPosition():Get())
inst.components.combat:SetRange(2)
inst.AnimState:SetBloomEffectHandle( "" )
inst.components.talker:Say("Musha is not an assassin.")
inst.switch = false
inst:RemoveEventCallback("onhitother", on_hitLightnings_9)
end 
end  

--power lightning
local function Lightning_a(inst)
inst:ListenForEvent("killed", onkilll)
if not inst.switch and inst.components.sanity.current > 50 and inst.level < 430  and not inst.components.health:IsDead() and not inst:HasTag("playerghost") then
inst.components.combat:SetRange(9)
inst.components.talker:Say("我说要有光!\n[LV1]")
inst:ListenForEvent("onhitother", on_hitLightnings_9)
inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
inst.switch = true
elseif not inst.switch and inst.components.sanity.current > 50 and inst.level >= 430 and inst.level < 1880  and not inst.components.health:IsDead() and not inst:HasTag("playerghost") then
inst.components.combat:SetRange(10)
inst.components.talker:Say("我说要有光!!\n[LV2]")
inst:ListenForEvent("onhitother", on_hitLightnings_9)
inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
inst.switch = true
elseif not inst.switch and inst.components.sanity.current > 50 and inst.level >= 1880 and inst.level < 7000  and not inst.components.health:IsDead() and not inst:HasTag("playerghost") then
inst.components.combat:SetRange(11)
inst.components.talker:Say("我说要有光!!\n[LV3]")
inst:ListenForEvent("onhitother", on_hitLightnings_9)
inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
inst.switch = true
elseif not inst.switch and inst.components.sanity.current > 50 and inst.level >= 7000 and not inst.components.health:IsDead() and not inst:HasTag("playerghost") then
inst.components.combat:SetRange(12)
inst.components.talker:Say("我说要有光!!\n[LV4]")
inst:ListenForEvent("onhitother", on_hitLightnings_9)
inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
inst.switch = true
elseif inst.switch and not inst.components.health:IsDead() then
inst.components.combat:SetRange(2)
inst:RemoveEventCallback("onhitother", on_hitLightnings_9)
inst.AnimState:SetBloomEffectHandle( "" )
inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
inst.switch = false
elseif not inst.switch and inst.components.sanity.current < 50 and not inst.components.health:IsDead() and not inst:HasTag("playerghost") then
inst.components.talker:Say("脑残值不足..")
elseif not inst.switch and inst:HasTag("playerghost") then
inst.components.talker:Say("Ooooh ! ohhoooho !!")
elseif inst.switch and inst:HasTag("playerghost") then
inst.components.talker:Say("Ooooh ? ooohhh ??")
end
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 250, {"yamcheb"})
for k,v in pairs(ents) do
if inst.components.leader:IsFollower(v) and not inst.switch then
v.yamche_lightning = false
elseif inst.components.leader:IsFollower(v) and inst.switch then
v.yamche_lightning = true
end end
end
AddModRPCHandler("musha", "Lightning_a", Lightning_a)

local function Sparkshield_1(inst, attacked, data) 
if inst.level < 430 and not inst.components.health:IsDead() and not inst.activec0 then
inst.components.health:DoDelta(4)
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
elseif inst.level >= 430 and inst.level < 1880  and not inst.components.health:IsDead() and not inst.activec0 then
inst.components.health:DoDelta(6)
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
elseif inst.level >= 1880 and inst.level < 7000  and not inst.components.health:IsDead() and not inst.activec0 then
inst.components.health:DoDelta(8)
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
elseif inst.level >= 7000 and not inst.components.health:IsDead() and not inst.activec0 then
inst.components.health:DoDelta(10)
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
end end

--active shield
local function shield_go(inst, attacked, data)
if not inst.components.health:IsDead() and inst.level < 430 and not inst.activec0 and inst.shield_level1 then
--inst.components.talker:Say("Shield on!!")
inst.components.health:SetAbsorptionAmount(1)
local fx = SpawnPrefab("forcefieldfxx")
Sparkshield_1(inst)
inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
fx.entity:SetParent(inst.entity)
fx.Transform:SetScale(0.8, 0.8, 0.8)
fx.Transform:SetPosition(0, 0.2, 0)
local fx_hitanim = function()
fx.AnimState:PlayAnimation("hit")
fx.AnimState:PushAnimation("idle_loop")
end
fx:ListenForEvent("blocked", fx_hitanim, inst)
inst.activec0 = true
inst.timec1 = true
inst:DoTaskInTime(--[[Duration]] 6, function()
fx:RemoveEventCallback("blocked", fx_hitanim, inst)
if inst:IsValid() then
fx.kill_fx(fx)
inst.components.health:SetAbsorptionAmount(0)
inst.components.talker:Say("[护盾] 冷却 -[600秒]")
inst:RemoveEventCallback("attacked", Sparkshield_1)
inst:DoTaskInTime(--[[Cooldown]] 600, function() inst.activec0 = false inst.timec1 = false end)
end end) 
end 
if not inst.components.health:IsDead() and inst.level >= 430 and inst.level < 1880 and not inst.activec0 and inst.shield_level2 then
--inst.components.talker:Say("Shield on!!")
inst.components.health:SetAbsorptionAmount(1)
local fx = SpawnPrefab("forcefieldfxx")
Sparkshield_1(inst)
inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
fx.entity:SetParent(inst.entity)
fx.Transform:SetScale(0.8, 0.8, 0.8)
fx.Transform:SetPosition(0, 0.2, 0)
local fx_hitanim = function()
fx.AnimState:PlayAnimation("hit")
fx.AnimState:PushAnimation("idle_loop")
end
fx:ListenForEvent("blocked", fx_hitanim, inst)
inst.activec0 = true
inst.timec2 = true
inst:DoTaskInTime(--[[Duration]] 8, function()
fx:RemoveEventCallback("blocked", fx_hitanim, inst)
if inst:IsValid() then
fx.kill_fx(fx)
inst.components.health:SetAbsorptionAmount(0)
inst.components.talker:Say("[护盾] 冷却 -[500秒]")
inst:RemoveEventCallback("attacked", Sparkshield_1)
inst:DoTaskInTime(--[[Cooldown]] 500, function() inst.activec0 = false inst.timec2 = false end)
end end) 
end 
if not inst.components.health:IsDead() and inst.level >= 1880 and inst.level < 7000 and not inst.activec0 and inst.shield_level3 then
--inst.components.talker:Say("Shield on!!")
inst.components.health:SetAbsorptionAmount(1)
local fx = SpawnPrefab("forcefieldfxx")
Sparkshield_1(inst)
inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
fx.entity:SetParent(inst.entity)
fx.Transform:SetScale(0.8, 0.8, 0.8)
fx.Transform:SetPosition(0, 0.2, 0)
local fx_hitanim = function()
fx.AnimState:PlayAnimation("hit")
fx.AnimState:PushAnimation("idle_loop")
end
fx:ListenForEvent("blocked", fx_hitanim, inst)
inst.activec0 = true
inst.timec3 = true
inst:DoTaskInTime(--[[Duration]] 10, function()
fx:RemoveEventCallback("blocked", fx_hitanim, inst)
if inst:IsValid() then
fx.kill_fx(fx)
inst.components.health:SetAbsorptionAmount(0)
inst.components.talker:Say("[护盾] 冷却 -[400秒]")
inst:RemoveEventCallback("attacked", Sparkshield_1)
inst:DoTaskInTime(--[[Cooldown]] 400, function() inst.activec0 = false inst.timec3 = false end)
end end) 
end 
if not inst.components.health:IsDead() and inst.level >= 7000 and not inst.activec0 and inst.shield_level4 then
--inst.components.talker:Say("Shield on!!")
inst.components.health:SetAbsorptionAmount(1)
local fx = SpawnPrefab("forcefieldfxx")
Sparkshield_1(inst)
inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/raise")
inst.SoundEmitter:PlaySound("dontstarve/creatures/chester/pop")
fx.entity:SetParent(inst.entity)
fx.Transform:SetScale(0.8, 0.8, 0.8)
fx.Transform:SetPosition(0, 0.2, 0)
local fx_hitanim = function()
fx.AnimState:PlayAnimation("hit")
fx.AnimState:PushAnimation("idle_loop")
end
fx:ListenForEvent("blocked", fx_hitanim, inst)
inst.activec0 = true
inst.timec4 = true
inst:DoTaskInTime(--[[Duration]] 12, function()
fx:RemoveEventCallback("blocked", fx_hitanim, inst)
if inst:IsValid() then
fx.kill_fx(fx)
inst.components.health:SetAbsorptionAmount(0)
inst.components.talker:Say("[护盾] 冷却 -[300秒]")
inst:RemoveEventCallback("attacked", Sparkshield_1)
inst:DoTaskInTime(--[[Cooldown]] 300, function() inst.activec0 = false inst.timec4 = false end)
end end) 
end 
end

---
local function shieldgo(inst)
if not inst.activec0 and not inst.timec1 and inst.level < 430  then
inst.components.talker:Say("[护盾]冷却完毕")
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
inst.timec1 = true
elseif not inst.activec0 and not inst.timec2 and inst.level >= 430 and inst.level < 1880  then
inst.components.talker:Say("[护盾]冷却完毕")
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
inst.timec2 = true
elseif not inst.activec0 and not inst.timec3 and inst.level >= 1880 and inst.level < 7000  then
inst.components.talker:Say("[护盾]冷却完毕")
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
inst.timec3 = true
elseif not inst.activec0 and not inst.timec4 and inst.level >= 7000 then
inst.components.talker:Say("[护盾]冷却完毕")
SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
inst.timec4 = true
end 
end
local function on_shield_act(inst)
inst:ListenForEvent("hungerdelta", shieldgo )
inst:ListenForEvent("attacked", Sparkshield_1)
if inst.level < 430 then
inst.shield_level1 = true
elseif inst.level >= 430 and inst.level < 1880 then
inst.shield_level2 = true
inst.shield_level1 = false
elseif inst.level >= 1880 and inst.level < 7000 then
inst.shield_level3 = true
inst.shield_level2 = false
inst.shield_level1 = false
elseif inst.level >= 7000 then
inst.shield_level4 = true
inst.shield_level3 = false
inst.shield_level2 = false
inst.shield_level1 = false
end
if inst.level < 430 and not inst.activec0 and not inst.components.health:IsDead() and not inst:HasTag("playerghost") then
inst.components.talker:Say("立场护盾!!\n(LV1)")
shield_go(inst)
elseif inst.level >= 430 and inst.level < 1880  and not inst.activec0 and not inst.components.health:IsDead() and not inst:HasTag("playerghost") then
inst.components.talker:Say("立场护盾!!\n(LV2)")
shield_go(inst)
elseif inst.level >= 1880 and inst.level < 7000  and not inst.activec0 and not inst.components.health:IsDead() and not inst:HasTag("playerghost") then
inst.components.talker:Say("立场护盾!!\n(LV3)")
shield_go(inst)
elseif inst.level >= 7000 and not inst.activec0 and not inst.components.health:IsDead() and not inst:HasTag("playerghost") then
inst.components.talker:Say("立场护盾!!\n(LV4)")
shield_go(inst)
elseif inst.activec0 and not inst.components.health:IsDead() and not inst:HasTag("playerghost") then
inst.components.talker:Say("它还没好呢~.")
inst.shield_level1 = false
inst.shield_level2 = false
inst.shield_level3 = false
inst.shield_level4 = false
elseif inst.activec0 and inst:HasTag("playerghost") then
inst.components.talker:Say("Oooohhhhh.!!")
elseif not inst.activec0 and inst:HasTag("playerghost") then
inst.components.talker:Say("Ooooh....")
end
end
  
 
AddModRPCHandler("musha", "on_shield_act", on_shield_act)

local function on_music_act1(inst)
if inst.components.playercontroller then

inst.components.playercontroller:Enable(false)
inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
local flute = inst.sg:GoToState("play_flute")
inst.AnimState:PlayAnimation("flute")
inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband")
inst.switlight = true
inst.entity:AddLight()
inst.Light:SetRadius(2.5)
inst.Light:SetFalloff(.8)
inst.Light:SetIntensity(.8)
inst.Light:SetColour(150/255,150/255,150/255)
inst.components.health:SetAbsorptionAmount(1)
inst.components.sanityaura.aura = (TUNING.SANITYAURA_HUGE*5)
scheduler:ExecuteInTime(3, function() inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") inst.sg:GoToState("play_flute")
scheduler:ExecuteInTime(3, function() inst.sg:GoToState("enter_onemanband")
scheduler:ExecuteInTime(3, function() inst.components.playercontroller:Enable(true) inst.AnimState:SetBloomEffectHandle("") inst.Light:Enable(true) inst.components.sanity:DoDelta(25) inst.components.talker:Say("[Light Aura] -on !") SpawnPrefab("statue_transition_2").Transform:SetPosition(inst:GetPosition():Get()) SpawnPrefab("ghosthound2").Transform:SetPosition(inst:GetPosition():Get())  inst.components.sanityaura.aura = (TUNING.SANITYAURA_MED) inst.components.sanity:DoDelta(30) inst.components.health:SetAbsorptionAmount(0) scheduler:ExecuteInTime(180, function() inst.components.talker:Say("[Light Aura] -off \n[performance] CoolDown -[1200sec]") inst.SoundEmitter:PlaySound("dontstarve/common/fireOut") SpawnPrefab("statue_transition_2").Transform:SetPosition(inst:GetPosition():Get()) inst.components.sanityaura.aura = 0 inst.Light:Enable(false) scheduler:ExecuteInTime(1200, function() inst.switlight = false inst.components.talker:Say("Musha Ready to [performance]") inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") scheduler:ExecuteInTime(2, function() inst.AnimState:SetBloomEffectHandle( "" ) inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") end)end)end)end)end)end)
end
end 
local function on_music_act2(inst)
if inst.components.playercontroller then

inst.components.playercontroller:Enable(false)
inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
local flute = inst.sg:GoToState("play_flute")
inst.AnimState:PlayAnimation("flute")
inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband")
inst.switlight = true
inst.entity:AddLight()
inst.Light:SetRadius(2.5)
inst.Light:SetFalloff(.8)
inst.Light:SetIntensity(.8)
inst.Light:SetColour(150/255,150/255,150/255)
inst.components.health:SetAbsorptionAmount(1)
inst.components.sanityaura.aura = (TUNING.SANITYAURA_HUGE*5)
scheduler:ExecuteInTime(3, function() inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") inst.sg:GoToState("play_flute")
scheduler:ExecuteInTime(3, function() inst.sg:GoToState("enter_onemanband")scheduler:ExecuteInTime(3, function() inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") inst.sg:GoToState("play_flute")
scheduler:ExecuteInTime(3, function() inst.components.playercontroller:Enable(true) inst.AnimState:SetBloomEffectHandle("") inst.Light:Enable(true) inst.components.sanity:DoDelta(25) inst.components.talker:Say("[Light Aura] -on !") SpawnPrefab("statue_transition_2").Transform:SetPosition(inst:GetPosition():Get()) SpawnPrefab("ghosthound").Transform:SetPosition(inst:GetPosition():Get())  inst.components.sanityaura.aura = (TUNING.SANITYAURA_MED) inst.components.sanity:DoDelta(30) inst.components.health:SetAbsorptionAmount(0) scheduler:ExecuteInTime(180, function() inst.components.talker:Say("[Light Aura] -off \n[performance] CoolDown -[1200sec]") inst.SoundEmitter:PlaySound("dontstarve/common/fireOut") SpawnPrefab("statue_transition_2").Transform:SetPosition(inst:GetPosition():Get()) inst.components.sanityaura.aura = 0 inst.Light:Enable(false) scheduler:ExecuteInTime(1200, function() inst.switlight = false inst.components.talker:Say("Musha Ready to [performance]") inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") scheduler:ExecuteInTime(2, function() inst.AnimState:SetBloomEffectHandle( "" ) inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") end)end)end)end)end)end)end)
end
end 
local function on_music_act3(inst)
if inst.components.playercontroller then

inst.components.playercontroller:Enable(false)
inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
local flute = inst.sg:GoToState("play_flute")
inst.AnimState:PlayAnimation("flute")
inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband")
inst.switlight = true
inst.entity:AddLight()
inst.Light:SetRadius(2.5)
inst.Light:SetFalloff(.8)
inst.Light:SetIntensity(.8)
inst.Light:SetColour(150/255,150/255,150/255)
inst.components.health:SetAbsorptionAmount(1)
inst.components.sanityaura.aura = (TUNING.SANITYAURA_HUGE*5)
scheduler:ExecuteInTime(3, function() inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") inst.sg:GoToState("play_flute")
scheduler:ExecuteInTime(3, function() inst.sg:GoToState("enter_onemanband")scheduler:ExecuteInTime(3, function() inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") inst.sg:GoToState("play_flute")scheduler:ExecuteInTime(3, function() inst.sg:GoToState("enter_onemanband")
scheduler:ExecuteInTime(3, function() inst.components.playercontroller:Enable(true) inst.AnimState:SetBloomEffectHandle("") inst.Light:Enable(true) inst.components.sanity:DoDelta(25) inst.components.talker:Say("[Light Aura] -on !") SpawnPrefab("statue_transition_2").Transform:SetPosition(inst:GetPosition():Get()) SpawnPrefab("shadowmusha").Transform:SetPosition(inst:GetPosition():Get())  inst.components.sanityaura.aura = (TUNING.SANITYAURA_MED) inst.components.sanity:DoDelta(30) inst.components.health:SetAbsorptionAmount(0) scheduler:ExecuteInTime(180, function() inst.components.talker:Say("[Light Aura] -off \n[performance] CoolDown -[1200sec]") inst.SoundEmitter:PlaySound("dontstarve/common/fireOut") SpawnPrefab("statue_transition_2").Transform:SetPosition(inst:GetPosition():Get()) inst.components.sanityaura.aura = 0 inst.Light:Enable(false) scheduler:ExecuteInTime(1200, function() inst.switlight = false inst.components.talker:Say("Musha Ready to [performance]") inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") scheduler:ExecuteInTime(2, function() inst.AnimState:SetBloomEffectHandle( "" ) inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") end)end)end)end)end)end)end)end)
end
end 
local function on_music_act4(inst)
if inst.components.playercontroller then

inst.components.playercontroller:Enable(false)
inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
local flute = inst.sg:GoToState("play_flute")
inst.AnimState:PlayAnimation("flute")
inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband")
inst.switlight = true
inst.entity:AddLight()
inst.Light:SetRadius(2.5)
inst.Light:SetFalloff(.8)
inst.Light:SetIntensity(.8)
inst.Light:SetColour(150/255,150/255,150/255)
inst.components.health:SetAbsorptionAmount(1)
inst.components.sanityaura.aura = (TUNING.SANITYAURA_HUGE*5)
scheduler:ExecuteInTime(3, function() inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") inst.sg:GoToState("play_flute")
scheduler:ExecuteInTime(3, function() inst.sg:GoToState("enter_onemanband")scheduler:ExecuteInTime(3, function() inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") inst.sg:GoToState("play_flute")scheduler:ExecuteInTime(3, function() inst.sg:GoToState("enter_onemanband")
scheduler:ExecuteInTime(3, function() inst.components.playercontroller:Enable(true) inst.AnimState:SetBloomEffectHandle("") inst.Light:Enable(true) inst.components.sanity:DoDelta(25) inst.components.talker:Say("[Light Aura] -on !") SpawnPrefab("statue_transition_2").Transform:SetPosition(inst:GetPosition():Get()) SpawnPrefab("tentacle_frost").Transform:SetPosition(inst:GetPosition():Get())  inst.components.sanityaura.aura = (TUNING.SANITYAURA_MED) inst.components.sanity:DoDelta(30) inst.components.health:SetAbsorptionAmount(0) scheduler:ExecuteInTime(180, function() inst.components.talker:Say("[Light Aura] -off \n[performance] CoolDown -[1200sec]") inst.SoundEmitter:PlaySound("dontstarve/common/fireOut") SpawnPrefab("statue_transition_2").Transform:SetPosition(inst:GetPosition():Get()) inst.components.sanityaura.aura = 0 inst.Light:Enable(false) scheduler:ExecuteInTime(1200, function() inst.switlight = false inst.components.talker:Say("Musha Ready to [performance]") inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") scheduler:ExecuteInTime(2, function() inst.AnimState:SetBloomEffectHandle( "" ) inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") end)end)end)end)end)end)end)end)
end
end 
local function on_music_act0(inst)
if inst.components.playercontroller then

inst.components.playercontroller:Enable(false)
inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )
local flute = inst.sg:GoToState("play_flute")
inst.AnimState:PlayAnimation("flute")
inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband")
inst.switlight = true
inst.entity:AddLight()
inst.Light:SetRadius(2.5)
inst.Light:SetFalloff(.8)
inst.Light:SetIntensity(.8)
inst.Light:SetColour(150/255,150/255,150/255)
inst.components.health:SetAbsorptionAmount(1)
inst.components.sanityaura.aura = (TUNING.SANITYAURA_MED)
inst.components.sanityaura.aura = (TUNING.SANITYAURA_HUGE*5)
scheduler:ExecuteInTime(3, function() inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") inst.sg:GoToState("play_flute")
scheduler:ExecuteInTime(3, function() inst.sg:GoToState("enter_onemanband")
scheduler:ExecuteInTime(3, function() inst.components.playercontroller:Enable(true) inst.AnimState:SetBloomEffectHandle("") inst.Light:Enable(true) inst.components.sanity:DoDelta(25) inst.components.talker:Say("[Light Aura] -on !")   inst.components.sanity:DoDelta(30) inst.components.health:SetAbsorptionAmount(0) scheduler:ExecuteInTime(180, function() inst.components.talker:Say("[Light Aura] -off \n[performance] CoolDown -[1200sec]") inst.SoundEmitter:PlaySound("dontstarve/common/fireOut") SpawnPrefab("statue_transition_2").Transform:SetPosition(inst:GetPosition():Get()) inst.components.sanityaura.aura = 0 inst.Light:Enable(false) scheduler:ExecuteInTime(1200, function() inst.switlight = false inst.components.talker:Say("Musha Ready to [performance]") inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") scheduler:ExecuteInTime(2, function() inst.AnimState:SetBloomEffectHandle( "" ) inst.SoundEmitter:PlaySound("dontstarve/wilson/onemanband") end)end)end)end)end)end)
end
end 
local function on_buff_act(inst)
local performance0 = 1
local performance1 = 0.25
local performance2 = 0.2
local performance3 = 0.15
local performance4 = 0.1
if math.random() < performance1 and not inst.switlight and not inst.components.health:IsDead() and not inst:HasTag("playerghost") then
inst.components.talker:Say("欣赏我的才艺吧!\n表演[type1]")
on_music_act1(inst)
elseif math.random() < performance2 and not inst.switlight and not inst.components.health:IsDead() and not inst:HasTag("playerghost") then
inst.components.talker:Say("欣赏我的才艺吧!\n表演[type2]")
on_music_act2(inst)
elseif math.random() < performance3 and not inst.switlight and not inst.components.health:IsDead() and not inst:HasTag("playerghost") then
inst.components.talker:Say("欣赏我的才艺吧!\n表演[type3]")
on_music_act3(inst)
elseif math.random() < performance4 and not inst.switlight and not inst.components.health:IsDead() and not inst:HasTag("playerghost") then
inst.components.talker:Say("欣赏我的才艺吧!\n表演[type4]")
on_music_act4(inst)
elseif math.random() < performance1 and not inst.switlight and not inst.components.health:IsDead() and not inst:HasTag("playerghost") then
inst.components.talker:Say("欣赏我的才艺吧!\n表演[type1]")
on_music_act1(inst)
elseif math.random() < performance2 and not inst.switlight and not inst.components.health:IsDead() and not inst:HasTag("playerghost") then
inst.components.talker:Say("欣赏我的才艺吧!\n表演[type2]")
on_music_act2(inst)
elseif math.random() < performance3 and not inst.switlight and not inst.components.health:IsDead() and not inst:HasTag("playerghost") then
inst.components.talker:Say("欣赏我的才艺吧!\n表演[type3]")
on_music_act3(inst)
elseif math.random() < performance4 and not inst.switlight and not inst.components.health:IsDead() and not inst:HasTag("playerghost") then
inst.components.talker:Say("欣赏我的才艺吧!\n表演[type4]")
on_music_act4(inst)
elseif math.random() < performance0 and not inst.switlight and not inst.components.health:IsDead() and not inst:HasTag("playerghost") then
inst.components.talker:Say("欣赏我的才艺吧!\n表演[type0]")
on_music_act0(inst)
elseif inst.switlight and not inst.components.health:IsDead() and not inst:HasTag("playerghost") then
inst.components.talker:Say("还想看? 嗯,一会儿的..")
elseif inst.components.health:IsDead() or inst:HasTag("playerghost") then
inst.components.talker:Say("Oooh Ohoooh..")
end
end

AddModRPCHandler("musha", "buff", on_buff_act)

 
--and inst.components.leader.numfollowers < 1 
local function yamche_update(inst)
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 25, {"yamcheb"})
for k,v in pairs(ents) do
if inst.follow and v.components.follower and not v.components.follower.leader and not inst.components.leader:IsFollower(v) and inst.components.leader:CountFollowers("yamcheb") == 0 and not v.hat then
inst.components.leader:AddFollower(v)
--on_yamche(inst)
v.yamche = true
v.sleepn = false 
v.fightn = false

--off_yamche(inst)
elseif not inst.follow and v.components.follower and v.components.follower.leader and inst.components.leader:IsFollower(v) and inst.components.leader:CountFollowers("yamcheb") == 1 and not v.hat then
v.sleepn = true
v.yamche = true 
v.fightn = true
inst.components.leader:RemoveFollowersByTag("yamcheb")

if inst.pick1 or inst.working_food then
v.components.talker:Say("[扔下收集的物品]")
v.pick1 = false
v.working_food = false
inst.pick1 = false
inst.working_food = false
end
end end end
 
local function order_yamche(inst)
if not inst.follow and not inst.components.health:IsDead() and not inst:HasTag("playerghost") then
inst.components.talker:Say("小凤, 跟着我!")
inst.follow = true
--master_yamche(inst)
yamche_update(inst)
elseif inst.follow and not inst.components.health:IsDead() and not inst:HasTag("playerghost") then
inst.components.talker:Say("小凤, 呆在这里")
inst.follow = false
--master_yamche(inst)
yamche_update(inst)
elseif not inst.follow and inst:HasTag("playerghost") then
inst.components.talker:Say("Fooolooowooomeeee...")
inst.follow = true
yamche_update(inst)
elseif inst.follow and inst:HasTag("playerghost") then
inst.components.talker:Say("Soooootaaaaayyyyyyy...")
inst.follow = false
yamche_update(inst)
end
end 

AddModRPCHandler("musha","yamche", order_yamche)

--specific
local function BabyPostInit(inst)
	if not inst.components.characterspecific then
		inst:AddComponent("characterspecific")	end
	inst.components.characterspecific:SetOwner("musha")
	inst.components.characterspecific:SetStorable(true)
	inst.components.characterspecific:SetComment("Phoenix seems difficult to tame..")
	return inst
end
AddPrefabPostInit("musha_small", BabyPostInit)
-----------------------------------------------
local function visual_hold(inst)
if not inst.visual_hold and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and not inst.full_hold and not inst.normal_hold and not inst.berserk_hold and not inst.valkyrie_hold then
inst.components.talker:Say("[变！变！变！] \n样式:[Current]")
inst.visual_hold = true
inst.full_hold = false
inst.normal_hold = true
inst.valkyrie_hold = true
inst.berserk_hold = true

elseif inst.visual_hold and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and not inst.full_hold and inst.normal_hold and inst.valkyrie_hold and inst.berserk_hold then
inst.components.talker:Say("[变！变！变！] \n样式:[Full]")
inst.visual_hold = true
inst.full_hold = true
inst.normal_hold = false
inst.valkyrie_hold = true
inst.berserk_hold = true
inst.AnimState:SetBuild("musha")

elseif inst.visual_hold and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and inst.full_hold and not inst.normal_hold and inst.valkyrie_hold and inst.berserk_hold  then
inst.components.talker:Say("[变！变！变！] \n样式:[Normal]")
inst.visual_hold = true
inst.full_hold = true
inst.normal_hold = true
inst.valkyrie_hold = false
inst.berserk_hold = true
inst.AnimState:SetBuild("musha_normal")

elseif inst.visual_hold and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and inst.full_hold and inst.normal_hold and not inst.valkyrie_hold and inst.berserk_hold then
inst.components.talker:Say("[变！变！变！] \n样式:[Valkyrie]")
inst.visual_hold = true
inst.full_hold = true
inst.normal_hold = true
inst.valkyrie_hold = true
inst.berserk_hold = false
inst.AnimState:SetBuild("musha_battle")

elseif inst.visual_hold and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and inst.full_hold and inst.normal_hold and inst.valkyrie_hold and not inst.berserk_hold then
inst.components.talker:Say("[变！变！变！] \n样式:[Berserk]")
inst.visual_hold = true
inst.full_hold = true
inst.normal_hold = true
inst.valkyrie_hold = true
inst.berserk_hold = true
inst.AnimState:SetBuild("musha_hunger")

elseif inst.visual_hold and not inst.components.health:IsDead() and not inst:HasTag("playerghost") and inst.full_hold and inst.normal_hold and inst.valkyrie_hold and inst.berserk_hold then
inst.components.talker:Say("[变！变！变！] \n样式:[自动]")
inst.visual_hold = false
inst.full_hold = false
inst.normal_hold = false
inst.valkyrie_hold = false
inst.berserk_hold = false

end end 
AddModRPCHandler("musha","visual_hold", visual_hold)

local function yamche2(inst)
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 25, {"yamcheb"})
for k,v in pairs(ents) do
if v.components.follower and v.components.follower.leader and inst.components.leader:IsFollower(v) and inst.working_food and not inst:HasTag("playerghost") then
v.components.inventory:DropEverything(true)
SpawnPrefab("small_puff").Transform:SetPosition(v:GetPosition():Get())
--v.components.talker:Say("[Dropping all items]")
inst.working_food = false
v.working_food = false
v.drop = true
end
if v.components.follower and v.components.follower.leader and inst.components.leader:IsFollower(v) and not inst.working_food and not inst.pick1 and not inst:HasTag("playerghost") then
inst.components.talker:Say("小凤,去捡起来.\n[收集物品]")
inst.pick1 = true
v.pick1 = true
v.drop = false
v.yamche = true 
if not v.light_on then
v.components.talker:Say("[收集物品]\n饥饿速率(x3)")
elseif v.light_on then
v.components.talker:Say("[发光]+[收集物品]\n饥饿速率(x11)")
end
elseif v.components.follower and v.components.follower.leader and inst.components.leader:IsFollower(v) and not inst.working_food and inst.pick1 and not inst:HasTag("playerghost") then
inst.components.talker:Say("让我看看你都找到了什么.\n[扔到所有物品]")
inst.pick1 = false
v.pick1 = false
v.drop = true
if not v.light_on then
v.components.talker:Say("[休息]\n饥饿速率(x1)")
elseif v.light_on then
v.components.talker:Say("[发光]n饥饿速率(x8)")
end
elseif not inst.components.leader:IsFollower(v) and not inst:HasTag("playerghost") and inst.components.leader:CountFollowers("yamcheb") == 0 then
inst.components.talker:Say("他在休息..")
elseif v.components.follower and v.components.follower.leader and inst.components.leader:IsFollower(v) and not inst.working_food and not inst.pick1 and inst:HasTag("playerghost") then
inst.components.talker:Say("cooooooooleeecttt...")
inst.pick1 = true
v.pick1 = true
v.drop = false
v.yamche = true 
if not v.light_on then
v.components.talker:Say("[收集物品]\n饥饿速率(x3)")
elseif v.light_on then
v.components.talker:Say("[发光]+[收集物品]\n饥饿速率(x11)")
end
elseif v.components.follower and v.components.follower.leader and inst.components.leader:IsFollower(v) and not inst.working_food and inst.pick1 and inst:HasTag("playerghost") then
inst.components.talker:Say("drooooooopeeeee...")
inst.pick1 = false
v.pick1 = false
v.drop = true
if not v.light_on then
v.components.talker:Say("[休息]\n饥饿速率(x1)")
elseif v.light_on then
v.components.talker:Say("[发光]\n饥饿速率(x8)")
end
end end end
AddModRPCHandler("musha","yamche2", yamche2)

local function yamche3(inst)
local x,y,z = inst.Transform:GetWorldPosition()
local ents = TheSim:FindEntities(x,y,z, 25, {"yamcheb"})
for k,v in pairs(ents) do
if v.components.follower and v.components.follower.leader and inst.components.leader:IsFollower(v) and inst.pick1 and not inst:HasTag("playerghost") then
v.components.inventory:DropEverything(true)
SpawnPrefab("small_puff").Transform:SetPosition(v:GetPosition():Get())
--v.components.talker:Say("[Dropping all items]")
inst.pick1 = false
v.pick1 = false
v.drop = true
end
if v.components.follower and v.components.follower.leader and inst.components.leader:IsFollower(v) and not inst.pick1 and not inst.working_food and not inst:HasTag("playerghost") then
inst.components.talker:Say("小凤,去收集起来.\n[收获物品]")
inst.working_food = true
v.working_food = true
v.drop = false
v.yamche = true 
if not v.light_on then
v.components.talker:Say("[收获物品]\n饥饿速率e(x6)")
elseif v.light_on then
v.components.talker:Say("[发光]+[收获物品]\n饥饿速率(x14)")
end
elseif v.components.follower and v.components.follower.leader and inst.components.leader:IsFollower(v) and not inst.pick1 and inst.working_food and not inst:HasTag("playerghost") then
inst.components.talker:Say("小凤, 给我看看你都收集了什么.\n[Drop - All]")
inst.working_food = false
v.working_food = false
v.drop = true
if not v.light_on then
v.components.talker:Say("[休息]\n饥饿速率x1)")
elseif v.light_on then
v.components.talker:Say("[发光]\n饥饿速率(x8)")
end
elseif not inst.components.leader:IsFollower(v) and not inst:HasTag("playerghost") and inst.components.leader:CountFollowers("yamcheb") == 0 then
inst.components.talker:Say("他需要更多的休息..")
elseif v.components.follower and v.components.follower.leader and inst.components.leader:IsFollower(v) and not inst.pick1 and not inst.working_food and inst:HasTag("playerghost") then
inst.components.talker:Say("cooooooooleeecttt...")
inst.working_food = true
v.working_food = true
v.drop = false
v.yamche = true 
if not v.light_on then
v.components.talker:Say("[收获物品]\n饥饿速率(x6)")
elseif v.light_on then
v.components.talker:Say("[发光]+[收获物品]\n饥饿速率(x14)")
end
elseif v.components.follower and v.components.follower.leader and inst.components.leader:IsFollower(v) and not inst.pick1 and inst.working_food and inst:HasTag("playerghost") then
inst.components.talker:Say("drooooooopeeeee...")
inst.working_food = false
v.working_food = false
v.drop = true
if not v.light_on then
v.components.talker:Say("[休息]\n饥饿速率(x1)")
elseif v.light_on then
v.components.talker:Say("[发光]\n饥饿速率(x8)")
end
end end end
AddModRPCHandler("musha","yamche3", yamche3)

------------------------------------------------
-------------comfortable health info
local healthinfoActive = 0
for _, moddir in ipairs(GLOBAL.KnownModIndex:GetModsToLoad()) do
    if GLOBAL.KnownModIndex:GetModInfo(moddir).name == "Health Info" then
		healthinfoActive = 1
   end end 
 
--yamche health info (thx health info)
if healthinfoActive == 0 then
AddClassPostConstruct("components/health_replica", function(self)
self.SetCurrent = function(self, current)
if self.inst.components and self.inst.components.health and self.inst.components.healthinfo_copy then
local str = self.inst.components.healthinfo_copy.text
if str ~= nil then
local h=self.inst.components.health
local mx=math.floor(h.maxhealth-h.minhealth)
local cur=math.floor(h.currenthealth-h.minhealth)
local i,j = string.find(str, " [", nil, true)
if i ~= nil and i > 1 then str = string.sub(str, 1, (i-1)) end
str = "["..math.floor(cur*100/mx).."%]"
if self.inst.components.healthinfo_copy and self.inst:HasTag("yamcheb") then
self.inst.components.healthinfo_copy:SetText(str)
end end end
if self.classified ~= nil then
self.classified:SetValue("currenthealth", current)
end end end)
--hover text
AddGlobalClassPostConstruct('widgets/hoverer', 'HoverText', function(self)
self.OnUpdate = function(self)
local using_mouse = self.owner.components and self.owner.components.playercontroller:UsingMouse()
if using_mouse ~= self.shown then
if using_mouse then
self:Show()
else
self:Hide()
end end
if not self.shown then
return
end
local str = nil
if self.isFE == false then
str = self.owner.HUD.controls:GetTooltip() or self.owner.components.playercontroller:GetHoverTextOverride()
else
str = self.owner:GetTooltip()
end
local secondarystr = nil
local lmb = nil
if not str and self.isFE == false then
lmb = self.owner.components.playercontroller:GetLeftMouseAction()
if lmb then
str = lmb:GetActionString()
if lmb.target and lmb.invobject == nil and lmb.target ~= lmb.doer then
local name = lmb.target:GetDisplayName() or (lmb.target.components.named and lmb.target.components.named.name)
if name then
local adjective = lmb.target:GetAdjective()
if adjective then
str = str.. " " .. adjective .. " " .. name
else
str = str.. " " .. name
end
if lmb.target.replica.stackable ~= nil and lmb.target.replica.stackable:IsStack() then
str = str .. " x" .. tostring(lmb.target.replica.stackable:StackSize())
end
if lmb.target.components.inspectable and lmb.target.components.inspectable.recordview and lmb.target.prefab then
GLOBAL.ProfileStatsSet(lmb.target.prefab .. "_seen", true)
end end end
if lmb.target and lmb.target ~= lmb.doer and lmb.target.components and lmb.target.components.healthinfo_copy and lmb.target.components.healthinfo_copy.text ~= '' then
local name = lmb.target:GetDisplayName() or (lmb.target.components.named and lmb.target.components.named.name) or ""
local i,j = string.find(str, " " .. name, nil, true)
if i ~= nil and i > 1 then str = string.sub(str, 1, (i-1)) end
str = str.. " " .. name .. " " .. lmb.target.components.healthinfo_copy.text
end end
local rmb = self.owner.components.playercontroller:GetRightMouseAction()
if rmb then
secondarystr = GLOBAL.STRINGS.RMB .. ": " .. rmb:GetActionString()
end end
if str then
if self.strFrames == nil then self.strFrames = 1 end
if self.str ~= self.lastStr then
--print("new string")
self.lastStr = self.str
self.strFrames = SHOW_DELAY
else
self.strFrames = self.strFrames - 1
if self.strFrames <= 0 then
if lmb and lmb.target and lmb.target:HasTag("player") then
self.text:SetColour(lmb.target.playercolour)
else
self.text:SetColour(1,1,1,1)
end
self.text:SetString(str)
self.text:Show()
end end
else
self.text:Hide()
end
if secondarystr then
YOFFSETUP = -80
YOFFSETDOWN = -50
self.secondarytext:SetString(secondarystr)
self.secondarytext:Show()
else
self.secondarytext:Hide()
end
local changed = (self.str ~= str) or (self.secondarystr ~= secondarystr)
self.str = str
self.secondarystr = secondarystr
if changed then
local pos = TheInput:GetScreenPosition()
self:UpdatePosition(pos.x, pos.y)
end end end)

AddPrefabPostInitAny(function(inst)
	if inst.components.healthinfo_copy == nil then
		inst:AddComponent("healthinfo_copy")
	if inst.components.health and inst:HasTag("yamcheb") then
			str = ""
			local h=inst.components.health
			local mx=math.floor(h.maxhealth-h.minhealth)
			local cur=math.floor(h.currenthealth-h.minhealth)
			
				str = "["..math.floor(cur*100/mx).."%]"
		inst.components.healthinfo_copy:SetText(str)
		end	end end)
end
-------------------------------------------------
-------------------------------------------------
--[[
-------yamche floating badge 
local function Yamchebadge ( inst )

	inst:DoTaskInTime( 0, function() 
		local controls = inst.HUD.controls
	local YamcheStatusDisplays = require "widgets/yamchestatusdisplays"
	controls.YamcheStatus = controls:AddChild(YamcheStatusDisplays(inst))
		controls.YamcheStatus:SetPosition(0, -250, 0)
	end)	
end
AddSimPostInit( Yamchebadge )
]]
-------------describe
---------------
STRINGS.NAMES.MUSHA_EGG = "凤凰蛋"
STRINGS.NAMES.MUSHA_EGG_CRACKED = "凤凰蛋"
STRINGS.NAMES.MUSHA_EGGS1 = "凤凰蛋(LV 2)"
STRINGS.NAMES.MUSHA_EGG_CRACKEDS1 = "凤凰蛋"
STRINGS.NAMES.MUSHA_EGGS2 = "凤凰蛋(LV 3)"
STRINGS.NAMES.MUSHA_EGG_CRACKEDS2 = "凤凰蛋"
STRINGS.NAMES.MUSHA_EGGS3 = "凤凰蛋(LV 4)"
STRINGS.NAMES.MUSHA_EGG_CRACKEDS3 = "凤凰蛋"
STRINGS.NAMES.MUSHA_EGG1 = "凤凰蛋(LV 5)"
STRINGS.NAMES.MUSHA_EGG_CRACKED1 = "凤凰蛋"
STRINGS.NAMES.MUSHA_EGG2 = "凤凰蛋(LV 6)"
STRINGS.NAMES.MUSHA_EGG_CRACKED2 = "凤凰蛋"
STRINGS.NAMES.MUSHA_EGG3 = "凤凰蛋(LV 7)"
STRINGS.NAMES.MUSHA_EGG_CRACKED3 = "凤凰蛋"
STRINGS.NAMES.MUSHA_EGG8 = "凤凰蛋(LV 8)"
STRINGS.NAMES.MUSHA_EGG_CRACKED8 = "凤凰蛋"
STRINGS.NAMES.MUSHA_EGG = "凤凰蛋"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_EGG = "凤凰蛋"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_EGGS1 = "凤凰蛋(LV 2)"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_EGGS2 = "凤凰蛋(LV 3)"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_EGGS3 = "凤凰蛋(LV 4)"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_EGG1 = "凤凰蛋(LV 5)"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_EGG2 = "凤凰蛋(LV 6)"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_EGG3 = "凤凰蛋(LV 7)"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_EGG8 = "凤凰蛋(LV 8)"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_EGG_CRACKED = "这不是暮莎的,是小凤的.."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_EGG_CRACKEDS1 = "这不是暮莎的,是小凤的.."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_EGG_CRACKEDS2 = "这不是暮莎的,是小凤的.."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_EGG_CRACKEDS3 = "这不是暮莎的,是小凤的.."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_EGG_CRACKED1 = "这不是暮莎的,是小凤的.."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_EGG_CRACKED2 = "这不是暮莎的,是小凤的.."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_EGG_CRACKED3 = "这不是暮莎的,是小凤的.."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_EGG_CRACKED8 = "这不是暮莎的,是小凤的.."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_SMALL = "挺萌的小鸟!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TEEN = "呃...小凤长大的真快.."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TEENR1 = "呃...小凤长大的真快.."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TEENR2 = "呃...小凤长大的真快.."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TEENR3 = "呃...小凤长大的真快.."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TEENR4 = "呃...小凤长大的真快.."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TEENICE = "呃...小凤长大的真快.."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALL = "小凤能吃所有的东西,真好"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALLR1 = "小凤能吃所有的东西,真好"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALLR2 = "小凤能吃所有的东西,真好"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALLR3 = "小凤能吃所有的东西,真好"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALLR4 = "小凤能吃所有的东西,真好"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALLRICE = "小凤能吃所有的东西,真好"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALL2 = "小凤最棒了!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALLRR1 = "小凤最棒了!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALLRR2 = "小凤最棒了!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALLRR3 = "小凤最棒了!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALLRR4 = "小凤最棒了!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALLRR5 = "小凤最棒了!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALLRRICE = "小凤最棒了!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALL3 = "小凤是暮莎的好朋友."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALLRRR1 = "小凤是暮莎的好朋友."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALLRRR2 = "小凤是暮莎的好朋友."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALLRRR3 = "小凤是暮莎的好朋友."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALLRRR4 = "小凤是暮莎的好朋友."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALLRRR5 = "小凤是暮莎的好朋友."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALLRRRICE = "小凤是暮莎的好朋友."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALL4 = "对!暮莎和小凤是一家的."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALLRRRR1 = "对!暮莎和小凤是一家的."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALLRRRR2 = "对!暮莎和小凤是一家的."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALLRRRR3 = "对!暮莎和小凤是一家的."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALLRRRR4 = "对!暮莎和小凤是一家的."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALLRRRR5 = "对!暮莎和小凤是一家的."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALLRRRR6 = "对!暮莎和小凤是一家的."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALLRRRRICE = "对!暮莎和小凤是一家的."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALL5 = "一起旅行真是极好的."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALLRRRRR1 = "一起旅行真是极好的."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALLRRRRR2 = "一起旅行真是极好的."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALLRRRRR3 = "一起旅行真是极好的."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALLRRRRR4 = "一起旅行真是极好的."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALLRRRRR5 = "一起旅行真是极好的."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALLRRRRR6 = "一起旅行真是极好的."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_TALLRRRRRICE = "一起旅行真是极好的."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_RP1 = "别饿到伙伴."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_RP2 = "别饿到伙伴."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_RP3 = "别饿到伙伴."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_RP4 = "别饿到伙伴."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_RP5 = "别饿到伙伴."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_RP6 = "别饿到伙伴."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_RP7 = "别饿到伙伴."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHA_RPICE = "别饿到伙伴."
STRINGS.NAMES.GHOSTHOUND = "幽灵犬"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.GHOSTHOUND = "暮莎召唤了幽灵."
STRINGS.NAMES.GHOSTHOUND2 = "幽灵幼犬"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.GHOSTHOUND2 = "暮莎召唤了幽灵."
STRINGS.NAMES.SHADOWMUSHA = "暮莎之影"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.SHADOWMUSHA = "她看起来跟暮莎一样."
STRINGS.NAMES.TENTACLE_FROST = "冷冻触手"
STRINGS.RECIPE_DESC.MUSHA_EGG = "凤凰蛋 (order'z')"
STRINGS.RECIPE_DESC.MUSHA_EGGS1 = "凤凰蛋 (Lv.2)"
STRINGS.RECIPE_DESC.MUSHA_EGGS2 = "凤凰蛋 (Lv.3)"
STRINGS.RECIPE_DESC.MUSHA_EGGS3 = "凤凰蛋 (Lv.4)"
STRINGS.RECIPE_DESC.MUSHA_EGG1 = "凤凰蛋 (Lv.5)"
STRINGS.RECIPE_DESC.MUSHA_EGG2 = "凤凰蛋 (Lv.6)"
STRINGS.RECIPE_DESC.MUSHA_EGG3 = "凤凰蛋 (Lv.7)"
STRINGS.RECIPE_DESC.MUSHA_EGG8 = "凤凰蛋 (Lv.Max)"
STRINGS.RECIPE_DESC.REDGEM = "宝石炼金术(蓝->红)"
STRINGS.RECIPE_DESC.BLUEGEM = "宝石炼金术(红->蓝)" 
STRINGS.RECIPE_DESC.NITRE = "宝石炼金术(金->硝石)" 
STRINGS.NAMES.NITRE = "硝石"
STRINGS.NAMES.REDGEM = "红宝石"
STRINGS.NAMES.REDGEM2 = "红宝石"
STRINGS.NAMES.BLUEGEM = "蓝宝石" 
STRINGS.NAMES.BLUEGEM2 = "蓝宝石" 
STRINGS.NAMES.MUSHASWORD_BASE = "损坏之刃"
STRINGS.NAMES.MUSHASWORD = "凤凰刃"
STRINGS.NAMES.MUSHASWORD_FROST = "寒冰凤凰刃"
STRINGS.RECIPE_DESC.MUSHASWORD_BASE = "损坏的凤凰刃, 视觉变化"
STRINGS.RECIPE_DESC.MUSHASWORD = "可成长的武器, 视觉变化"

STRINGS.RECIPE_DESC.MUSHASWORD_FROST = "可成长的武器, 视觉变化"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHASWORD_BASE = "让我们把它修好吧!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHASWORD = "不是太锋利,但还算是一把剑"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MUSHASWORD_FROST = "很锋利!!"
STRINGS.NAMES.MUSHA_FLUTE = "凤凰短笛"
STRINGS.RECIPE_DESC.MUSHA_FLUTE = "治愈你的同伴(250HP)."
STRINGS.NAMES.GLOWDUST = "光之尘埃"
STRINGS.RECIPE_DESC.GLOWDUST = "闪闪发光的粉末"
STRINGS.NAMES.CRISTAL = "水晶糖果"
STRINGS.RECIPE_DESC.CRISTAL = "Summon=>bulb-plant,Yamche=>EGG"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.CRISTAL = "看起来像普通的水晶."
STRINGS.NAMES.EXP = "能量精华"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.EXP = "这会让暮莎变得强大."
STRINGS.NAMES.EXP1000CHEAT = "超级精华"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.EXP1000CHEAT = "暮莎会成神的."
STRINGS.RECIPE_DESC.EXP = "它能帮暮莎修好齿轮."
STRINGS.RECIPE_DESC.EXP10 = "增加EXP 10"
STRINGS.RECIPE_DESC.EXP50 = "增加EXP 50"
STRINGS.RECIPE_DESC.EXP100 = "增加EXP 100"
STRINGS.NAMES.FROSTHAMMER = "冰霜之锤"
STRINGS.RECIPE_DESC.FROSTHAMMER = "修复冰霜之锤."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.FROSTHAMMER = "这是我的王室专属武器"
STRINGS.NAMES.BROKEN_FROSTHAMMER = "冰霜护甲"
STRINGS.RECIPE_DESC.BROKEN_FROSTHAMMER = "这是我的王室专属护甲"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BROKEN_FROSTHAMMER =  "多功能的."
STRINGS.NAMES.HAT_MPHOENIX = "凤凰头盔"
STRINGS.RECIPE_DESC.HAT_MPHOENIX = "可穿戴成长的面具"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.HAT_MPHOENIX = "一个中世纪的头盔."
STRINGS.NAMES.HAT_MPRINCESS = "小狗公主冠"
STRINGS.RECIPE_DESC.HAT_MPRINCESS = "护盾, 脑残回复, 视野"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.HAT_MPRINCESS = "皇家皇家王冠."
STRINGS.NAMES.HAT_MCROWN = "小狗女王冠"
STRINGS.RECIPE_DESC.HAT_MCROWN = "护盾, 脑残回复, 特别的"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.HAT_MCROWN = "好棒."
STRINGS.NAMES.HAT_MBUNNY = "兔子帽"
STRINGS.RECIPE_DESC.HAT_MBUNNY = "成长, 可穿戴"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.HAT_MBUNNY = "看起来像兔耳朵."
STRINGS.NAMES.ARMOR_MUSHAA = "暮莎护甲"
STRINGS.RECIPE_DESC.ARMOR_MUSHAA = "可成长的护甲背包"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.ARMOR_MUSHAA = "像个连衣裙."
STRINGS.NAMES.ARMOR_MUSHAB = "公主护甲"
STRINGS.RECIPE_DESC.ARMOR_MUSHAB = "可成长的护甲背包"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.ARMOR_MUSHAB = "完美!就像我一样." 
---------------
STRINGS.PHOENIXS=
{    --random
"小凤队长","这小笨蛋","坚硬的小凤","雷神附体","这是小凤","勇敢的小鸟","挺萌的","猫头凤","阳光小凤","月之小凤","汉城小凤","苹果小凤","薇莉亚 小凤","光合小凤","笨蛋凤","暮莎凤","梅丽莎 小凤","琳达 小凤 ","Battleborn Yamche ","Grey Yamche","Sky Yamche","Lucia Yamche","Khajit Yamche","Pig Yamche","Mjoll Yamche","Lioness Yamche","Muiri Yamche","Ysolda Yamche","Rayya Yamche","Falkas Yamche","Vilkas Yamche","Aela Yamche","Huter Yamche","Huntress Yamche","Queen Yamche","Fire Yamche","Cicero Yamche","Top Yamche","Lina Yamche","Totoro Yamche","Yu-na Yamche","Winter Yamche","White Yamche","Mellisa Yamche","Riften Yamche","Dawnstar Yamche","Windhelm Yamche","Pho Yamche","Sneaky Yamche","Kiwis Yamche","Coco Yamche","Moon Yamche","Pizza Yamche","Sugar Yamche","Orc Yamche","Elf Yamche","Knight Yamche","Lich Yamche","Azeroth Yamche","Tauren Yamche","Troll Yamche","Thrall Yamche","Narugar Yamche","Yancook Yamche","Tirano Yamche","Honey Yamche","Isis Yamche","Bosom Yamche","Esmeralda Yamche","Pluvia Yamche","Doraemon Yamche","Dooly Yamche","Apple Yamche","IU Yamche","Gandalf Yamche","Frodo Yamche","Sam Yamche","Regolas Yamche","Gimli Yamche","Boromir Yamche","Wilxon Yamche","Willo Yamche","Wolfkong Yamche","Wenil Yamche","WX79 Yamche","Wickerbi Yamche","Woorie Yamche","Wex Yamche","Maximus Yamche","Wigfreedom Yamche","Webbers Yamche","Naruto Yamche","Sasuke Yamche","Withcer",
 }

AddModCharacter("musha","FEMALE")
--table.insert(GLOBAL.CHARACTER_GENDERS.FEMALE, "musha")
