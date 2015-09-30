local ThrowMT = Class(function(self, inst)
    self.inst = inst

    inst:AddTag("throwmt")
end)

function ThrowMT:OnRemoveFromEntity()
    self.inst:RemoveTag("throwmt")
end

function ThrowMT:ThrowRocks(target)
	if target then
		local pt = Vector3(target.Transform:GetWorldPosition())
		
		local ants = TheSim:FindEntities(pt.x, 0, pt.z, 300, {"player"}, { "smashable", "INLIMBO", "playerghost" })
		local attacker = ants[1]
		
		if attacker == nil then
			return false
		end
		
		local ents = TheSim:FindEntities(pt.x, 0, pt.z, 30, nil, { "smashable", "INLIMBO", "playerghost" })
			for i, v in ipairs(ents) do
				if v ~= nil and v.prefab == "rocks" then
					target.SoundEmitter:PlaySound("dontstarve/common/stone_drop")
					
					local function onattack(inst, attacker, target, skipsanity)
						if target.components.combat then
							target.components.combat:GetAttacked(attacker, 10, attacker.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS))
						end
					end
										
					v:AddComponent("projectile")
					v.components.projectile:SetSpeed(30)
					v.components.projectile.onhit = onattack
					v.components.projectile:Throw(attacker, target, attacker)
					
					
				end
			end
		
		return true
	else 
		return false
	end
end


return ThrowMT