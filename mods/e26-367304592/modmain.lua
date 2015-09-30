--[[		Created by: Ysovuka/Kzisor		]]

-- Import the lib use.
modimport("libs/use.lua")

-- Import the mod environment as our environment.
env = use "libs/mod_env"

-- Create the string name for dug reeds.
STRINGS.NAMES.DUG_REEDS = "Dug Reeds"

-- Import the prefab files.
PrefabFiles = 
{
	'dug_reeds',
}

-- Import data/reeds/base.lua
use "data/prefabs/reeds" 

-- Import data/deployable/base.lua
use "data/components/deployable" 