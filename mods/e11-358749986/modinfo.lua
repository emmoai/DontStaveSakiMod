name = "e11ָʾ���λ��"
description = "��һ��ָ����Կ�����Ķ�����ʲôλ��."
author = "YY89856191�·�����"
version = "1.1"

forumthread = ""

-- This lets other players know if your mod is out of date, update it to match the current version in the game
api_version = 10

-- Can specify a custom icon for this mod!
icon_atlas = "ExtendedIndicators.xml"
icon = "ExtendedIndicators.tex"

-- Specify compatibility with the game!
dont_starve_compatible = true
reign_of_giants_compatible = true
dst_compatible = true

all_clients_require_mod = false
clients_only_mod = false

server_filter_tags = {"indicator", "indicators", "icons", "extended indicators", "extended"}


configuration_options =
{
	{
		name = "PlayerIndicators",
		label = "���ָʾ��",
		options =	{
						{description = "����", data = 1},
						{description = "�ر�", data = 2},
					},
		default = 1,
	},
	{
		name = "IndicatorSize",
		label = "ָ��ߴ�",
		options =	{
						{description = "��С", data = 1},
						{description = "С", data = 2},
						{description = "��", data = 3},
						{description = "��", data = 4},
					},
		default = 3,
	},
	{
		name = "MaxIndicator",
		label = "���ָʾ��Χ",
		options =	{
						{description = "ԭʼ", data = 50},
						{description = "����", data = 100},
						{description = "�޴�", data = 250},
						{description = "ȫ��", data = 7000},
					},
		default = 7000,
	}
}