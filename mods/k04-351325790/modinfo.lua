name = "k04������ֲ"
description = "���Ժ�����Ĳ������dog is home "
author = "yy89856191����WoodyCC����"
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
		label = "CTRL�л���/��",
		options =	{
						{description = "��", data = true},
						{description = "��", data = false},
					},
		default = false,	
	},
	{
		name = "BUILDGRID",
		label = "��ʾ��������",
		options =	{
						{description = "��", data = true},
						{description = "��", data = false},
					},
		default = true,	
	},
	{
		name = "HIDEPLACER",
		label = "������Ӱ����",
		options =	{
						{description = "��", data = true},
						{description = "��", data = false},
					},
		default = false,	
	},
	{
		name = "HIDECURSOR",
		label = "������Ʒ���",
		options =	{
						{description = "��", data = true},
						{description = "��", data = false},
					},
		default = true,	
	},
	{
		name = "SMALLGRIDSIZE",
		label = "С��(��ֲ)����ߴ�",
		options = smallgridsizeoptions,
		default = 10,	
	},
	{
		name = "MEDGRIDSIZE",
		label = "����(��ǽ)����ߴ�",
		options = medgridsizeoptions,
		default = 6,	
	},
	{
		name = "BIGGRIDSIZE",
		label = "����(�̵�)����ߴ�",
		options = biggridsizeoptions,
		default = 2,	
	},
	{
		name = "COLORS",
		label = "������ɫ",
		options =	{
						{description = "��/��", data = false},
						{description = "��/��", data = "redblue"},
						{description = "��/��", data = "blackwhite"},
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