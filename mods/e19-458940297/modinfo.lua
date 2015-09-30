-- This information tells other players more about the mod
name = "e19食物和武器属性"
description = " 可以看到食物和武器的属性及火坑的燃烧时间 "
author = "YY89856191游侠WoodyCC汉化"
version = "2.5"

forumthread = ""

-- This lets other players know if your mod is out of date, update it to match the current version in the game
api_version = 10

--This let's the game know that this mod doesn't need to be listed in the server's mod listing
client_only_mod = false

--Let the mod system know that this mod is functional with Don't Starve Together
dst_compatible = true

all_clients_require_mod = true 

-- Can specify a custom icon for this mod!
icon_atlas = "FoodValuesItemTooltips.xml"
icon = "FoodValuesItemTooltips.tex"

-- Specify the priority
priority=3

configuration_options =
{
	{
		name = "DFV_Language",
		label = "语言",
		options =	{
						{description = "中文", data = "EN"},
						{description = "French", data = "FR"},
					},

		default = "EN",
	
	},
	
	{
		name = "DFV_MinimalMode",
		label = "Minimal mode",
		options =	{
						{description = "Off", data = "default"},
						{description = "On", data = "on"},
					},

		default = "default",
	
	},
	
	{
		name = "DFV_ClientPrediction",
		label = "Enable client bruteforce",
		options =	{
						{description = "Off", data = "default"},
						{description = "On", data = "On"},
					},

		default = "default",
	},
	
	{
		name = "DFV_PercentReplace",
		label = "Replace icon %",
		options =	{
						{description = "Off", data = "default"},
						{description = "On", data = "On"},
					},

		default = "default",
	},
	
	{
		name = "DFV_ShowDamage",
		label = "攻击力显示",
		options =	{
						{description = "开", data = "default"},
						{description = "关", data = "off"},
					},

		default = "default",
	},
	{
		name = "DFV_ShowUses",
		label = "耐久度显示",
		options =	{
						{description = "开", data = "default"},
						{description = "关", data = "off"},
					},

		default = "default",
	},
	{
		name = "DFV_FueledSettings",
		label = "限时物品显示格式",
		options =	{
						{description = "分:秒", data = "default"},
						{description = "时钟段", data = "seg"},
						{description = "双显", data = "both"},
						{description = "关", data = "off"},
					},

		default = "default",
	},
	{
		name = "DFV_ShowTemperature",
		label = "物品温度显示",
		options =	{
						{description = "开", data = "default"},
						{description = "关", data = "off"},
					},

		default = "default",
	},
	{
		name = "DFV_ShowACondition",
		label = "Show armour condition",
		options =	{
						{description = "On", data = "default"},
						{description = "Off", data = "off"},
					},

		default = "default",
	},
	{
		name = "DFV_ShowADefence",
		label = "Show armour defence",
		options =	{
						{description = "On", data = "default"},
						{description = "Off", data = "off"},
					},

		default = "default",
	},
	{
		name = "DFV_ShowAType",
		label = "Show armour type",
		options =	{
						{description = "On", data = "default"},
						{description = "Off", data = "off"},
					},

		default = "default",
	},
	{
		name = "DFV_ShowInsulation",
		label = "Show insulation",
		options =	{
						{description = "On", data = "default"},
						{description = "Off", data = "off"},
					},

		default = "default",
	},
	
	{
		name = "DFV_ShowFireTime",
		label = "剩余燃烧时间",
		options =	{
						{description = "开", data = "default"},
						{description = "关", data = "off"},
					},

		default = "default",
	},
}