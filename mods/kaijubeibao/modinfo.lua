
name = "开局携带资源"

description = "别担心刚到资源就被采光了.\n\n很方便就可以先做好自己的家了"
author      = "沧海一粟汉化"

version = "1.2.0"

--This lets other players know if your mod is out of date. This typically needs to be updated every time there's a new game update.
api_version = 10
priority    = 0

--Compatible with both the base game and Reign of Giants
dont_starve_compatible     = true
reign_of_giants_compatible = true
dst_compatible = true

--This lets clients know if they need to get the mod from the Steam Workshop to join the game
all_clients_require_mod = false

--This determines whether it causes a server to be marked as modded (and shows in the mod list)
client_only_mod = false

--This lets people search for servers with this mod by these tags
server_filter_tags = {
  "bootstrap"
}

icon_atlas = "images/bugout.xml"
icon = "bugout.tex"

forumthread = ""


configuration_options = {}

yes_no = {
  {description = "不需要", data = false},
  {description = "需要！",  data = true},
}

tools = {
  "小偷背包", "斧头", "铁镐", "铲子", "火炬",
  "长矛", "木甲"
}

for i=1,#tools do
  configuration_options[#configuration_options + 1] = {
    name    = tools[i],
    label   = tools[i].."?",
    options = yes_no,
    default = false
  }
end


__resource_counts = {
  0, 1, 2, 3, 4, 5, 10, 15, 20, 25, 30, 35, 40, 50, 60, 70, 80
}

resource_counts = {}
for i=1,#__resource_counts do 
  resource_counts[i] = {
    description=__resource_counts[i],
    data=__resource_counts[i]
  }
end


resource = {
  "牛肉干", "木头", "木炭", "碎石", "岩石", "黄金",
  "树枝", "割草", "大便", "蜘蛛网", "齿轮", 
}

for i=1,#resource do 
  configuration_options[#configuration_options + 1] = {
    name    = resource[i],
    label   = resource[i],
    options = resource_counts,
    default = 0
  }
end
