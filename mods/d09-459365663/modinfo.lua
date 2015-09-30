--[[	Copyright (c) 2015 Kzisor/Ysovuka	]]

-- Mod Name
name = "d09恶魔王子阿努比斯"

-- Mod Description
description = [[
阿努比斯好像可以升级,
他将用他那美妙的微笑征服这个世界?
]]

-- Mod Authors
author = "YY89856191章凡汉化"

-- Mod Version
version = "0.0.7"

--[[
	CHANGE NOTES:
	Version 0.0.7:
	Wortox's sound should no longer blast over the entire world.

	Version 0.0.6:
	Sanity inversion should now correctly work when picking objects which affect sanity.

	Version 0.0.5:
	Overtime sanity drains and increases are now properly inverted.

	Version 0.0.4:
	Sanity inversion now properly works.

	Version 0.0.3:
	Fixed the minimap icon.

	Version 0.0.2:
	Wortelisk now only activates when Wortox gets near it.
	Deciduous Trees now have a 15% chance to turn into Poisonous Deciduous Trees.
	Fixed a crash when merm would try to target someone.
	Fixed a typo in the recipe strings causing the recipe to have no name or description.

	Version 0.0.1:
	Release

]]

-- Left blank until we get to a point where we are going to release this mod.
forumthread = ""

-- Don't Starve API version.
-- Note: We set this to 10 so that it's incompatible with single player.
api_version = 10

-- Don't Starve Together API version.
api_version_dst = 10

-- Priority of which our mod will be loaded.
priority = 0

-- Engine Compatibility
-- Don't Starve Vanilla
dont_starve_compatible = false
-- Don't Starve: Reign of Giants
reign_of_giants_compatible = false
-- Don't Starve Together
dst_compatible = true

-- Requirements
-- Client only gets benefits.
client_only_mod = false
-- All clients require mod to get benefits.
all_clients_require_mod = true

-- Server tags for our mod.
server_filter_tags =
{
	"Wortox",
}

-- Mod icon files.
icon_atlas = "modicon.xml"
icon = "modicon.tex"

-- Configrations for our mod.
configuration_options = 
{

}