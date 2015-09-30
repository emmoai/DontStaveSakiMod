local function dig(inst, digger)
	-- Error Prevention: inst.components.pickable
	if inst.components.pickable and inst.components.pickable:CanBePicked() then
		-- Error Prevention: inst.components.lootdropper
		if inst.components.lootdropper then
			inst.components.lootdropper:SpawnLootPrefab("cutreeds")
		end
	end

	-- Remove instance from the world.
	inst:Remove()

	-- Spawn our dug reeds.
	-- Error Prevention: inst.components.lootdropper
	if inst.components.lootdropper then
		inst.components.lootdropper:SpawnLootPrefab("dug_reeds")
	end
end

local function onpickedfn(inst)
    inst.SoundEmitter:PlaySound("dontstarve/wilson/pickup_reeds")
    inst.AnimState:PlayAnimation("picking")
    inst.AnimState:PushAnimation("picked")
end

local function onregenfn(inst)
    inst.AnimState:PlayAnimation("grow")
    inst.AnimState:PushAnimation("idle", true)
end

local function makeemptyfn(inst)
	inst.AnimState:PlayAnimation("picked")
end

local function ontransplantfn(inst)
	inst.components.pickable:MakeBarren()
end

local function makebarrenfn(inst)
	inst.AnimState:PlayAnimation("idle_dead")
end

local function ReedsPostInit(inst)

	-- Determine if this is the master simulator or if it's a client.
	if not TheWorld.ismastersim then
		return inst
	end

	-- Error Prevention: inst.components.pickable
	if inst.components.pickable then
		inst.components.pickable:SetUp("cutreeds", TUNING.REEDS_REGROW_TIME)
		inst.components.pickable.onregenfn = onregenfn
		inst.components.pickable.onpickedfn = onpickedfn
		inst.components.pickable.makeemptyfn = makeemptyfn
		inst.components.pickable.makebarrenfn = makebarrenfn
		inst.components.pickable.makefullfn = makefullfn
		inst.components.pickable.max_cycles = 20
		inst.components.pickable.cycles_left = 20   
		inst.components.pickable.ontransplantfn = ontransplantfn
	end

	-- Error Prevention: inst.components.loodropper
	if not inst.components.lootdropper then
		inst:AddComponent("lootdropper")
	end

	-- Error Prevention: inst.components.workable
	if not inst.components.workable then
		inst:AddComponent("workable")
	end

	-- Error Prevention: inst.components.workable
	if inst.components.workable then
		inst.components.workable:SetWorkAction(ACTIONS.DIG)
		inst.components.workable:SetOnFinishCallback(dig)
		inst.components.workable:SetWorkLeft(1)
	end

	return inst
end

AddPrefabPostInit("reeds", ReedsPostInit)