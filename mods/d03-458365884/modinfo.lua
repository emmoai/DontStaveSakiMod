-- This information tells other players more about the mod
name = "d03异形"
description = "我喜欢扮演外星人."
author = "YY89856191章凡汉化"
version = "1.2.0" -- This is the version of the template. Change it to your own number.

-- This is the URL name of the mod's thread on the forum; the part after the ? and before the first & in the url
forumthread = "/files/file/950-extended-sample-character/"


-- This lets other players know if your mod is out of date, update it to match the current version in the game
api_version = 10

-- Compatible with Don't Starve Together
dst_compatible = true

-- Not compatible with Don't Starve
dont_starve_compatible = false
reign_of_giants_compatible = true

-- Character mods need this set to true
all_clients_require_mod = true 

icon_atlas = "modicon.xml"
icon = "modicon.tex"

-- The mod's tags displayed on the server list
server_filter_tags = {
"character",
}

configuration_options =
{
    {
        name = "NightVision",
        label = "夜视功能",
        options =
        {
            {description = "开启", data = true},
            {description = "关闭", data = false},			
            
       },
        default = true,
    },	
}
