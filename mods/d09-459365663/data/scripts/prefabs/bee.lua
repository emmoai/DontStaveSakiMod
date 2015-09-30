--[[	Copyright (c) 2015 Kzisor/Ysovuka	]]

local function BeePostInit( inst )

	if not TheWorld.ismastersim then

		return inst

	end

	local _targetfn = inst.components.combat.targetfn

	local function RetargetFn( inst )

		local target = _targetfn( inst )

		if target == nil then

			return FindEntity(inst, SpringCombatMod(8),
		        function(guy)
		            return inst.components.combat:CanTarget(guy) and guy:HasTag("demon")
		        end,
		        { "_combat", "_health" },
		        { "insect", "INLIMBO" },
		        { "character", "animal", "monster" })
		end

		return target

	end

	inst.components.combat:SetRetargetFunction(3, RetargetFn)

	return inst

end

local function KillerBeePostInit( inst )

	if not TheWorld.ismastersim then

		return inst

	end

	local _targetfn = inst.components.combat.targetfn

	local function RetargetFn( inst )

		local target = _targetfn( inst )

		if target ~= nil and target:HasTag("demon") then
			
			return nil

		end

		return target

	end

	inst.components.combat:SetRetargetFunction(3, RetargetFn)

	return inst

end

AddPrefabPostInit("bee", BeePostInit)
AddPrefabPostInit("killerbee", KillerBeePostInit)