
name = "����Я����Դ"

description = "���ĸյ���Դ�ͱ��ɹ���.\n\n�ܷ���Ϳ����������Լ��ļ���"
author      = "�׺�һ�ں���"

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
  {description = "����Ҫ", data = false},
  {description = "��Ҫ��",  data = true},
}

tools = {
  "С͵����", "��ͷ", "����", "����", "���",
  "��ì", "ľ��"
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
  "ţ���", "ľͷ", "ľ̿", "��ʯ", "��ʯ", "�ƽ�",
  "��֦", "���", "���", "֩����", "����", 
}

for i=1,#resource do 
  configuration_options[#configuration_options + 1] = {
    name    = resource[i],
    label   = resource[i],
    options = resource_counts,
    default = 0
  }
end
