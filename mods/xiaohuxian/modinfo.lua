-- This information tells other players more about the mod
name = "The Millennium fox"
description = "Version 1.0\n(For Don't Starve Together)"
author = "DuoMingShuSheng"
version = "1.0" -- This is the version of the template. Change it to your own number.

-- This is the URL name of the mod's thread on the forum; the part after the ? and before the first & in the url
forumthread = ""


-- This lets other players know if your mod is out of date, update it to match the current version in the game
api_version = 10

-- Compatible with Don't Starve Together
dst_compatible = true

-- Not compatible with Don't Starve
dont_starve_compatible = false
reign_of_giants_compatible = false

-- Character mods need this set to true
all_clients_require_mod = true 

icon_atlas = "modicon.xml"
icon = "modicon.tex"

-- The mod's tags displayed on the server list
server_filter_tags = {
"character",
}

--configuration_options = {}
local alpha = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",}
local KEY_A = 97
local keyslist = {}
for i = 1, #alpha do keyslist[i] = {description = alpha[i], data = i + KEY_A - 1} end

configuration_options =
{
    {
        name = "CHARMKEY",
        label = "Charm",
		hover = "The key you press to charm creatures.",
        options = keyslist,
        default = 114, --R
    },
    
    {
        name = "DISENCHANTKEY",
        label = "Disenchant",
		hover = "The key you press to disenchant all of your followers.",
        options = keyslist,
        default = 120, --X
    },
}