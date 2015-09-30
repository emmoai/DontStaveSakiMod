require = GLOBAL.require
TUNING = GLOBAL.TUNING
Vector3 = GLOBAL.Vector3
SpawnPrefab = GLOBAL.SpawnPrefab

--speed debuffs
AddPlayerPostInit(function(inst)
	if inst then
		inst:DoPeriodicTask(0, function(inst)
			if inst and GLOBAL.TheWorld.ismastersim then
				if inst.components.health and inst.components.hunger and not inst:HasTag("playerghost") then
					local health=inst.components.health.currenthealth/inst.components.health.maxhealth
					local hunger=inst.components.hunger.current/inst.components.hunger.max
					local hungerfactor=1
	
					if hunger >= .9 then
						hungerfactor=.8
					end
					if hunger < .9 and hunger >= .8 then
						hungerfactor=.85
					end
					if hunger < .8 and hunger >= .7 then
						hungerfactor=.9
					end
					if hunger < .7 and hunger >= .6 then
						hungerfactor=.95
					end
					if hunger < .6 and hunger >= .4 then
						hungerfactor=1
					end
					if hunger < .4 and hunger >= .3 then
						hungerfactor=.9
					end
					if hunger < .3 and hunger >= .2 then
						hungerfactor=.85
					end
					if hunger < .2 and hunger >= .1 then
						hungerfactor=.8
					end
					if hunger < .1 then
						hungerfactor=.75
					end
					inst.components.locomotor:SetExternalSpeedMultiplier(inst, "hardmoderunspeed", hungerfactor*health)
				else
					inst.components.locomotor:SetExternalSpeedMultiplier(inst, "hardmoderunspeed", 1)
				end
			end
		end)
	end
end)

--damage debuffs:
local Combat = require "components/combat"
local Combat_CalcDamage_base = Combat.CalcDamage
function Combat:CalcDamage(target, weapon, multiplier)
	local damage = Combat_CalcDamage_base(self, target, weapon, multiplier)
		local inst=self.inst
		if inst and inst:HasTag("player") and target ~= inst and inst.components.health and inst.components.hunger then

			local damagefactor=1
			local health=inst.components.health.currenthealth/inst.components.health.maxhealth
			local hunger=inst.components.hunger.current/inst.components.hunger.max

			if health > 0 then
				damagefactor=damagefactor*health
				if hunger > 0 then
					damagefactor=damagefactor*hunger
				else
					hunger=.01
					damagefactor=damagefactor*hunger
				end
				if damagefactor <= 0 then
					damagefactor=.01
				end
			end

			damage = damage * damagefactor
--print("Player did " .. damage .. " damage.")
		end
		if target:HasTag("player") and target.components.sanity then
			local buff=damage*.35
			damage=damage+buff
			local sanitydebuff=damage*.25
			target.components.sanity:DoDelta(-sanitydebuff)
--print(GLOBAL.ThePlayer.prefab .. " will take " .. damage .. " damage.")
		end
	return damage
end

local function spawnoffscreen(pt, radius)
	local theta = math.random() * 2 * GLOBAL.PI
	radius = radius or 40
	local offset = GLOBAL.FindWalkableOffset(pt, theta, radius, 12, true)
	if offset then
		return pt+offset
	end
end
--combat ready spawner
function spawnattacker(prefab, trytoscale, chancetoscale, trytomega, chancetomega, teleporttoinst, guy)
	teleporttoinst=teleporttoinst or false
	trytoscale=trytoscale or false
	chancetoscale=chancetoscale or 2
	trytomega=trytomega or false
	chancetomega=chancetomega or 3
	local pt = Vector3(guy.Transform:GetWorldPosition())
	local spawn_pt = spawnoffscreen(pt)
	if spawn_pt and prefab then
		local attacker = SpawnPrefab(prefab)
		if attacker and teleporttoinst==true then
			spawn_pt = Vector3(guy.Transform:GetWorldPosition())
			attacker.Physics:Teleport(spawn_pt:Get())
		end
		if attacker and attacker.Physics and attacker.components.combat then
			attacker:FacePoint(pt)
			attacker.Physics:Teleport(spawn_pt:Get())
			attacker:DoTaskInTime(1, function(attacker)
				if attacker.components.knownlocations then
					attacker.components.knownlocations.locations["home"]=Vector3(guy.Transform:GetWorldPosition())
				end
			end)
			if attacker.components.sleeper and attacker.components.sleeper.isasleep then
				attacker.components.sleeper:WakeUp()
			end
			if trytoscale==true then
				if not attacker._hardmodescale then
				    attacker._hardmodescale = GLOBAL.net_float(inst.GUID, "inst._hardmodescale", "hardmodescaledirty")
			    	attacker._hardmodescale:set_local(1)
				end
				if math.random(chancetoscale)==1 then
					local scaleamount
					local megaed
					if trytomega==true and math.random(chancetomega)==1 then
						if GLOBAL.TheWorld.ismastersim then
					    	attacker._hardmodescale:set(3)
						end
						megaed=true
					else
						scaleamount=math.random(10)*.1
						if GLOBAL.TheWorld.ismastersim then
					    	attacker._hardmodescale:set(scaleamount+1)
						end
						megaed=false
					end
--print("scale amount: " .. scaleamount)
					attacker.Transform:SetScale(attacker._hardmodescale:value(),attacker._hardmodescale:value(),attacker._hardmodescale:value())
					if attacker.components.health then
						attacker.components.health.maxhealth=attacker.components.health.maxhealth*inst._hardmodescale:value()
						attacker.components.health:DoDelta(attacker.components.health.maxhealth)
					end
					attacker.components.combat.defaultdamage=attacker.components.combat.defaultdamage*inst._hardmodescale:value()
					if megaed==true then
						attacker.components.combat.attackrange=attacker.components.combat.attackrange*2
						attacker.components.combat.hitrange=attacker.components.combat.hitrange*2
					else
						attacker.components.combat.attackrange=attacker.components.combat.attackrange*inst._hardmodescale:value()
						attacker.components.combat.hitrange=attacker.components.combat.hitrange*inst._hardmodescale:value()
					end
					if attacker.components.combat.areahitrange ~= nil then
						if megaed==true then
							attacker.components.combat.areahitrange=attacker.components.combat.areahitrange*2
						else
							attacker.components.combat.areahitrange=attacker.components.combat.areahitrange*inst._hardmodescale:value()
						end
					end
				end
			end
			attacker.components.combat:SetTarget(guy)
		end
	end
end

--hostile mob scaler
local function mobrescaler(inst, chancetoscale, trytomega, chancetomega)
	chancetoscale=chancetoscale or 2
	trytomega=trytomega or true
	chancetomega=chancetomega or 3

	if not inst._hardmodescale then
	    inst._hardmodescale = GLOBAL.net_float(inst.GUID, "inst._hardmodescale", "hardmodescaledirty")
    	inst._hardmodescale:set_local(1)
	end

	if math.random(chancetoscale)==1 then
		if GLOBAL.TheWorld.ismastersim then
			local scaleamount
			local megaed
			if trytomega==true and math.random(chancetomega)==1 then
		    	inst._hardmodescale:set(3)
				megaed=true
			else
				scaleamount=math.random(10)*.1
		    	inst._hardmodescale:set(scaleamount+1)
				megaed=false
			end
			if inst.components.health then
				inst.components.health.maxhealth=inst.components.health.maxhealth*inst._hardmodescale:value()
				inst.components.health:DoDelta(inst.components.health.maxhealth)
			end
			if inst.components.combat then
				inst.components.combat.defaultdamage=inst.components.combat.defaultdamage*inst._hardmodescale:value()
				if megaed==true then
					inst.components.combat.attackrange=inst.components.combat.attackrange*2
					inst.components.combat.hitrange=inst.components.combat.hitrange*2
				else
					inst.components.combat.attackrange=inst.components.combat.attackrange*inst._hardmodescale:value()
					inst.components.combat.hitrange=inst.components.combat.hitrange*inst._hardmodescale:value()
				end
				if inst.components.combat.areahitrange ~= nil then
					if megaed==true then
						inst.components.combat.areahitrange=inst.components.combat.areahitrange*2
					else
						inst.components.combat.areahitrange=inst.components.combat.areahitrange*inst._hardmodescale:value()
					end
				end
			end
		end
		inst.Transform:SetScale(inst._hardmodescale:value(),inst._hardmodescale:value(),inst._hardmodescale:value())
	end
end
AddPrefabPostInit("butterfly", mobrescaler)
AddPrefabPostInit("bee", mobrescaler)
AddPrefabPostInit("killerbee", mobrescaler)
AddPrefabPostInit("babybeefalo", mobrescaler)
AddPrefabPostInit("bat", mobrescaler)
AddPrefabPostInit("beefalo", mobrescaler)
AddPrefabPostInit("bishop", mobrescaler)
AddPrefabPostInit("bishop_nightmare", mobrescaler)
AddPrefabPostInit("bunnyman", mobrescaler)
AddPrefabPostInit("deerclops", mobrescaler)
AddPrefabPostInit("eyeplant", mobrescaler)
AddPrefabPostInit("foliage", mobrescaler)
AddPrefabPostInit("frog", mobrescaler)
AddPrefabPostInit("ghost", mobrescaler)
AddPrefabPostInit("hound", mobrescaler)
AddPrefabPostInit("knight", mobrescaler)
AddPrefabPostInit("knight_nightmare", mobrescaler)
AddPrefabPostInit("koalefant", mobrescaler)
AddPrefabPostInit("krampus", mobrescaler)
AddPrefabPostInit("leif", mobrescaler)
AddPrefabPostInit("lureplant", mobrescaler)
AddPrefabPostInit("merm", mobrescaler)
AddPrefabPostInit("monkey", mobrescaler)
AddPrefabPostInit("penguin", mobrescaler)
AddPrefabPostInit("perd", mobrescaler)
AddPrefabPostInit("pigman", mobrescaler)
AddPrefabPostInit("pigguard", mobrescaler)
AddPrefabPostInit("rabbit", mobrescaler)
AddPrefabPostInit("rocky", mobrescaler)
AddPrefabPostInit("rook", mobrescaler)
AddPrefabPostInit("rook_nightmare", mobrescaler)
AddPrefabPostInit("shadowcreature", mobrescaler)
AddPrefabPostInit("slurper", mobrescaler)
AddPrefabPostInit("slurtle", mobrescaler)
AddPrefabPostInit("smallbird", mobrescaler)
AddPrefabPostInit("spider", mobrescaler)
AddPrefabPostInit("spiderqueen", mobrescaler)
AddPrefabPostInit("tallbird", mobrescaler)
AddPrefabPostInit("tentacle", mobrescaler)
AddPrefabPostInit("walrus", mobrescaler)
AddPrefabPostInit("spider_spitter", mobrescaler)
AddPrefabPostInit("firehound", mobrescaler)
AddPrefabPostInit("icehound", mobrescaler)
AddPrefabPostInit("mosquito", mobrescaler)
AddPrefabPostInit("crawlinghorror", mobrescaler)
AddPrefabPostInit("terrorbeak", mobrescaler)
AddPrefabPostInit("spider_warrior", mobrescaler)
AddPrefabPostInit("teenbird", mobrescaler)
AddPrefabPostInit("crow", mobrescaler)
AddPrefabPostInit("robin", mobrescaler)
AddPrefabPostInit("robin_winter", mobrescaler)

--bleeder effect, charlie insta-kill, resurrect, hunger rate increase, hounds, bots
AddPlayerPostInit(function(inst)
	inst:ListenForEvent("oneat", function(inst)
		if math.random(4)==1 then
			if inst.components.talker then
				inst.components.talker:Say("Hounds!")
			end
--function spawnattacker(prefab, trytoscale, chancetoscale, trytomega, chancetomega, teleporttoinst, inst)
			spawnattacker("hound", false, 2, false, 4, false, inst)
		end
	end)
	inst:ListenForEvent("buildstructure", function(inst)
		if math.random(3)==1 then
			if inst.components.talker then
				inst.components.talker:Say"Destroyers!"
			end
			SpawnPrefab("poop").Transform:SetPosition(Vector3(inst.Transform:GetWorldPosition()).x,Vector3(inst.Transform:GetWorldPosition()).y,Vector3(inst.Transform:GetWorldPosition()).z)
			local temp=math.random(6)
			if temp==1 then
				spawnattacker("knight", true, 2, false, 4, false, inst)
			end
			if temp==2 then
				spawnattacker("bishop", true, 2, false, 4, false, inst)
			end
			if temp==3 then
				spawnattacker("rook", true, 2, false, 5, false, inst)
			end
			if temp==4 then
				spawnattacker("knight_nightmare", true, 2, false, 4, false, inst)
			end
			if temp==5 then
				spawnattacker("bishop_nightmare", true, 2, false, 4, false, inst)
			end
			if temp==6 then
				spawnattacker("rook_nightmare", true, 2, false, 5, false, inst)
			end
		end
	end)
	if inst and inst.components.hunger then
		local newhr=inst.components.hunger.hungerrate/4
		inst.components.hunger.hungerrate=inst.components.hunger.hungerrate+newhr
	end
	inst:ListenForEvent("attackedbygrue", function(inst)
		if inst.components.health then
			inst.components.health:DoDelta(inst.components.health.maxhealth*-2)
		end
	end)

    inst._isbleeding = GLOBAL.net_bool(inst.GUID, "player._isbleeding", "isbleedingdirty")
    inst._isbleeding:set_local(false)
    inst._isbleedingnotified = GLOBAL.net_bool(inst.GUID, "player._isbleedingnotified", "isbleedingnotifieddirty")
    inst._isbleedingnotified:set_local(false)

    if GLOBAL.TheWorld.ismastersim then
		inst:ListenForEvent("resurrect", function(inst)
			if inst.components.health then
				local temp=inst.components.health.maxhealth/3
				inst.components.health.maxhealth=inst.components.health.maxhealth-temp
				inst.components.health:DoDelta(0)
				inst._isbleeding:set(false)
			end
		end)
		inst:ListenForEvent("attacked", function(inst)
			if math.random(3)==1 and inst._isbleeding:value()==false then
				if inst.components.talker then
					inst.components.talker:Say("I'm bleeding!")
				end
				inst._isbleeding:set(true)
				inst._isbleedingnotified:set(true)
				inst:DoTaskInTime(5, function(inst)
					inst._isbleedingnotified:set(false)
				end)
			end
		end)
		inst:ListenForEvent("killed", function(inst)
			inst._isbleeding:set(false)
		end)
		inst:DoPeriodicTask(1, function(inst)
			if inst._isbleeding:value() == true then
				if inst.components.health then
					inst.components.health:DoDelta(-2)
				end
				if inst.components.sanity then
					inst.components.sanity:DoDelta(-1)
				end
			end
		end)
	else
		inst:DoPeriodicTask(5, function(inst)
			if inst._isbleeding:value() == true and inst._isbleedingnotified:value() == false then
				inst.components.talker:Say("I'm still bleeding!\nI need to heal!")
			end
		end)
	end
end)
--bleeding:stop
local Health = require "components/health"
local ddelta = Health.DoDelta
function Health:DoDelta(amount, overtime, cause, ignore_invincible)
	local asdf = ddelta(self, amount, overtime, cause, ignore_invincible)
		if self.inst and self.inst:HasTag("player") then
			if amount >= 5 and self.inst._isbleeding:value() == true then
				self.inst._isbleeding:set(false)
				if self.inst.components.talker then
					self.inst.components.talker:Say("The bleeding has stopped!")
				end
			end
		end
	return asdf
end
--resurrect and bleeding:save
local savehealth = Health.OnSave
function Health:OnSave()
	local asdf = savehealth(self)
		if self.inst and self.inst:HasTag("player") then
			return
			{
				isbleeding = self.inst._isbleeding:value(),
				maxhealth = self.maxhealth,
				health = self.currenthealth,
				penalty = self.penalty > 0 and self.penalty or nil
			}
		end
	return asdf
end
--resurrect and bleeding:load
local loadhealth = Health.OnLoad
function Health:OnLoad(data)
	local asdf = loadhealth(self, data)
		if self.inst and self.inst:HasTag("player") then
			if data.maxhealth then
				self.inst.components.health.maxhealth=data.maxhealth
				self.inst.components.health:DoDelta(0)
			end
			if data.isbleeding then
				self.inst._isbleeding:set(data.isbleeding)
			end
		end
	return asdf
end

--tree tentacle
local function treetent(inst)
	inst:ListenForEvent("workfinished", function(inst, worker)
		if math.random(3)==1 then
			if worker.worker.components.talker then
				worker.worker.components.talker:Say("He felt the vibrations!")
			end
			if worker.worker:HasTag("player") then
				worker.worker:ShakeCamera(GLOBAL.CAMERASHAKE.SIDE, .5, .05, .1, inst, 40)
			end
--function spawnattacker(prefab, trytoscale, chancetoscale, trytomega, chancetomega, teleporttoinst, inst)
			spawnattacker("tentacle", true, 2, false, 1, true, worker.worker)
		end
	end)
end
AddPrefabPostInit("evergreen", treetent)
AddPrefabPostInit("evergreen_normal", treetent)
AddPrefabPostInit("evergreen_tall", treetent)
AddPrefabPostInit("evergreen_short", treetent)
AddPrefabPostInit("evergreen_sparse", treetent)
AddPrefabPostInit("evergreen_sparse_normal", treetent)
AddPrefabPostInit("evergreen_sparse_tall", treetent)
AddPrefabPostInit("evergreen_sparse_short", treetent)
AddPrefabPostInit("deciduoustree", treetent)
AddPrefabPostInit("deciduoustree_normal", treetent)
AddPrefabPostInit("deciduoustree_tall", treetent)
AddPrefabPostInit("deciduoustree_short", treetent)
AddPrefabPostInit("deciduoustree_burnt", treetent)
AddPrefabPostInit("marsh_tree", treetent)

--spider in rock spawner
local function bolderspider(inst)
	inst:ListenForEvent("worked", function(inst, worker)
		if math.random(7)==1 then
			if worker.worker.components.talker then
				worker.worker.components.talker:Say"He was hiding under there!"
			end
			local temp=math.random(2)
			if temp == 1 then
				spawnattacker("spider_spitter", true, 2, false, 4, true, worker.worker)
			end
			if temp == 2 then
--function spawnattacker(prefab, trytoscale, chancetoscale, trytomega, chancetomega, teleporttoinst, inst)
				spawnattacker("spider_hider", true, 2, false, 4, true, worker.worker)
			end
		end
	end)
end
AddPrefabPostInit("rock1", bolderspider)
AddPrefabPostInit("rock2", bolderspider)
AddPrefabPostInit("rock_flintless", bolderspider)
AddPrefabPostInit("cave_entrance", bolderspider)

--ghost spawner
local ghostsetv = Health.SetVal
function Health:SetVal(val, cause)
	local asdf = ghostsetv(self, val, cause)
		if not self.inst.spawnedghost and self.currenthealth <= 0 and self.inst.prefab ~= "ghost" and self.inst.prefab ~= "eyeplant" and self.inst and not self.inst:HasTag("player") and math.random(2) == 1 then
			self.inst.spawnedghost=true
--function spawnattacker(prefab, trytoscale, chancetoscale, trytomega, chancetomega, teleporttoinst, inst)
			spawnattacker("ghost", false, 2, false, 4, true, self.inst)
		end
	return asdf
end

--sanity dropper
AddPlayerPostInit(function(inst)
	if inst then
		if inst.components.sanity and inst.components.sanity.dapperness then
			inst.components.sanity.dapperness = -TUNING.DAPPERNESS_HUGE
		end
	end
end)

--sanity debuffs:
--tools:
--
AddGlobalClassPostConstruct("components/tool", "Tool", function(self)
	if not self.checkersetup then
		self.checkersetup=true
		self.inst:DoPeriodicTask(0,function(inst)
			if inst and inst.components.inventoryitem and inst.components.inventoryitem.owner then
				if inst:HasTag("CHOP_tool") then
					inst.defaultaction="CHOP_tool"
				end
				if inst:HasTag("DIG_tool") then
					inst.defaultaction="DIG_tool"
				end
				if inst:HasTag("HAMMER_tool") then
					inst.defaultaction="HAMMER_tool"
				end
				if inst:HasTag("MINE_tool") then
					inst.defaultaction="MINE_tool"
				end
				if inst:HasTag("NET_tool") then
					inst.defaultaction="NET_tool"
				end
				if inst:HasTag("PLAY_tool") then
					inst.defaultaction="PLAY_tool"
				end
				local owner = inst.components.inventoryitem.owner
				if inst.defaultaction and owner and owner:HasTag("player") and owner.components.sanity and owner.components.sanity.current/owner.components.sanity.max < .55 then
					if inst:HasTag(inst.defaultaction) then
						inst:RemoveTag(inst.defaultaction)
					end
				else
					if not inst:HasTag(inst.defaultaction) then
						inst:AddTag(inst.defaultaction)
					end
				end
			end
		end)
	end
end)
--]]

--pickables:
local sayings={
	"Wait! It could be a trap!",
	"Wait... I don't think I can trust it...",
	"I can't do it now! It knows I'm here!",
	"Stop! They'll come for me!",
	"I better not... The world might flood...",
	"On second thought, I better think again...",
	"If I do this, I might end up doing it\nand then it will be done! We don't want that...",
}
local Pickable = require "components/pickable"
local mypickable = Pickable.Pick
function Pickable:Pick(picker)
	if picker and picker:HasTag("player") and picker.components.sanity then
		local sanity=picker.components.sanity.current/picker.components.sanity.max
		if sanity < .25 then
			if picker.components.talker then
				picker.components.talker:Say(sayings[math.random(#sayings)])
			end
			return
		end
	end
	return mypickable(self,picker)
end

--reset map at start of new day
AddSimPostInit(function(inst)
	local readytoclear=false
	GLOBAL.TheWorld:DoPeriodicTask(5, function(inst)
		if GLOBAL.TheWorld.state.isnight==true and readytoclear==false then
			readytoclear=true
		end
		if GLOBAL.TheWorld.state.isday==true and readytoclear==true then
			readytoclear=false
			GLOBAL.TheWorld.minimap.MiniMap:ClearRevealedAreas()
		end
	end)
end)

--nerf inventory size
AddPlayerPostInit(function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	else
		inst.components.inventory:DropEverything(false,true)
	end
end)
GLOBAL.MAXITEMSLOTS=7
AddGlobalClassPostConstruct("widgets/inventorybar", "Inv", function(self)
	local asdf = self.Refresh
	function self:Refresh()
		asdf(self)
		self.bg:SetScale(.62,1,1)
		self.bgcover:SetScale(.62,1,1)
	end
end)

AddPlayerPostInit(function(inst)
	if false then
		inst:DoPeriodicTask(.1, function(inst)
			inst.components.health:DoDelta(24)
		end)
	end
end)
--debug tools
--[[
require("debugkeys")
AddSimPostInit(function(player)
	GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_T, function(down)
		local sanitypc=GLOBAL.ThePlayer.components.sanity.max/2
		sanitypc = sanitypc-1
		GLOBAL.ThePlayer.components.sanity.current=sanitypc
		GLOBAL.ThePlayer.isbleeding = true
		GLOBAL.ThePlayer.components.health:DoDelta(-1, false, "noneya", true)
	end)
end)
AddSimPostInit(function(player)
	GLOBAL.TheInput:AddKeyDownHandler(GLOBAL.KEY_R, function(down)
		local sanitypc=GLOBAL.ThePlayer.components.sanity.max/2
		sanitypc = sanitypc+1
		GLOBAL.ThePlayer.components.sanity.current=sanitypc
		GLOBAL.ThePlayer.components.health:DoDelta(1, false, "noneya", true)
	end)
end)
--]]
