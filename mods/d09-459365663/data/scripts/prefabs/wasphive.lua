--[[	Copyright (c) 2015 Kzisor/Ysovuka	]]

local function WaspHivePostInit( inst )


	if not TheWorld.ismastersim then

		return inst

	end


	local _onnear =  inst.components.playerprox.onnear

	inst.components.playerprox.onnear = function ( inst, target )

			if not target:HasTag("demon") then

				return _onnear( inst, target )

			end

		end

end

AddPrefabPostInit( "wasphive", WaspHivePostInit)