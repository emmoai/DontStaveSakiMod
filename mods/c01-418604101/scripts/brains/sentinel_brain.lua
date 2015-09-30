require "behaviours/follow"
require "behaviours/wander"
require "behaviours/chaseandattack"
require "behaviours/doaction"

local SentinelBrain = Class(Brain, function(self, inst)
    Brain._ctor(self, inst)
end)

function SentinelBrain:OnStart()
	local nodes = {
		ChaseAndAttack(self.inst, 12, 20),
	}
	table.insert(nodes,Follow(self.inst, function() return self.inst.components.follower.leader end, 1, 6, 8))
	table.insert(nodes,Wander(self.inst, function()
		local master = self.inst.components.follower.leader
		if master and master:IsValid() then
			return Point(master.Transform:GetWorldPosition())
		else
			return Point(self.inst.Transform:GetWorldPosition())
		end
	end , 7))
    local root = 
    PriorityNode(nodes, 1)
    self.bt = BT(self.inst, root)
end

return SentinelBrain