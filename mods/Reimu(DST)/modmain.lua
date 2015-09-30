local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local STRINGS = GLOBAL.STRINGS
local Recipe = GLOBAL.Recipe
local require = GLOBAL.require
local SpawnPrefab = GLOBAL.SpawnPrefab
local ACTIONS = GLOBAL.ACTIONS
local Action = GLOBAL.Action
local TECH = GLOBAL.TECH
local GetPlayer = GLOBAL.GetPlayer
local Vector3 = GLOBAL.Vector3
local resolvefilepath = GLOBAL.resolvefilepath

PrefabFiles = {
	"reimu",
	"lf",
	"qmb",
	"yyy",
	"ground_l_breaking",
}

STRINGS.NAMES.LF = "灵符"
STRINGS.RECIPE_DESC.LF = "附有灵力纸符,\n可获得3张."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.LF = "能换十万吗？" 

STRINGS.NAMES.YYY = "阴阳玉"
STRINGS.RECIPE_DESC.YYY = "散发着灵光的宝玉，\n听说还可以减肥."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.YYY = "十万，低了不卖." 

STRINGS.NAMES.QMB = "御币"
STRINGS.RECIPE_DESC.QMB = "能驱散不洁的圣物，\n驱痒也是."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.QMB = "用了背还是痒，不用更痒." 

-- strings! Any "REIMU" below would have to be replaced by the prefab name of your character.

-- First up, the character select screen lines 
-- note: these are lower-case character name
STRINGS.CHARACTER_TITLES.reimu = "乐园巫女"
STRINGS.CHARACTER_NAMES.reimu = "博丽灵梦"
STRINGS.CHARACTER_DESCRIPTIONS.reimu = "*身手矫健\n*巫女特有的道具\n*无惧怪物"
STRINGS.CHARACTER_QUOTES.reimu = "\"这是什么地方？\""

-- You can also add any kind of custom dialogue that you would like. Don't forget to make
-- categores that don't exist yet using = {}
-- note: these are UPPER-CASE charcacter name
STRINGS.CHARACTERS.REIMU = {}

STRINGS.CHARACTERS.REIMU.ANNOUNCE_BOOMERANG  = "无聊的小孩子玩具."
STRINGS.CHARACTERS.REIMU.ANNOUNCE_CHARLIE  = "趁我看不见吗?"
STRINGS.CHARACTERS.REIMU.ANNOUNCE_CHARLIE_ATTACK = "别乱摸！"

STRINGS.CHARACTERS.REIMU.ANNOUNCE_COLD  = "巫女也是会冷的."
STRINGS.CHARACTERS.REIMU.ANNOUNCE_CRAFTING_FAIL  = "没十万能干?"
STRINGS.CHARACTERS.REIMU.ANNOUNCE_DUSK = "好想回家."
STRINGS.CHARACTERS.REIMU.ANNOUNCE_HUNGRY  = "我要吃点东西才行."
STRINGS.CHARACTERS.REIMU.ANNOUNCE_HUNT_BEAST_NEARBY = "就是你了. "
STRINGS.CHARACTERS.REIMU.ANNOUNCE_HUNT_LOST_TRAIL  = "去哪儿了?"
STRINGS.CHARACTERS.REIMU.ANNOUNCE_INV_FULL  = "我装不下了. "
STRINGS.CHARACTERS.REIMU.ANNOUNCE_KNOCKEDOUT  = "噢... "
STRINGS.CHARACTERS.REIMU.ANNOUNCE_NODANGERSLEEP  = "先打怪再说."
STRINGS.CHARACTERS.REIMU.ANNOUNCE_NOHUNGERSLEEP  = "敢先吃点东西么."
STRINGS.CHARACTERS.REIMU.ANNOUNCE_NODAYSLEEP  = "白日梦还是算了吧."
STRINGS.CHARACTERS.REIMU.ANNOUNCE_NO_TRAP  = "呵呵. "
STRINGS.CHARACTERS.REIMU.ANNOUNCE_PECKED  = "不要作死. "
STRINGS.CHARACTERS.REIMU.ANNOUNCE_QUAKE = " S子,别闹. "
STRINGS.CHARACTERS.REIMU.ANNOUNCE_RESEARCH  = "我学到点东西. "
STRINGS.CHARACTERS.REIMU.ANNOUNCE_TORCH_OUT  = "阴阳玉呢?"
STRINGS.CHARACTERS.REIMU.ANNOUNCE_WORMHOLE  = "里面有黏糊糊的液体."

STRINGS.CHARACTERS.REIMU.ANNOUNCE_EAT = {}
STRINGS.CHARACTERS.REIMU.ANNOUNCE_EAT.GENERIC  = "难吃."
STRINGS.CHARACTERS.REIMU.ANNOUNCE_EAT.PAINFULL = "吃点正常的好么?"
STRINGS.CHARACTERS.REIMU.ANNOUNCE_EAT.SPOILED = "快吐了."
STRINGS.CHARACTERS.REIMU.ANNOUNCE_EAT.STALE  = "已经开始变质了."

STRINGS.CHARACTERS.REIMU.BATTLECRY = {}
STRINGS.CHARACTERS.REIMU.BATTLECRY.GENERIC  = "退散!"
STRINGS.CHARACTERS.REIMU.BATTLECRY.PIG = "我爱猪肉."
STRINGS.CHARACTERS.REIMU.BATTLECRY.PREY  = "别以为你小我就不敢欺负你. "
STRINGS.CHARACTERS.REIMU.BATTLECRY.SPIDER  = "蜘蛛妖退散!"
STRINGS.CHARACTERS.REIMU.BATTLECRY.SPIDER_WARRIOR  = "你是比较麻烦的一类."
STRINGS.CHARACTERS.REIMU.BATTLECRY.HOUND  = "又是猪妖."
STRINGS.CHARACTERS.REIMU.BATTLECRY.LEIF  = "树妖么?"

-- Description
STRINGS.CHARACTERS.REIMU.DESCRIBE = {}
STRINGS.CHARACTERS.REIMU.DESCRIBE.ROBIN = "太多春也不好啊."
STRINGS.CHARACTERS.REIMU.DESCRIBE.SLURPER  = "要驱散吗?"
STRINGS.CHARACTERS.REIMU.DESCRIBE.ORANGEAMULET  = "这也许魔理沙比较感兴趣."
STRINGS.CHARACTERS.REIMU.DESCRIBE.YELLOWSTAFF  = "这也许魔理沙比较感兴趣."
STRINGS.CHARACTERS.REIMU.DESCRIBE.YELLOWGEM  = "黄宝石,十万吗? "
STRINGS.CHARACTERS.REIMU.DESCRIBE.ORANGEGEM  = "橙宝石,十万吗?"
STRINGS.CHARACTERS.REIMU.DESCRIBE.STAFFLIGHT  = "没阴阳玉给力啊."
STRINGS.CHARACTERS.REIMU.DESCRIBE.ANCIENT_ALTAR  = "这让我想起不寒而栗."
STRINGS.CHARACTERS.REIMU.DESCRIBE.CAVE_BANANA  = "看起来像一个正常的香蕉."
STRINGS.CHARACTERS.REIMU.DESCRIBE.ROCKY  = "那啥啊?"
STRINGS.CHARACTERS.REIMU.DESCRIBE.EVERGREEN = "希望没有烦人的妖精."

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/reimu.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/reimu.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/reimu.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/reimu.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/reimu_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/reimu_silho.xml" ),

    Asset( "IMAGE", "bigportraits/reimu.tex" ),
    Asset( "ATLAS", "bigportraits/reimu.xml" ),

    Asset( "IMAGE", "images/reimu1.tex"),
    Asset( "ATLAS", "images/reimu1.xml"),

    Asset( "IMAGE", "images/reimutab.tex"),
    Asset( "ATLAS", "images/reimutab.xml"),

    Asset( "IMAGE", "images/inventoryimages/lf.tex"),
    Asset( "ATLAS", "images/inventoryimages/lf.xml"),

    Asset( "IMAGE", "images/inventoryimages/qmb.tex"),
    Asset( "ATLAS", "images/inventoryimages/qmb.xml"),

    Asset( "IMAGE", "images/inventoryimages/yyy.tex"),
    Asset( "ATLAS", "images/inventoryimages/yyy.xml"),

    Asset( "IMAGE", "images/avatars/avatar_reimu.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_reimu.xml" ),
    
    Asset( "IMAGE", "images/avatars/avatar_ghost_reimu.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_reimu.xml" ),

}

local CUSTOM_RECIPETABS = GLOBAL.CUSTOM_RECIPETABS
CUSTOM_RECIPETABS.REIMUTABS = { str = "REIMUTABS", sort = 999, icon = "reimutab.tex", icon_atlas = resolvefilepath("images/reimutab.xml") }
STRINGS.TABS.REIMUTABS = "灵力"

	local lf = Recipe("lf", {Ingredient("papyrus", 1), Ingredient("nitre", 1)}, CUSTOM_RECIPETABS.REIMUTABS, {SCIENCE = 0, MAGIC = 0, ANCIENT = 0}, nil, nil, nil, 3)
	lf.atlas = "images/inventoryimages/lf.xml"
	local qmb = Recipe("qmb", {Ingredient("twigs", 2), Ingredient("rope", 1), Ingredient("papyrus", 1)}, CUSTOM_RECIPETABS.REIMUTABS, {SCIENCE = 0, MAGIC = 0, ANCIENT = 0})
	qmb.atlas = "images/inventoryimages/qmb.xml"
	local yyy = Recipe("yyy", {Ingredient("redgem", 1), Ingredient("nightmarefuel", 2), Ingredient("flint", 4)}, CUSTOM_RECIPETABS.REIMUTABS, {SCIENCE = 0, MAGIC = 0, ANCIENT = 0})
	yyy.atlas = "images/inventoryimages/yyy.xml"

AddClassPostConstruct("widgets/crafttabs", function(class)
    if class.owner:HasTag("reimubuilder") then
        local v = CUSTOM_RECIPETABS.REIMUTABS
        local k = #class.tab_order + 1
        local tab_bg = 
        {
            normal = "tab_normal.tex",
            selected = "tab_selected.tex",
            highlight = "tab_highlight.tex",
            bufferedhighlight = "tab_place.tex",
            overlay = "tab_researchable.tex",
        }
        
        class.tabs.spacing = 750/k
        local tab = class.tabs:AddTab(STRINGS.TABS[v.str], resolvefilepath("images/hud.xml"), v.icon_atlas or resolvefilepath("images/hud.xml"), v.icon, tab_bg.normal, tab_bg.selected, tab_bg.highlight, tab_bg.bufferedhighlight, tab_bg.overlay,
            
            function() --select fn
                if not class.controllercraftingopen then
                    
                    if class.craft_idx_by_tab[k] then
                        class.crafting.idx = class.craft_idx_by_tab[k]
                    end

                    class.crafting:SetFilter( 
                        function(recipe)
                            local rec = GLOBAL.AllRecipes[recipe]
                            return rec and rec.tab == v
                        end)
                
                                                                            
                    class.crafting:Open()
                end
            end, 

            function() --deselect fn
                class.craft_idx_by_tab[k] = class.crafting.idx
                class.crafting:Close()
            end)
        tab.filter = v
        tab.icon = v.icon
        tab.icon_atlas = v.icon_atlas or resolvefilepath("images/hud.xml")
        tab.tabname = STRINGS.TABS[v.str]
        class.tabbyfilter[v] = tab
        
        table.insert(class.tab_order, tab)
    end
end)

AddModCharacter("reimu")

AddMinimapAtlas("images/reimu1.xml")