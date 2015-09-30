name        = "e08DJ���Զ�����[DJPaul's Sort Inventory]"
description = "Automatically stacks and sorts your inventory into a sensible order."
author      = "Paul Gibbs (DJPaul),����Coralfox"
version     = "1.4"
forumthread = "/topic/54138-new-mod-djpauls-sort-inventory/"

api_version                = 10  -- DST api version
dont_starve_compatible     = false
reign_of_giants_compatible = false
dst_compatible             = true
priority                   = 0  -- Relative load order
server_filter_tags         = { "djpaul", "sort inventory" }
icon_atlas                 = "modicon.xml"
icon                       = "modicon.tex"

client_only_mod         = false
all_clients_require_mod = true

configuration_options = {
	{
		default = 103,  -- ASCII code for "g"
		label   = "������:",
		name    = "keybind",
		options = (function()
			local KEY_A  = 97  -- ASCII code for "a"
			local values = {}
			local chars  = {
				"A","B","C","D","E","F","G","H","I","J","K","L","M",
				"N","O","P","Q","R","S","T","U","V","W","X","Y","Z"
			}

			for i = 1, #chars do
				values[#values + 1] = { description = chars[i], data = i + KEY_A - 1 }
			end

			return values
		end)()
	},
	{
		default = 2,
		label   = "�������ɴ�Ż����:",
		name    = "maxLights",
		options = (function()
			local values = {}
			for i = 1, 10 do
				values[#values + 1] = { description = i, data = i }
			end

			return values
		end)()
	},
	{
		default = "resources",
		label   = "����Щ���뱳��:",
		name    = "backpackCategory",
		options = {
			{ description = "װ��",    data = "armour" },
			{ description = "ʳ��",      data = "food" },
			{ description = "����",      data = "misc" },
			{ description = "��Դ",    data = "light" },
			{ description = "��Դ", data = "resources" },
			{ description = "����",     data = "tools" },
			{ description = "����",   data = "weapons" },
		}
	},
}
