name = "e11指示玩家位置"
description = "有一个指针可以看到你的队友在什么位置."
author = "YY89856191章凡汉化"
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
		label = "玩家指示器",
		options =	{
						{description = "启用", data = 1},
						{description = "关闭", data = 2},
					},
		default = 1,
	},
	{
		name = "IndicatorSize",
		label = "指针尺寸",
		options =	{
						{description = "极小", data = 1},
						{description = "小", data = 2},
						{description = "中", data = 3},
						{description = "大", data = 4},
					},
		default = 3,
	},
	{
		name = "MaxIndicator",
		label = "最大指示范围",
		options =	{
						{description = "原始", data = 50},
						{description = "两倍", data = 100},
						{description = "巨大", data = 250},
						{description = "全屏", data = 7000},
					},
		default = 7000,
	}
}