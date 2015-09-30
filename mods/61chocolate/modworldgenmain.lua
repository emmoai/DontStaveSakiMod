GLOBAL.require("map/terrain")

GLOBAL.terrain.rooms.BGNoise.contents.distributeprefabs.cacao_tree = 0.1

	if GLOBAL.IsDLCEnabled(GLOBAL.REIGN_OF_GIANTS) then 
GLOBAL.terrain.rooms.BGNoise.contents.distributeprefabs.cacao_tree = 0.1
	end

GLOBAL.terrain.filter.cacao_tree = {GLOBAL.GROUND.ROAD, GLOBAL.GROUND.WOODFLOOR, GLOBAL.GROUND.CARPET, GLOBAL.GROUND.CHECKER}





