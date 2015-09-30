-- This information tells other players more about the mod
name = "Black Rock Shooter"
description = "Tirimiru和Bakaduck制作"
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
		label = "黑刃基础伤害",
		hover = "修改黑刃的基础伤害",
		options = 
	{
		{description = "32 [默认]", data = 32},
		{description = "38", data = 38},
		{description = "44", data = 44},
	},
		default = 32,
	},

	{
	name = "bladeclawdmg", 
		label = "黑切基础伤害",
		hover = "修改黑切的基础伤害",
		options = 
	{
		{description = "42 [默认]", data = 42},
		{description = "55", data = 55},
		{description = "68", data = 68},
	},
		default = 42,
	},

	{
	name = "maxdura", 
		label = "设置剑刃的耐久",
		hover = "修改黑刃和黑切的耐久,有限或无限",
		options = 
	{
		{description = "有限 [默认]", data = "finite"},
		{description = "无限", data = "infinite"},
	},
		default = "finite",
	},


	{
	name = "rockcannondmg", 
		label = "黑岩巨炮基础伤害",
		hover = "修改黑岩巨炮的基础伤害",
		options = 
	{
		{description = "30 [默认]", data = 30},
		{description = "50", data = 50},
		{description = "80", data = 80},
	},
		default = 30,
	},

	{
	name = "rockcannonaoe", 
		label = "黑岩巨炮AOE(范围)伤害",
		hover = "修改黑岩巨炮的AOE(范围)伤害",
		options = 
	{
		{description = "25 [默认]", data = 25},
		{description = "50", data = 50},
		{description = "75", data = 75},
	},
		default = 25,
	},

	{
	name = "cannonlancedmg", 
		label = "黑岩枪矛巨炮基础伤害",
		hover = "修改黑岩枪矛巨炮的基础伤害",
		options = 
	{
		{description = "60 [默认]", data = 60},
		{description = "150", data = 150},
		{description = "250", data = 250},
	},
		default = 60,
	},

	{
		name = "workparticledropchance", 
		label = "采集 - SP.微粒掉落",
		hover = "进行采集动作时(例如砍树),精神微粒掉落概率",
		options = 
	{
		{description = "0%", data = 0.00},
		{description = "1%", data = 0.01},
		{description = "2%", data = 0.02},
		{description = "3%", data = 0.03},
		{description = "4%", data = 0.04},
		{description = "5% [默认]", data = 0.05},
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
		label = "击杀 - Sp.微粒掉落",
		hover = "击杀怪物时,精神微粒掉落概率",
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
		{description = "10% [默认]", data = 0.10},
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
		label = "灵魂精粹掉落",
		hover = "击杀BOSS掉落灵魂精粹概率",
		options = 
	{
		{description = "50%", data = 0.50},
		{description = "100% [默认]", data = 1.00},
	},
		default = 1.00,
	},

	{
	name = "customequips", 
		label = "武器锁",
		hover = "阻止其它角色使用黑岩射手的武器.",
		options = 
	{
		{description = "开 [默认]", data = "true"},
		{description = "关", data = "false"},
	},
		default = "true",
	},

	{
	name = "clothes", 
		label = "无形装备",
		options = 
	{
		{description = "开", data = "true"},
		{description = "关 [默认]", data = "false"},
	},
		default = "false",
	},


}