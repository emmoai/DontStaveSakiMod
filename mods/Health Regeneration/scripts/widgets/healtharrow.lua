local Widget = require "widgets/widget"
local UIAnim = require "widgets/uianim"
--arrow_loop_increase_most
--arrow_loop_increase_more
--arrow_loop_increase

--[[
Based on Broken Valkyrie's Mod
--]]

local HealthArrow = Class(Widget, function(self)
	Widget._ctor(self, "HealthArrow")
	self.sanityarrow = self:AddChild(UIAnim())
	self.sanityarrow:GetAnimState():SetBank("sanity_arrow")
	self.sanityarrow:GetAnimState():SetBuild("sanity_arrow")
	self.sanityarrow:GetAnimState():PlayAnimation("neutral")
	self.sanityarrow:SetClickable(false)
	self.owner = ThePlayer
	self.anim = "neutral"

end)

function HealthArrow:UpdateHealth(healthrate)
	local rate = healthrate
	if rate > 0 then
		if rate > .015 then
			self.anim = "arrow_loop_increase_most"
		elseif rate > .075 then
			self.anim = "arrow_loop_increase_more"
		else
			self.anim = "arrow_loop_increase"
		end
	else
		self.anim = "neutral"
	end
	
	--Hide the widget as ghost.
	if self.owner:HasTag("playerghost") then
		self.anim = "neutral"
	end
	
	--The purpose of this is to switch the animation state.
	if self.arrowdir ~= self.anim then
		self.arrowdir = self.anim
		self.sanityarrow:GetAnimState():PlayAnimation(self.anim, true)
	end
end


return HealthArrow