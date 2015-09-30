 




local function ontransplantfn(inst)
	--inst.components.pickable:MakeBarren(true)
end

local function makeemptyfn(inst)
	
	if inst:HasTag("withered") then
		inst.AnimState:PlayAnimation("dead_to_empty")
		inst.AnimState:PushAnimation("empty")
	else
		inst.AnimState:PlayAnimation("empty")	
		
	end
end


local function makebarrenfn(inst)
	if inst:HasTag("withered") then
		if not inst.components.pickable.hasbeenpicked then
			inst.AnimState:PlayAnimation("full_to_dead")
		else
			inst.AnimState:PlayAnimation("empty_to_dead")
		end
		inst.AnimState:PushAnimation("idle_dead")
	else
		inst.AnimState:PlayAnimation("idle_dead")
	end
end

local function pickanim(inst)
	if inst.components.pickable then
		if inst.components.pickable:CanBePicked() then
			local percent = 0
			if inst.components.pickable then
				percent = inst.components.pickable.cycles_left / inst.components.pickable.max_cycles
			end
			if percent >= .9 then
				return "berriesmost"
			elseif percent >= .33 then
				return "berriesmore"
			else
				return "berries"
			end
		else
			if inst.components.pickable:IsBarren() then
				return "idle_dead"
			else
				return "idle"
			end
		end
	end

	return "idle"
end


local function shake(inst)
    if inst.components.pickable and inst.components.pickable:CanBePicked() then
        inst.AnimState:PlayAnimation("shake")
    else
        inst.AnimState:PlayAnimation("shake_empty")
    end
	inst.AnimState:PushAnimation(pickanim(inst), false)
end

local function spawnperd(inst)
    if inst:IsValid() then
		local perd = SpawnPrefab("perd")
		local spawnpos = Vector3(inst.Transform:GetWorldPosition() )
		spawnpos = spawnpos + TheCamera:GetDownVec()
		perd.Transform:SetPosition(spawnpos:Get() )
		perd.sg:GoToState("appear")
		perd.components.homeseeker:SetHome(inst)
		shake(inst)
	end
end

local function onpickedfn(inst, picker)
inst.components.pickable.cycles_left = 5

	if inst.components.pickable then
		local old_percent = (inst.components.pickable.cycles_left+1) / inst.components.pickable.max_cycles

		if old_percent >= .9 then
			inst.AnimState:PlayAnimation("berriesmost_picked")
		elseif old_percent >= .33 then
			inst.AnimState:PlayAnimation("berriesmore_picked")
		else
			inst.AnimState:PlayAnimation("berries_picked")
		end

		if inst.components.pickable:IsBarren() then
			inst.AnimState:PushAnimation("idle_dead")
		else
			inst.AnimState:PushAnimation("idle")
		end
	end
	
	if not picker:HasTag("berrythief") and math.random() < TUNING.PERD_SPAWNCHANCE then
	    inst:DoTaskInTime(3+math.random()*3, spawnperd)
	end
end

local function getregentimefn(inst)
	if inst.components.pickable then
		local num_cycles_passed = math.min(inst.components.pickable.max_cycles - inst.components.pickable.cycles_left, 0)
		return TUNING.BERRY_REGROW_TIME + TUNING.BERRY_REGROW_INCREASE*num_cycles_passed+ math.random()*TUNING.BERRY_REGROW_VARIANCE
	else
		return TUNING.BERRY_REGROW_TIME
	end
	
end


local function makefullfn(inst)
	inst.AnimState:PlayAnimation(pickanim(inst))
end

local function dig_up(inst, chopper)
    inst:Remove()
    if inst.components.pickable and inst.components.lootdropper then
    
        if inst.components.pickable:IsBarren() or inst:HasTag("withered") then
            inst.components.lootdropper:SpawnLootPrefab("twigs")
            inst.components.lootdropper:SpawnLootPrefab("twigs")
        else
            
            if inst.components.pickable and inst.components.pickable:CanBePicked() then
                inst.components.lootdropper:SpawnLootPrefab("pappfruit")
            end
            
            inst.components.lootdropper:SpawnLootPrefab("dug_"..inst.bushname)
        end
    end 
end
local function createbush(bushname)
	local assets =
	{
		--Asset("ANIM", "anim/berrybush.zip"),		
		Asset("ANIM", "anim/"..bushname..".zip"),
	}

	local prefabs =
	{
	    "pappfruit",
	    "dug_"..bushname,
	    "perd",
	    "twigs",
	}   

		local function fn()
        local inst = CreateEntity()

        inst.bushname = bushname

        inst.entity:AddTransform()
        inst.Transform:SetScale(1.5,1.5,1.5)
        inst.entity:AddAnimState()
        inst.entity:AddMiniMapEntity()
        inst.entity:AddNetwork()

        MakeObstaclePhysics(inst, .1)

        inst:AddTag("bush")

        inst.MiniMapEntity:SetIcon("pineapple.tex")

        inst.AnimState:SetBank("berrybush")
        inst.AnimState:SetBuild(bushname)
        inst.AnimState:PlayAnimation("berriesmost", false)

		MakeDragonflyBait(inst, 1)
        MakeSnowCoveredPristine(inst)

        if not TheWorld.ismastersim then
            return inst
        end

        inst.entity:SetPristine()

        inst:AddComponent("pickable")
        inst.components.pickable.picksound = "dontstarve/wilson/harvest_berries"
        inst.components.pickable:SetUp("pappfruit", TUNING.BERRY_REGROW_TIME)

        inst.components.pickable.getregentimefn = getregentimefn
        
        inst.components.pickable.onpickedfn = onpickedfn
        inst.components.pickable.makeemptyfn = makeemptyfn
        inst.components.pickable.makebarrenfn = makebarrenfn
        inst.components.pickable.makefullfn = makefullfn
        inst.components.pickable.ontransplantfn = ontransplantfn
        inst.components.pickable.max_cycles = TUNING.BERRYBUSH_CYCLES + math.random(2)
        inst.components.pickable.cycles_left = inst.components.pickable.max_cycles
		inst:AddComponent("witherable")
        local variance = math.random() * 4 - 2

        MakeLargeBurnable(inst)
        MakeLargePropagator(inst)

        MakeHauntableIgnite(inst)
        AddHauntableCustomReaction(inst, function(inst, haunter)
	        if math.random() <= TUNING.HAUNT_CHANCE_ALWAYS then
	            shake(inst)
	            inst.components.hauntable.hauntvalue = TUNING.HAUNT_COOLDOWN_TINY
	            return true
	        end
	        return false
	    end, false, false, true)


        inst:AddComponent("lootdropper")
        inst:AddComponent("workable")
        inst.components.workable:SetWorkAction(ACTIONS.DIG)
        inst.components.workable:SetOnFinishCallback(dig_up)
        inst.components.workable:SetWorkLeft(1)






        inst:AddComponent("inspectable")
        inst.components.inspectable.nameoverride = "pineapple"



        inst:ListenForEvent("onwenthome", shake)
        MakeSnowCovered(inst)
        MakeNoGrowInWinter(inst)
        return inst
    end
	return Prefab( "common/objects/"..bushname, fn, assets, prefabs)	
end  
return createbush("pineapple")--, createbush("berryblu2") 
