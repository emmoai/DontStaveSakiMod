local prefabs =
{
	"groundpound_fx",
	"groundpoundring_fx",
}


local    numRingsbase = 1
local    numRings = 3
local    ringDelay = 0.2
local    initialRadius = 1
local    radiusStepDistance = 2
local    pointDensity = .25
local    damageRings = 2
local    destructionRings = 3
local    noTags = { "FX", "NOCLICK", "DECOR", "INLIMBO" }
local    destroyer = true
local    burner = false
local    groundpoundfx = "groundpound_fx"
local    groundpoundringfx = "groundpoundring_fx"
local    groundpounddamage = 100
local    groundpoundFn = nil

function GetPoints(pt, reader)
    local points = {}
    local radius = initialRadius

    for i = 1, numRings do
        local theta = 0
        local circ = 2*PI*radius
        local numPoints = circ * pointDensity
        for p = 1, numPoints do

            if not points[i] then
                points[i] = {}
            end

            local offset = Vector3(radius * math.cos(theta), 0, -radius * math.sin(theta))
            local point = pt + offset

            table.insert(points[i], point)

            theta = theta - (2*PI/numPoints)
        end
        
        radius = radius + radiusStepDistance

    end
    return points
end

function DestroyPoints(points, breakobjects, dodamage, reader)
    local getEnts = breakobjects or dodamage
    local map = TheWorld.Map
    for k, v in pairs(points) do
        if getEnts then
            local ents = TheSim:FindEntities(v.x, v.y, v.z, 3, nil, noTags)
            if #ents > 0 then
                if breakobjects then
                    for i, v2 in ipairs(ents) do
                        if v2 ~= reader and v2:IsValid() then
                            -- Don't net any insects when we do work
                            if destroyer and
                                v2.components.workable ~= nil and
                                v2.components.workable.workleft > 0 and
                                v2.components.workable.workable and
								not v2.components.structure and
                                v2.components.workable.action ~= ACTIONS.NET then
                                v2.components.workable:Destroy(reader)
                            end
                            if v2:IsValid() and --might've changed after work?
                                not v2:IsInLimbo() and --might've changed after work?
                                burner and
                                v2.components.burnable ~= nil and
                                not v2.components.burnable:IsBurning() and
                                not v2:HasTag("burnt") then
                                v2.components.burnable:Ignite()
                            end
                        end
                    end
                end
                if dodamage then
                    for i, v2 in ipairs(ents) do
                        if v2 ~= reader and
							not v2:HasTag("player") == true and
                            v2:IsValid() and
                            v2.components.health ~= nil and
							not v2:HasTag("companion") and
                            not v2.components.health:IsDead() then

							v2.components.combat:GetAttacked(reader, groundpounddamage, reader.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS), nil)
                            -- reader.components.combat:DoAttack(v2, nil, nil, nil, groundpounddamage)
                        end
                    end
                end
            end
        end

        if map:IsPassableAtPoint(v:Get()) then
            SpawnPrefab(groundpoundfx).Transform:SetPosition(v.x, 0, v.z)
        end
    end
end

function GroundPound(pt, reader)
    SpawnPrefab(groundpoundringfx).Transform:SetPosition(pt:Get())
    local points = GetPoints(pt, reader)
    local delay = 0
    for i = 1, numRings do
        reader:DoTaskInTime(delay, function() DestroyPoints(points[i], i <= destructionRings, true, reader) end)
        delay = delay + ringDelay
    end
	
    if groundpoundFn ~= nil then
        groundpoundFn(inst)
    end
end
	
function missingpowerfn(inst, reader)
    local pt = Vector3(reader.Transform:GetWorldPosition())
	
    reader:StartThread(function()
		reader:AddTag("huge")
	
		local health_max = reader.components.health:GetMaxWithPenalty()
		local health_percent = reader.components.health:GetPercent()
		reader.components.health:SetMaxHealth(10000) -- BECOME UNSTOPPABLE
		reader.components.health:SetPercent(health_percent, true)
	
		local powerlevel = 2;
		groundpounddamage = 80
		if reader:HasTag("drunk") then
			powerlevel = 3;
			groundpounddamage = 120
		end
		if reader:HasTag("sober") then
			powerlevel = 1;
			groundpounddamage = 40
		end
		
		numRings = numRingsbase + powerlevel
		damageRings = numRingsbase + powerlevel
		destructionRings = numRingsbase + powerlevel
		

		
		reader.sg:PushEvent("powerup");
		reader.SoundEmitter:PlaySound("dontstarve/characters/wolfgang/grow_medtolrg")
		Sleep(.5)
		GroundPound(pt, reader)
		for k = 0, powerlevel do
			reader:ApplyScale("missingpower", 1 + k)
			Sleep(.1)
		end
		Sleep(.35)
		
		for k = 0, powerlevel do
			reader:ApplyScale("missingpower", 1 + powerlevel - k)
			Sleep(.1)
		end
		reader:RemoveTag("huge")
		
		reader.components.health:SetMaxHealth(health_max) -- BECOME STOPPABLE
		reader.components.health:SetPercent(health_percent, true)
    end)
	
	

	
    return true
end

function missingppowerfn(inst, reader)
    local pt = Vector3(reader.Transform:GetWorldPosition())
	
    reader:StartThread(function()
		local powerlevel = 2;
		if reader:HasTag("drunk") then
			powerlevel = 3;
		end
		if reader:HasTag("sober") then
			powerlevel = 1;
		end
	
		reader:AddTag("huge")
	
		local health_max = reader.components.health:GetMaxWithPenalty()
		local health_percent = reader.components.health:GetPercent()
		reader.components.health:SetMaxHealth(powerlevel * 1000) -- BECOME BIG
		reader.components.health:SetPercent(health_percent, true)
	

		
		numRings = numRingsbase + powerlevel
		damageRings = numRingsbase + powerlevel
		destructionRings = numRingsbase + powerlevel
		groundpounddamage = 20 + 10 * powerlevel
		
		reader.sg:PushEvent("powerup");
		reader.SoundEmitter:PlaySound("dontstarve/characters/wolfgang/grow_medtolrg")
				
		-- Buffs

		-- reader.components.combat:SetRange(TUNING.BEARGER_ATTACK_RANGE, TUNING.BEARGER_MELEE_RANGE)
		reader.components.combat:SetAreaDamage(6, 0.8)
		reader.components.combat:SetDefaultDamage(20)
		reader.components.combat.damagemultiplier = 1 + powerlevel
		
		-- big people need big meals
		reader.components.hunger:SetRate(3*TUNING.WILSON_HUNGER_RATE)
		
		Sleep(.5)
		GroundPound(pt, reader)
		for k = 0, powerlevel do
			local scale = 1.5 + k
			reader:ApplyScale("missingppower", scale)
			reader.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED / scale)
			reader.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED / scale)
			Sleep(.1)
		end

		local duration = 100 * powerlevel
		for k = 0, duration do
			local scale = 1.5 + powerlevel - k/duration/2
			reader:ApplyScale("missingppower", scale)
			reader.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED / scale)
			reader.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED / scale)
			Sleep(.1)
		end
		
		reader.components.talker:Say(GetString(reader, "ANNOUNCE_NORMALTOWIMPY"))
        reader.SoundEmitter:PlaySound("dontstarve/characters/wolfgang/shrink_medtosml")
		for k = 0, powerlevel do
			reader:ApplyScale("missingppower", 1.5 + powerlevel - k)
			Sleep(.1)
		end
		reader:ApplyScale("missingppower", 1)
		reader:RemoveTag("huge")
		
		reader.components.health:SetMaxHealth(health_max) -- BECOME STOPPABLE
		reader.components.health:SetPercent(health_percent, true)
		
		-- fin
		

    end)
	
    return true
end

local DEBRIS =
{
    "rocks",
    "rocks",
	"rocks",
	"rocks",
    "flint",
}

local function ScaleShadow(shadow, y)
    local scale = Lerp(.5, 1.5, math.clamp(y / 35, 0, 1))
    shadow.Transform:SetScale(scale, scale, scale)
    scale = scale - .5
    scale = 1 - scale * scale
    shadow.AnimState:SetMultColour(scale, scale, scale, scale)
end

local function GroundDetectionUpdate(inst)
    local x, y, z = inst.Transform:GetWorldPosition()
    if y <= .2 then
        inst.shadow:Remove()

        local hitplayer = true
        local ents = TheSim:FindEntities(x, 0, z, 2, nil, { "smashable", "INLIMBO", "playerghost" })
        for i, v in ipairs(ents) do
            if v ~= nil and v ~= inst and v:IsValid() and v.components.combat ~= nil then
                if not v:HasTag("player") and not v:HasTag("companion") then
                    hitplayer = true
                    -- if v.components.grogginess ~= nil then
                    --     v.components.grogginess:AddGrogginess(.3)
                    -- end
					v.components.combat:GetAttacked(inst, 3, nil)
                end
                -- 
            end
        end

        if hitplayer then
            --bounce off player
            local speed = 3.2 + math.random()
            local angle = math.random() * 2 * PI
            inst.Physics:SetMotorVel(0, 0, 0)
            inst.Physics:SetDamping(0.9)
            inst.Physics:SetVel(
                speed * math.cos(angle),
                speed * 2.3,
                speed * math.sin(angle)
            )
            inst.persists = true
            inst.entity:SetCanSleep(true)
            inst.updatetask:Cancel()
            inst.updatetask = nil
        
			if math.random() < .8 then
				--spawn break effect
				inst.SoundEmitter:PlaySound("dontstarve/common/stone_drop")
				SpawnPrefab("ground_chunks_breaking").Transform:SetPosition(x, 0, z)
				inst:Remove()
			end
        end
    elseif inst:GetTimeAlive() < 1.5 then
        if y < 2 then
            inst.Physics:SetMotorVel(0, -50, 0)
        end
        ScaleShadow(inst.shadow, y)
    else
        --failsafe
        inst.shadow:Remove()
        inst:Remove()
    end
end

function DropRock(player, dx, dz)
	--local pvp = GLOBAL.TheNet:GetPVPEnabled()
    local debris = SpawnPrefab(DEBRIS[math.random(#DEBRIS)])
    if debris ~= nil then
        debris.entity:SetCanSleep(false)
        debris.persists = false

        local x, y, z = player.Transform:GetWorldPosition()
        if player.sg:HasStateTag("moving") then
            --Lead the player's position if he's moving
            local speed = player.components.locomotor:GetRunSpeed()
            local lead = speed * GetRandomMinMax(.6, 1)
            local theta = player.Transform:GetRotation() * DEGREES
            x = x + lead * math.cos(theta)
            z = z - lead * math.sin(theta)
        end
        local theta = math.random() * 2 * PI
        local radius = GetRandomMinMax(3, 5)
        x = x + dx + radius * math.cos(theta)
        z = z + dz - radius * math.sin(theta)
        debris.Physics:Teleport(x, 20, z)


		local target = nil
		local pvp = false
		for k,v in pairs(TheSim:FindEntities(x, 0, z, 10)) do
				if v.replica and v.replica.combat and v.replica.combat:CanBeAttacked(player) and
				player.replica and player.replica.combat and player.replica.combat:CanTarget(v) and not v:HasTag("companion")
				and (not v:HasTag("wall")) and (pvp or ((not pvp)
						and (not (player:HasTag("player") and v:HasTag("player"))))) then
					target = v
					break
				end
			end

		player.SoundEmitter:PlaySound("dontstarve/common/stone_drop")
		
		local function onattack(inst, attacker, target, skipsanity)
			if target.components.combat then
				target.components.combat:GetAttacked(attacker, 10, attacker.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS))
				if math.random() < .9 then
					inst:Remove()
				end
			end
		end
		
		--target = player --testing!
							
		if target ~= nil then
			debris:AddComponent("projectile")
			debris.components.projectile:SetSpeed(10)
			debris.components.projectile.onhit = onattack
			debris.components.projectile:Throw(player, target, player)
		else
		    debris.shadow = SpawnPrefab("warningshadow")
			debris.shadow.Transform:SetPosition(x, 0, z)
			ScaleShadow(debris.shadow, 5)
			debris.updatetask = debris:DoPeriodicTask(FRAMES, GroundDetectionUpdate)
		end
    end
end

function throwingmtfn(inst, reader)
    local pt = Vector3(reader.Transform:GetWorldPosition())
	
	local powerlevel = 2;
	if reader:HasTag("drunk") then
		powerlevel = 3;
	end
	if reader:HasTag("sober") then
		powerlevel = 1;
	end
	local count = powerlevel*15
	
    for i = 1, count do
		reader:DoTaskInTime(i/10, DropRock, 0, 0)
		--Sleep(.1)
    end
	--reader:AddComponent("throwmt")
	
    return true
end


function MakeBook(name, usefn, carduses)
	local assets =
	{
		Asset("ANIM", "anim/"..name..".zip"),
		--Asset("SOUND", "sound/common.fsb"),
		Asset("ATLAS", "images/inventoryimages/"..name..".xml"),
		Asset("IMAGE", "images/inventoryimages/"..name..".tex"),
		
	}

	local prefabs =
	{
		name,
	}

    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddSoundEmitter()
        inst.entity:AddNetwork()
		
        inst.AnimState:SetBank(name)
        inst.AnimState:SetBuild(name)
        inst.AnimState:PlayAnimation("idle")

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        -----------------------------------

        inst:AddComponent("spellcard")
        inst.components.spellcard.onread = usefn
        inst:AddComponent("inspectable")
		
        inst:AddComponent("inventoryitem")
		inst.components.inventoryitem.imagename = name
		inst.components.inventoryitem.atlasname = "images/inventoryimages/"..name..".xml"
		
        inst:AddComponent("finiteuses")
        inst.components.finiteuses:SetMaxUses(carduses)
        inst.components.finiteuses:SetUses(carduses)
        inst.components.finiteuses:SetOnFinished(inst.Remove)

        MakeSmallBurnable(inst)
        MakeSmallPropagator(inst)

        return inst
    end

    return Prefab("common/inventory/"..name, fn, assets, prefabs)
end

return 	MakeBook("card_missingpower", missingpowerfn, 3),
		MakeBook("card_missingppower", missingppowerfn, 1),
		MakeBook("card_throwingmt", throwingmtfn, 2)