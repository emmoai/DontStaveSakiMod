name = "e27��׮����"
description = " �µ���׮��������׮�Ѿ����ܽ���ֻ��������� "
author = "YY89856191�·�����"
version = "2.0.0b"
forumthread = ""
icon_atlas = "modicon.xml"
icon = "modicon.tex"
api_version = 10
client_only_mod = false
dst_compatible = true
dont_starve_compatible = true
reign_of_giants_compatible = true
all_clients_require_mod = true

configuration_options =
{
  {
    name = "Difficulty",
    label = "�Ѷ�",
    options =	{
      {description = "����", data = 0, hover = "�Զ���ѿ,�ھ���,�ɳ��߲�"},
      {description = "����", data = 1, hover = "�Զ���ѿ,���ھ���,�ɳ��߲�"},
      {description = "����", data = 2, hover = "�貥�ַ�ѿ,���ھ���,�����߲�"},
    },
    default = 0,
  },
  {
    name = "GrowthSpeed",
    label = "�����ٶ�",
    options =	{
      {description = "0.01(�ǳ���)", data = 0.01},
      {description = "0.1(��)",       data = 0.1},
      {description = "0.2",              data = 0.2},
      {description = "0.3",              data = 0.3},
      {description = "0.4",              data = 0.4},
      {description = "0.5",              data = 0.5},
      {description = "0.6",              data = 0.6},
      {description = "0.7",              data = 0.7},
      {description = "0.8",              data = 0.8},
      {description = "0.9",              data = 0.9},
      {description = "1.0(Ĭ��)",    data = 1.0},
      {description = "2.0",              data = 2.0},
      {description = "3.0",              data = 3.0},
      {description = "4.0",              data = 4.0},
      {description = "5.0",              data = 5.0},
      {description = "6.0",              data = 6.0},
      {description = "7.0",              data = 7.0},
      {description = "8.0",              data = 8.0},
      {description = "9.0",              data = 9.0},
      {description = "10.0",             data = 10.0},
      {description = "20.0",             data = 20.0},
      {description = "30.0(��)",      data = 30.0},
    },
    default = 1.0,
  },
  {
    name = "Edible",
    label = "ʳ�þ�",
    options =	{
      {description = "����",  data = true},
      {description = "�ر�", data = false},
    },
    default = true,
  },
  {
    name = "AutoCrumble",
    label = "�ս���������",
    options =	{
      {description = "����",  data = true},
      {description = "�ر�", data = false},
    },
    default = true,
  },
}
