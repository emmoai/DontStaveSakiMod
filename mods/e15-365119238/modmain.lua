
local SmarterCrockPotInterface = GetModConfigData("Interface")
GLOBAL.STRINGS.SmarterCrockPotInterface = SmarterCrockPotInterface


-- Assets = {
	-- Asset("ATLAS", "images/ui_cookpot_1x5.xml"),
	-- Asset("ATLAS", "images/ui_cookpot_1x5_controller.xml"),
-- }



modimport "modmain_segments/containerwidgetfunction.lua"
modimport "modmain_segments/containers_setup.lua"
modimport "modmain_segments/action_predict.lua"

local function SmarterCookpotInit(prefab)
	

	prefab:AddTag("SMARTERCROCKPOT")
	
	-- if GLOBAL.TheWorld.ismastersim then
    prefab:AddComponent("predicter")
    -- end
    
end

AddPrefabPostInit("cookpot", SmarterCookpotInit)


