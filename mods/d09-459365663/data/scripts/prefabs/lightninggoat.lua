--[[	Copyright (c) 2015 Kzisor/Ysovuka	]]

local function LightningGoatPostInit( inst )

	if not TheWorld.ismastersim then

		return inst

	end

	local _targetfn = inst.components.combat.targetfn

	local function RetargetFn( inst )

		local target = _targetfn( inst )

		if target == nil then
			
			return FindEntity(inst, TUNING.BEEFALO_TARGET_DIST, function(guy)
            		return guy:HasTag("demon") and inst.components.combat:CanTarget(guy)
        	end,
        	nil,
        	{"lightninggoat"}
        	)

		end

		return target

	end
	
	inst.components.combat:SetRetargetFunction(3, RetargetFn)

	return inst

end

AddPrefabPostInit("lightninggoat", LightningGoatPostInit)