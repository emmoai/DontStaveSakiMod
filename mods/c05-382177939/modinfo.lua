name = "c05地窖"
description = "可以放更多的东西.不会烧着 告别木箱，从我做起 "
author = "yy89856191章凡汉化"
version = "1.7"

forumthread = "19505-Modders-Your-new-friend-at-Klei!"

api_version = 10

priority = - 1
dst_compatible = true
all_clients_require_mod = true
client_only_mod = false

icon_atlas = "cellar.xml"
icon = "cellar.tex"

configuration_options =
{
	{
		name = "eightxten",
		label = "槽格分布",
        hover = "在这里，你可以改变槽格的分布",
		options =
	{
		{description = "5 x 16", data = "5x16", hover = "5格高度x16格宽度"},
		{description = "8 x 10", data = "8x10", hover = "8格高度x10格宽度"},
	},
		default = "5x16",
	},
}	