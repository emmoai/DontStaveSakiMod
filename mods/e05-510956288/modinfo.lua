name = "e05腐烂箱"
description = "机器中的食物会很快变质, 可以快速大量制造腐烂食物来作为肥料."

author = "[BSy]Jupiter,汉化Coralfox"

version = "1.0.3"

api_version = 10
api_version_dst = 10
dst_compatible = true

forumthread = ""

icon_atlas = "modicon.xml"
icon = "modicon.tex"

all_clients_require_mod = true
client_only_mod = false

server_filter_tags = {"Rot Machine"}

dont_starve_compatible = false

----------------------
-- General settings --
----------------------

configuration_options =
{
	{
		name = "spoiled_food",
		label = "制作肥料需要腐烂食物?",
		hover = "决定需要多少腐烂食物,才能制作一个肥料.",
		options =	{
						{description = "4", data = 4, hover = ""},
						{description = "5", data = 5, hover = ""},
						{description = "6", data = 6, hover = ""},
						{description = "7", data = 7, hover = ""},
						{description = "8", data = 8, hover = ""},
						{description = "9", data = 9, hover = ""},
						{description = "10", data = 10, hover = ""},
						{description = "11", data = 11, hover = ""},
						{description = "12", data = 12, hover = ""},
					},
		default = 8,
	},
}