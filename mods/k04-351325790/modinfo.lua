name = "k04几何种植"
description = "可以很整齐的布置你的dog is home "
author = "yy89856191游侠WoodyCC汉化"
version = "1.4.3"

forumthread = "http://forums.kleientertainment.com/files/file/1108-geometric-placement/"

api_version = 10

-- Compatible with the base game & ROG
dont_starve_compatible = true
reign_of_giants_compatible = true
dst_compatible = true

icon_atlas = "modicon.xml"
icon = "modicon.tex"

--These let clients know if they need to get the mod from the Steam Workshop to join the game
all_clients_require_mod = false

--This determines whether it causes a server to be marked as modded (and shows in the mod list)
client_only_mod = true

--This lets people search for servers with this mod by these tags
server_filter_tags = {}

local smallgridsizeoptions = {}
for i=1,10 do
	smallgridsizeoptions[i] = {description=""..(i*5).."", data=i*5}
end
local medgridsizeoptions = {}
for i=1,12 do
	medgridsizeoptions[i] = {description=""..(i*2).."", data=i*2}
end
local biggridsizeoptions = {}
for i=1,10 do
	biggridsizeoptions[i] = {description=""..(i).."", data=i}
end

configuration_options =
{
	{
		name = "CTRL",
		label = "CTRL切换开/关",
		options =	{
						{description = "开", data = true},
						{description = "关", data = false},
					},
		default = false,	
	},
	{
		name = "BUILDGRID",
		label = "显示建造网格",
		options =	{
						{description = "开", data = true},
						{description = "关", data = false},
					},
		default = true,	
	},
	{
		name = "HIDEPLACER",
		label = "隐藏虚影辅助",
		options =	{
						{description = "是", data = true},
						{description = "否", data = false},
					},
		default = false,	
	},
	{
		name = "HIDECURSOR",
		label = "隐藏物品光标",
		options =	{
						{description = "是", data = true},
						{description = "否", data = false},
					},
		default = true,	
	},
	{
		name = "SMALLGRIDSIZE",
		label = "小型(种植)网格尺寸",
		options = smallgridsizeoptions,
		default = 10,	
	},
	{
		name = "MEDGRIDSIZE",
		label = "中型(建墙)网格尺寸",
		options = medgridsizeoptions,
		default = 6,	
	},
	{
		name = "BIGGRIDSIZE",
		label = "大型(铺地)网格尺寸",
		options = biggridsizeoptions,
		default = 2,	
	},
	{
		name = "COLORS",
		label = "网格颜色",
		options =	{
						{description = "红/绿", data = false},
						{description = "红/蓝", data = "redblue"},
						{description = "黑/白", data = "blackwhite"},
					},
		default = false,	
	},
	{
		name = "REDUCECHESTSPACING",
		label = "Tighter Chests",
		options =	{
						{description = "Yes", data = true},
						{description = "No", data = false},
					},
		default = true,	
	},
}