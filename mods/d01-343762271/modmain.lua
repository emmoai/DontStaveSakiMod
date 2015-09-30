local enablechars =
{
	woodie = false,
	wes = true,
	waxwell = true,
}
for k,v in pairs(GLOBAL.DST_CHARACTERLIST) do
	if enablechars[v] then enablechars[v] = false end
end

for k,v in pairs(enablechars) do
	if v then GLOBAL.table.insert(GLOBAL.DST_CHARACTERLIST, k) end
end


-- GLOBAL.DST_CHARACTERLIST =
-- {
	-- 'wilson',
	-- 'willow',
	-- 'wendy',
	-- 'wx78',
	-- 'wickerbottom',
	-- 'wolfgang',
	-- 'woodie',
	-- 'wes',
	-- 'waxwell',
-- }
-- PrefabFiles = { 'willow', 'lighter' }

--[[ WES FIXES ]]--
local function SGWilsonGhostPostInit(sg)
	sg.states.mime.onenter = 
		function(inst)
            inst.components.locomotor:Stop()
            if not inst.AnimState:IsCurrentAnimation("idle") then
                inst.AnimState:PlayAnimation("idle", true)
            end

            if inst.talksoundoverride ~= nil then
                inst.SoundEmitter:PlaySound(inst.talksoundoverride, "talk")
            end

            inst.sg:SetTimeout(1.5 + math.random() * .5)
        end
end
local OldGetDescription = GLOBAL.GetDescription
local function GetDescription(inst, item, modifier)
	if type(inst) == "table" and inst:HasTag("mime") then return "" end
	return OldGetDescription(inst, item, modifier)
end
local OldGetString = GLOBAL.GetString
local function GetString(inst, item, modifier)
	if type(inst) == "string" and inst == "wes" then return "" end
	return OldGetString(inst, item, modifier)
end
if enablechars.wes then
	GLOBAL.GetDescription = GetDescription
	GLOBAL.GetString = GetString
	-- #rezecib looks like the ghost stategraph got fixed
	-- AddStategraphPostInit("wilsonghost", SGWilsonGhostPostInit)
end

--[[ MAXWELL FIXES ]]--

--Fixes a crash that would occur when examining Maxwell's skeleton
GLOBAL.STRINGS.NAMES.WAXWELL = GLOBAL.STRINGS.CHARACTER_NAMES.waxwell

--Fixes Wickerbottom (or modded characters with a Reader component) 
-- being able to summon Shadow Waxwells
local function WaxwellJournalPostInit(inst)
    if not GLOBAL.TheWorld.ismastersim then
        return inst
    end
	local onread = inst.components.book.onread
	local function preonread(inst, reader, ignorecosts)
		if reader.prefab ~= 'waxwell' then
			if reader.components.talker then
				reader.components.talker:Say("This tome is too arcane even for me!")
			end
			return true
		end
		onread(inst, reader, ignorecosts)
	end
    inst.components.book.onread = preonread
end

--Hopefully fixes a foreseen problem where multiple Maxwells would share penalties from each other
--Also appears to fix the problem where Maxwell wouldn't regain the sanity. idk why it does
local function SanityPostInit(self)
	function self:RecalculatePenalty()
		self.penalty = 0
		if self.inst and self.inst.components and self.inst.components.leader then
			for k,v in pairs(self.inst.components.leader.followers) do
				if k.components.sanityaura and k.components.sanityaura.penalty then
					self.penalty = self.penalty + k.components.sanityaura.penalty
				end
			end
		end
		self:DoDelta(0)
	end
end

--The respawn health penalty is capped at 3 respawns' worth. This doesn't work for Maxwell because
-- he only has 75 health, so 75 - 120 takes all of his health.
-- This overrides the penalty recalculation to also cap it at leaving you with 30 health
local function HealthPostInit(self)
	local OldRecalculatePenalty = self.RecalculatePenalty
	local function RecalculatePenalty(self, forceupdatewidget)
		local mult = GLOBAL.TUNING.REVIVE_HEALTH_PENALTY_AS_MULTIPLE_OF_EFFIGY
		mult = mult * GLOBAL.TUNING.EFFIGY_HEALTH_PENALTY
		local maxrevives = (self.maxhealth - 30)/mult
		if self.numrevives > maxrevives then
			self.numrevives = maxrevives
		end
		OldRecalculatePenalty(self, forceupdatewidget)
	end
	self.RecalculatePenalty = RecalculatePenalty
end

--Fixes sanity not being restored to non-host Maxwells after their puppets die
-- (previously it called GetPlayer())
local function ShadowWaxwellPostInit(inst)
	-- local function TryRecalcAll(inst)
		
	-- end
	inst:ListenForEvent("death", function(inst)
		inst.components.sanityaura.penalty = 0
		local player = inst.components.follower.leader
		if player then
			player.components.sanity:RecalculatePenalty()
		else
			print('more-dst-characters shadowwaxwell failsafe: recalculating all players\' sanity')
			-- if not AllPlayers then
				-- inst:DoTaskInTime(1, func
			-- else			
				for k,v in pairs(GLOBAL.AllPlayers) do
					v.components.sanity:RecalculatePenalty()
				end
			-- end
		end
	end)
end

if enablechars.waxwell then
	AddPrefabPostInit('waxwelljournal', WaxwellJournalPostInit)
	AddComponentPostInit('sanity', SanityPostInit)
	AddComponentPostInit('health', HealthPostInit)
	AddPrefabPostInit('shadowwaxwell', ShadowWaxwellPostInit)
end

--[[ WOODIE FIXES ]]--
local function LucyPostInit(inst)
	if not GLOBAL.TheWorld.ismastersim then
		inst:AddComponent("talker")
		inst.components.talker.fontsize = 28
		inst.components.talker.font = GLOBAL.TALKINGFONT
		inst.components.talker.colour = GLOBAL.Vector3(.9, .4, .4, 1)
		inst.components.talker.offset = GLOBAL.Vector3(0,0,0)
		inst.components.talker.symbol = "swap_object"
	end
end
local function SentientAxePostInit(self)
	local OldOnBeaverDelta = self.OnBeaverDelta
	local function OnBeaverDelta(inst, old, new)
		if self.owner and self.owner.components and self.owner.components.beaverness == nil then return end
		OldOnBeaverDelta(inst, old, new)
	end
	self.OnBeaverDelta = OnBeaverDelta
end
if enablechars.woodie then
	AddPrefabPostInit('lucy', LucyPostInit)
	AddComponentPostInit('sentientaxe', SentientAxePostInit)
end
--[[ MISCELLANEOUS FIXES ]]--

--TODO: Fix character-specific summoned followers on leave/rejoin (remove them?)

--unlocks all the characters
local function LobbyScreenPostConstruct(self)
	local OldOnBecomeActive = self.OnBecomeActive
	function self:OnBecomeActive()
		OldOnBecomeActive(self)
		self.profile:UnlockEverything()
		self.profile:Save()
	end
end
AddClassPostConstruct('screens/lobbyscreen', LobbyScreenPostConstruct)
