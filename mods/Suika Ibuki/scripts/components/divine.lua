local Divine = Class(function(self, inst)
    self.inst = inst

    inst:AddTag("divine")
end)

function Divine:OnRemoveFromEntity()
    self.inst:RemoveTag("divine")
end

function Divine:Read(card)
	if card.components.spellcard then
		if card.components.spellcard:OnRead(self.inst) then
			if card.components.finiteuses then
				card.components.finiteuses:Use(1)
			end
			return true
		end		
	end
end

return Divine