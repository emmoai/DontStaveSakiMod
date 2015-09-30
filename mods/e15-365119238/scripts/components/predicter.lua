local InvSlot = require "widgets/invslot"
local UtilSlot = require "widgets/utilslot"--mod
local Widget = require "widgets/widget"
local Text = require "widgets/text"
local UIAnim = require "widgets/uianim"
local ImageButton = require "widgets/imagebutton"
local ItemTile = require "widgets/itemtile"
local cooking = require "cooking"
local ContainerWidget = require("widgets/containerwidget")


local Predicter= Class(function(self, inst)
    self.inst = inst
	
    self.prediction_odds = 1
    self.net_prediction_odds = net_float(self.inst.GUID,"prediction_odds","prediction_odds_changed")

    self.prediction_item = nil
    self.net_prediction_item = net_entity(self.inst.GUID,"prediction_item","prediction_item_changed")

    
    if not TheWorld.ismastersim then
        self.prediction_odds_changed_fn = function(inst, data) self:On_prediction_odds_changed(data) end   
        self.prediction_item_changed_fn = function(inst, data) self:On_prediction_item_changed(data) end
        self.inst:ListenForEvent("prediction_odds_changed", self.prediction_odds_changed_fn )
        self.inst:ListenForEvent("prediction_item_changed", self.prediction_item_changed_fn )
    end
    
end)

function Predicter:On_prediction_item_changed(data)
    local prefab = self.inst
    self.prediction_item = self.net_prediction_item:value()
    if self.prediction_odds then
        prefab:PushEvent("prediction", {item = self.prediction_item,odds = self.prediction_odds})
    end
    
end


function Predicter:On_prediction_odds_changed(data)
    local prefab = self.inst
    self.prediction_odds = (self.net_prediction_odds:value())  
    if self.prediction_item then
        prefab:PushEvent("prediction", {item = self.prediction_item,odds = self.prediction_odds})
    end
end


local aliases=
{
	cookedsmallmeat = "smallmeat_cooked",
	cookedmonstermeat = "monstermeat_cooked",
	cookedmeat = "meat_cooked"
}

local null_ingredient = {tags={}}
local function GetIngredientData(prefabname)
	local name = aliases.prefabname or prefabname

	return cooking.ingredients[name] or null_ingredient
end


local function GetIngredientValues(prefablist)
	local prefabs = {}
	local tags = {}
	for k,v in pairs(prefablist) do
		local name = aliases[v] or v
		prefabs[name] = prefabs[name] and prefabs[name] + 1 or 1
		local data = GetIngredientData(name)

		if data then

			for kk, vv in pairs(data.tags) do

				tags[kk] = tags[kk] and tags[kk] + vv or vv
			end
		end
	end

	return {tags = tags, names = prefabs}
end


local function GetCandidateRecipes(cooker, ingdata)
	
	local recipes = cooking.recipes["cookpot"] or {}
	local candidates = {}

	--find all potentially valid recipes
	for k,v in pairs(recipes) do
		if v.test(cooker, ingdata.names, ingdata.tags) then
			table.insert(candidates, v)
		end
	end
	table.sort( candidates, function(a,b) return (a.priority or 0) > (b.priority or 0) end )
	if #candidates > 0 then
		--find the set of highest priority recipes
		local top_candidates = {}
		local idx = 1
		local val = candidates[1].priority or 0

		for k,v in ipairs(candidates) do
			if k > 1 and (v.priority or 0) < val then
				break
			end
			table.insert(top_candidates, v)
		end
		return top_candidates
	end

	return candidates
end

--original mod functions start here
function PredictRecipes(cooker,names)		
	local ingdata = GetIngredientValues(names)
	local candidates = GetCandidateRecipes(cooker, ingdata)
	table.sort( candidates, function(a,b) return (a.weight or 1) > (b.weight or 1) end )
	return candidates
end

local function PredictMany(prefab)
	local ings = {}	
	for k,v in pairs (prefab.components.container.slots) do
		table.insert(ings, v.prefab)
	end
	local results=PredictRecipes(prefab,ings)
	return results
end			


local function getWeightPercent(Recipes, index)
	local total=0
	for k,v in pairs(Recipes) do
		total = total + (v.weight or 1)
	end
	local fraction=(Recipes[index].weight or 1)/total
	local Perc=fraction
	return Perc
end

function getSpoilage(prefab)
	local spoilage_total = 0
	local spoilage_n = 0
	for k,v in pairs (prefab.components.container.slots) do
		if  v.components and v.components.perishable then
		spoilage_n = spoilage_n + 1
		spoilage_total = spoilage_total + v.components.perishable:GetPercent()
		end
	end	
	local spoilage = 1
	if spoilage_total > 0 then
		spoilage = spoilage_total / spoilage_n
		spoilage = 1 - (1 - spoilage)*.5
	end
	return spoilage
end


function Predicter:Predict(act)
    local prefab = self.inst
	self.PredictedProducts=PredictMany(prefab)
	if self.DisplayIndexForRecipes and self.PredictedProducts[self.DisplayIndexForRecipes+1] then
		self.DisplayIndexForRecipes=self.DisplayIndexForRecipes+1
	else 
		self.DisplayIndexForRecipes=1
	end 
    local chance=getWeightPercent(self.PredictedProducts,self.DisplayIndexForRecipes)
    self.prediction_odds = chance
    self.net_prediction_odds:set(self.prediction_odds)
	
    local loot=SpawnPrefab(self.PredictedProducts[self.DisplayIndexForRecipes].name)
	if loot and loot.components.perishable then
		loot.components.perishable:SetPercent(getSpoilage(prefab))
	end	
    loot.components.inventoryitem:OnPutInInventory(prefab)
    local data = {item = loot,odds = chance}
    
    
    prefab:PushEvent("prediction", data)
    
    
    self.prediction_item = loot
    self.net_prediction_item:set(self.prediction_item)
    
    
    
    return loot,chance
end


-- function Predicter:CollectSceneActions(doer, actions, right)

	-- if (self.inst:HasTag("SMARTERCROCKPOT")) then
		-- if self.inst.components.stewer and self.inst.components.stewer:CanCook() then
			-- if (self.inst.components.container and self.inst.components.container:IsOpen()) then 
                -- if (STRINGS.SmarterCrockPotInterface ~= "Close Always") then
                    -- if ((STRINGS.SmarterCrockPotInterface == "Predict Always")or (not self.inst:HasTag("PREDICTED"))) then
                        -- table.insert(actions, ACTIONS.PREDICT)
                        -- return
                    -- end
                -- end
            -- end
        -- end
    -- end
-- end



return Predicter