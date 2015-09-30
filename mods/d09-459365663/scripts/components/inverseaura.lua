--[[	Copyright (c) 2015 Kzisor/Ysovuka	]]

return Class( function( self, inst )
	assert(TheWorld.ismastersim, "Inverse Aura must not be loaded on the client.")


--------------------------------------------------------------------------
--[[ Member variables ]]
--------------------------------------------------------------------------

-- public
self.inst = inst

self.radius = nil
self.tickperiod = nil
self.time_elapsed = 0

self.active = false
self.applying = nil

-- private
local transformables = { }

--------------------------------------------------------------------------
--[[ Private member functions ]]
--------------------------------------------------------------------------


--------------------------------------------------------------------------
--[[ Initialization ]]
--------------------------------------------------------------------------

self.inst:StartUpdatingComponent( self )

--------------------------------------------------------------------------
--[[ Public member functions ]]
--------------------------------------------------------------------------

function self:Enable( val )

	if self.active ~= val then

		print(val)

		self.active = val

		if not self.active then

			self.inst:PushEvent("stopaura")
			self.applying = false

		end

	end

end

function self:AddItem( prefab, item )

	transformables[prefab] = item

end

function self:SetTickPeriod( period )

	self.tickperiod = period

end

function self:SetRadius( radius )

	self.radius = radius

end

function self:OnUpdate( dt )

	self.time_elapsed = self.time_elapsed + dt

	if self.time_elapsed >= self.tickperiod then

		if self.active then

		    local x,y,z = self.inst.Transform:GetWorldPosition()
		    local ents = TheSim:FindEntities(x,y,z, self.radius, nil, {"FX", "NOCLICK", "DECOR","INLIMBO"} )

		    for k,v in pairs(ents) do
		        -- TODO: Reverse all appearances who we are affecting.

		        if transformables[ v.prefab ] ~= nil then

		        	if transformables[ v.prefab ].chance == nil or transformables[ v.prefab ].chance and ( transformables[ v.prefab ].chance * 1000 ) >= math.random(1, 1000) and not v:HasTag("nontransform") then

		        		if transformables[ v.prefab ].alternate_chance == nil or transformables[ v.prefab ].alternate_chance and ( transformables[ v.prefab ].alternate_chance * 1000 ) >= math.random(1, 1000) then

		        			local item = SpawnPrefab(transformables[ v.prefab ].new )
		        			
		        			if item ~= nil then
		        				item.Transform:SetPosition( v:GetPosition():Get() )
		        			end

		        			v:Remove()

		        		else

		        			local item = SpawnPrefab(transformables[ v.prefab ].alternative )
		        			
		        			if item ~= nil then
		        				item.Transform:SetPosition( v:GetPosition():Get() )
		        			end

		        			v:Remove()

		        		end

		        	else

		        		v:AddTag("nontransform")

		        	end
		        
		        elseif v.components.werebeast and not v.components.werebeast:IsInWereState() then		        	

		        	v.components.werebeast:TriggerDelta(v.components.werebeast.triggerlimit)

		        elseif v.components.deciduoustreeupdater and not v.monster and not v:HasTag("notransform") then

		        	if math.random(1, 1000) >= 850 then

		        		v:StartMonster(true)
		        	
		        	else

		        		v:AddTag("nontransform")
		        	end

		        elseif v.components.workable and v.components.workable:GetWorkAction() == ACTIONS.MINE then

		        	v.components.workable:WorkedBy( self.inst, v.components.workable.workleft )

		        end

		    end

		end

		self.time_elapsed = 0

	end

end





-- end of return
end )