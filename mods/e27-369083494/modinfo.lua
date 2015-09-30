name = "e27树桩再生"
description = " 新的树桩再生，树桩已经不能接受只长大成树了 "
author = "YY89856191章凡汉化"
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
    label = "难度",
    options =	{
      {description = "容易", data = 0, hover = "自动发芽,挖掘奖励,成长蔬菜"},
      {description = "正常", data = 1, hover = "自动发芽,无挖掘奖励,成长蔬菜"},
      {description = "困难", data = 2, hover = "需播种发芽,无挖掘奖励,不长蔬菜"},
    },
    default = 0,
  },
  {
    name = "GrowthSpeed",
    label = "生长速度",
    options =	{
      {description = "0.01(非常慢)", data = 0.01},
      {description = "0.1(慢)",       data = 0.1},
      {description = "0.2",              data = 0.2},
      {description = "0.3",              data = 0.3},
      {description = "0.4",              data = 0.4},
      {description = "0.5",              data = 0.5},
      {description = "0.6",              data = 0.6},
      {description = "0.7",              data = 0.7},
      {description = "0.8",              data = 0.8},
      {description = "0.9",              data = 0.9},
      {description = "1.0(默认)",    data = 1.0},
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
      {description = "30.0(快)",      data = 30.0},
    },
    default = 1.0,
  },
  {
    name = "Edible",
    label = "食用菌",
    options =	{
      {description = "开启",  data = true},
      {description = "关闭", data = false},
    },
    default = true,
  },
  {
    name = "AutoCrumble",
    label = "烧焦的树再生",
    options =	{
      {description = "开启",  data = true},
      {description = "关闭", data = false},
    },
    default = true,
  },
}
