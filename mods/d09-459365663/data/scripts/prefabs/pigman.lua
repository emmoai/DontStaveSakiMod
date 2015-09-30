--[[	Copyright (c) 2015 Kzisor/Ysovuka	]]

local function WerepigPostInit( inst )

	if not TheWorld.ismastersim then

		return inst

	end


	local function OnTransform( inst )

		if inst:HasTag("werepig") then

			local _targetfn = inst.components.combat.targetfn

				local function RetargetFn( inst )

					local target = _targetfn( inst )

					if target ~= nil and target:HasTag("demon") then
						
						return nil

					end

					return target

				end
			
			inst.components.combat:SetRetargetFunction(3, RetargetFn)

		end

	end

	inst:ListenForEvent("transformwere", OnTransform)

	return inst

end


AddPrefabPostInit("pigman", WerepigPostInit)