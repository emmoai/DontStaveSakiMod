Assets = {
	Asset("ATLAS", "images/status_bgs.xml"),
	Asset("ATLAS", "images/rain.xml"),
	Asset("ANIM", "anim/moon_waning_phases.zip"),
}

local SHOWTEMPERATURE = GetModConfigData("SHOWTEMPERATURE")
local SHOWWORLDTEMP = GetModConfigData("SHOWWORLDTEMP")
local SHOWTEMPBADGES = SHOWTEMPERATURE and SHOWWORLDTEMP and GetModConfigData("SHOWTEMPBADGES")
local SHOWMOON = GetModConfigData("SHOWMOON")
local SHOWMOONDAY = SHOWMOON > 1
local SHOWMOONDUSK = SHOWMOON > 0
local SHOWWANINGMOON = GetModConfigData("SHOWWANINGMOON")
local PREDICTMOONPHASE = GetModConfigData("PREDICTMOONPHASE")
local SHOWNEXTFULLMOON = GetModConfigData("SHOWNEXTFULLMOON")
local CELSIUS = GetModConfigData("CELSIUS")
local SEASONOPTIONS = GetModConfigData("SEASONOPTIONS")
local SHOWSEASONCLOCK = SEASONOPTIONS == 1
local COMPACTSEASONS = SEASONOPTIONS == 2

local Widget = GLOBAL.require('widgets/widget')
local Image = GLOBAL.require('widgets/image')
local Text = GLOBAL.require('widgets/text')
local PlayerBadge = GLOBAL.require("widgets/playerbadge")
local Badge = GLOBAL.require("widgets/badge")

local function BadgePostConstruct(self)
	self:SetScale(.9,.9,.9)
	
	self.bg = self:AddChild(Image("images/status_bgs.xml", "status_bgs.tex"))
	self.bg:SetScale(.4,.43,0)
	self.bg:SetPosition(-.5,-40,0)
	
	self.num:SetFont(GLOBAL.NUMBERFONT)
	self.num:SetSize(28)
	self.num:SetPosition(3.5, -40.5, 0)
	self.num:SetScale(1,.78,1)

	self.num:MoveToFront()
	self.num:Show()

	self.maxnum = self:AddChild(Text(GLOBAL.NUMBERFONT, 33))
    self.maxnum:SetPosition(6, 0, 0)
	-- self.maxnum:SetScale(1,.78,1)
	self.maxnum:MoveToFront()
    self.maxnum:Hide()
	
	local OldOnGainFocus = self.OnGainFocus
	function self:OnGainFocus()
		OldOnGainFocus(self)
		self.maxnum:Show()
	end

	local OldOnLoseFocus = self.OnLoseFocus
	function self:OnLoseFocus()
		OldOnLoseFocus(self)
		self.maxnum:Hide()
		self.num:Show()
	end
	
	-- for health/hunger/sanity
	local OldSetPercent = self.SetPercent
	if OldSetPercent then
		function self:SetPercent(val, max, ...)
			self.maxnum:SetString(tostring(math.ceil(max or 100)))
			OldSetPercent(self, val, max, ...)
		end
	end
	
	-- for moisture
	local OldSetValue = self.SetValue
	if OldSetValue then
		function self:SetValue(val, max, ...)
			self.maxnum:SetString(tostring(math.ceil(max)))
			OldSetValue(self, val, max, ...)
		end
	end
end
AddClassPostConstruct("widgets/badge", BadgePostConstruct)
AddClassPostConstruct("widgets/moisturemeter", function(self)
	BadgePostConstruct(self)
	local OldActivate = self.Activate
	self.Activate = function(self)
		self.num:Show()
		self.bg:Show()
		OldActivate(self)
	end
	local OldDeactivate = self.Deactivate
	self.Deactivate = function(self)
		self.num:Hide()
		self.bg:Hide()
		OldDeactivate(self)
	end
	self.num:Hide()
	self.bg:Hide()
end)

local controls = nil
local function ControlsPostConstruct(self)
	controls = self
	self.clock._text:SetPosition(5,0,0)
	self.clock._text:SetScale(.8,.8,0)

	if SHOWSEASONCLOCK then
		self.seasonclock = self.sidepanel:AddChild(GLOBAL.require("widgets/seasonclock")(self.owner))
		self.seasonclock:SetPosition(50, 10, 0)
		self.seasonclock:SetScale(0.8, 0.8, 0.8)
		self.clock:SetPosition(-50, 10, 0)
		self.clock:SetScale(0.8, 0.8, 0.8)
	elseif COMPACTSEASONS then
		
	end
	
	self.sidepanel:SetPosition(-100,-70,0)
	
	--fixes numbers being hidden when controller crafting is opened
	self.HideStatusNumbers = function() end	
end
AddClassPostConstruct("widgets/controls", ControlsPostConstruct)

local function StatusPostConstruct(self)
	self.brain:SetPosition(0, SHOWSEASONCLOCK and 35 or 10, 0)
	self.stomach:SetPosition(-62, 35, 0)
	self.heart:SetPosition(62, 35, 0)

	if SHOWTEMPERATURE then	
		self.temperature = self:AddChild(Badge("temperature", self.owner))
		self.inst:ListenForEvent("temperaturedelta",
			function(inst)
				local val = self.owner:GetTemperature()
				if CELSIUS then
					self.temperature.num:SetString(tostring(math.ceil(val)).."\176C")
				else
					self.temperature.num:SetString(tostring(math.ceil(1.8*(val) + 32)).."\176F")
				end
			end,
			self.owner)
		self.temperature:SetPosition(65.5,0,0)
		if SHOWTEMPBADGES then
			self.tempbadge = self:AddChild(PlayerBadge(self.owner.prefab, {80/255, 60/255, 30/255, 1}, false, 0))
			self.tempbadge:SetScale(0.35, 0.35, 1)
			self.tempbadge:SetPosition(41, -35.5, 0)
			self.temperature.bg:SetScale(.5,.43,0)
			-- self.temperature.bg:SetPosition(5,-25,0)
			self.temperature.num:SetPosition(8, -40.5, 0)
			self.temperature.num:SetScale(0.9,.7,1)
		end
	end
	
	if SHOWWORLDTEMP then
		self.worldtemp = self:AddChild(Badge("temperature", self.owner))
		self.inst:WatchWorldState("temperature",
			function(inst)
				local val = GLOBAL.TheWorld.state.temperature
				if CELSIUS then
					self.worldtemp.num:SetString(tostring(math.ceil(val)).."\176C")
				else
					self.worldtemp.num:SetString(tostring(math.ceil(1.8*(val) + 32)).."\176F")
				end
			end,
			self.owner)
		self.worldtemp:SetPosition(65.5, SHOWTEMPERATURE and -30 or 0, 0)
		if SHOWTEMPBADGES then
			self.worldtempbadge = self:AddChild(PlayerBadge(self.owner.prefab, {80/255, 60/255, 30/255, 1}, false, 0))
			self.worldtempbadge.head:SetTexture("images/rain.xml", "rain.tex")
			self.worldtempbadge.head:SetScale(.6, .6, 1)
			self.worldtempbadge:SetScale(0.35, 0.35, 1)
			self.worldtempbadge:SetPosition(41, -65.5, 0)
			self.worldtemp.bg:SetScale(.5, .43, 0)
			-- self.worldtemp.bg:SetPosition(5, -25, 0)
			self.worldtemp.num:SetPosition(8, -40.5, 0)
			self.worldtemp.num:SetScale(0.9, .7, 1)
		end
	end
	
	-- The badge anims aren't actually aligned identically, so this fixes them
	-- OCD, I know, but it was really obvious with beaverness + wetness next to each other
	self.stomach.anim:SetPosition(0, -2, 0) --move stomach down 2 pixels
	--move moisturemeter down 1 pixel
	--move beaverness up 1 pixel; this needs to be done in the AddBeaverness/SetBeaverMode functions
	
	if self.moisturemeter then
		self.moisturemeter:SetPosition(0, SHOWSEASONCLOCK and -52 or -80, 0)
		self.moisturemeter.anim:SetPosition(0, -1, 0)
	end
	
	if COMPACTSEASONS then
		self.season = self:AddChild(Badge("seasons", self.owner))
		self.season.bg:SetScale(0.6, .86, 1)
		-- self.season:SetPosition(-62, -13, 0) -- this was the position before beaverness
		local temp_nudge = SHOWTEMPERATURE and 1 or 0
		temp_nudge = temp_nudge + (SHOWWORLDTEMP and 1 or 0)
		self.season:SetPosition(65, -15 - 30*temp_nudge, 0)
		-- self.season.bg:SetPosition(-.5, -11, 0)
		self.season.num:SetScale(0.9, .7, 1)
		local season_trans = {"autumn", "winter", "spring", "summer"}
		local season_lookup = {}
		for i,v in ipairs(season_trans) do season_lookup[v] = i end
		local function UpdateText(remaining)
			if remaining == nil then
				remaining = self.season.focus
			end
			local season = GLOBAL.TheWorld.state.season
			if remaining then -- show days left until next season
				local season_i = season_lookup[season]
				local season_length = 0
				repeat
					season_i = season_i%#season_trans + 1
					season_length = GLOBAL.TheWorld.state[season_trans[season_i] .. "length"]
				until season_length > 0
				local seasonstr = GLOBAL.STRINGS.UI.SERVERLISTINGSCREEN.SEASONS[season_trans[season_i]:upper()]
				self.season.num:SetString(GLOBAL.TheWorld.state.remainingdaysinseason .. " to\n" .. seasonstr)
			else -- show current season progress
				local seasonstr = GLOBAL.STRINGS.UI.SERVERLISTINGSCREEN.SEASONS[season:upper()]
				local days = GLOBAL.TheWorld.state.elapseddaysinseason
				local total = GLOBAL.TheWorld.state[season .. "length"]
				self.season.num:SetString(days .. "/" .. total .. "\n" .. seasonstr)
			end
		end
		self.season.OnGainFocus = function() UpdateText(true) end
		self.season.OnLoseFocus = function() UpdateText(false) end
		self.inst:ListenForEvent("cycleschanged", function() UpdateText() end, GLOBAL.TheWorld)
		self.inst:ListenForEvent("seasonlengthschanged", function() UpdateText() end, GLOBAL.TheWorld)
	end
	
	local OldAddBeaverness = self.AddBeaverness
	self.AddBeaverness = function(self, ...)
		OldAddBeaverness(self, ...)
		if self.beaverness ~= nil then
			self.beaverness:SetPosition(-62, -52, 0) -- this is for human, alive
			self.beaverness.anim:SetPosition(0, 1, 0) -- animation alignment fix
		end
	end
	
	-- RemoveBeaverness never gets called... but if at some point it does, I might have issues here
	
	local OldSetBeaverMode = self.SetBeaverMode
	self.SetBeaverMode = function(self, beavermode, ...)
		OldSetBeaverMode(self, beavermode, ...)
		-- for beavermode, this should match the stomach position;
		-- otherwise, it should match the beaverness positioning for AddBeaverness above
		self.beaverness:SetPosition(-62, beavermode and 35 or -52, 0)
	end
end
AddClassPostConstruct("widgets/statusdisplays", StatusPostConstruct)

local function UIClockPostInit(self)
	GLOBAL.STRINGS.UI.HUD.WORLD_CLOCKDAY = "世界\n天数"
	self:UpdateWorldString()
	local world = GLOBAL.TheWorld
    self.inst:ListenForEvent("cycleschanged",
		function(inst, data)
			if not self._showingcycles then self:UpdateWorldString() end
		end, world)
    self.inst:ListenForEvent("clocktick",
		function(inst, data)
			if not self._showingcycles then self:UpdateWorldString() end
		end, world)
	
	function self:OnGainFocus()
		self._base.OnGainFocus(self)
		self:UpdateDayString()
		return true
	end

	function self:OnLoseFocus()
		self._base.OnLoseFocus(self)
		self:UpdateWorldString()
		return true
	end
	
	if SHOWWANINGMOON then
		self._waxing = true
	end
	
	--copied code below from components/clock.lua; make sure it stays up-to-date
	local MOON_PHASE_NAMES =
	{
		"new",
		"quarter",
		"half",
		"threequarter",
		"full",
	}
	local MOON_PHASE_LENGTHS = 
	{
		new = 1,
		quarter = 3,
		half = 3,
		threequarter = 3,
		full = 1,
	}
	local offset = 9
	-- if not ISROG then
		-- for k,_ in pairs(MOON_PHASE_LENGTHS) do
			-- MOON_PHASE_LENGTHS[k] = 2
		-- end
		-- offset = 6
	-- end
	-- end copied code from components/clock.lua
	local MOON_PHASE_SLOTS = { }
	for i = #MOON_PHASE_NAMES-1, 2, -1 do
		for x=1,MOON_PHASE_LENGTHS[MOON_PHASE_NAMES[i]] do
			table.insert(MOON_PHASE_SLOTS, MOON_PHASE_NAMES[i])
		end
	end
	for i,v in ipairs(MOON_PHASE_NAMES) do
		for x=1,MOON_PHASE_LENGTHS[v] do
			table.insert(MOON_PHASE_SLOTS, v)
		end
	end
	
	if SHOWNEXTFULLMOON then
		self._moonanim.moontext = self._moonanim:AddChild(Text(GLOBAL.NUMBERFONT, 25))
		self._moonanim.moontext:SetPosition(-83, 22, 0)
		self._moonanim.OnGainFocus = function() self._moonanim.moontext:Show() end
		self._moonanim.OnLoseFocus = function() self._moonanim.moontext:Hide() end
		local function PredictNextFullMoon()
			local today = GLOBAL.TheWorld.state.cycles
			while(MOON_PHASE_SLOTS[(today+offset)%#MOON_PHASE_SLOTS + 1] ~= "full") do
				today = today + 1
			end
			self._moonanim.moontext:SetString("" .. (today+1))
		end
		PredictNextFullMoon()
		self._moonanim.moontext:Hide()
		self.inst:WatchWorldState("isfullmoon", function(inst, fullmoon)
			print("Watching world state, isfullmoon:", fullmoon)
			if not fullmoon then
				PredictNextFullMoon()
			end
		end)
	end
	
	if SHOWMOONDUSK then
		--it sucks to have to override the whole thing, but... it hasn't changed in forever, so *shrug*
		self.OnPhaseChanged = function(self, phase)
			if PREDICTMOONPHASE then
				if phase ~= "night" then
					self:OnMoonPhaseChanged(MOON_PHASE_SLOTS[(GLOBAL.TheWorld.state.cycles+offset)%#MOON_PHASE_SLOTS + 1])
				end
			end
			
			if self._phase == phase then
				return
			end
			
			if (self._phase == "night" and not SHOWMOONDAY)
			or (self._phase == "day" and SHOWMOONDUSK) then
				self._moonanim:GetAnimState():PlayAnimation("trans_in")
			end

			if phase == "day" then
				if self._phase ~= nil then
					self._anim:GetAnimState():PlayAnimation("trans_night_day")
					self._anim:GetAnimState():PushAnimation("idle_day", true)
				else
					self._anim:GetAnimState():PlayAnimation("idle_day", true)
				end
				if SHOWMOONDAY then self:ShowMoon() end
			elseif phase == "dusk" then
				 if self._phase ~= nil then
					self._anim:GetAnimState():PlayAnimation("trans_day_dusk")
					self._anim:GetAnimState():PushAnimation("idle_dusk", true)
				else
					self._anim:GetAnimState():PlayAnimation("idle_dusk", true)
				end
				if SHOWMOONDUSK then self:ShowMoon() end
			elseif phase == "night" then
				if self._phase ~= nil then
					self._anim:GetAnimState():PlayAnimation("trans_dusk_night")
					self._anim:GetAnimState():PushAnimation("idle_night", true)
				else
					self._anim:GetAnimState():PlayAnimation("idle_night", true)
				end
				self:ShowMoon()
			end

			self._phase = phase
		end
		
		local moonphases = { new = 0, quarter = 1, half = 2, threequarter = 3, full = 4 }
		
		local OldOnMoonPhaseChanged = self.OnMoonPhaseChanged
		self.OnMoonPhaseChanged = function(self, moonphase)
			if SHOWWANINGMOON and self._moonphase ~= moonphase then
				self._waxing = moonphases[self._moonphase] == (1 - moonphases[moonphase])%5
			end
			OldOnMoonPhaseChanged(self, moonphase)
			if (SHOWMOONDUSK and self._phase == "dusk") or (SHOWMOONDAY and self._phase == "day") then
				self:ShowMoon()
			end
		end
	end
	
	if SHOWWANINGMOON then
		self.ShowMoon = function(self)
			local moon_syms =
			{
				full = "moon_full",
				quarter = "moon_quarter",
				new = "moon_new",
				threequarter = "moon_three_quarter",
				half = "moon_half",
			}
			if self._waxing then
				self._moonanim:GetAnimState():OverrideSymbol("swap_moon", "moon_phases", moon_syms[self._moonphase] or "moon_full")
			else
				self._moonanim:GetAnimState():OverrideSymbol("swap_moon", "moon_waning_phases", moon_syms[self._moonphase] or "moon_full")
			end
			if self._phase ~= nil then
				self._moonanim:GetAnimState():PlayAnimation("trans_out")
				self._moonanim:GetAnimState():PushAnimation("idle", true)
			else
				self._moonanim:GetAnimState():PlayAnimation("idle", true)
			end
		end
	end
end

AddClassPostConstruct("widgets/uiclock", UIClockPostInit)

--[[
--This may need to be rewritten if they actually add back the badge scaling
-- (it's been removed because in DST it can't be in the oneat directly)

-- WX78 Upgrade Animation Fix
local function applyupgrades(inst)

	local max_upgrades = 15
	local upgrades = math.min(inst.level, max_upgrades)

	local hunger_percent = inst.components.hunger:GetPercent()
	local health_percent = inst.components.health:GetPercent()
	local sanity_percent = inst.components.sanity:GetPercent()

	inst.components.hunger.max = math.ceil(TUNING.WX78_MIN_HUNGER + upgrades* (TUNING.WX78_MAX_HUNGER - TUNING.WX78_MIN_HUNGER)/max_upgrades)
	inst.components.health.maxhealth = math.ceil(TUNING.WX78_MIN_HEALTH + upgrades* (TUNING.WX78_MAX_HEALTH - TUNING.WX78_MIN_HEALTH)/max_upgrades)
	inst.components.sanity.max = math.ceil(TUNING.WX78_MIN_SANITY + upgrades* (TUNING.WX78_MAX_SANITY - TUNING.WX78_MIN_SANITY)/max_upgrades)

	inst.components.hunger:SetPercent(hunger_percent)
	inst.components.health:SetPercent(health_percent)
	inst.components.sanity:SetPercent(sanity_percent)
	
end

local function newoneat(inst, food)
	
	if food and food.components.edible and food.components.edible.foodtype == "GEARS" then
		inst.level = inst.level + 1
		applyupgrades(inst)	
		inst.SoundEmitter:PlaySound("dontstarve/characters/wx78/levelup")
		inst.HUD.controls.status.heart:PulseGreen()
		inst.HUD.controls.status.stomach:PulseGreen()
		inst.HUD.controls.status.brain:PulseGreen()
		
		inst.HUD.controls.status.brain:ScaleTo(1.2,.9,.7)
		inst.HUD.controls.status.heart:ScaleTo(1.2,.9,.7)
		inst.HUD.controls.status.stomach:ScaleTo(1.2,.9,.7)
	end
end

local function wx78eat(inst)
	inst.components.eater:SetOnEatFn(newoneat) --problem when joining
end

AddPrefabPostInit("wx78", wx78eat)
]]


--[[
--This may need to be looked at again if RPG HUD is added

-- Status Display Fix
local function StatusDisplayFix(self)
	function self:CloseControllerInventory()
		TheFrontEnd:GetSound():PlaySound("dontstarve/HUD/craft_close")
		self.controls:ShowStatusNumbers()
		self:ShowControllerCrafting()
		self.controls.inv:CloseControllerInventory()
	end
end

local RPGActive = 0
for _, moddir in ipairs(GLOBAL.KnownModIndex:GetModsToLoad()) do
    if GLOBAL.KnownModIndex:GetModInfo(moddir).name == "RPG HUD" then
		RPGActive = 1
    end
end

if RPGActive == 0 then
	AddClassPostConstruct("screens/playerhud", StatusDisplayFix)
end
]]