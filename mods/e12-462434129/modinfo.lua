name = "e12����"
forumthread = ""
description = '�����MOD. \n\n���﷢�� "#restart" ���¿�ʼ. \n���﷢�� "#restart_d" ���¿�ʼ���������е���. \n\n���¿�ʼ��ζ�ŷ��ؽ�ɫѡ�����!'
author = "Skull,����Coralfox"
version = "0.0.9"
api_version = 10
priority = -77
dont_starve_compatible = false
reign_of_giants_compatible = false
dst_compatible = true
all_clients_require_mod = false
client_only_mod = false
server_filter_tags = { "Restart" }

icon_atlas = "preview.xml"
icon = "preview.tex"

configuration_options =
{
	{
		name = "FLOODING_PROTECTION",
		label = "��ֹƵ������",
		hover = "������������趨����������ʱ����.",
		options =
		{
			{description = "����", data = true},
			{description = "�ر�", data = false},
		},
		default = true,
	},
	{
		name = "IGNORING_ADMIN",
		label = "����Ա��ʱ������",
		hover = "�����͹���Ա,����Ա��ɶ,�������(����ע).",
		options =
		{
			{description = "����", data = true},
			{description = "�ر�", data = false},
		},
		default = true,
	},
	{
		name = "FORCE_DROP_ALL",
		label = "ǿ�Ƶ������е���",
		hover = "�ر�,�������������Ĳ�ͬ,������ͬ.",
		options =
		{
			{description = "����", data = true},
			{description = "�ر�", data = false},
		},
		default = false,
	},
	{
		name = "FLOODING_INTERVAL",
		label = "������� (��)",
		hover = "���뿪�� ��ֹƵ������.",
		options =
		{
			{description = " 1 ", data = 1},
			{description = " 2 ", data = 2},
			{description = " 3 ", data = 3},
			{description = " 4 ", data = 4},
			{description = " 5 ", data = 5},
			{description = " 7 ", data = 7},
			{description = " 10 ", data = 10},
		},
		default = 5,
	},
}