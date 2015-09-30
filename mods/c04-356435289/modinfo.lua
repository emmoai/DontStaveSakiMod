name = "c04鱼农场"
description = [[
可以生产鱼，过于BT慎用,建造材料可设置：
易=5木板2鱼4蜜蜂          
难=二本科技+5木板2鱼4蜜蜂1蜂巢5绳
]]
author = "yy89856191游侠WoodyCC汉化"
version = "1.5"

forumthread = "19505-Modders-Your-new-friend-at-Klei!"

priority = 0.346962883
dst_compatible = true
all_clients_require_mod = true
client_only_mod = false

api_version = 10

icon_atlas = "w_pond.xml"
icon = "w_pond.tex"

configuration_options =
{
	{
		name = "fishfarmrecipe",
                label = "建造材料",
		options =
	{
		{description = "容易", data = "easy", hover = "5木板2鱼4蜜蜂"},
		{description = "困难", data = "hard", hover = "二本科技+5木板2鱼4蜜蜂1蜂巢5绳"},
	},
		default = "hard",
	},
}	