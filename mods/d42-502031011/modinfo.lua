-- This information tells other players more about the mod
name = "Black Rock Shooter"
description = "Tirimiru��Bakaduck����"
author = "Tirimiru"
version = "2.2.7"

-- This is the URL name of the mod's thread on the forum; the part after the ? and before the first & in the url
forumthread = "http://forums.kleientertainment.com/files/file/1286-black-rock-shooter-dst/"


-- This lets other players know if your mod is out of date, update it to match the current version in the game
api_version = 10

-- Compatible with Don't Starve Together
dst_compatible = true

-- Not compatible with Don't Starve
dont_starve_compatible = false
reign_of_giants_compatible = false

-- Character mods need this set to true
all_clients_require_mod = true 

icon_atlas = "modicon.xml"
icon = "modicon.tex"

-- The mod's tags displayed on the server list
server_filter_tags = {
"character",
}

configuration_options = 
{
	{
	name = "blackbladedmg", 
		label = "���л����˺�",
		hover = "�޸ĺ��еĻ����˺�",
		options = 
	{
		{description = "32 [Ĭ��]", data = 32},
		{description = "38", data = 38},
		{description = "44", data = 44},
	},
		default = 32,
	},

	{
	name = "bladeclawdmg", 
		label = "���л����˺�",
		hover = "�޸ĺ��еĻ����˺�",
		options = 
	{
		{description = "42 [Ĭ��]", data = 42},
		{description = "55", data = 55},
		{description = "68", data = 68},
	},
		default = 42,
	},

	{
	name = "maxdura", 
		label = "���ý��е��;�",
		hover = "�޸ĺ��кͺ��е��;�,���޻�����",
		options = 
	{
		{description = "���� [Ĭ��]", data = "finite"},
		{description = "����", data = "infinite"},
	},
		default = "finite",
	},


	{
	name = "rockcannondmg", 
		label = "���Ҿ��ڻ����˺�",
		hover = "�޸ĺ��Ҿ��ڵĻ����˺�",
		options = 
	{
		{description = "30 [Ĭ��]", data = 30},
		{description = "50", data = 50},
		{description = "80", data = 80},
	},
		default = 30,
	},

	{
	name = "rockcannonaoe", 
		label = "���Ҿ���AOE(��Χ)�˺�",
		hover = "�޸ĺ��Ҿ��ڵ�AOE(��Χ)�˺�",
		options = 
	{
		{description = "25 [Ĭ��]", data = 25},
		{description = "50", data = 50},
		{description = "75", data = 75},
	},
		default = 25,
	},

	{
	name = "cannonlancedmg", 
		label = "����ǹì���ڻ����˺�",
		hover = "�޸ĺ���ǹì���ڵĻ����˺�",
		options = 
	{
		{description = "60 [Ĭ��]", data = 60},
		{description = "150", data = 150},
		{description = "250", data = 250},
	},
		default = 60,
	},

	{
		name = "workparticledropchance", 
		label = "�ɼ� - SP.΢������",
		hover = "���вɼ�����ʱ(���翳��),����΢���������",
		options = 
	{
		{description = "0%", data = 0.00},
		{description = "1%", data = 0.01},
		{description = "2%", data = 0.02},
		{description = "3%", data = 0.03},
		{description = "4%", data = 0.04},
		{description = "5% [Ĭ��]", data = 0.05},
		{description = "6%", data = 0.06},
		{description = "7%", data = 0.07},
		{description = "8%", data = 0.08},
		{description = "9%", data = 0.09},
		{description = "10%", data = 0.10},
		{description = "11%", data = 0.11},
		{description = "12%", data = 0.12},
		{description = "13%", data = 0.13},
		{description = "14%", data = 0.14},
		{description = "15%", data = 0.15},
		{description = "16%", data = 0.16},
		{description = "17%", data = 0.17},
		{description = "18%", data = 0.18},
		{description = "19%", data = 0.19},
		{description = "20%", data = 0.20},
	},
		default = 0.05,
	},

	{
		name = "killparticledropchance", 
		label = "��ɱ - Sp.΢������",
		hover = "��ɱ����ʱ,����΢���������",
		options = 
	{
		{description = "0%", data = 0.00},
		{description = "1%", data = 0.01},
		{description = "2%", data = 0.02},
		{description = "3%", data = 0.03},
		{description = "4%", data = 0.04},
		{description = "5%", data = 0.05},
		{description = "6%", data = 0.06},
		{description = "7%", data = 0.07},
		{description = "8%", data = 0.08},
		{description = "9%", data = 0.09},
		{description = "10% [Ĭ��]", data = 0.10},
		{description = "11%", data = 0.11},
		{description = "12%", data = 0.12},
		{description = "13%", data = 0.13},
		{description = "14%", data = 0.14},
		{description = "15%", data = 0.15},
		{description = "16%", data = 0.16},
		{description = "17%", data = 0.17},
		{description = "18%", data = 0.18},
		{description = "19%", data = 0.19},
		{description = "20%", data = 0.20},
		{description = "21%", data = 0.21},
		{description = "22%", data = 0.22},
		{description = "23%", data = 0.23},
		{description = "24%", data = 0.24},
		{description = "25%", data = 0.25},
		{description = "26%", data = 0.26},
		{description = "27%", data = 0.27},
		{description = "28%", data = 0.28},
		{description = "29%", data = 0.29},
		{description = "30%", data = 0.30},
	},
		default = 0.10,
	},

	{
	name = "souldropchance", 
		label = "��꾫�����",
		hover = "��ɱBOSS������꾫�����",
		options = 
	{
		{description = "50%", data = 0.50},
		{description = "100% [Ĭ��]", data = 1.00},
	},
		default = 1.00,
	},

	{
	name = "customequips", 
		label = "������",
		hover = "��ֹ������ɫʹ�ú������ֵ�����.",
		options = 
	{
		{description = "�� [Ĭ��]", data = "true"},
		{description = "��", data = "false"},
	},
		default = "true",
	},

	{
	name = "clothes", 
		label = "����װ��",
		options = 
	{
		{description = "��", data = "true"},
		{description = "�� [Ĭ��]", data = "false"},
	},
		default = "false",
	},


}