name = "k03С��ͼ"
description = "����Ϸ���������һ��С��ͼ "
author = "yy89856191����WoodyCC����"
version = "1.0.4b"
forumthread = "/files/file/352-minimap-hud/"
icon_atlas = "modicon.xml"
icon = "modicon.tex"
dst_compatible = true
client_only_mod = true
all_clients_require_mod = false

-- this setting is dumb; this mod is likely compatible with all future versions
api_version = 10

configuration_options =
{
    {
        name = "Minimap Size",
	label = "С��ͼ�ߴ�",
        options =
        {
            {description = "��С", data = 0.125},
            {description = "С", data = 0.175},
            {description = "��", data = 0.225},
            {description = "��", data = 0.275},
            {description = "�ܴ�", data = 0.325},
            {description = "�޴�", data = 0.375},
        },
        default = 0.225,
    },
    {
        name = "Position",
	label = "λ��",
        options =
        {
            {description = "���Ͻ�", data = "top_right"},
            {description = "���Ͻ�", data = "top_left"},
            {description = "������", data = "top_center"},
            {description = "�����", data = "middle_left"},
            {description = "������", data = "middle_center"},
            {description = "�ұ���", data = "middle_right"},
            {description = "���½�", data = "bottom_left"},
            {description = "�ײ���", data = "bottom_center"},
            {description = "���½�", data = "bottom_right"},
        },
        default = "top_right"
    },
    {
        name = "Horizontal Margin",
	label = "ˮƽ����",
        options =
        {
            {description = "0", data = 0},
            {description = "1", data = 5},
            {description = "2", data = 12.5},
            {description = "3", data = 25},
            {description = "4", data = 50},
            {description = "5", data = 125},
            {description = "6", data = 235},
            {description = "7", data = 350},
            {description = "8", data = 450},
        },
        default = 235
    },
    {
        name = "Vertical Margin",
	label = "��ֱ����",
        options =
        {
            {description = "0", data = 0},
            {description = "1", data = 5},
            {description = "2", data = 12.5},
            {description = "3", data = 25},
            {description = "4", data = 50},
            {description = "5", data = 125},
            {description = "6", data = 235},
            {description = "7", data = 300},
            {description = "8", data = 350},
            {description = "9", data = 450},
        },
        default = 25
    },
}