local CharacterSpecific = Class(function(self, inst)
    self.inst = inst

    self.character = nil
    self.storable = false
    self.comment = "我也许应该静静地离开."
end)

function CharacterSpecific:CanPickUp(doer)
    if doer and doer.prefab ~= self.character then
        return false
    end

    return true
end

function CharacterSpecific:SetOwner(brs)
    self.character = brs
end

function CharacterSpecific:IsStorable()
    return self.storable
end

function CharacterSpecific:SetStorable(value)
    self.storable = value
end

function CharacterSpecific:GetComment()
    return self.comment
end

function CharacterSpecific:SetComment(comment)
    self.comment = comment
end

return CharacterSpecific