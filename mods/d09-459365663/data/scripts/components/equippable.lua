--[[	Copyright (c) 2015 Kzisor/Ysovuka	]]


local function EquippablePostInit( inst )

	if not TheWorld.ismastersim then

		return inst

	end

	local _GetDapperness = inst.GetDapperness

	function inst:GetDapperness( inst, owner )

		local dapperness = _GetDapperness(self, inst, owner)

		if owner and owner:HasTag("inverseaura") and dapperness > 0 then

			dapperness = dapperness * 0.75

		end

		return dapperness

	end



	return inst

end

AddComponentPostInit( "equippable", EquippablePostInit)