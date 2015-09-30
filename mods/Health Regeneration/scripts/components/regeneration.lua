local HealthRegeneration = Class(function(self, player)
	self.player = player
	self.health = player.components.health
	self.hunger = player.components.hunger
	self.sanity = player.components.sanity
	player:StartUpdatingComponent(self)
end)

function HealthRegeneration:OnUpdate(delta)
	if self.health:IsDead()  or self.health:GetPercent() >= 1 then
		return
	end

	if (not self.hunger or self.hunger:GetPercent() >= REQUIRED_HUNGER_PERCENT) and (not self.sanity or self.sanity:GetPercent() >= REQUIRED_SANITY_PERCENT) then
		--Regenerate Health
		self.health:DoDelta(delta/REGENERATION_RATE, true, "HealthRegeneration", false)
		if HUNGER_DRAIN_ENABLED and self.hunger then
			--Drain Hunger
			self.hunger:DoDelta(delta/(REGENERATION_RATE / HUNGER_DRAIN_RATE), true, false)
		end
	end
end

--Set the Config Data
function HealthRegeneration:SetData(required_hunger, required_sanity, regen_rate, hunger_drain_rate)
	REQUIRED_HUNGER_PERCENT = required_hunger
	REQUIRED_SANITY_PERCENT = required_sanity
	REGENERATION_RATE = regen_rate
	HUNGER_DRAIN_RATE = hunger_drain_rate
	HUNGER_DRAIN_ENABLED = HUNGER_DRAIN_RATE == not 0
end

--Default Values
REQUIRED_HUNGER_PERCENT = 0.66
REQUIRED_SANITY_PERCENT = 0.25
REGENERATION_RATE = 32
HUNGER_DRAIN_RATE = 1.2
HUNGER_DRAIN_ENABLED = true

return HealthRegeneration

