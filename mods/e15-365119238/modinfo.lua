-- This information tells other players more about the mod
name = "e15智能锅"
description = "可以预测出你将要烹饪出的美食! "
author = "yy89856191游侠WoodyCC汉化"
version = "2.00001"
priority = 3
dst_compatible = true
client_only_mod = false
all_clients_require_mod = true
-- This is the URL name of the mod's thread on the forum; the part after the ? and before the first & in the URL
-- Example:
-- http://forums.kleientertainment.com/showthread.php?19505-Modders-Your-new-friend-at-Klei!
-- becomes
-- 19505-Modders-Your-new-friend-at-Klei!
forumthread = "/files/file/458-smarter-crock-pot/"

-- This lets other players know if your mod is out of date, update it to match the current version in the game
api_version = 10
dont_starve_compatible = true
reign_of_giants_compatible = true

icon_atlas = "SmartCrockPot.xml"
icon = "SmartCrockPot.tex"


--[[configuration_options =
{
	{
		-- when using controllers or mouse directly, you have 3 options of input:
		--	close/open ,examine or cook with the crockpot.
		-- to support a fourth option (max is 3) of predicting, the close option is temporarily replaced with predicting.
		-- After predicting, and while prediction is seen, the close option returns.
		name = "Interface",
		label = "Crock pot click Action",
		options =	{
						{description = "Mouse", data = "Close Always"},
						{description = "Controller", data = "Predict then Close"},
                        {description = "Predict then Close", data = "Predict then Close"},
						{description = "Predict Always", data = "Predict Always"},
					},

		default = "True",
	
	},
    
}]]--