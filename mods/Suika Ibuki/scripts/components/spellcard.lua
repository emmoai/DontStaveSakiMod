local Spellcard = Class(function(self, inst)
    self.inst = inst
end)

function Spellcard:OnRead(reader)
    if self.onread then
        return self.onread(self.inst, reader)
    end

    return true
end

return Spellcard