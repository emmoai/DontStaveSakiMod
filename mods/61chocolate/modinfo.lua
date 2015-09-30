
name = "Chocolate"
description = "This mod adds Chocolate to the game as well as cacao trees, raw/roasted cacao fruits, chocolate milk, chocolate icecream and even choco cookies! Enjoy your dessert! Check 'Configure Mod' below to change some stats if you want."
author = "Mr. Hastings"
version = "4.5"

forumthread = ""

restart_required = false

api_version = 6

icon_atlas = "modicon.xml"
icon = "modicon.tex"

dont_starve_compatible = true
reign_of_giants_compatible = true


configuration_options =
{
	{
        name = "Cacao_CookedHP",
        label = "Cacao Cooked HP Bonus",
        options =
        {
            {description = "-1 (default)", data = -1},
            {description = "0", data = 0},			
            {description = "+3", data = 3},
       },
        default = -1,
    },	
    {
        name = "ChocolateHP",
        label = "Chocolate HP Bonus",
        options =
        {
            {description = "-3 (default)", data = -3},
            {description = "0", data = 0},			
            {description = "+10", data = 10},
			{description = "+20", data = 20},
       },
        default = -3,
    },
    {
        name = "Chocolate_MilkHP",
        label = "Chocolate Milk HP Bonus",
        options =
        {
            {description = "-3 (default)", data = -3},
            {description = "0", data = 0},			
            {description = "+10", data = 10},
			{description = "+20", data = 20},
       },
        default = -3,
    },	
	    {
        name = "Chocolate_MilkTEMP",
        label = "Chocolate Milk Warmth",
        options =
        {
            {description = "+40 (default)", data = 40},
            {description = "0", data = 0},
       },
        default = 40,
    },	
	    {
        name = "Choco_IcecreamHP",
        label = "Choco Icecream HP Bonus",
        options =
        {
            {description = "0 (default)", data = 0},
            {description = "-3", data = -3},			
            {description = "+10", data = 10},
       },
        default = 0,
    },	
		    {
        name = "Choco_IcecreamTEMP",
        label = "Choco Icecream Warmth",
        options =
        {
            {description = "-20 (default)", data = -20},
            {description = "-40", data = -40},
       },
        default = -20,
    },	
		{
        name = "Choco_CookiesHP",
        label = "Choco Cookies HP Bonus",
        options =
        {
            {description = "0 (default)", data = 0},
            {description = "-3", data = -3},			
            {description = "+10", data = 10},
       },
        default = 0,
    },	
}