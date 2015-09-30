-- This information tells other players more about the mod
name = "e19ʳ�����������"
description = " ���Կ���ʳ������������Լ���ӵ�ȼ��ʱ�� "
author = "YY89856191����WoodyCC����"
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
		label = "����",
		options =	{
						{description = "����", data = "EN"},
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
		label = "��������ʾ",
		options =	{
						{description = "��", data = "default"},
						{description = "��", data = "off"},
					},

		default = "default",
	},
	{
		name = "DFV_ShowUses",
		label = "�;ö���ʾ",
		options =	{
						{description = "��", data = "default"},
						{description = "��", data = "off"},
					},

		default = "default",
	},
	{
		name = "DFV_FueledSettings",
		label = "��ʱ��Ʒ��ʾ��ʽ",
		options =	{
						{description = "��:��", data = "default"},
						{description = "ʱ�Ӷ�", data = "seg"},
						{description = "˫��", data = "both"},
						{description = "��", data = "off"},
					},

		default = "default",
	},
	{
		name = "DFV_ShowTemperature",
		label = "��Ʒ�¶���ʾ",
		options =	{
						{description = "��", data = "default"},
						{description = "��", data = "off"},
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
		label = "ʣ��ȼ��ʱ��",
		options =	{
						{description = "��", data = "default"},
						{description = "��", data = "off"},
					},

		default = "default",
	},
}