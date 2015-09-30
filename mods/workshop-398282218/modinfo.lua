name = "Craftable Krampus Sack"
description = "It`s Craftable Krampus Sack NEW version!"
author = "Vytas2015"
version = "1.6"
api_version = 10
forumthread = ""

icon_atlas = "preview.xml"
icon = "preview.tex"

dont_starve_compatible = true
reign_of_giants_compatible = true
dst_compatible = true
all_clients_require_mod=false
client_only_mod=true
server_filter_tags = {"Craftable Krampus Sack"}

configuration_options =
 {{ name ="easy_crafting",
   label ="Crafting",
 options =         {       {description = "Easy", data = "ea" },
                           {description = "Normal", data = "no" },
                           {description = "Hard", data = "hr" },
                           {description = "veryHard", data = "SH" },
                             },
             default = "no",
          },
}