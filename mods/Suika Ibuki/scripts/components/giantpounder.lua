local GiantPounder = Class(function(self, inst)
    self.inst = inst

    self.numRings = 4
    self.ringDelay = 0.2
    self.initialRadius = 1
    self.radiusStepDistance = 4
    self.pointDensity = .25
    self.damageRings = 2
    self.destructionRings = 3
    self.noTags = { "FX", "NOCLICK", "DECOR", "INLIMBO" }
    self.destroyer = false
    self.burner = false
    self.groundpoundfx = "groundpound_fx"
    self.groundpoundringfx = "groundpoundring_fx"
    self.groundpounddamagemult = 1
    self.groundpoundFn = nil
end)

function GiantPounder:GetPoints(pt)
    local points = {}
    local radius = self.initialRadius

    for i = 1, self.numRings do
        local theta = 0
        local circ = 2*PI*radius
        local numPoints = circ * self.pointDensity
        for p = 1, numPoints do

            if not points[i] then
                points[i] = {}
            end

            local offset = Vector3(radius * math.cos(theta), 0, -radius * math.sin(theta))
            local point = pt + offset

            table.insert(points[i], point)

            theta = theta - (2*PI/numPoints)
        end
        
        radius = radius + self.radiusStepDistance

    end
    return points
end

function GiantPounder:DestroyPoints(points, breakobjects, dodamage)
    local getEnts = breakobjects or dodamage
    local map = TheWorld.Map
    for k, v in pairs(points) do
        if getEnts then
            local ents = TheSim:FindEntities(v.x, v.y, v.z, 3, nil, self.noTags)
            if #ents > 0 then
                if breakobjects then
                    for i, v2 in ipairs(ents) do
                        if v2 ~= self.inst and v2:IsValid() then
                            -- Don't net any insects when we do work
                            if self.destroyer and
                                v2.components.workable ~= nil and
                                v2.components.workable.workleft > 0 and
                                v2.components.workable.workable and
                                v2.components.workable.action ~= ACTIONS.NET then
                                v2.components.workable:Destroy(self.inst)
                            end
                            if v2:IsValid() and --might've changed after work?
                                not v2:IsInLimbo() and --might've changed after work?
                                self.burner and
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
                        if v2 ~= self.inst and
                            v2:IsValid() and
                            v2.components.health ~= nil and
                            not v2.components.health:IsDead() and 
                            self.inst.components.combat:CanTarget(v2) then
                            self.inst.components.combat:DoAttack(v2, nil, nil, nil, self.groundpounddamagemult)
                        end
                    end
                end
            end
        end

        if map:IsPassableAtPoint(v:Get()) then
            SpawnPrefab(self.groundpoundfx).Transform:SetPosition(v.x, 0, v.z)
        end
    end
end

function GiantPounder:GroundPound(pt)
    SpawnPrefab(self.groundpoundringfx).Transform:SetPosition(pt:Get())
    local points = self:GetPoints(pt)
    local delay = 0
    for i = 1, self.numRings do
        self.inst:DoTaskInTime(delay, function() self:DestroyPoints(points[i], i <= self.destructionRings, i <= self.damageRings) end)
        delay = delay + self.ringDelay
    end

    if self.groundpoundFn ~= nil then
        self.groundpoundFn(self.inst)
    end
end