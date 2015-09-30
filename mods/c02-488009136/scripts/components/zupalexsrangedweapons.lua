--Update inventoryitem_replica constructor if any more properties are added

local function onattackrange(self, attackrange)
    if self.inst.replica.inventoryitem ~= nil then
        self.inst.replica.inventoryitem:SetAttackRange(attackrange)
    end
end

local Zupalexsrangedweapons = Class(function(self, inst)
    self.inst = inst
    self.damage = 10
    self.attackrange = nil
    self.hitrange = nil
    self.onattack = nil
    self.onprojectilelaunch = nil
    self.projectile = nil
    self.stimuli = nil
	self.arrowbasedamage = 0
	self.owner = nil
	self.allowedprojectiles ={}
	self.fueledby = nil
	
	self.onarmed = nil
	
    --Monkey uses these
    self.modes = nil
    self.variedmodefn = nil

    self.inst:AddTag("zupalexsrangedweapons")
end,
nil,
{
    attackrange = onattackrange,
})

function Zupalexsrangedweapons:OnRemoveFromEntity()
    if self.inst.replica.inventoryitem ~= nil then
        self.inst.replica.inventoryitem:SetAttackRange(-1)
    end
end

function Zupalexsrangedweapons:SetDamage(dmg)
    self.damage = dmg
end

function Zupalexsrangedweapons:SetRange(attack, hit)
    self.attackrange = attack
    self.hitrange = hit or self.attackrange
end

function Zupalexsrangedweapons:SetOnAttack(fn)
    self.onattack = fn
end

function Zupalexsrangedweapons:SetOnProjectileLaunch(fn)
    self.onprojectilelaunch = fn
end

function Zupalexsrangedweapons:SetProjectile(projectile)
    self.projectile = projectile
end

function Zupalexsrangedweapons:SetElectric()
    self.stimuli = "electric"
end

function Zupalexsrangedweapons:CanRangedAttack()
    if self.variedmodefn then
        local mode = self.variedmodefn(self.inst)
        if not mode.ranged then
            --determined to use melee mode, return false.
            return false
        end
    end

    return self.projectile ~= nil
end

function Zupalexsrangedweapons:SetAttackCallback(fn)
    self.onattack = fn
end

function Zupalexsrangedweapons:OnAttack(attacker, target, projectile)
    if self.onattack then
        self.onattack(self.inst, attacker, target)
    end
    
    if self.inst.components.finiteuses then
	    self.inst.components.finiteuses:Use(self.attackwear or 1)
    end
end

function Zupalexsrangedweapons:SetOwner(owner)
	self.owner = owner
end

function Zupalexsrangedweapons:SetOnArmedFn(onarmedfn)
	self.onarmed = onarmedfn
end

function Zupalexsrangedweapons:OnArmed(armer)
	if self.onarmed then
		self.onarmed(self.inst, armer)
	end
end

function Zupalexsrangedweapons:LaunchProjectile(attacker, target)
	if self.projectile then

        if self.onprojectilelaunch then
            self.onprojectilelaunch(self.inst, attacker, target)
        end
		
	    local proj = SpawnPrefab(self.projectile)
		local owner = nil
		if self.inst.components.inventoryitem ~= nil then
			owner = self.inst.components.inventoryitem.owner
		end
		proj.components.zupalexsrangedweapons:SetOwner(owner)
--		print("Thrower in Component file = ", owner)
	    if proj then
            if proj.components.projectile then
    	        proj.Transform:SetPosition( attacker.Transform:GetWorldPosition() )
    	        proj.components.projectile:Throw(self.inst, target, attacker)
            elseif proj.components.complexprojectile then
                proj.Transform:SetPosition( attacker.Transform:GetWorldPosition() )
                proj.components.complexprojectile:Launch(Vector3( target.Transform:GetWorldPosition() ), attacker, self.inst)
            end
	    end
	end
end

function Zupalexsrangedweapons:GetArrowBaseDamage()
	if self.inst.prefab == "arrow" then
		return TUNING.BOWDMG
	elseif self.inst.prefab == "goldarrow" then
		return TUNING.BOWDMG*TUNING.GOLDARROWDMGMOD
	elseif self.inst.prefab == "moonstonearrow" then
		return TUNING.BOWDMG*TUNING.MOONSTONEARROWDMGMOD
	elseif self.inst.prefab == "firearrow" then
		return TUNING.BOWDMG*(TUNING.FIREARROWDMGMOD/2.0)
	elseif self.inst.prefab == "icearrow" then
		return TUNING.BOWDMG*TUNING.ICEARROWDMGMOD
	elseif self.inst.prefab == "bolt" then
		return TUNING.BOWDMG*TUNING.CROSSBOWDMGMOD
	elseif self.inst.prefab == "explosivebolt" then
		return 10
	elseif self.inst.prefab == "shadowarrow" then
		return TUNING.BOWDMG*TUNING.MAGICBOWDMGMOD
	elseif self.inst.prefab == "lightarrow" then
		return TUNING.BOWDMG*TUNING.MAGICBOWDMGMOD
	elseif self.inst.prefab == "healingarrow" then
		return 0
	end
end

function Zupalexsrangedweapons:SetAllowedProjectiles(projlist)
	self.allowedprojectiles = projlist
end

function Zupalexsrangedweapons:AddAllowedProjectiles(projname)
	table.insert(self.allowedprojectiles, projname)
end

function Zupalexsrangedweapons:GetBasicAmmo()
	if self.inst:HasTag("arrow") then
		if self.inst:HasTag("golden") then
			return string.lower("goldarrow")
		elseif self.inst:HasTag("moonstone") then
			return string.lower("moonstonearrow")
		else
			return string.lower("arrow")
		end
	elseif self.inst:HasTag("bolt") then
		return string.lower("bolt")
	end
end

function Zupalexsrangedweapons:GetMissChance()
	if self.inst:HasTag("arrow") then
		return TUNING.BOWMISSCHANCESMALL, TUNING.BOWMISSCHANCEBIG
	elseif self.inst:HasTag("bolt") then
		return TUNING.BOWMISSCHANCESMALL*TUNING.CROSSBOWACCMOD, TUNING.BOWMISSCHANCEBIG*TUNING.CROSSBOWACCMOD
	end
end

function Zupalexsrangedweapons:GetRecChance(hit)
	local RecChance

	if hit then
		RecChance = TUNING.HITREC
	else
		RecChance = TUNING.MISSREC
	end

	if self.inst:HasTag("arrow") then
		if self.inst:HasTag("golden") then
			return (RecChance*0.6)
		elseif self.inst:HasTag("moonstone") then
			return 0.99
		else
			return RecChance
		end
	elseif self.inst:HasTag("bolt") then
		return RecChance
	end
end

function Zupalexsrangedweapons:SetFueledBy(itemprefab)
	self.fueledby = itemprefab
end

function Zupalexsrangedweapons:MBSetNewProjectile(itemprefab)
	local currentproj = self.projectile
	
	local newproj = nil
	local lightR, lightG, lightB = nil, nil, nil
	
	if itemprefab == "nightmarefuel" then
		newproj = string.lower("shadowarrow")
		lightR = 204/255
		lightG = 0/255
		lightB = 255/255
	elseif itemprefab == "z_firefliesball" then
		newproj = string.lower("lightarrow")	
		lightR = 255/255
        lightG = 253/255
		lightB = 54/255
	elseif itemprefab == "z_bluegoop" then
		newproj = string.lower("healingarrow")	
		lightR = 247/255
		lightG = 116/255
		lightB = 255/255
	end
	
	if newproj ~= nil then
		self:SetFueledBy(itemprefab)
	
--		print("current proj = ", currentproj or "UNAVAILABLE", " / new proj = ", newproj or "UNAVAILABLE")
	
		if currentproj ~= newproj then
			if self.inst:HasTag("healer") and not newproj == "z_bluegoop" then
				self.inst:RemoveTag("healer")
			end
		
			self.inst.Light:SetColour(lightR, lightG, lightB)
			self:SetProjectile(newproj)
			
			print("I successfuly set a new projectile : ", self.projectile)
			
			return true
		else
			return false
		end
	end	
end

function Zupalexsrangedweapons:OnSave()
    if self.inst:HasTag("magic") and self.inst:HasTag("bow") and self.fueledby ~= nil then
        return {fueledby = self.fueledby}
    end
end

function Zupalexsrangedweapons:OnLoad(data)
    if self.inst:HasTag("magic") and self.inst:HasTag("bow") and data.fueledby then
--		print("I load stuffs")
        self:MBSetNewProjectile(data.fueledby)
    end
end

return Zupalexsrangedweapons