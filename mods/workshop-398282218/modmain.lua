STRINGS = GLOBAL.STRINGS
RECIPETABS = GLOBAL.RECIPETABS
Recipe = GLOBAL.Recipe
Ingredient = GLOBAL.Ingredient
TECH = GLOBAL.TECH

STRINGS.RECIPE_DESC.KRAMPUS_SACK = "Even More Items." 

table.insert(GLOBAL.STRINGS, "DFV_LANG")

local DFV_LANG = GetModConfigData("easy_crafting")

if DFV_LANG == "ea" then
 local chesterrecipe GLOBAL.Recipe("krampus_sack", {Ingredient("cutreeds", 1),Ingredient("rope", 1),Ingredient("silk", 1)}, RECIPETABS.SURVIVAL,  TECH.SCIENCE_TWO ,nil,nil,nil,1) 

elseif DFV_LANG == "hr" then
 local chesterrecipe GLOBAL.Recipe("krampus_sack", {Ingredient("cutreeds", 20),Ingredient("rope", 20),Ingredient("silk", 20)}, RECIPETABS.SURVIVAL,  TECH.SCIENCE_TWO ,nil,nil,nil,1)

elseif DFV_LANG == "SH" then
 local chesterrecipe GLOBAL.Recipe("krampus_sack", {Ingredient("cutreeds", 10),Ingredient("pigskin", 10),Ingredient("nightmarefuel", 5),Ingredient("purplegem", 1),Ingredient("silk", 20)}, RECIPETABS.SURVIVAL,  TECH.SCIENCE_TWO ,nil,nil,nil,1)

else
 local chesterrecipe GLOBAL.Recipe("krampus_sack", {Ingredient("cutreeds", 10),Ingredient("rope", 10),Ingredient("silk", 10)}, RECIPETABS.SURVIVAL,  TECH.SCIENCE_TWO ,nil,nil,nil,1)

end  