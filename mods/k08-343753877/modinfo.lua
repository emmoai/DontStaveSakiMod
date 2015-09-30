--The name of the mod displayed in the 'mods' screen.
name = "k08״̬����"

--A description of the mod.
description = "��ݸ�֪�����Լ��ļ���.����.����,(Alt+��������Χͼ��)\n��֪���ѽ�����Ҫ�������ֿƼ�(Alt+�������Ƽ���ͼ��)\n��֪�����Լ�����������(Alt+Shift+��������Ʒ������)."

--Who wrote this awesome mod?
author = "WoodyCC��������"

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
		label = "������Χ",
                hover = "�����ú����ķ�Χ��ͬʱ��סctrl�������л�.",
		options =	{
						{description = "����", data = true},
						{description = "ȫ��", data = false},
					},
		default = false,
	},
	{
		name = "EXPLICIT",
		label = "��ʾ��ֵ",
		options =	{
						{description = "Yes", data = true},
						{description = "No", data = false},
					},
		default = true,
	},
	{
		name = "WILSON",
		label = "����ѷר������",
		options =	{
						{description = "Yes", data = true},
						{description = "No", data = false},
					},
		default = false,
	},
	{
		name = "WILLOW",
		label = "��Ůר������",
		options =	{
						{description = "Yes", data = true},
						{description = "No", data = false},
					},
		default = false,
	},
	{
		name = "WX78",
		label = "������ר������",
		options =	{
						{description = "Yes", data = true},
						{description = "No", data = false},
					},
		default = false,
	},
	{
		name = "WICKERBOTTOM",
		label = "������ר������",
		options =	{
						{description = "Yes", data = true},
						{description = "No", data = false},
					},
		default = false,
	},
	{
		name = "WOLFGANG",
		label = "�ֶ����ר������",
		options =	{
						{description = "Yes", data = true},
						{description = "No", data = false},
					},
		default = false,
	},
	{
		name = "WENDY",
		label = "�µ�ר������",
		options =	{
						{description = "Yes", data = true},
						{description = "No", data = false},
					},
		default = false,
	},
	{
		name = "WOODIE",
		label = "��ľ��ר������",
		options =	{
						{description = "Yes", data = true},

					},
		default = true,
	},
	{
		name = "WES",
		label = "С��ר������",
		options =	{
						{description = "Yes", data = true},
						{description = "No", data = false},
					},
		default = false,
	},
	{
		name = "WAXWELL",
		label = "���˹Τר������",
		options =	{
						{description = "Yes", data = true},
						{description = "No", data = false},
					},
		default = false,
	},
}