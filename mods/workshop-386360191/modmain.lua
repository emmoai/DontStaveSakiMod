STRINGS = GLOBAL.STRINGS
RECIPETABS = GLOBAL.RECIPETABS
Recipe = GLOBAL.Recipe
Ingredient = GLOBAL.Ingredient
TECH = GLOBAL.TECH


table.insert(GLOBAL.STRINGS, "DFV_LANG")

local DFV_LANG = GetModConfigData("easy_crafting")

if DFV_LANG == "ea" then
 local chesterrecipe GLOBAL.Recipe("panflute",  {Ingredient("boards", 1), Ingredient("rope", 2)}, RECIPETABS.MAGIC, TECH.MAGIC_TWO ,nil,nil,nil,1)

elseif DFV_LANG == "hr" then
 local chesterrecipe GLOBAL.Recipe("panflute",  {Ingredient("boards", 3), Ingredient("rope", 6), Ingredient("sewing_kit", 2)}, RECIPETABS.MAGIC, TECH.MAGIC_TWO ,nil,nil,nil,1)

else
 local chesterrecipe GLOBAL.Recipe("panflute",  {Ingredient("boards", 1), Ingredient("rope", 2), Ingredient("sewing_kit", 1)}, RECIPETABS.MAGIC, TECH.MAGIC_TWO ,nil,nil,nil,1)

end

local mound_drop=is_drop==3 and {
	{"panflute", chance_drop},
	{"spidereggsack", 0.05},
	{"cane", 0.05},
	{"amulet", 0.1},
	{"sewing_kit", 0.1},
	{"boomerang", 0.1},
	{"lantern", 0.15},
	{"pitchfork", 0.05},
	{"blowdart_pipe", 0.05},
	{"heatrock", 0.05},
	{"axe", 0.10},
	{"razor", 0.10}
}