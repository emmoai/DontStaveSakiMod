local require = GLOBAL.require;
--[[
Thanks to Broken Valkyrie for his widget code!
--]]

local REQUIRED_HUNGER_PERCENT = GetModConfigData("REQUIRED_HUNGER_PRECENT")
local REQUIRED_SANITY_PERCENT = GetModConfigData("REQUIRED_SANITY_PERCENT")
local REGENERATION_RATE = GetModConfigData("REGENERATION_RATE")
local HUNGER_DRAIN_RATE = GetModConfigData("HUNGER_DRAIN_RATE")
local WIDGET_ENABLED = GetModConfigData("WIDGET_ENABLED") == 1

local function AddRegenComponent(inst) 
	--dont add it to fake players!
	if(inst.name == "unknown") then 
		return inst
	end

	if not inst.components.regeneration then
		inst:AddComponent("regeneration")
		inst.components.regeneration:SetData(REQUIRED_HUNGER_PERCENT, REQUIRED_SANITY_PERCENT, REGENERATION_RATE, HUNGER_DRAIN_RATE)
	end
	return inst
end

local function AddArrowComponent(inst) 
	--dont add it to fake players!
	if(inst.name == "unknown") then 
		return inst
	end

	if not inst.components.arrowcomponent then
		inst:AddComponent("arrowcomponent")
		inst.components.arrowcomponent:SetFlag(WIDGET_ENABLED)
	end
	return inst
end


--Add the Server Components
if GLOBAL.TheNet:GetIsServer() then
	AddPlayerPostInit(AddRegenComponent)
end

--Add the Client Components
AddPlayerPostInit(AddArrowComponent)

--remove arrow?
if WIDGET_ENABLED then
	AddClassPostConstruct( "widgets/statusdisplays", function(self)
		local statusdisplay = self
		statusdisplay.brain.sanityarrow:GetAnimState():SetBank("")
		statusdisplay.brain.sanityarrow:GetAnimState():SetBuild("")
	end)
end
