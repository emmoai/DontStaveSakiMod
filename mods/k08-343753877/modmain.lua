modimport("announcestrings.lua")

for k,v in pairs(ANNOUNCE_STRINGS) do
	if k ~= "UNKNOWN" and not GetModConfigData(k) then
		ANNOUNCE_STRINGS[k] = ANNOUNCE_STRINGS.UNKNOWN
	end
end

local WHISPER = GetModConfigData("WHISPER")
local EXPLICIT = GetModConfigData("EXPLICIT")

local percentlookup = 
{
	Health = 		{	1,		0.75,	0.5,	0.25	},
	["Log Meter"] = {	0.9,	0.7,	0.5,	0.25	},
	default = 		{	0.75,	0.55,	0.35,	0.15	},
}

local function GetPercentMessage(stat, MESSAGES, percent)
	local thresholds = percentlookup[stat] or percentlookup.default
	if percent >= thresholds[1] then
		return MESSAGES.FULL
	elseif percent >= thresholds[2] then
		return MESSAGES.HIGH
	elseif percent >= thresholds[3] then
		return MESSAGES.MID
	elseif percent >= thresholds[4] then
		return MESSAGES.LOW
	else
		return MESSAGES.EMPTY
	end
end
	
local function ChooseMessage(CHAR_MESSAGES, stat, cur, max)
	local percent = cur/max
	local thresholds = percentlookup[stat] or percentlookup.default
	if GLOBAL.ThePlayer.isbeavermode then
		CHAR_MESSAGES = CHAR_MESSAGES[GLOBAL.ThePlayer.isbeavermode:value() and 2 or 1]
	end
	local STAT_MESSAGES = CHAR_MESSAGES[stat:upper()]
	local message = GetPercentMessage(stat, STAT_MESSAGES, cur/max)
	if EXPLICIT then
		return string.format("(%s: %d/%d) %s", stat, cur, max, message)
	else
		return message
	end
end

local function Announce(message, whisper)
	GLOBAL.TheNet:Say(GLOBAL.STRINGS.LMB .. " " .. message, WHISPER ~= whisper)
end

local function PlayerHUDPostInit(self)
	local CHAR_MESSAGES = ANNOUNCE_STRINGS[GLOBAL.ThePlayer.prefab:upper()]
	if not CHAR_MESSAGES then CHAR_MESSAGES = ANNOUNCE_STRINGS.UNKNOWN end
	
	local OldOnMouseButton = self.OnMouseButton
	function self:OnMouseButton(button, down, ...)
		if button == 1000 and down and GLOBAL.TheInput:IsControlPressed(GLOBAL.CONTROL_FORCE_INSPECT) then
			local status = self.controls.status
			local whisper = GLOBAL.TheInput:IsKeyDown(GLOBAL.KEY_CTRL)
			if status.heart.focus then
				-- Announcement of health state
				Announce(ChooseMessage(
					CHAR_MESSAGES,
					"Health",
					GLOBAL.ThePlayer.player_classified.currenthealth:value(),
					GLOBAL.ThePlayer.player_classified.maxhealth:value(),
					true), whisper)
			elseif status.brain.focus then
				-- Announcement of sanity state
				Announce(ChooseMessage(
					CHAR_MESSAGES,
					"Sanity",
					GLOBAL.ThePlayer.player_classified.currentsanity:value(),
					GLOBAL.ThePlayer.player_classified.maxsanity:value()
					), whisper)
			elseif status.stomach.focus then
				-- Announcement of hunger state
				Announce(ChooseMessage(
					CHAR_MESSAGES,
					"Hunger",
					GLOBAL.ThePlayer.player_classified.currenthunger:value(),
					GLOBAL.ThePlayer.player_classified.maxhunger:value()
					), whisper)
			elseif status.moisturemeter.focus then
				-- Announcement of wetness state
				Announce(ChooseMessage(
					CHAR_MESSAGES,
					"Wetness",
					GLOBAL.ThePlayer.player_classified.moisture:value(),
					GLOBAL.ThePlayer.player_classified.maxmoisture:value()
					), whisper)
			elseif type(status.beaverness) == "table" and status.beaverness.focus then
				-- Announcement of beaverness state
				Announce(ChooseMessage(
					CHAR_MESSAGES,
					"Log Meter", -- need to use a display name for the Explicit setting
					GLOBAL.ThePlayer.player_classified.currentbeaverness:value(),
					100 -- looks like the only way is to hardcode this
					), whisper)
			elseif GLOBAL.TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
				-- Announcements of inventory items you have
				local active = nil
				for i,v in ipairs(self.controls.inv.inv) do
					if v.focus then active = v end
				end
				local pack = true
				local container = nil
				local containerName = nil
				for j,w in pairs(self.controls.containers) do
					if w.container then
						for k,v in pairs(w.inv) do
							if v.focus then
								active = v
								pack = v and v.container and v.container.type == "pack"
								if not pack then container = v.container end
								containerName = w.container.name:lower()
							end
						end
					end
				end
				if active ~= nil and active.tile ~= nil then
					local name = active.tile.item.name:lower()
					local has, num_found = self.owner.replica.inventory:Has(active.tile.item.prefab, 1)
					-- local quant = nil
					local prestring = ""
					local poststring = "."
					if pack then -- this is a backpack or inventory
						prestring = "我有 "
					else -- this is a chest
						has, num_found = container:Has(active.tile.item.prefab, 1)
						-- if active.tile.quantity ~= nil then quant = active.tile.quantity.string end
						-- if quant ~= nil then plural = quant:match("^1$") == nil end
						prestring = "我们有<"
						poststring = ">在<" .. containerName .. ">里."
					end
					local quant = "" .. num_found
					local plural = num_found > 1
					local a = "a"
					if string.find(name, "^[aeoiuAOIEU]") ~= nil then a = "an" end
					local s = ""
					if (not plural) or string.find(name, "s$") ~= nil then
						s = ""
					end
					if quant == nil then quant = a end
					Announce(prestring..quant.." "..name..s..poststring, whisper)
				end
			end
		end
		if type(OldOnMouseButton) == "function" then
			OldOnMouseButton(self, button, down, ...)
		end
	end
end
AddClassPostConstruct("screens/playerhud", PlayerHUDPostInit)

local function CraftSlotPostInit(self)
	local OldOnControl = self.OnControl
	function self:OnControl(control, down)
		if down and control == GLOBAL.CONTROL_ACCEPT
			and GLOBAL.TheInput:IsControlPressed(GLOBAL.CONTROL_FORCE_INSPECT)
			and self.owner and self.recipe then
			local ingredient = nil
			for i, ing in ipairs(self.recipepopup.ing) do
				if ing.focus then ingredient = ing end
			end
			
			local builder = self.owner.replica.builder
			local buffered = builder:IsBuildBuffered(self.recipe.name)
			local knows = builder:KnowsRecipe(self.recipe.name)
			local can_build = builder:CanBuild(self.recipe.name)
			local whisper = GLOBAL.TheInput:IsKeyDown(GLOBAL.KEY_CTRL)
			local name = GLOBAL.STRINGS.NAMES[self.recipe.name:upper()]:lower()
			local a = "a"
			if string.find(name, "^[aeoiuAOIEU]") ~= nil then a = "an" end
			local s = "s"
			if ((not ingredient) and (string.find(name, "s$") ~= nil))
				or (ingredient and (string.find(ingredient.tooltip:lower(), "s$") ~= nil)) then
				s = ""
			end
			if ingredient == nil then
				if buffered then
					Announce("I have "..a.." "..name.." pre-built and ready to place.", whisper)
				elseif knows and can_build then
					Announce("我可以制作<"..name..">.", whisper)
				elseif not knows then
					Announce("谁帮我做个<"..name..">?", whisper)
				else
					Announce("我们需要制作<"..name..">.", whisper)
				end
			else
				local num = 0
				local ingname = ingredient.ing.texture:sub(1,-5)
				local amount = 1
				for k,v in pairs(self.recipe.ingredients) do
					if ingname == v.type then amount = v.amount end
				end
				local has, num_found = self.owner.replica.inventory:Has(ingname, GLOBAL.RoundBiasedUp(amount * self.owner.replica.builder:IngredientMod()))
				num = amount - num_found
				if num == 1 then s = "" end
				if num > 0 then
					Announce("我需要"..num.."个<"..ingredient.tooltip:lower()..">制作<"..name..">.", whisper)
				else
					Announce("我有足够的<"..ingredient.tooltip:lower()..">制作<"..name..">.", whisper) 
				end
			end
		elseif not GLOBAL.TheInput:IsControlPressed(GLOBAL.CONTROL_FORCE_INSPECT) then
			OldOnControl(self, control, down)
		end
	end
end
AddClassPostConstruct("widgets/craftslot", CraftSlotPostInit)

local function InvSlotPostInit(self)
	local OldOnControl = self.OnControl
	function self:OnControl(control, down)
		if down and control == GLOBAL.CONTROL_ACCEPT
			and GLOBAL.TheInput:IsControlPressed(GLOBAL.CONTROL_FORCE_INSPECT)
			and GLOBAL.TheInput:IsKeyDown(GLOBAL.KEY_SHIFT) then
		else
			return OldOnControl(self, control, down)
		end
	end
end
AddClassPostConstruct("widgets/invslot", InvSlotPostInit)