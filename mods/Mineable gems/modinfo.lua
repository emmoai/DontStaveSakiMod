--[[
Copy & paste for dedicated server:

["workshop-380423963"] = { --Mineable Gems
	enabled = true,
	configuration_options =
	{
		-- 1 means 100%, 0.3 means 30%, 0.15 means 15% etc.
		-- Also 3.7 means 3 gems + 70% chance of 4th gem.
		["Boulder Blue Gem"] = 0.01,
		["Boulder Purple Gem"] = 0.005, --Means 0.5%
		["Gold Vein Red Gem"] = 0.01,
		["Gold Vein Purple Gem"] = 0.005,
		["Flintless Blue Gem"] = 0.02,
		["Flintless Red Gem"] = 0.02,
		["Flintless Purple Gem"] = 0.01,
		["Meteor Yellow Gem"] = 0.01,
		["Meteor Orange Gem"] = 0.01,
		["Meteor Green Gem"] = 0.01,
	}
},


--]]

name = "Mineable Gems"
forumthread = " "
description = "Gives boulders a chance to drop gems. A straight port from the original, so all credit goes to Ashkain."
author = "star"
version = "2.14"
api_version = 10
dont_starve_compatible = true
reign_of_giants_compatible = true
dst_compatible = true
all_clients_require_mod = false
client_only_mod = false
server_filter_tags = {"mineable gems"}

icon_atlas = "preview.xml"
icon = "preview.tex"

configuration_options =
{
    {
        name = "Boulder Blue Gem",
        options = 
        {
            {description = "0%", data = 0.00},
            {description = "1%", data = 0.01},
            {description = "2%", data = 0.02},
            {description = "3%", data = 0.03},
            {description = "5%", data = 0.05},
            {description = "10%", data = 0.1},
            {description = "15%", data = 0.15},
            {description = "20%", data = 0.2},
            {description = "30%", data = 0.3},
            {description = "40%", data = 0.4},
            {description = "50%", data = 0.5},
            {description = "75%", data = 0.75},
            {description = "125%", data = 1.25},
            {description = "175%", data = 1.75},
            {description = "250%", data = 2.5},
        }, 
        default = 0.2,
    },
    {
        name = "Gold Vein Red Gem",
        options = 
        {
            {description = "0%", data = 0.00},
            {description = "1%", data = 0.01},
            {description = "2%", data = 0.02},
            {description = "3%", data = 0.03},
            {description = "5%", data = 0.05},
            {description = "10%", data = 0.1},
            {description = "15%", data = 0.15},
            {description = "20%", data = 0.2},
            {description = "30%", data = 0.3},
            {description = "40%", data = 0.4},
            {description = "50%", data = 0.5},
            {description = "75%", data = 0.75},
            {description = "125%", data = 1.25},
            {description = "175%", data = 1.75},
            {description = "250%", data = 2.5},
        }, 
        default = 0.1,
    },
    {
        name = "Boulder Purple Gem",
        options = 
        {
            {description = "0%", data = 0.00},
            {description = "1%", data = 0.01},
            {description = "2%", data = 0.02},
            {description = "3%", data = 0.03},
            {description = "5%", data = 0.05},
            {description = "10%", data = 0.1},
            {description = "15%", data = 0.15},
            {description = "20%", data = 0.2},
            {description = "30%", data = 0.3},
            {description = "40%", data = 0.4},
            {description = "50%", data = 0.5},
            {description = "75%", data = 0.75},
            {description = "125%", data = 1.25},
            {description = "175%", data = 1.75},
            {description = "250%", data = 2.5},
        }, 
        default = 0.05,
    },
    {
        name = "Gold Vein Purple Gem",
        options = 
        {
            {description = "0%", data = 0.00},
            {description = "1%", data = 0.01},
            {description = "2%", data = 0.02},
            {description = "3%", data = 0.03},
            {description = "5%", data = 0.05},
            {description = "10%", data = 0.1},
            {description = "15%", data = 0.15},
            {description = "20%", data = 0.2},
            {description = "30%", data = 0.3},
            {description = "40%", data = 0.4},
            {description = "50%", data = 0.5},
            {description = "75%", data = 0.75},
            {description = "125%", data = 1.25},
            {description = "175%", data = 1.75},
            {description = "250%", data = 2.5},
        }, 
        default = 0.05,
    },
    {
        name = "Flintless Blue Gem",
        options = 
        {
            {description = "0%", data = 0.00},
            {description = "1%", data = 0.01},
            {description = "2%", data = 0.02},
            {description = "3%", data = 0.03},
            {description = "5%", data = 0.05},
            {description = "10%", data = 0.1},
            {description = "15%", data = 0.15},
            {description = "20%", data = 0.2},
            {description = "30%", data = 0.3},
            {description = "40%", data = 0.4},
            {description = "50%", data = 0.5},
            {description = "75%", data = 0.75},
            {description = "125%", data = 1.25},
            {description = "175%", data = 1.75},
            {description = "250%", data = 2.5},
        }, 
        default = 0.5,
    },
    {
        name = "Meteor Yellow Gem",
        options = 
        {
            {description = "0%", data = 0},
            {description = "1%", data = 0.01},
            {description = "2%", data = 0.02},
            {description = "3%", data = 0.03},
            {description = "5%", data = 0.05},
            {description = "10%", data = 0.1},
            {description = "15%", data = 0.15},
            {description = "20%", data = 0.2},
            {description = "30%", data = 0.3},
            {description = "40%", data = 0.4},
            {description = "50%", data = 0.5},
            {description = "75%", data = 0.75},
            {description = "125%", data = 1.25},
            {description = "175%", data = 1.75},
            {description = "250%", data = 2.5},
        }, 
        default = 0.02,
    },
    {
        name = "Flintless Red Gem",
        options = 
        {
            {description = "0%", data = 0.00},
            {description = "1%", data = 0.01},
            {description = "2%", data = 0.02},
            {description = "3%", data = 0.03},
            {description = "5%", data = 0.05},
            {description = "10%", data = 0.1},
            {description = "15%", data = 0.15},
            {description = "20%", data = 0.2},
            {description = "30%", data = 0.3},
            {description = "40%", data = 0.4},
            {description = "50%", data = 0.5},
            {description = "75%", data = 0.75},
            {description = "125%", data = 1.25},
            {description = "175%", data = 1.75},
            {description = "250%", data = 2.5},
        }, 
        default = 0.2,
    },
    {
        name = "Meteor Orange Gem",
        options = 
        {
            {description = "0%", data = 0},
            {description = "1%", data = 0.01},
            {description = "2%", data = 0.02},
            {description = "3%", data = 0.03},
            {description = "5%", data = 0.05},
            {description = "10%", data = 0.1},
            {description = "15%", data = 0.15},
            {description = "20%", data = 0.2},
            {description = "30%", data = 0.3},
            {description = "40%", data = 0.4},
            {description = "50%", data = 0.5},
            {description = "75%", data = 0.75},
            {description = "125%", data = 1.25},
            {description = "175%", data = 1.75},
            {description = "250%", data = 2.5},
        }, 
        default = 0.02,
    },
    {
        name = "Flintless Purple Gem",
        options = 
        {
            {description = "0%", data = 0.00},
            {description = "1%", data = 0.01},
            {description = "2%", data = 0.02},
            {description = "3%", data = 0.03},
            {description = "5%", data = 0.05},
            {description = "10%", data = 0.1},
            {description = "15%", data = 0.15},
            {description = "20%", data = 0.2},
            {description = "30%", data = 0.3},
            {description = "40%", data = 0.4},
            {description = "50%", data = 0.5},
            {description = "75%", data = 0.75},
            {description = "125%", data = 1.25},
            {description = "175%", data = 1.75},
            {description = "250%", data = 2.5},
        }, 
        default = 0.1,
    },
    {
        name = "Meteor Green Gem",
        options = 
        {
            {description = "0%", data = 0},
            {description = "1%", data = 0.01},
            {description = "2%", data = 0.02},
            {description = "3%", data = 0.03},
            {description = "5%", data = 0.05},
            {description = "10%", data = 0.1},
            {description = "15%", data = 0.15},
            {description = "20%", data = 0.2},
            {description = "30%", data = 0.3},
            {description = "40%", data = 0.4},
            {description = "50%", data = 0.5},
            {description = "75%", data = 0.75},
            {description = "125%", data = 1.25},
            {description = "175%", data = 1.75},
            {description = "250%", data = 2.5},
        }, 
        default = 0.02,
    },
}

priority = 1
added = 0.00380423963 --must be strong enough
local s = ""
for i=1,2 do
	s = s .. configuration_options[i].name..forumthread
end
if s == "Boulder Blue Gem Gold Vein Red Gem " then
	dont_strave_compatible = false
	priority = priority + api_version * api_version
	client_only_mod = false
else
	dst_compatible = false
	server_filter_tags = {"no dst"}
	version = version .. "_gamma"
	author = "kto-to"
end

author = author .. "_" ..priority
priority = priority + added


