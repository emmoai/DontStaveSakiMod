--The name of the mod displayed in the 'mods' screen.
name = "k08状态宣告"

--A description of the mod.
description = "快捷告知队友自己的饥饿.理智.生命,(Alt+左键点击三围图标)\n告知队友接下来要制作哪种科技(Alt+左键点击科技树图标)\n告知队友自己的物资数量(Alt+Shift+左键点击物品栏材料)."

--Who wrote this awesome mod?
author = "WoodyCC完美汉化"

--A version number so you can ask people if they are running an old version of your mod.
version = "1.12"

--This lets other players know if your mod is out of date. This typically needs to be updated every time there's a new game update.
api_version = 10

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

icon_atlas = "statusannouncements.xml"
icon = "statusannouncements.tex"

forumthread = "http://forums.kleientertainment.com/files/file/923-dst-status-announcements"

--[[
Credits:
    Silentdarkness1 for coming up with most of the character-specific quotes  ,
	Acemurdock and OSMRhodey for helping out with the Woodie quotes
]]

configuration_options =
{
	{
		name = "WHISPER",
		label = "喊话范围",
                hover = "可设置喊话的范围，同时按住ctrl键可以切换.",
		options =	{
						{description = "附近", data = true},
						{description = "全屏", data = false},
					},
		default = false,
	},
	{
		name = "EXPLICIT",
		label = "显示数值",
		options =	{
						{description = "Yes", data = true},
						{description = "No", data = false},
					},
		default = true,
	},
	{
		name = "WILSON",
		label = "威尔逊专属喊话",
		options =	{
						{description = "Yes", data = true},
						{description = "No", data = false},
					},
		default = false,
	},
	{
		name = "WILLOW",
		label = "火女专属喊话",
		options =	{
						{description = "Yes", data = true},
						{description = "No", data = false},
					},
		default = false,
	},
	{
		name = "WX78",
		label = "机器人专属喊话",
		options =	{
						{description = "Yes", data = true},
						{description = "No", data = false},
					},
		default = false,
	},
	{
		name = "WICKERBOTTOM",
		label = "老奶奶专属喊话",
		options =	{
						{description = "Yes", data = true},
						{description = "No", data = false},
					},
		default = false,
	},
	{
		name = "WOLFGANG",
		label = "沃尔夫冈专属喊话",
		options =	{
						{description = "Yes", data = true},
						{description = "No", data = false},
					},
		default = false,
	},
	{
		name = "WENDY",
		label = "温蒂专属喊话",
		options =	{
						{description = "Yes", data = true},
						{description = "No", data = false},
					},
		default = false,
	},
	{
		name = "WOODIE",
		label = "伐木工专属喊话",
		options =	{
						{description = "Yes", data = true},

					},
		default = true,
	},
	{
		name = "WES",
		label = "小丑专属喊话",
		options =	{
						{description = "Yes", data = true},
						{description = "No", data = false},
					},
		default = false,
	},
	{
		name = "WAXWELL",
		label = "麦克斯韦专属喊话",
		options =	{
						{description = "Yes", data = true},
						{description = "No", data = false},
					},
		default = false,
	},
}