--------------------------------------------------------------------------
--[[ Dependencies ]]
--------------------------------------------------------------------------

local Widget = require "widgets/widget"
local Image = require "widgets/image"
local Text = require "widgets/text"
local UIAnim = require "widgets/uianim"

--------------------------------------------------------------------------
--[[ Constants ]]
--------------------------------------------------------------------------

local NUM_SEGS = 32
local COLOURS = 
{
	AUTUMN = Vector3(205 / 255, 79 / 255, 57 / 255),
	WINTER = Vector3(149 / 255, 191 / 255, 242 / 255),
	SPRING = Vector3(84 / 168, 200 / 255, 84 / 255),
	SUMMER = Vector3(255 / 255, 206 / 255, 139 / 255),
}
local DARKEN_PERCENT = .75

--------------------------------------------------------------------------
--[[ Constructor ]]
--------------------------------------------------------------------------

local SeasonClock = Class(Widget, function(self)
    Widget._ctor(self, "SeasonClock")

    --Member variables
    self._moonanim = nil
    self._anim = nil
    self._face = nil
    self._segs = {}
    self._rim = nil
    self._hands = nil
    self._text = nil
    self._showingseasons = nil
    self._cycles = nil
    self._phase = nil
    self._moonphase = nil
    self._time = nil

    local basescale = 1
    self:SetScale(basescale, basescale, basescale)
    self:SetPosition(0, 0, 0)

    local animscale = 1
    self._anim = self:AddChild(UIAnim())
    self._anim:SetScale(animscale, animscale, animscale)
    self._anim:GetAnimState():SetBank("clock01")
    self._anim:GetAnimState():SetBuild("clock_transitions")
    self._anim:GetAnimState():PlayAnimation("idle_day", true)

    self._face = self:AddChild(Image("images/hud.xml", "clock_NIGHT.tex"))
    self._face:SetClickable(false)

	-- build each segment on the clock and set its rotation and position
    local segscale = .4
    for i = NUM_SEGS, 1, -1 do
        local seg = self:AddChild(Image("images/hud.xml", "clock_wedge.tex"))
        seg:SetScale((i == 1 and 0.5 or 1)*segscale, segscale, segscale)
        seg:SetHRegPoint(ANCHOR_LEFT)
        seg:SetVRegPoint(ANCHOR_BOTTOM)
        seg:SetRotation((i - (i == 1 and 1 or 2)) * (360 / NUM_SEGS))
        seg:SetClickable(false)
        self._segs[i] = seg
    end

    self._rim = self:AddChild(Image("images/hud.xml", "clock_rim.tex"))
    self._rim:SetClickable(false)

    self._hands = self:AddChild(Image("images/hud.xml", "clock_hand.tex"))
    self._hands:SetClickable(false)

    self._text = self:AddChild(Text(BODYTEXTFONT, 33 / basescale))
    self._text:SetPosition(5, 0 / basescale, 0)

    --Default initialization
    self:UpdateSeasonString()
	local seasons = { "autumn", "winter", "spring", "summer" }
	local lengths = {}
	for i,v in ipairs(seasons) do
		lengths[v] = TheWorld.state[v .. "length"] or TUNING[v:upper() .. "_LENGTH"]
	end
    self:OnSeasonLengthsChanged(lengths)

    --Register events
    self.inst:ListenForEvent("cycleschanged", function(inst, data) self:OnCyclesChanged(data) end, TheWorld)
    self.inst:ListenForEvent("seasonlengthschanged", function(inst, data) self:OnSeasonLengthsChanged(data) end, TheWorld)
    self.inst:ListenForEvent("phasechanged", function(inst, data) self:OnPhaseChanged(data) end, TheWorld)
end)

--------------------------------------------------------------------------
--[[ Member functions ]]
--------------------------------------------------------------------------

function SeasonClock:UpdateSeasonString()
	self._text:SetString(STRINGS.UI.SERVERLISTINGSCREEN.SEASONS[TheWorld.state.season:upper()])
    self._showingseasons = true
end

function SeasonClock:UpdateRemainingString()
    self._text:SetString(TheWorld.state.remainingdaysinseason .. "Ìì\nºó")
    self._showingseasons = false
end

--------------------------------------------------------------------------
--[[ Event handlers ]]
--------------------------------------------------------------------------

function SeasonClock:OnGainFocus()
    SeasonClock._base.OnGainFocus(self)
    self:UpdateRemainingString()
    return true
end

function SeasonClock:OnLoseFocus()
    SeasonClock._base.OnLoseFocus(self)
    self:UpdateSeasonString()
    return true
end

function SeasonClock:OnSeasonLengthsChanged(data)
	local lengths = {}
	local total = 0
	for k,v in pairs(data) do
		total = total + v
	end
	local multiplier = NUM_SEGS/total
	local residuals = {}
	total = 0
	for k,v in pairs(data) do
		local length = v*multiplier
		lengths[k] = math.floor(length)
		total = total + lengths[k]
		table.insert(residuals, {residual = length%1, season = k})
	end
	table.sort(residuals, function(a,b) return a.residual > b.residual end)
	local r = 1
	while total < NUM_SEGS do
		lengths[residuals[r].season] = lengths[residuals[r].season] + 1
		total = total + 1
		r = r + 1
	end
	self.seasonsegments = lengths

    local dark = true
	local seasons = {"autumn", "winter", "spring", "summer"}
	self.seasons = seasons
	local season = 1
	local runningtotal = 0
    for i, seg in ipairs(self._segs) do
		if i - runningtotal > lengths[seasons[season]] then
			season = season + 1
			runningtotal = i - 1
		end
		
		seg:Show()

		local color = COLOURS[seasons[season]:upper()]
		if dark then
			color = color * DARKEN_PERCENT
		end
		dark = not dark

		seg:SetTint(color.x, color.y, color.z, 1)
    end
end

function SeasonClock:OnCyclesChanged()
	local progress = 0
	local i = 1
	while TheWorld.state.season ~= self.seasons[i] do
		progress = progress + self.seasonsegments[self.seasons[i]]
		i = i + 1
	end
	local segments = self.seasonsegments[TheWorld.state.season]
	progress = progress + segments*TheWorld.state.elapseddaysinseason/TheWorld.state[TheWorld.state.season .. "length"]
	progress = progress / NUM_SEGS
	self._hands:SetRotation(progress*360)
    if self._showingseasons then
        self:UpdateSeasonString()
	else
		self:UpdateRemainingString()
    end
end

function SeasonClock:OnPhaseChanged(phase)
	if self._phase ~= nil and self._phase ~= phase then
		self._anim:GetAnimState():PlayAnimation("trans_" .. self._phase .. "_" .. phase)
		self._anim:GetAnimState():PushAnimation("idle_" .. phase, true)
	else
		self._anim:GetAnimState():PlayAnimation("idle_" .. phase, true)
	end
	-- they had so much unecessary code before...

    self._phase = phase
end

--------------------------------------------------------------------------
--[[ End ]]
--------------------------------------------------------------------------

return SeasonClock