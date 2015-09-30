local PREDICT = GLOBAL.Action(-1,false,true)
PREDICT.str = "Predict"
PREDICT.id = "PREDICT"
PREDICT.fn = function(act)
	if act.target:HasTag("SMARTERCROCKPOT") then
		item ,odds= act.target.components.predicter:Predict(act)
	end
end

AddAction(PREDICT)
AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(PREDICT, "doshortaction"))

