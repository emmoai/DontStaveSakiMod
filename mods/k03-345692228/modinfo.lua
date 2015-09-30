name = "k03小地图"
description = "在游戏界面上添加一个小地图 "
author = "yy89856191游侠WoodyCC汉化"
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
	label = "小地图尺寸",
        options =
        {
            {description = "很小", data = 0.125},
            {description = "小", data = 0.175},
            {description = "中", data = 0.225},
            {description = "大", data = 0.275},
            {description = "很大", data = 0.325},
            {description = "巨大", data = 0.375},
        },
        default = 0.225,
    },
    {
        name = "Position",
	label = "位置",
        options =
        {
            {description = "左上角", data = "top_right"},
            {description = "右上角", data = "top_left"},
            {description = "顶部中", data = "top_center"},
            {description = "左边中", data = "middle_left"},
            {description = "正中央", data = "middle_center"},
            {description = "右边中", data = "middle_right"},
            {description = "左下角", data = "bottom_left"},
            {description = "底部中", data = "bottom_center"},
            {description = "右下角", data = "bottom_right"},
        },
        default = "top_right"
    },
    {
        name = "Horizontal Margin",
	label = "水平调整",
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
	label = "垂直调整",
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