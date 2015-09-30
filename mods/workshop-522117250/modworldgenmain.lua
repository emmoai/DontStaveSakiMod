GLOBAL.require("map/terrain")

if GLOBAL.terrain.rooms.DeepDeciduous then
GLOBAL.terrain.rooms.DeepDeciduous.contents.distributeprefabs.berryblue = .06
GLOBAL.terrain.rooms.DeepDeciduous.contents.distributeprefabs.berryblu2 = .04
GLOBAL.terrain.rooms.DeepDeciduous.contents.distributeprefabs.berrygree = .03
GLOBAL.terrain.rooms.DeepDeciduous.contents.distributeprefabs.berrygre2 = .02
GLOBAL.terrain.rooms.DeepDeciduous.contents.distributeprefabs.appletree = .08
end
if GLOBAL.terrain.rooms.BGDeciduous then
GLOBAL.terrain.rooms.BGDeciduous.contents.distributeprefabs.berryblue = .09
GLOBAL.terrain.rooms.BGDeciduous.contents.distributeprefabs.berryblu2 = .045
GLOBAL.terrain.rooms.BGDeciduous.contents.distributeprefabs.berrygree = .045
GLOBAL.terrain.rooms.BGDeciduous.contents.distributeprefabs.berrygre2 = .023
end

if GLOBAL.terrain.rooms.DeciduousMole then
GLOBAL.terrain.rooms.DeciduousMole.contents.distributeprefabs.berryblue = .04
GLOBAL.terrain.rooms.DeciduousMole.contents.distributeprefabs.berryblu2 = .02
GLOBAL.terrain.rooms.DeciduousMole.contents.distributeprefabs.berrygree = .015
GLOBAL.terrain.rooms.DeciduousMole.contents.distributeprefabs.berrygre2 = .01
end
if GLOBAL.terrain.rooms.MolesvilleDeciduous then
GLOBAL.terrain.rooms.MolesvilleDeciduous.contents.distributeprefabs.berryblue = .07
GLOBAL.terrain.rooms.MolesvilleDeciduous.contents.distributeprefabs.berryblu2 = .035
GLOBAL.terrain.rooms.MolesvilleDeciduous.contents.distributeprefabs.berrygree = .035
GLOBAL.terrain.rooms.MolesvilleDeciduous.contents.distributeprefabs.berrygre2 = .017
GLOBAL.terrain.rooms.MolesvilleDeciduous.contents.distributeprefabs.appletree = .1
end
if GLOBAL.terrain.rooms.DeciduousClearing then
GLOBAL.terrain.rooms.DeciduousClearing.contents.distributeprefabs.berryblue = .08
GLOBAL.terrain.rooms.DeciduousClearing.contents.distributeprefabs.berryblu2 = .04
GLOBAL.terrain.rooms.DeciduousClearing.contents.distributeprefabs.berrygree = .035
GLOBAL.terrain.rooms.DeciduousClearing.contents.distributeprefabs.berrygre2 = .02
GLOBAL.terrain.rooms.DeciduousClearing.contents.distributeprefabs.appletree = .5
end
if GLOBAL.terrain.rooms.MagicalDeciduous then
GLOBAL.terrain.rooms.MagicalDeciduous.contents.distributeprefabs.berryblue = .1
GLOBAL.terrain.rooms.MagicalDeciduous.contents.distributeprefabs.berryblu2 = .05
GLOBAL.terrain.rooms.MagicalDeciduous.contents.distributeprefabs.berrygree = .05
GLOBAL.terrain.rooms.MagicalDeciduous.contents.distributeprefabs.berrygre2 = .025
end
if GLOBAL.terrain.rooms.PondyGrass then
GLOBAL.terrain.rooms.PondyGrass.contents.distributeprefabs.berryblue = .09
GLOBAL.terrain.rooms.PondyGrass.contents.distributeprefabs.berryblu2 = .045
GLOBAL.terrain.rooms.PondyGrass.contents.distributeprefabs.berrygree = .04
GLOBAL.terrain.rooms.PondyGrass.contents.distributeprefabs.berrygre2 = .022
end
if GLOBAL.terrain.rooms.BGGrass then
GLOBAL.terrain.rooms.BGGrass.contents.distributeprefabs.berryblue = .05
GLOBAL.terrain.rooms.BGGrass.contents.distributeprefabs.berryblu2 = .025
GLOBAL.terrain.rooms.BGGrass.contents.distributeprefabs.berrygree = .025
GLOBAL.terrain.rooms.BGGrass.contents.distributeprefabs.berrygre2 = .012
GLOBAL.terrain.rooms.BGGrass.contents.distributeprefabs.pineapple = .05
GLOBAL.terrain.rooms.BGGrass.contents.distributeprefabs.appletree = .02
end
if GLOBAL.terrain.rooms.BGGrassBurnt then
GLOBAL.terrain.rooms.BGGrassBurnt.contents.distributeprefabs.berryblue = .06
GLOBAL.terrain.rooms.BGGrassBurnt.contents.distributeprefabs.berryblu2 = .03
GLOBAL.terrain.rooms.BGGrassBurnt.contents.distributeprefabs.berrygree = .03
GLOBAL.terrain.rooms.BGGrassBurnt.contents.distributeprefabs.berrygre2 = .015
end

if GLOBAL.terrain.rooms.BGDeepForest then
GLOBAL.terrain.rooms.BGGrassBurnt.contents.distributeprefabs.berryblue = .02
GLOBAL.terrain.rooms.BGGrassBurnt.contents.distributeprefabs.berryblu2 = .01
GLOBAL.terrain.rooms.BGGrassBurnt.contents.distributeprefabs.berrygree = .01
GLOBAL.terrain.rooms.BGGrassBurnt.contents.distributeprefabs.berrygre2 = .005
GLOBAL.terrain.rooms.BGGrassBurnt.contents.distributeprefabs.appletree = .3
end

if GLOBAL.terrain.rooms.BGForest then
GLOBAL.terrain.rooms.BGGrassBurnt.contents.distributeprefabs.berryblue = .01
GLOBAL.terrain.rooms.BGGrassBurnt.contents.distributeprefabs.berryblu2 = .005
GLOBAL.terrain.rooms.BGGrassBurnt.contents.distributeprefabs.berrygree = .005
GLOBAL.terrain.rooms.BGGrassBurnt.contents.distributeprefabs.berrygre2 = .002
GLOBAL.terrain.rooms.BGGrassBurnt.contents.distributeprefabs.appletree = .1
end


if GLOBAL.terrain.rooms.BGBadlands then
    GLOBAL.terrain.rooms.BGBadlands.contents.distributeprefabs.pineapple = 0.35
end
if GLOBAL.terrain.rooms.Lightning then
    GLOBAL.terrain.rooms.Lightning.contents.distributeprefabs.pineapple = 0.2
end
if GLOBAL.terrain.rooms.Badlands then
    GLOBAL.terrain.rooms.Badlands.contents.distributeprefabs.pineapple = 0.4
end
if GLOBAL.terrain.rooms.HoundyBadlands then
    GLOBAL.terrain.rooms.HoundyBadlands.contents.distributeprefabs.pineapple = 0.2
end
if GLOBAL.terrain.rooms.BuzzardyBadlands then
    GLOBAL.terrain.rooms.BuzzardyBadlands.contents.distributeprefabs.pineapple = 0.2
end

GLOBAL.terrain.filter.berryblue = {GLOBAL.GROUND.ROAD, GLOBAL.GROUND.WOODFLOOR, GLOBAL.GROUND.CARPET, GLOBAL.GROUND.CHECKER, GLOBAL.GROUND.ROCKY, GLOBAL.GROUND.MARSH}
GLOBAL.terrain.filter.berryblu2 = {GLOBAL.GROUND.ROAD, GLOBAL.GROUND.WOODFLOOR, GLOBAL.GROUND.CARPET, GLOBAL.GROUND.CHECKER, GLOBAL.GROUND.ROCKY, GLOBAL.GROUND.MARSH}
GLOBAL.terrain.filter.berrygree = {GLOBAL.GROUND.ROAD, GLOBAL.GROUND.WOODFLOOR, GLOBAL.GROUND.CARPET, GLOBAL.GROUND.CHECKER, GLOBAL.GROUND.ROCKY, GLOBAL.GROUND.MARSH}
GLOBAL.terrain.filter.berrygre2 = {GLOBAL.GROUND.ROAD, GLOBAL.GROUND.WOODFLOOR, GLOBAL.GROUND.CARPET, GLOBAL.GROUND.CHECKER, GLOBAL.GROUND.ROCKY, GLOBAL.GROUND.MARSH}
GLOBAL.terrain.filter.pineapple = {GLOBAL.GROUND.ROAD, GLOBAL.GROUND.WOODFLOOR, GLOBAL.GROUND.CARPET, GLOBAL.GROUND.CHECKER, GLOBAL.GROUND.ROCKY, GLOBAL.GROUND.MARSH}
GLOBAL.terrain.filter.appletree = {GLOBAL.GROUND.ROAD, GLOBAL.GROUND.WOODFLOOR, GLOBAL.GROUND.CARPET, GLOBAL.GROUND.CHECKER, GLOBAL.GROUND.ROCKY, GLOBAL.GROUND.MARSH}