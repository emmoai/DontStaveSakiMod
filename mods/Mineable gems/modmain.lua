_G = _G or GLOBAL
if _G.TheNet and _G.TheNet:GetIsServer() then
------------ Server side ---------------

--Safe getting/setting global variables.
local GetGlobal=function(gname,default)
	local res=_G.rawget(_G,gname)
	if default~=nil and res==nil then
		_G.rawset(_G,gname,default)
		return default
	end
	return res
end


--Locals (Add compatibility with any other mineable mods).
local mods = GetGlobal("mods",{})
local t = mods.mine or {}
mods.mine = t



--Detecting enabled mods
local mod_names	 --названия всех модов (чтобы не дергать джвижок)
local mod_names_nover --названия модов с обрезанной версией (если смысловая часть достаточно длинная)
if mods.mod_names then
	mod_names = mods.mod_names
	mod_names_nover = mods.mod_names_nover
else
	mod_names = {}
	mod_names_nover = {}
	local function GetAllModNames()
		if not (_G.KnownModIndex and _G.KnownModIndex.savedata and _G.KnownModIndex.savedata.known_mods
			and _G.ModManager and _G.ModManager.enabledmods)
		then
			return
		end
		local folders = {} --ассоциативный массив включенных модов (по папкам)
		for _,v in ipairs(_G.ModManager.enabledmods) do
			folders[v]=true
		end
		for folder, mod in pairs(_G.KnownModIndex.savedata.known_mods) do
			local name = mod.modinfo.name
			if name then
				mod_names[name]=folders[folder] and true or false
				local s=string.match(name,"^(.-)([0-9%._ ]+)$")
				if s then
					mod_names_nover[s]=name --обрезаем номер версии с конца
					--вместо true сохраняем полное имя мода (чтобы идентифицировать его в системе)
				else
					mod_names_nover[name]=name
				end
			end
		end
	end
	GetAllModNames()
	mods.mod_names = mod_names
	mods.mod_names_nover = mod_names_nover
end

--Saving work of other mods with higher priority.
local LootTables
local protected_objects --prevent deleting loot

--Function for adding new loot.
local function AddLoot(prefab,loot,value)
	--Create table if needed
	if not LootTables[prefab] then
		LootTables[prefab] = {}
	end
	--We want to protect out loot from overwriting.
	if not LootTables[prefab].protect then
		LootTables[prefab].protect = {"protect",-1}
		--Mark basic loot status
		local a = {}
		for _,v in ipairs(LootTables[prefab]) do
			a[v[1]] = true
		end
		LootTables[prefab].protect.marks = a
	end
	--Divide loot into single objects
	while value>0 do
		local val=value>1 and 1 or value
		table.insert(LootTables[prefab],{loot,val})
		value=value-val
	end
	LootTables[prefab].protect.marks[loot] = true
end


--Connect all loot mods together.
local function NewSetSharedLootTable(name, tbl)
	if not (LootTables[name] and LootTables[name].protect) then
		LootTables[name] = tbl
	else
		--Somebody is trying to hack us.... Let him import his data and prevent breaking ours.
		local a = LootTables[name]
		for i,v in ipairs(tbl) do
			if not a.protect.marks[v[1]] then
				table.insert(a, v)
			end
		end
	end
end



--Add custom loot
local function PreInitLoot()
	
	--Mineable Gems Mod
	if not t.MineableGems then
		t.MineableGems = {} --protect from two mineable gems mods at once (protect from fool users and modders)
		AddLoot('rock1','bluegem',_G.tonumber(GetModConfigData("Boulder Blue Gem")) or 0.2)
		AddLoot('rock1','purplegem',_G.tonumber(GetModConfigData("Boulder Purple Gem")) or 0.05)
	
		AddLoot('rock2','redgem',_G.tonumber(GetModConfigData("Gold Vein Red Gem")) or 0.1)
		AddLoot('rock2','purplegem',_G.tonumber(GetModConfigData("Gold Vein Purple Gem")) or 0.05)

		AddLoot('rock_flintless','bluegem',_G.tonumber(GetModConfigData("Flintless Blue Gem")) or 0.5)
		AddLoot('rock_flintless','redgem',_G.tonumber(GetModConfigData("Flintless Red Gem")) or 0.2)
		AddLoot('rock_flintless','purplegem',_G.tonumber(GetModConfigData("Flintless Purple Gem")) or 0.1)

		AddLoot('rock_flintless_med','bluegem',_G.tonumber(GetModConfigData("Flintless Blue Gem")) or 0.5)
		AddLoot('rock_flintless_med','redgem',_G.tonumber(GetModConfigData("Flintless Red Gem")) or 0.2)
		AddLoot('rock_flintless_med','purplegem',_G.tonumber(GetModConfigData("Flintless Purple Gem")) or 0.1)

		AddLoot('rock_flintless_low','bluegem',_G.tonumber(GetModConfigData("Flintless Blue Gem")) or 0.5)
		AddLoot('rock_flintless_low','redgem',_G.tonumber(GetModConfigData("Flintless Red Gem")) or 0.2)
		AddLoot('rock_flintless_low','purplegem',_G.tonumber(GetModConfigData("Flintless Purple Gem")) or 0.1)

		AddLoot('rock_moon','yellowgem',_G.tonumber(GetModConfigData("Meteor Yellow Gem")) or 0.02)
		AddLoot('rock_moon','orangegem',_G.tonumber(GetModConfigData("Meteor Orange Gem")) or 0.02)
		AddLoot('rock_moon','greengem',_G.tonumber(GetModConfigData("Meteor Green Gem")) or 0.02)
	end
end


AddPrefabPostInit("forest",function(inst)
	LootTables = GetGlobal("LootTables",{}) --i hope this is a real table
	_G.SetSharedLootTable=NewSetSharedLootTable
	PreInitLoot()
end)

---------------------END OF SERVER SIDE-------------------
end
