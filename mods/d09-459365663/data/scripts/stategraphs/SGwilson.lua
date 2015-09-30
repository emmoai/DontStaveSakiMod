--[[	Copyright (c) 2015 Kzisor/Ysovuka	]]

local function StateGraphPostInit( sg )

	if not TheWorld.ismastersim then

		return sg

	end


	local _fn = sg.events["death"].fn
	sg.events["death"].fn = function( inst )

			if HUMAN_MEAT_ENABLED then
				inst.components.inventory:GiveItem(SpawnPrefab("monstermeat"))
				inst.components.inventory:GiveItem(SpawnPrefab("monstermeat"))
				inst.components.inventory:GiveItem(SpawnPrefab("monstermeat"))
				inst.components.inventory:GiveItem(SpawnPrefab("monstermeat"))
			end

			_fn(inst)

			if inst:HasTag("demon") then

				local meat = FindEntity(inst, 20,
					function(item) return item.prefab == "humanmeat" end, nil, nil)

				if meat ~= nil then

					meat:Remove()

				end

			end

		end


	return sg

end

AddStategraphPostInit("wilson", StateGraphPostInit)