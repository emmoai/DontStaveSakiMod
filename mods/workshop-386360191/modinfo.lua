name = "PanFlute"
description = "It`s PanFlute Language all!"
author = "Vytas2015"
version = "1.3"
api_version = 10
forumthread = ""

icon_atlas = "preview.xml"
icon = "preview.tex"

dont_starve_compatible = true
reign_of_giants_compatible = true
dst_compatible = true
all_clients_require_mod=false
client_only_mod=true
server_filter_tags = {"PanFlute"}

configuration_options =
 {{ name ="easy_crafting",
   label ="Crafting",
 options =         {       {description = "Easy", data = "ea" },
                           {description = "Normal", data = "no" },
                           {description = "Hard", data = "hr" },
                             },
             default = "no",
          },
	
    {
        name = "chance_drop",
		label = "Pan Flute reign",
        options = 
        {
            {description = "1%", data = 0.01},
            {description = "2%", data = 0.02},
            {description = "3%", data = 0.03},
            {description = "4%", data = 0.04},
            {description = "5%", data = 0.05},
            {description = "6%", data = 0.06},
            {description = "8%", data = 0.08},
            {description = "10%", data = 0.10},
            {description = "12%", data = 0.12},
            {description = "14%", data = 0.14},
            {description = "15%", data = 0.15},
            {description = "16%", data = 0.16},
            {description = "18%", data = 0.18},
            {description = "20%", data = 0.20},
        }, 
        default = 0.1,
    },
}
	