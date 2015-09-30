local function DeployablePostInit(self)
	-- Stored for later usage.
	self._Deploy = self.Deploy

	-- Variable for our test function.
	self.test = nil

	function self:Deploy(pt, deployer)
		if self.test and not self.test(self, pt) then
			return
		end

		if not self:CanDeploy(pt) then
        	return
    	end

    	if self.ondeploy ~= nil then
        	self.ondeploy(self.inst, pt, deployer)
    	end
    	return true
    end

    return self
end

AddComponentPostInit("deployable", DeployablePostInit)