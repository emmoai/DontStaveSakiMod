--The name of the mod displayed in the 'mods' screen.
name = "k02����ʱ��"

--A description of the mod.
description = "��ʾ���������������ǣ��¶ȣ��������һ��."

--Who wrote this awesome mod?
author = "yy89856191����WoodyCC����"

--A version number so you can ask people if they are running an old version of your mod.
version = "1.1.6"

--This lets other players know if your mod is out of date. This typically needs to be updated every time there's a new game update.
api_version = 10
priority = 2.5

--Compatible with both the base game and Reign of Giants
dont_starve_compatible = true
reign_of_giants_compatible = true
dst_compatible = true

--This lets clients know if they need to get the mod from the Steam Workshop to join the game
all_clients_require_mod = false

--This determines whether it causes a server to be marked as modded (and shows in the mod list)
client_only_mod = true

--This lets people search for servers with this mod by these tags
server_filter_tags = {}

icon_atlas = "alwaysonstatus.xml"
icon = "alwaysonstatus.tex"

forumthread = ""

--[[
Credits: Kiopho for writing the original mod and giving me permission to maintain it for DST!
]]

configuration_options =
{
	{
		name = "SHOWTEMPERATURE",
		label = "��ʾ����",
		hover = "��ʾ�������.",
		options =	{
						{description = "��ʾ", data = true},
						{description = "����", data = false},
					},
		default = true,
	},	
	{
		name = "SHOWWORLDTEMP",
		label = "��ʾ����",
		hover = "��ʾ�����¶�(�Ⲣ��������Դ�������).",
		options =	{
						{description = "��ʾ", data = true},
						{description = "����", data = false},
					},
		default = true,
	},	
	{
		name = "SHOWTEMPBADGES",
		label = "�¶�����ͼ��",
		hover = "�������������¶ȵ�ͼ��.",
		options =	{
						{description = "��ʾ", data = true, hover = "�������¶�ͬʱ����ʱ,����ʾͼ��."},
						{description = "����", data = false, hover = "��Զ����ʾͼ��."},
					},
		default = true,
	},	
	{
		name = "CELSIUS",
		label = "�¶ȼ�����λ",
		hover = "�������Ϊ����.",
		options =	{
						{description = "����", data = true},
						{description = "����", data = false},
					},
		default = true,
	},
	{
		name = "SHOWWANINGMOON",
		label = "Show Waning",
		hover = "Show both the waxing and waning moon phases separately."
			 .. "\nIt may be incorrect when you first join the game (until the phase changes).",
		options =	{
						{description = "Show", data = true},
						{description = "Don't", data = false},
					},
		default = true,
	},
	{
		name = "SHOWMOON",
		label = "��ʾ�����",
		hover = "�ڰ���ƻ�ҹ��ʱ��ʾ��������λ.",
		options =	{
						{description = "ҹ��", data = 0, hover = "ֻ��ҹ����ʾ����, like usual."},
						{description = "�ƻ��", data = 1, hover = "��ҹ��ͻƻ�ʱ����ʾ����."},
						{description = "һֱ", data = 2, hover = "�κ�ʱ�䶼��ʾ����"},
					},
		default = 1,
	},
	{
		name = "SHOWNEXTFULLMOON",
		label = "Ԥ������",
		hover = "Ԥ���¸����µ�����,"
			 .. "\n�����ͣ�������ʱ�ͻ���ʾ.",
		options =	{
						{description = "��", data = true},
						{description = "��", data = false},
					},
		default = true,
	},
	{
		name = "PREDICTMOONPHASE",
		label = "Predict Moon",
		hover = "Predicts the moon phase based on the day count"
			 .. "\n(technically the game changed phase at nightfall)."
			 .. "\nIt may be incorrect if a mod/setting changes the moon phases.",
		options =	{
						{description = "Yes", data = true},
						{description = "No", data = false},
					},
		default = true,
	},
	{
		name = "SEASONOPTIONS",
		label = "����ʱ������",
		hover = "����һ����ʾ���ڵ�ʱ��, ��������״̬�����еø�������."
		.."\n����,�����������ͣ����ʱ�����ʾ�ü���ʣ�µ�����.",
		options =	{
						{description = "������", data = 2},
						{description = "ʱ����", data = 1},
						{description = "����ʾ", data = 0},
					},
		default = 1,
	},
}