--The name of the mod displayed in the 'mods' screen.
name = "k02季节时钟"

--A description of the mod.
description = "显示健康，饥饿，理智，温度，和世界的一天."

--Who wrote this awesome mod?
author = "yy89856191游侠WoodyCC汉化"

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
		label = "显示体温",
		hover = "显示玩家体温.",
		options =	{
						{description = "显示", data = true},
						{description = "隐藏", data = false},
					},
		default = true,
	},	
	{
		name = "SHOWWORLDTEMP",
		label = "显示气温",
		hover = "显示世界温度(这并不考虑热源，如火灾).",
		options =	{
						{description = "显示", data = true},
						{description = "隐藏", data = false},
					},
		default = true,
	},	
	{
		name = "SHOWTEMPBADGES",
		label = "温度区分图标",
		hover = "用于区分两种温度的图标.",
		options =	{
						{description = "显示", data = true, hover = "当两种温度同时开启时,则显示图标."},
						{description = "隐藏", data = false, hover = "永远不显示图标."},
					},
		default = true,
	},	
	{
		name = "CELSIUS",
		label = "温度计量单位",
		hover = "最好设置为摄氏.",
		options =	{
						{description = "摄氏", data = true},
						{description = "华氏", data = false},
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
		label = "显示月相表",
		hover = "在白天黄昏夜晚时显示月亮的相位.",
		options =	{
						{description = "夜晚", data = 0, hover = "只在夜晚显示月相, like usual."},
						{description = "黄昏后", data = 1, hover = "在夜晚和黄昏时都显示月相."},
						{description = "一直", data = 2, hover = "任何时间都显示月相"},
					},
		default = 1,
	},
	{
		name = "SHOWNEXTFULLMOON",
		label = "预测满月",
		hover = "预测下个满月的天数,"
			 .. "\n鼠标悬停在月相表时就会显示.",
		options =	{
						{description = "是", data = true},
						{description = "否", data = false},
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
		label = "季节时钟类型",
		hover = "增加一个显示季节的时钟, 并将其他状态表排列得更加美观."
		.."\n另外,当你用鼠标悬停它的时候会显示该季节剩下的天数.",
		options =	{
						{description = "紧凑型", data = 2},
						{description = "时钟型", data = 1},
						{description = "不显示", data = 0},
					},
		default = 1,
	},
}