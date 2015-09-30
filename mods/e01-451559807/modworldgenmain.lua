local require = GLOBAL.require
require("map/lockandkey")
require("map/tasks")

local LOCKS = GLOBAL.LOCKS
local KEYS = GLOBAL.KEYS
local SIZE_VARIATION = 2
local GROUND = GLOBAL.GROUND

local function tprint (tbl, indent)
	if tbl == nil then
		return
	end
	if not indent then 
		indent = 0 
	end
	if type(tbl) ~= "table" then
		print(tbl)
		return
	end
	
	for k, v in pairs(tbl) do
		formatting = string.rep("  ", indent) .. k .. ": "
		if type(v) == "table" then
			print(formatting)
			tprint(v, indent+1)
		else
			print(formatting, v)
		end
	end
end

local BiomeTasks = {

	-- Default tasks
	["biome_Make a pick"] = { "Make a pick", "Resource-rich Tier2" },
	["biome_Dig that rock"] = { "Dig that rock" },
	["biome_Great Plains"] = { "Great Plains" },
	["biome_Squeltch"] = { "Squeltch" },
	["biome_Beeeees!"] = { "Beeeees!" },
	["biome_Speak to the king"] = { "Speak to the king" },
	["biome_Forest hunters"] = { "Forest hunters" },
	--["biome_Badlands"] = { "Badlands" },
	["biome_deerclopse"] = { "EXMG_Deerclopsfield" },

	-- Cave biome tasks
	["biome_cavespiders"] = { "EXMG_CaveSpiderArea" },
	["biome_bats"] = { "EXMG_BatArea" },
	["biome_rocklobsters"] = { "EXMG_RockLobsterArea" },
	["biome_residential"] = { "EXMG_Residential" },
	["biome_labyrinth"] = { "EXMG_TheLabyrinth", "EXMG_TheLabyrinth2", "EXMG_TheLabyrinth3" },
	["biome_tentaclecave"] = { "EXMG_TentacledCave", "EXMG_TentacledCave2", "EXMG_TentacledCave3" },
	["biome_sacred"] = { "EXMG_Sacred" },
	["biome_wilds"] = { "EXMG_Wilds" },
	["biome_mush"] = { "EXMG_MushArea" },
	["biome_military"] = { "EXMG_Military" },
	["biome_sinkhole"] = { "EXMG_SinkholeRoom" },
}

local function DuplicateTask(task)
	local task_source = GLOBAL.tasks.GetTaskByName(task, GLOBAL.tasks.sampletasks)
	
	--print("task")
	--tprint(task)
	--print("task_source")
	--tprint(task_source)
	
	local i = 1
	while GLOBAL.tasks.GetTaskByName(task .. "_copy_" .. i, GLOBAL.tasks.sampletasks) do
		i = i + 1
	end
	
	AddTask(task .. "_copy_" .. i, task_source)
	
	return task .. "_copy_" .. i
end

local function TakeRandomChoiceOrCopy(source, choices)
	local n = table.getn(choices)
	if n == 0 then
		return DuplicateTask(source)
	end
	local i = math.random(1, n)
	local choice = choices[i]
	table.remove(choices, i)
	return choice
end

local function LevelPreInit(level)
	local parameters = GLOBAL.json.decode(GLOBAL.GEN_PARAMETERS)
	local biome = parameters and parameters.world_gen_choices and parameters.world_gen_choices.tweak and parameters.world_gen_choices.tweak.biome or nil
	
	if biome and biome.optionaltasks ~= "default" then
		if biome.optionaltasks == "lots" then
			level.numoptionaltasks = 12
		elseif biome.optionaltasks == "more" then
			level.numoptionaltasks = 8
		elseif biome.optionaltasks == "less" then
			level.numoptionaltasks = 2
		end
	else
		level.numoptionaltasks = 4
	end
	
	
	for k, v in pairs(BiomeTasks) do
		choices = GLOBAL.deepcopy(v)
		
		if biome == nil or biome[k] ~= "never" then
			if biome ~= nil and biome[k] == "less" then
				table.insert(level.optionaltasks, TakeRandomChoiceOrCopy(v[1], choices))
			else
				table.insert(level.tasks, TakeRandomChoiceOrCopy(v[1], choices))
			end
		end
		if biome ~= nil and (biome[k] == "more" or biome[k] == "lots") then
			table.insert(level.tasks, TakeRandomChoiceOrCopy(v[1], choices))
			
			if biome[k] == "lots" then
				table.insert(level.tasks, TakeRandomChoiceOrCopy(v[1], choices))
			end
		end
	end
end

AddLevelPreInitAny(LevelPreInit)

-- Slurper Wilds
AddTask("EXMG_Wilds",	{
					locks={LOCKS.BASIC_COMBAT, LOCKS.TIER4},
					keys_given={KEYS.TIER5},
--					entrance_room="BGRocky",
					room_choices =
						{
							["Wormhole"] = GetModConfigData("CaveBiomeWormholes"),
							["EXMG_PondWilds"] = math.random(1,3),
							["EXMG_SlurperWilds"] = 1 + math.random(SIZE_VARIATION), 
							["EXMG_LushWilds"] = 1, 
							["EXMG_LightWilds"] = 1,
						},
					room_bg=GROUND.FUNGUS,
					background_room="EXMG_LushWilds",
					colour={r=1,g=0,b=0.6,a=1},
				}
	)

AddRoom("EXMG_SlurperWilds",	{
			colour={r=0.3,g=0.2,b=0.1,a=0.3},
			value = GROUND.MUD, 
			contents =	{
				distributepercent = GetModConfigData("SlurperWildsPrefabDistribution"),
					distributeprefabs = 
						{
							blue_mushroom = GetModConfigData("SlurperWildsBlueMushroom"),
							lichen = GetModConfigData("SlurperWildsLichen"),
							cave_fern = GetModConfigData("SlurperWildsCaveFern"),
							pillar_algae = GetModConfigData("SlurperWildsSlimyPillar"),
							slurper = GetModConfigData("SlurperWildsSlurper"),
--							bat = 0.15,
--							spiderden = 0.01,
						}
					}
					}
	)

AddRoom("EXMG_LushWilds",	{
			colour={r=0.3,g=0.2,b=0.1,a=0.3},
			value = GROUND.MUD, 
			contents =	{
				distributepercent = GetModConfigData("LushWildsPrefabDistribution"),
					distributeprefabs = 
						{
							blue_mushroom = GetModConfigData("LushWildsBlueMushroom"),
							lichen = GetModConfigData("LushWildsLichen"),
							cave_fern = GetModConfigData("LushWildsCaveFern"),
							pillar_algae = GetModConfigData("LushWildsSlimyPillar"),
							worm = GetModConfigData("LushWildsDepthsWorm"),
--							spiderden = .01,
--							bat = 0.15,
							fissure_lower = GetModConfigData("LushWildsNightmareLight"),
							flower_cave = GetModConfigData("LushWildsCaveFlower"),
							flower_cave_double = GetModConfigData("LushWildsCaveFlower"),
							flower_cave_triple = GetModConfigData("LushWildsCaveFlower"),
						}
					}
				}
	)

AddRoom("EXMG_LightWilds",	{
			colour={r=0.3,g=0.2,b=0.1,a=0.3},
			value = GROUND.MUD, 
			contents =	{
				distributepercent = GetModConfigData("LightWildsPrefabDistribution"),
					distributeprefabs = 
						{
							blue_mushroom = GetModConfigData("LightWildsBlueMushroom"),
							lichen = GetModConfigData("LightWildsLichen"),
							cave_fern = GetModConfigData("LightWildsCaveFern"),
							pillar_algae = GetModConfigData("LightWildsSlimyPillar"),
							flower_cave = GetModConfigData("LightWildsCaveFlower"),
							flower_cave_double = GetModConfigData("LightWildsCaveFlower"),
							flower_cave_triple = GetModConfigData("LightWildsCaveFlower"),
							fissure_lower = GetModConfigData("LightWildsNightmareLight"),
						}
					}
				}
	)

-- Mush Area
AddTask("EXMG_MushArea",	{
					locks={LOCKS.BASIC_COMBAT, LOCKS.TIER5},
					keys_given={KEYS.TIER6, KEYS.LABYRINTH},
--					entrance_room="BGRocky",
					room_choices =
						{
							["Wormhole"] = GetModConfigData("CaveBiomeWormholes"),
							["EXMG_GreenMush"] = 2, 
							["EXMG_RedMush"] = 2, 
							["EXMG_BlueMush"] = 2, 
							["EXMG_RabitFungusRoom"] = 2,
						},
					room_bg=GROUND.FUNGUS,
					background_room="EXMG_NoisyFungus",
					colour={r=1,g=0,b=0.6,a=1},
				}
	)

AddRoom("EXMG_RabitFungusRoom",	{
			colour={r=0.3,g=0.2,b=0.1,a=0.3},
			value = GROUND.FUNGUS,
--			tags = {"ForceConnected"},
			countstaticlayouts =
						{
							["RabbitTown"] = function () return math.random(2) end,
							["RabbitCity"] = function () return math.random(3) end,
							["TorchRabbitking"]=function () return math.random(3) end,
						},
			contents =	{
				distributepercent = GetModConfigData("RabbitFieldPrefabDistribution"),
					distributeprefabs =
						{
							flower_cave = GetModConfigData("RabbitFieldCaveFlower"),
							flower_cave_triple = GetModConfigData("RabbitFieldCaveFlower"),
							flower_cave_double = GetModConfigData("RabbitFieldCaveFlower"),
							carrot_planted = GetModConfigData("RabbitFieldCarrot"),
							green_mushroom = GetModConfigData("RabbitFieldAllMushrooms"),
							blue_mushroom = GetModConfigData("RabbitFieldAllMushrooms"),
							red_mushroom = GetModConfigData("RabbitFieldAllMushrooms"),
--							mushtree_tall = 0.5,
--							mushtree_medium = 0.5,
--							mushtree_small = 0.5,
							rabbithouse = GetModConfigData("RabbitFieldRabbitHouse"),
							cave_fern = GetModConfigData("RabbitFieldCaveFern"),
						}
					}
					}
	)

AddRoom("EXMG_GreenMush",	{
			colour={r=0.3,g=0.2,b=0.1,a=0.3},
			value = GROUND.FUNGUSGREEN, 
--			tags = {"ForceConnected"},
			contents =	{
				distributepercent = GetModConfigData("GreenMushPrefabDistribution"),
					distributeprefabs =
						{
							slurtlehole = GetModConfigData("GreenMushSlurtleMound"),
							worm = GetModConfigData("GreenMushDepthsWorm"),
--							tallbirdnest = 0.01,
--							spiderden = 0.01,
							carrot_planted = GetModConfigData("GreenMushCarrot"),
							cave_fern = GetModConfigData("GreenMushCaveFern"),
							flower_cave = GetModConfigData("GreenMushCaveFlower"),
							flower_cave_triple = GetModConfigData("GreenMushCaveFlower"),
							flower_cave_double = GetModConfigData("GreenMushCaveFlower"),
							green_mushroom = GetModConfigData("GreenMushGreenMushroom"),
							mushtree_small = GetModConfigData("GreenMushSmallMushtree"),
						}
					}
				}
	)

AddRoom("EXMG_RedMush",	{
			colour={r=0.3,g=0.2,b=0.1,a=0.3},
			value = GROUND.FUNGUSRED, 
--			tags = {"ForceConnected"},
			contents =	{
				distributepercent = GetModConfigData("RedMushPrefabDistribution"),
					distributeprefabs =
						{
							slurtlehole = GetModConfigData("RedMushSlurtleMound"),
							worm = GetModConfigData("RedMushDepthsWorm"),
--							tallbirdnest = 0.01,
--							spiderden = 0.01,
							carrot_planted = GetModConfigData("RedMushCarrot"),
							cave_fern = GetModConfigData("RedMushCaveFern"),
							flower_cave = GetModConfigData("RedMushCaveFlower"),
							flower_cave_triple = GetModConfigData("RedMushCaveFlower"),
							flower_cave_double = GetModConfigData("RedMushCaveFlower"),
							red_mushroom = GetModConfigData("RedMushRedMushroom"),
							mushtree_medium = GetModConfigData("RedMushMediumMushtree"),
						}
					}
				}
	)

AddRoom("EXMG_BlueMush",	{
			colour={r=0.3,g=0.2,b=0.1,a=0.3},
			value = GROUND.FUNGUS, 
--			tags = {"ForceConnected"},
			contents =	{
				distributepercent = GetModConfigData("BlueMushPrefabDistribution"),
					distributeprefabs =
						{
							slurtlehole = GetModConfigData("BlueMushSlurtleMound"),
							worm = GetModConfigData("BlueMushDepthsWorm"),
--							tallbirdnest = 0.01,
--							spiderden = 0.01,
							carrot_planted = GetModConfigData("BlueMushCarrot"),
							cave_fern = GetModConfigData("BlueMushCaveFern"),
							flower_cave = GetModConfigData("BlueMushCaveFlower"),
							flower_cave_triple = GetModConfigData("BlueMushCaveFlower"),
							flower_cave_double = GetModConfigData("BlueMushCaveFlower"),
							blue_mushroom = GetModConfigData("BlueMushBlueMushroom"),
							mushtree_tall = GetModConfigData("BlueMushTallMushtree"),
						}
					}
				}
	)

AddRoom("EXMG_NoisyFungus",	{
			colour={r=0.3,g=0.2,b=0.1,a=0.3},
			value = GROUND.MUD, 
--			tags = {"ForceConnected"},
			contents =	{
				distributepercent = GetModConfigData("FungusPlainsPrefabDistribution"),
					distributeprefabs =
						{
							slurtlehole = GetModConfigData("FungusPlainsSlurtleMound"),
							worm = GetModConfigData("FungusPlainsDepthsWorm"),
--							tallbirdnest=0.01,
--							spiderden=0.01,
							carrot_planted = GetModConfigData("FungusPlainsCarrot"),
							flower_cave = GetModConfigData("FungusPlainsCaveFlower"),
							flower_cave_double = GetModConfigData("FungusPlainsCaveFlower"),
							flower_cave_triple = GetModConfigData("FungusPlainsCaveFlower"),
							mushtree_tall = GetModConfigData("FungusPlainsMushTree"),
							mushtree_medium = GetModConfigData("FungusPlainsMushTree"),
							mushtree_small = GetModConfigData("FungusPlainsMushTree"),
							cave_fern = GetModConfigData("FungusPlainsCaveFern"),
							goldnugget = GetModConfigData("FungusPlainsGoldNugget"),
						}
					}
				}
	)

-- Bat Area
AddTask("EXMG_BatArea",	{
					locks={LOCKS.BASIC_COMBAT, LOCKS.TIER4},
					keys_given={KEYS.TIER5},
					room_choices =
						{
							["Wormhole"] = GetModConfigData("CaveBiomeWormholes"),
							["EXMG_BatCaveRoom"] = 1 + math.random(SIZE_VARIATION), 
						},
					room_bg=GROUND.CAVE,
					background_room="EXMG_BatCaveRoom",
					colour={r=0.3,g=0.3,b=0.3,a=0.3},
				}
	)

AddRoom("EXMG_BatCaveRoom",	{
			colour={r=0.3,g=0.2,b=0.1,a=0.3},
			value = GROUND.CAVE, 
			contents =	{
				distributepercent = GetModConfigData("BatCavePrefabDistribution"),
					distributeprefabs =
						{
							tallbirdnest = GetModConfigData("BatCaveTallbirdNest"),
							bat = GetModConfigData("BatCaveBats"),
							guano = GetModConfigData("BatCaveGuano"),
							goldnugget = GetModConfigData("BatCaveGoldNugget"),
							flint = GetModConfigData("BatCaveFlint"),
							stalagmite_tall = GetModConfigData("BatCaveStalagmite"),
							stalagmite_tall_med = GetModConfigData("BatCaveStalagmite"),
							stalagmite_tall_low = GetModConfigData("BatCaveStalagmite"),
							pillar_cave = GetModConfigData("BatCaveCavePillar"),
							fissure = GetModConfigData("BatCaveNightmareLight"),
						}
					}
				}
	)

-- Cave Spider Area
AddTask("EXMG_CaveSpiderArea",	{
						locks={LOCKS.BASIC_COMBAT, LOCKS.TIER4},
						keys_given={KEYS.TIER5},
						room_choices =
							{
								["Wormhole"] = GetModConfigData("CaveBiomeWormholes"),
								["EXMG_CaveSpiderPlains"] = 1 + math.random(SIZE_VARIATION), 
							},
						room_bg=GROUND.CAVE,
						background_room="EXMG_CaveSpiderPlains",
						colour={r=0.3,g=0.3,b=0.3,a=0.3},
					}
	)
	
AddRoom("EXMG_CaveSpiderPlains",	{
			colour={r=0.3,g=0.2,b=0.1,a=0.3},
			value = GROUND.CAVE,
			contents =	{
				distributepercent = GetModConfigData("CaveSpiderPlainsPrefabDistribution"),
					distributeprefabs =
						{
							stalagmite = GetModConfigData("CaveSpiderPlainsStalagmite"),
							stalagmite_med = GetModConfigData("CaveSpiderPlainsStalagmite"),
							stalagmite_low = GetModConfigData("CaveSpiderPlainsStalagmite"),
--							stalagmite_tall = 0.5,
--							stalagmite_gold = 0.05,
							spiderhole = GetModConfigData("CaveSpiderPlainsSpilagmite"),
							slurtlehole = GetModConfigData("CaveSpiderPlainsSlurtleMound"),
							pillar_cave = GetModConfigData("CaveSpiderPlainsCavePillar"),
							fissure = GetModConfigData("CaveSpiderPlainsNightmareLight"),
						}
					}
					}
	)

-- Rock Lobster Area
AddTask("EXMG_RockLobsterArea",	{
						locks={LOCKS.BASIC_COMBAT, LOCKS.TIER4},
						keys_given={KEYS.TIER5},
						room_choices =
							{
								["Wormhole"] = GetModConfigData("CaveBiomeWormholes"),
								["EXMG_RockLobsterPlains"] = 1 + math.random(SIZE_VARIATION), 
							},
						room_bg=GROUND.CAVE,
						background_room="EXMG_RockLobsterPlains",
						colour={r=0.3,g=0.3,b=0.3,a=0.3},
					}
	)

-- Rock Lobster Plains
AddRoom("EXMG_RockLobsterPlains",	{
			colour={r=0.3,g=0.2,b=0.1,a=0.3},
			value = GROUND.CAVE, 
			contents =	{
				distributepercent = GetModConfigData("RockLobsterPlainsPrefabDistribution"),
					distributeprefabs =
						{
							rocky = GetModConfigData("RockLobsterPlainsRocklobster"),
							goldnugget = GetModConfigData("RockLobsterPlainsGoldNugget"),
							rocks = GetModConfigData("RockLobsterPlainsRocks"),
							flint = GetModConfigData("RockLobsterPlainsFlint"),
							rock_flintless = GetModConfigData("RockLobsterPlainsBoulder"),
							rock_flintless_med = GetModConfigData("RockLobsterPlainsBoulder"),
							rock_flintless_low = GetModConfigData("RockLobsterPlainsBoulder"),
							pillar_cave = GetModConfigData("RockLobsterPlainsCavePillar"),
							fissure = GetModConfigData("RockLobsterPlainsNightmareLight"),
						}
					}
					}
	)

-- Monkey Wilds
AddTask("EXMG_Residential",	{
					locks={LOCKS.BASIC_COMBAT, LOCKS.TIER5},
					keys_given={KEYS.TIER6, KEYS.LABYRINTH, KEYS.SACRED, KEYS.BASIC_COMBAT},
					entrance_room = "RuinedCityEntrance",
					room_choices =
						{
							["EXMG_Vacant"] = 1 + math.random(SIZE_VARIATION),
							["EXMG_BGMonkeyWilds"] = 1,
						},
					room_bg = GROUND.TILES,
					maze_tiles = {rooms = {"room_residential", "room_residential_two", "hallway_residential", "hallway_residential_two"}, bosses = {"room_residential"}},
					background_room="EXMG_Vacant",
					colour={r=1,g=0,b=0.6,a=1},
				}
	)
	
AddRoom("EXMG_BGMonkeyWilds",	{	
			colour={r=0.3,g=0.2,b=0.1,a=0.3},
			value = GROUND.MUD, 
--			tags = {"Maze"},
			contents =	{
				distributepercent = GetModConfigData("MonkeyWildsPrefabDistribution"),
					distributeprefabs = 
						{
							lichen = GetModConfigData("MonkeyWildsLichen"),
							cave_fern = GetModConfigData("MonkeyWildsCaveFern"),
							pillar_algae = GetModConfigData("MonkeyWildsSlimyPillar"),
							cave_banana_tree = GetModConfigData("MonkeyWildsBananaTree"),
							monkeybarrel = GetModConfigData("MonkeyWildsSplumonkeyPod"),
							slurper = GetModConfigData("MonkeyWildsSlurper"),
							pond_cave = GetModConfigData("MonkeyWildsCavePond"),
							fissure_lower = GetModConfigData("MonkeyWildsNightmareLight"),
							worm = GetModConfigData("MonkeyWildsDepthsWorm"),
						}
					}
					}
	)

AddRoom("EXMG_Vacant",	{
			colour={r=0.3,g=0.2,b=0.1,a=0.3},
			value = GROUND.MUD, 
			contents =	{
			countstaticlayouts =
						{
							["CornerWall"] = math.random(1,3),
							["StraightWall"] = math.random(1,2),
							["CornerWall2"] = math.random(1,2),
							["StraightWall2"] = math.random(1,3),
						},
				distributepercent = GetModConfigData("VacantPrefabDistribution"),
					distributeprefabs = 
						{
							lichen = GetModConfigData("VacantLichen"),
							cave_fern = GetModConfigData("VacantCaveFern"),
							pillar_algae = GetModConfigData("VacantSlimyPillar"),
							slurper = GetModConfigData("VacantSlurper"),
							cave_banana_tree = GetModConfigData("VacantBananaTree"),
							monkeybarrel = GetModConfigData("VacantSplumonkeyPod"),
							dropperweb = GetModConfigData("VacantDropperWeb"),
							ruins_rubble_table = GetModConfigData("VacantRubble"),
							ruins_rubble_chair = GetModConfigData("VacantRubble"),
							ruins_rubble_vase = GetModConfigData("VacantRubble"),
						}
					}
				}
	)

AddTask("EXMG_TentacledCave",	{
						locks={LOCKS.BASIC_COMBAT, LOCKS.TIER4},
						keys_given={KEYS.TIER6, KEYS.SACRED, KEYS.LABYRINTH, KEYS.BASIC_COMBAT},
						room_choices =
							{
								["TentacleCave"] = 1+math.random(4),
							},
						room_bg=GROUND.MARSH,
						background_room="TentacleCave", --"BGFungusRoom",
						colour={r=0.5,g=0,b=1,a=1},
					}
	)
	
AddTask("EXMG_TentacledCave2",	{
						locks={LOCKS.BASIC_COMBAT, LOCKS.TIER4},
						keys_given={KEYS.TIER6, KEYS.SACRED, KEYS.LABYRINTH, KEYS.BASIC_COMBAT},
						room_choices =
							{
								["TentacleCave"] = 1+math.random(4),
							},
						room_bg=GROUND.MARSH,
						background_room="TentacleCave", --"BGFungusRoom",
						colour={r=0.5,g=0,b=1,a=1},
					}
	)

AddTask("EXMG_TentacledCave3",	{
						locks={LOCKS.BASIC_COMBAT, LOCKS.TIER5},
						keys_given={KEYS.TIER6, KEYS.SACRED, KEYS.LABYRINTH, KEYS.BASIC_COMBAT},
						room_choices =
							{
								["TentacleCave"] = 1+math.random(4),
							},
						room_bg=GROUND.MARSH,
						background_room="TentacleCave", --"BGFungusRoom",
						colour={r=0.5,g=0,b=1,a=1},
					}
	)
	
AddRoom("EXMG_BGLabyrinth",	{
			colour={r=0.3,g=0.2,b=0.1,a=0.3},
			value = GROUND.BRICK, 
--			tags = {"Labyrinth"},
			contents =	{
					distributepercent = GetModConfigData("LabyrinthPrefabDistribution"),
						distributeprefabs =
							{
								nightmarelight = GetModConfigData("LabyrinthNightmareLight"),
								dropperweb = GetModConfigData("LabyrinthDropperWeb"),
							}
					}
				}
	)

AddRoom("EXMG_LabyrinthGuarden",	{
			colour={r=0.3,g=0.2,b=0.1,a=0.3},
			value = GROUND.BRICK, 
--			tags = {"LabyrinthEntrance"},
			contents =	{
			countstaticlayouts = 
						{
							["WalledGarden"] = 1,
						},          
					},
					}
	)

AddTask("EXMG_Deerclopsfield",	{
						locks = {LOCKS.BASIC_COMBAT, LOCKS.TIER4},
						keys_given = {KEYS.BASIC_COMBAT, KEYS.TIER4},
--						entrance_room="LabyrinthEntrance",
						room_choices =
							{
								["Deerclopsfield"] = 1, 
							},
						room_bg=GROUND.FOREST,
						background_room="BGForest",
						colour={r=0,g=0,b=0,a=0},
					}
	)

AddTask("EXMG_TheLabyrinth",	{
						locks = {LOCKS.BASIC_COMBAT, LOCKS.TIER6},
						keys_given = {KEYS.TIER6, KEYS.ADVANCED_COMBAT},
--						entrance_room="LabyrinthEntrance",
						room_choices =
							{
								["EXMG_LabyrinthGuarden"] = 1, 
							},
						room_bg=GROUND.BRICK,
						background_room="EXMG_BGLabyrinth",
						colour={r=0,g=0,b=0,a=0},
					}
	)
	
AddTask("EXMG_TheLabyrinth2",	{
						locks = {LOCKS.SACRED, LOCKS.TIER6},
						keys_given = {KEYS.SACRED},
--						entrance_room="LabyrinthEntrance",
						room_choices =
							{
								["EXMG_LabyrinthGuarden"] = 1, 
							},
						room_bg=GROUND.BRICK,
						background_room="EXMG_BGLabyrinth",
						colour={r=0,g=0,b=0,a=0},
					}
	)
	
AddTask("EXMG_TheLabyrinth3",	{
						locks = {LOCKS.LABYRINTH, LOCKS.TIER6},
						keys_given = {KEYS.LABYRINTH},
--						entrance_room="LabyrinthEntrance",
						room_choices =
							{
								["EXMG_LabyrinthGuarden"] = 1, 
							},
						room_bg=GROUND.BRICK,
						background_room="EXMG_BGLabyrinth",
						colour={r=0,g=0,b=0,a=0},
					}
	)
	
AddTask("EXMG_Sacred",	{
					locks = {LOCKS.SACRED, LOCKS.TIER6},
					keys_given = {KEYS.SACRED},
					room_choices =
						{
							["Barracks"] = 1,
							["Bishops"] = 1,
							["Spiral"] = 1,
							["BrokenAltar"] = 1,
							["Altar"] = 1,
						},
					room_bg = GROUND.TILES,
					maze_tiles = {rooms = {"room_armoury", "hallway_armoury", "room_armoury_two"}, bosses = {"room_armoury_two"}},
					background_room="BGSacredGround",
					colour={r=1,g=0,b=0.6,a=1},
				}
	)

-- Junkyard Custom Biome
AddTask("EXMG_Military",	{
					locks = {LOCKS.RUINS},
					keys_given = KEYS.NONE,
--					entrance_room = "MilitaryEntrance",
					room_choices =
						{
						--	["EXMG_SinkholeRoom"] = 3+math.random(SIZE_VARIATION),
							["Wormhole"] = GetModConfigData("CaveBiomeWormholes"),
							["EXMG_BGMilitary"] = 4+math.random(SIZE_VARIATION),
						},
					room_bg = GROUND.TILES,
					maze_tiles = {rooms = {"room_armoury", "hallway_armoury", "room_armoury_two"}, bosses = {"room_armoury_two"}},
					background_room="EXMG_BGMilitary",
					colour={r=1,g=0,b=0.6,a=1},
				}
	)

AddRoom("EXMG_BGMilitary",	{
			colour={r=0.3,g=0.2,b=0.1,a=0.3},
			value = GROUND.UNDERROCK,
--			tags = {"Maze"},
			contents =	{
				distributepercent = GetModConfigData("JunkyardBiomePrefabDistribution"),
					distributeprefabs = 
						{
							dropperweb = GetModConfigData("JunkyardBiomeDropperweb"),
--							pillar_ruins = 0.4,
--							pillar_cave = 0.4,
							nightmarelight = GetModConfigData("JunkyardBiomeNightmarelight"),
							rock_flintless = GetModConfigData("JunkyardBiomeRockFlintless"),
							rock1 = GetModConfigData("JunkyardBiomeBoulders"),
							rock2 = GetModConfigData("JunkyardBiomeBoulders"),
							stalagmite_tall = GetModConfigData("JunkyardBiomeStalagmite"),
							stalagmite_tall_med = GetModConfigData("JunkyardBiomeStalagmite"),
							stalagmite_tall_low = GetModConfigData("JunkyardBiomeStalagmite"),
							spiderhole = GetModConfigData("JunkyardBiomeSpilagmite"),
							ruins_rubble_table = GetModConfigData("JunkyardBiomeRubble"),
							ruins_rubble_chair = GetModConfigData("JunkyardBiomeRubble"),
							ruins_rubble_vase = GetModConfigData("JunkyardBiomeRubble"),
							ruins_statue_head = GetModConfigData("JunkyardBiomeAncientStatues"),
							ruins_statue_head_nogem = GetModConfigData("JunkyardBiomeAncientStatues"),
							ruins_statue_mage = GetModConfigData("JunkyardBiomeAncientStatues"),
							ruins_statue_mage_nogem = GetModConfigData("JunkyardBiomeAncientStatues"),
							chessjunk1 = GetModConfigData("JunkyardBiomeBrokenClockworks"),
							chessjunk2 = GetModConfigData("JunkyardBiomeBrokenClockworks"),
							chessjunk3 = GetModConfigData("JunkyardBiomeBrokenClockworks"),
							tallbirdnest = GetModConfigData("JunkyardBiomeTallbirdNest"),
							marbletree = GetModConfigData("JunkyardBiomeMarbleTree"),
							marblepillar = GetModConfigData("JunkyardBiomeMarblePillar"),
							rook_nightmare = GetModConfigData("JunkyardBiomeNightmareClockworks"),
							bishop_nightmare = GetModConfigData("JunkyardBiomeNightmareClockworks"),
							knight_nightmare = GetModConfigData("JunkyardBiomeNightmareClockworks"),
							pond_cave = GetModConfigData("JunkyardBiomeCavePond"),
							statuemaxwell = GetModConfigData("JunkyardBiomeMaxwellStatue"),
							maxwelllight = GetModConfigData("JunkyardBiomeMaxwellsLight"),
							flower_cave = GetModConfigData("JunkyardBiomeCaveFlowers"),
							flower_cave_double = GetModConfigData("JunkyardBiomeCaveFlowers"),
							flower_cave_triple = GetModConfigData("JunkyardBiomeCaveFlowers"),
						}
					}
				}
	)

AddRoom("EXMG_PondWilds",	{
			colour={r=0.3,g=0.2,b=0.1,a=0.3},
			value = GROUND.MUD, 
			contents =	{
				distributepercent = GetModConfigData("WildPondsPrefabDistribution"),
					distributeprefabs = 
						{
							blue_mushroom = GetModConfigData("WildPondsBlueMushroom"),
							cave_fern = GetModConfigData("WildPondsCaveFern"),
							pillar_algae = GetModConfigData("WildPondsSlimyPillar"),
							pond_cave = GetModConfigData("WildPondsCavePonds"),
							fissure_lower = GetModConfigData("WildPondsNightmareLight"),
						}
					}
				}
	)

AddTask("EXMG_Military",	{
					locks = {LOCKS.RUINS},
					keys_given = KEYS.NONE,
--					entrance_room = "MilitaryEntrance",
					room_choices =
						{
							["Wormhole"] = GetModConfigData("CaveBiomeWormholes"),
							["EXMG_BGMilitary"] = 4+math.random(SIZE_VARIATION),
						},
					room_bg = GROUND.TILES,
					maze_tiles = {rooms = {"room_armoury", "hallway_armoury", "room_armoury_two"}, bosses = {"room_armoury_two"}},
					background_room="EXMG_BGMilitary",
					colour={r=1,g=0,b=0.6,a=1},
				}
	)

AddTask("EXMG_SinkholeRoom",{
					locks = {LOCKS.RUINS},
					keys_given = KEYS.NONE,
					room_choices =
						{
							["EXMG_BGSinkholeRoom"] = 4+math.random(SIZE_VARIATION),
--							["Wormhole"] = 1, -- Need Wormholes in pairs, find another biome to put the other pair.
						},
					room_bg = GROUND.TILES,
					background_room="EXMG_BGSinkholeRoom",
					colour={r=.15,g=.18,b=.15,a=.50},
				}
	)

AddRoom("EXMG_BGSinkholeRoom",	{
			colour={r=.15,g=.18,b=.15,a=.50},
			value = GROUND.SINKHOLE,
			contents =  {
				distributepercent = GetModConfigData("SinkholePrefabDistribution"),
					distributeprefabs =
						{
							cavelight = GetModConfigData("SinkholeCavelight"),
							rabbithouse = GetModConfigData("SinkholeRabbitHouse"),
							fireflies = GetModConfigData("SinkholeFireFlies"),
							reeds = GetModConfigData("SinkholeReeds"),
							deciduoustree = GetModConfigData("SinkholeDeciduousTree"),
							berrybush = GetModConfigData("SinkholeBerryBush"),
							blue_mushroom = GetModConfigData("SinkholeMushrooms"),
							green_mushroom = GetModConfigData("SinkholeMushrooms"),
							red_mushroom = GetModConfigData("SinkholeMushrooms"),
							cave_fern = GetModConfigData("SinkholeCaveFern"),
							flower_cave = GetModConfigData("SinkholeCaveFlower"),
							flower_cave_triple = GetModConfigData("SinkholeCaveFlower"),
							flower_cave_double = GetModConfigData("SinkholeCaveFlower"),
							carrot_planted = GetModConfigData("SinkholeCarrot"),
							pond = GetModConfigData("SinkholePonds"),
							pond_mos = GetModConfigData("SinkholePonds"),
							slurtlehole = GetModConfigData("SinkholeSlurtleMound"),
							spiderhole = GetModConfigData("SinkholeSpiderDen"),
						},
					}
					}
	)