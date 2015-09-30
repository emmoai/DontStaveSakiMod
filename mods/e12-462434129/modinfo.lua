name = "e12重生"
forumthread = ""
description = '服务端MOD. \n\n密语发送 "#restart" 重新开始. \n密语发送 "#restart_d" 重新开始并掉落所有道具. \n\n重新开始意味着返回角色选择界面!'
author = "Skull,汉化Coralfox"
version = "0.0.9"
api_version = 10
priority = -77
dont_starve_compatible = false
reign_of_giants_compatible = false
dst_compatible = true
all_clients_require_mod = false
client_only_mod = false
server_filter_tags = { "Restart" }

icon_atlas = "preview.xml"
icon = "preview.tex"

configuration_options =
{
	{
		name = "FLOODING_PROTECTION",
		label = "防止频繁重生",
		hover = "在重生间隔中设定两次重生的时间间隔.",
		options =
		{
			{description = "开启", data = true},
			{description = "关闭", data = false},
		},
		default = true,
	},
	{
		name = "IGNORING_ADMIN",
		label = "管理员随时可重生",
		hover = "房主和管理员,管理员是啥,俺不清楚(译者注).",
		options =
		{
			{description = "开启", data = true},
			{description = "关闭", data = false},
		},
		default = true,
	},
	{
		name = "FORCE_DROP_ALL",
		label = "强制掉落所有道具",
		hover = "关闭,则根据命令输入的不同,有所不同.",
		options =
		{
			{description = "开启", data = true},
			{description = "关闭", data = false},
		},
		default = false,
	},
	{
		name = "FLOODING_INTERVAL",
		label = "重生间隔 (分)",
		hover = "必须开启 防止频繁重生.",
		options =
		{
			{description = " 1 ", data = 1},
			{description = " 2 ", data = 2},
			{description = " 3 ", data = 3},
			{description = " 4 ", data = 4},
			{description = " 5 ", data = 5},
			{description = " 7 ", data = 7},
			{description = " 10 ", data = 10},
		},
		default = 5,
	},
}