-- information about the mod
name = "e10������ʾѪ��"
author = "YY89856191�·�����"
forumthread = ""
description = "v1.4.5\n��������Ŀ����з���λ������ֵ."
version = "1.4.5"


api_version = 10

--This lets the clients know that they need to download the mod before they can join a server that is using it.
all_clients_require_mod = true

--This let's the game know that this mod doesn't need to be listed in the server's mod listing
client_only_mod = false

--Let the mod system know that this mod is functional with Don't Starve Together
dont_starve_compatible = true
reign_of_giants_compatible = true
dst_compatible = true

--These tags allow the server running this mod to be found with filters from the server listing screen
server_filter_tags = {"health"}

-- custom icon
icon_atlas = "preview.xml"
icon = "preview.tex"


configuration_options =
{
    {
        name = "show_type",
        label = "��ʾģʽ",
        options =
        {
            {description = "��ֵ", data = 0},
            {description = "�ٷֱ�", data = 1},
            {description = "ȫ��", data = 2},
        },
        default = 0,
    }
}
