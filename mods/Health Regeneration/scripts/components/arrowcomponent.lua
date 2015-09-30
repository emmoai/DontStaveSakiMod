local HealthWidget	= require "widgets/healtharrow"
local Text 			= require "widgets/text"

local function OnHealthRateDirty(inst)
    inst.components.arrowcomponent.healthrate = inst.components.arrowcomponent.net_healthrate:value()
end

--[[
Based on Broken Valkyrie's Mod
--]]


local ArrowComponent = Class(function(self, inst)
	self.inst = inst
--Net variable data
	self.healthrate = 0.0
	self.net_healthrate = net_ushortint(self.inst.GUID, "healthrate", "healthratedirty" )
--Host side only
	if TheWorld.ismastersim then
		-- components
		self.health = self.inst.components.health
		self.hunger = self.inst.components.hunger
		self.sanity = self.inst.components.sanity
		-- variable
		--Calculate the Rate
		self.previoushealth = 0.0
		self.healthdifference = 0.0
		
	else
--Client side only, listen for these data changes
		self.inst:ListenForEvent("healthratedirty", OnHealthRateDirty)
	end
	
	--Flag for HUD is created, its flagged at true at the start to prevent duplicate, as a caller will set this flag to false once.
	self.HUD = true
	self.EnableHealthWidget = false
	self.HealthArrowPresent = false
	
	-- update
	self.inst:StartUpdatingComponent(self)
	
	print("Regeneration arrow component active")
end)

--Straight from player classified, make sure we don't enter out of bound number to net variable.
function ArrowComponent:SetValue(name, value)
    assert(value >= 0 and value <= 65535, "Player "..tostring(name).." out of range: "..tostring(value))
    self[name]:set(math.ceil(value))
end

--Credit to rezecib for lending his code which helped with the decimal storage.

function ArrowComponent:GetHealthRate()
	if TheWorld.ismastersim then
		return self.healthdifference
	elseif self.healthrate ~= nil then
		return (self.healthrate/10000)
	else
		return 0
	end
end

function ArrowComponent:SetHealthRate()
		local health = self.inst.components.health.currenthealth
		self.healthdifference = health - self.previoushealth
		local rate
		local negative = self.healthdifference < 0
		if self.healthdifference >= 2 then
			self:SetValue("net_healthrate", 20000)
		elseif self.healthdifference <= -2 then
			self:SetValue("net_healthrate", 40000)
		else
			rate = math.floor(math.abs(self.healthdifference) * 10000 + 0.5)
			self:SetValue("net_healthrate", negative and rate + 20000 or rate )
		end
		self.previoushealth = health
end

--Create the widget
function ArrowComponent:CreateWidget()
	if not self.HUD then
		for k,v in pairs(ThePlayer.HUD.controls.status.children) do
			if tostring(k) == "HealthArrow" then
				self.HealthArrowPresent = true
				self.healtharrow = k
			end
		end
	
		if self.EnableHealthWidget and not self.HealthArrowPresent then
			self.healtharrow = ThePlayer.HUD.controls.status:AddChild(HealthWidget())
			self.healtharrow:SetPosition(40,20,0)
			print("health arrow widget added")
		end
		
		self.HUD = true
		--[[ Debugging scree uncomment or un bracket to enable.
		self.debug = ThePlayer.HUD.overlayroot:AddChild( Text(UIFONT, 30) )
		self.debug:SetVAnchor(ANCHOR_TOP)
        self.debug:SetHAnchor(ANCHOR_MIDDLE)
        self.debug:SetPosition(0, -45)
        self.debug:SetString("test")
		--]]
		--[[
		self.HUD = true
		self.debug2 = ThePlayer.HUD.overlayroot:AddChild( Text(UIFONT, 30) )
		self.debug2:SetVAnchor(ANCHOR_TOP)
        self.debug2:SetHAnchor(ANCHOR_MIDDLE)
        self.debug2:SetPosition(0, -90)
        self.debug2:SetString("test")
		self.previousdecimal = 0.0
		--]]
	end
end

function ArrowComponent:SetFlag(healthflag)
		self.EnableHealthWidget = healthflag
		self.HUD = false
end


function ArrowComponent:OnUpdate(dt)

	--Make sure the Player is initialise and widget is created once.
	if ThePlayer ~= nil and self.HUD == false then
		self:CreateWidget()
	end

	--host function only
	if TheWorld.ismastersim then
		--Update the decimal values
		self:SetHealthRate()
	end
--Update those widget
	if self.EnableHealthWidget and self.HUD then
		self.healtharrow:UpdateHealth(self:GetHealthRate())
	end
	
end



return ArrowComponent