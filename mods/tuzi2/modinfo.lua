-- This information tells other players more about the mod
name = "Faroz Character 2.5"
description = "Fixed some bugs from original"
author = "Haruz & Tullaphat"
version = "2.0.3"

-- This is the URL name of the mod's thread on the forum; the part after the ? and before the first & in the url
forumthread = ""


-- This lets other players know if your mod is out of date, update it to match the current version in the game
api_version = 10

dst_compatible = true
dont_starve_compatible = false
reign_of_giants_compatible = false
all_clients_require_mod = true

icon_atlas = "modicon.xml"
icon = "modicon.tex"

configuration_options =
{
	{
		name = "DROPGLASSES",
		label = "Drop Glasses",
		hover = "drop it or not, when player disconnected",
		options =	{
						{description = "yes", data = 1},
						{description = "no", data = 0},
					},

		default = 1,
	},
}