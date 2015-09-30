
local MakePlayerCharacter = require "prefabs/player_common"

local assets = {
        Asset( "ANIM", "anim/no.zip" ),
		Asset("SOUND", "sound/wendy.fsb"),
		Asset( "ANIM", "anim/ghost_no_build.zip" ),

}
local prefabs = {"abigail_flower",}




local function common_postinit(inst)
	inst:AddTag("ghostwithhat")
    inst:AddTag("ghostlyfriend")
    inst.MiniMapEntity:SetIcon("no.tex")
end
local function OnDespawn(inst)
    if inst.abigail ~= nil then
        inst.abigail.components.lootdropper:SetLoot(nil)
        inst.abigail.components.health:SetInvincible(true)
        inst.abigail:PushEvent("death")
        --in case the state graph got interrupted somehow, just force
        --removal after the dissipate animation should've finished
        inst.abigail:DoTaskInTime(25 * FRAMES, inst.abigail.Remove)
    end
end

local function OnSave(inst, data)
    if inst.abigail ~= nil then
        data.abigail = inst.abigail:GetSaveRecord()
    end
end

local function OnLoad(inst, data)
    if data.abigail ~= nil and inst.abigail == nil then
        local abigail = SpawnSaveRecord(data.abigail)
        if abigail ~= nil then
            abigail.SoundEmitter:PlaySound("dontstarve/common/ghost_spawn")
            abigail:LinkToPlayer(inst)
        end
    end
end


local function master_postinit(inst)
	
	inst.soundsname = "wendy"
	
	inst.ghostbuild = "ghost_no_build"
	
	inst.components.health:SetMaxHealth(150)
	inst.components.hunger:SetMax(150)
	inst.components.sanity:SetMax(200)
	
	inst.abigail = nil
    inst.abigail_flowers = {}

    inst.OnDespawn = OnDespawn
    inst.OnSave = OnSave
    inst.OnLoad = OnLoad

end



local start_inv = 
{
	"abigail_flower",
}


STRINGS.CHARACTER_TITLES.no = "Toujou Nozomi"
STRINGS.CHARACTER_NAMES.no = "Nozomi"
STRINGS.CHARACTER_DESCRIPTIONS.no = "*. \n Love Live School Idol"
STRINGS.CHARACTER_QUOTES.no = "\".\""

return MakePlayerCharacter("no", prefabs, assets, common_postinit, master_postinit, start_inv)
