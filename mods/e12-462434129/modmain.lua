if GLOBAL.TheNet and GLOBAL.TheNet:GetIsServer() then

local STRINGS_RESTART_WARNING = "你重生太频繁!"
local STRINGS_RESTART_ANNOUNCE = "重新开始!"

---------------Load Cofig
local function GetConfig(s,default)
	local c=GetModConfigData(s)
	if c==nil then
		c=default
	end
	if type(c)=="table" then
		c=c.option_data
	end
	return c
end
local Flooding_Protection = GetConfig("FLOODING_PROTECTION", true)
local Ignoring_Admin = GetConfig("IGNORING_ADMIN", true)
local Force_Drop_All = GetConfig("FORCE_DROP_ALL", false)
local Flooding_Interval = GetConfig("FLOODING_INTERVAL", 5)

---------------List Manage Function
local restartlist = {}

local function ListInsert(inst)
	if table.getn(restartlist) == 0 then
		table.insert(restartlist, inst.userid)
		return
	else
		for k,v in pairs(restartlist) do
			if v == inst.userid then
				return
			end
		end
		table.insert(restartlist, inst.userid)
	end
end

local function ListRemove(inst)
	for k,v in ipairs(restartlist) do
		if inst.userid == v then
			table.remove(restartlist, k)
			inst:RemoveTag("Restarted")
			return
		end
	end
end

---------------DodeSpawn Function
local function DodeSpawn(player)
	local id = player.userid
	if player ~= nil and player:IsValid() then
		if GLOBAL.TheWorld.ismastersim then
			if Flooding_Protection then
				ListInsert(player)
			end
			GLOBAL.TheWorld:PushEvent("ms_playerdespawnanddelete", player)
		end
	end
end

-----------------Remove restart
AddComponentPostInit("playerspawner", function(OnPlayerSpawn, inst)
	inst:ListenForEvent("ms_playerjoined", function(inst, player)
		if not Flooding_Protection then
			return
		end
		if player and player.components then
			if table.getn(restartlist) ~= 0 then
				for l,v in pairs(restartlist) do
					if player.userid == v then
						if not player:HasTag("Restarted") then
							player:AddTag("Restarted")
							player:DoTaskInTime(Flooding_Interval*60, ListRemove)
							return
						end
					end
				end
			end
		end
	end)
end)

---------------Main Function
local net_say = GLOBAL.Networking_Say
GLOBAL.Networking_Say = function(guid, userid, name, prefab, message, colour, whisper, ...)
	net_say(guid, userid, name, prefab, message, colour, whisper, ...)
	if whisper then
		if string.sub(message,1,8)=="#restart" then

---------Find the player
			for k,v in ipairs(GLOBAL.AllPlayers) do
				if v ~= nil and v.userid == userid then

---------------Flood
					if Flooding_Protection then
						if v:HasTag("Restarted") then
							if Ignoring_Admin and GLOBAL.TheNet:GetIsServerAdmin() and v and v.components and v.Network:IsServerAdmin() then
							else
								v:DoTaskInTime(0.5, function(v)
								if v.components.talker then v.components.talker:Say(v:GetDisplayName()..", "..STRINGS_RESTART_WARNING) end
								end)
								return
							end
						end
					end

---------------Drop Everything
					if #message == 10 and string.sub(message,9,10)=="_d" then
						if v and v.components and v.components.inventory then
							v.components.inventory:DropEverything(false,false)
						end
					elseif #message == 8 then
						if Force_Drop_All then
							if v and v.components and v.components.inventory then
								v.components.inventory:DropEverything(false,false)
							end
						end
					else
						return
					end

---------------Announce all Players who restart the Game
					v:DoTaskInTime(0.5, function(v)
						GLOBAL.TheNet:Announce(v:GetDisplayName().." "..STRINGS_RESTART_ANNOUNCE)
					end)

---------------Restart the Game
					v:DoTaskInTime(1, DodeSpawn)
					return
				end
			end
		end
	end
end

end
