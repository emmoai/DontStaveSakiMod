name = "e05������"
description = "�����е�ʳ���ܿ����, ���Կ��ٴ������츯��ʳ������Ϊ����."

author = "[BSy]Jupiter,����Coralfox"

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
		label = "����������Ҫ����ʳ��?",
		hover = "������Ҫ���ٸ���ʳ��,��������һ������.",
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