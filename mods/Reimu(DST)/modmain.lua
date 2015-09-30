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

STRINGS.NAMES.LF = "���"
STRINGS.RECIPE_DESC.LF = "��������ֽ��,\n�ɻ��3��."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.LF = "�ܻ�ʮ����" 

STRINGS.NAMES.YYY = "������"
STRINGS.RECIPE_DESC.YYY = "ɢ�������ı���\n��˵�����Լ���."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.YYY = "ʮ�򣬵��˲���." 

STRINGS.NAMES.QMB = "����"
STRINGS.RECIPE_DESC.QMB = "����ɢ�����ʥ�\n����Ҳ��."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.QMB = "���˱������������ø���." 

-- strings! Any "REIMU" below would have to be replaced by the prefab name of your character.

-- First up, the character select screen lines 
-- note: these are lower-case character name
STRINGS.CHARACTER_TITLES.reimu = "��԰��Ů"
STRINGS.CHARACTER_NAMES.reimu = "��������"
STRINGS.CHARACTER_DESCRIPTIONS.reimu = "*���ֽý�\n*��Ů���еĵ���\n*�޾����"
STRINGS.CHARACTER_QUOTES.reimu = "\"����ʲô�ط���\""

-- You can also add any kind of custom dialogue that you would like. Don't forget to make
-- categores that don't exist yet using = {}
-- note: these are UPPER-CASE charcacter name
STRINGS.CHARACTERS.REIMU = {}

STRINGS.CHARACTERS.REIMU.ANNOUNCE_BOOMERANG  = "���ĵ�С�������."
STRINGS.CHARACTERS.REIMU.ANNOUNCE_CHARLIE  = "���ҿ�������?"
STRINGS.CHARACTERS.REIMU.ANNOUNCE_CHARLIE_ATTACK = "��������"

STRINGS.CHARACTERS.REIMU.ANNOUNCE_COLD  = "��ŮҲ�ǻ����."
STRINGS.CHARACTERS.REIMU.ANNOUNCE_CRAFTING_FAIL  = "ûʮ���ܸ�?"
STRINGS.CHARACTERS.REIMU.ANNOUNCE_DUSK = "����ؼ�."
STRINGS.CHARACTERS.REIMU.ANNOUNCE_HUNGRY  = "��Ҫ�Ե㶫������."
STRINGS.CHARACTERS.REIMU.ANNOUNCE_HUNT_BEAST_NEARBY = "��������. "
STRINGS.CHARACTERS.REIMU.ANNOUNCE_HUNT_LOST_TRAIL  = "ȥ�Ķ���?"
STRINGS.CHARACTERS.REIMU.ANNOUNCE_INV_FULL  = "��װ������. "
STRINGS.CHARACTERS.REIMU.ANNOUNCE_KNOCKEDOUT  = "��... "
STRINGS.CHARACTERS.REIMU.ANNOUNCE_NODANGERSLEEP  = "�ȴ����˵."
STRINGS.CHARACTERS.REIMU.ANNOUNCE_NOHUNGERSLEEP  = "���ȳԵ㶫��ô."
STRINGS.CHARACTERS.REIMU.ANNOUNCE_NODAYSLEEP  = "�����λ������˰�."
STRINGS.CHARACTERS.REIMU.ANNOUNCE_NO_TRAP  = "�Ǻ�. "
STRINGS.CHARACTERS.REIMU.ANNOUNCE_PECKED  = "��Ҫ����. "
STRINGS.CHARACTERS.REIMU.ANNOUNCE_QUAKE = " S��,����. "
STRINGS.CHARACTERS.REIMU.ANNOUNCE_RESEARCH  = "��ѧ���㶫��. "
STRINGS.CHARACTERS.REIMU.ANNOUNCE_TORCH_OUT  = "��������?"
STRINGS.CHARACTERS.REIMU.ANNOUNCE_WORMHOLE  = "������������Һ��."

STRINGS.CHARACTERS.REIMU.ANNOUNCE_EAT = {}
STRINGS.CHARACTERS.REIMU.ANNOUNCE_EAT.GENERIC  = "�ѳ�."
STRINGS.CHARACTERS.REIMU.ANNOUNCE_EAT.PAINFULL = "�Ե������ĺ�ô?"
STRINGS.CHARACTERS.REIMU.ANNOUNCE_EAT.SPOILED = "������."
STRINGS.CHARACTERS.REIMU.ANNOUNCE_EAT.STALE  = "�Ѿ���ʼ������."

STRINGS.CHARACTERS.REIMU.BATTLECRY = {}
STRINGS.CHARACTERS.REIMU.BATTLECRY.GENERIC  = "��ɢ!"
STRINGS.CHARACTERS.REIMU.BATTLECRY.PIG = "�Ұ�����."
STRINGS.CHARACTERS.REIMU.BATTLECRY.PREY  = "����Ϊ��С�ҾͲ����۸���. "
STRINGS.CHARACTERS.REIMU.BATTLECRY.SPIDER  = "֩������ɢ!"
STRINGS.CHARACTERS.REIMU.BATTLECRY.SPIDER_WARRIOR  = "���ǱȽ��鷳��һ��."
STRINGS.CHARACTERS.REIMU.BATTLECRY.HOUND  = "��������."
STRINGS.CHARACTERS.REIMU.BATTLECRY.LEIF  = "����ô?"

-- Description
STRINGS.CHARACTERS.REIMU.DESCRIBE = {}
STRINGS.CHARACTERS.REIMU.DESCRIBE.ROBIN = "̫�ഺҲ���ð�."
STRINGS.CHARACTERS.REIMU.DESCRIBE.SLURPER  = "Ҫ��ɢ��?"
STRINGS.CHARACTERS.REIMU.DESCRIBE.ORANGEAMULET  = "��Ҳ��ħ��ɳ�Ƚϸ���Ȥ."
STRINGS.CHARACTERS.REIMU.DESCRIBE.YELLOWSTAFF  = "��Ҳ��ħ��ɳ�Ƚϸ���Ȥ."
STRINGS.CHARACTERS.REIMU.DESCRIBE.YELLOWGEM  = "�Ʊ�ʯ,ʮ����? "
STRINGS.CHARACTERS.REIMU.DESCRIBE.ORANGEGEM  = "�ȱ�ʯ,ʮ����?"
STRINGS.CHARACTERS.REIMU.DESCRIBE.STAFFLIGHT  = "û�����������."
STRINGS.CHARACTERS.REIMU.DESCRIBE.ANCIENT_ALTAR  = "���������𲻺�����."
STRINGS.CHARACTERS.REIMU.DESCRIBE.CAVE_BANANA  = "��������һ���������㽶."
STRINGS.CHARACTERS.REIMU.DESCRIBE.ROCKY  = "��ɶ��?"
STRINGS.CHARACTERS.REIMU.DESCRIBE.EVERGREEN = "ϣ��û�з��˵�����."

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
STRINGS.TABS.REIMUTABS = "����"

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