local CloneCracker = Class(function(self, inst)
	self.inst = inst

	inst:StartUpdatingComponent(self)
	
	inst:ListenForEvent("oneatsomething", function(inst, data) 
		if data.food and data.food.components.edible then
			if data.food.components.perishable and not data.food.components.perishable:IsFresh() then
				if data.food.components.perishable:IsStale() then
					inst.components.talker:Say("GAO 不高兴")
				elseif data.food.components.perishable:IsSpoiled() then
					inst.components.talker:Say("GAO 讨厌")
				end
			end
		end
	end)
	
	inst:WatchWorldState("startdusk", function()
		inst.components.talker:Say("GAO 再见 太阳")
	end)

	inst:ListenForEvent("torchranout", function(inst, data)
		inst.components.talker:Say("GAO 火炬")
	end)
end)

function CloneCracker:InCooldown()
	if self.lastcommenttime then
		local time_since_comment = GetTime() - self.lastcommenttime
		if time_since_comment < 30 then
			return true
		end
	end
	return false
end

function CloneCracker:OnUpdate()
	if not self:InCooldown() then
		local currenthealth = self.inst.components.health.currenthealth / self.inst.components.health.maxhealth	
		if currenthealth < 0.6 then
			if currenthealth < 0.1 then
				self.inst.components.talker:Say("GAO 好累")
			else
				self.inst.components.talker:Say("GAO 饿了")
			end
			self.lastcommenttime = GetTime()
			self.inst.AnimState:PlayAnimation("hungry")
		end
	end
end

return CloneCracker
