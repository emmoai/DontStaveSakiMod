-- _Q_ -- Wormhole Marks 1.0 

Assets = 
{
	Asset("ATLAS", "images/mark_1.xml"),
	Asset("ATLAS", "images/mark_2.xml"),
	Asset("ATLAS", "images/mark_3.xml"),
	Asset("ATLAS", "images/mark_4.xml"),
	Asset("ATLAS", "images/mark_5.xml"),
	Asset("ATLAS", "images/mark_6.xml"),
	Asset("ATLAS", "images/mark_7.xml"),
	Asset("ATLAS", "images/mark_8.xml"),
	Asset("ATLAS", "images/mark_9.xml"),
	Asset("ATLAS", "images/mark_10.xml"),
	Asset("ATLAS", "images/mark_11.xml"),
	Asset("ATLAS", "images/mark_12.xml"),
}

AddMinimapAtlas("images/mark_1.xml")
AddMinimapAtlas("images/mark_2.xml")
AddMinimapAtlas("images/mark_3.xml")
AddMinimapAtlas("images/mark_4.xml")
AddMinimapAtlas("images/mark_5.xml")
AddMinimapAtlas("images/mark_6.xml")
AddMinimapAtlas("images/mark_7.xml")
AddMinimapAtlas("images/mark_8.xml")
AddMinimapAtlas("images/mark_9.xml")
AddMinimapAtlas("images/mark_10.xml")
AddMinimapAtlas("images/mark_11.xml")
AddMinimapAtlas("images/mark_12.xml")

local function oncameraarrive(doer)
    doer:SnapCamera()
    doer:ScreenFade(true, 2)
end

local function ondoerarrive(doer)
    doer:Show()
    doer.DynamicShadow:Enable(true)
    doer.sg:GoToState("jumpout")
    if doer.components.sanity ~= nil then
        doer.components.sanity:DoDelta(-TUNING.SANITY_MED)
    end
end

local function ondoerwormholespit(doer)
    doer:PushEvent("wormholespit")
    doer.components.health:SetInvincible(false)
    doer.components.playercontroller:Enable(true)
end

function OnActivate_mod(inst, doer)
	if  not inst.components.wormhole_marks:CheckMark() then
		inst.components.wormhole_marks:Mark()
	end
	
	if doer:HasTag("player") then
        GLOBAL.ProfileStatsSet("wormhole_used", true)
		doer.components.health:SetInvincible(true)
		doer.components.playercontroller:Enable(false)
		
		if inst.components.teleporter.targetTeleporter ~= nil then
			GLOBAL.DeleteCloseEntsWithTag("WORM_DANGER", inst.components.teleporter.targetTeleporter, 15)
		end

        doer:Hide()
        doer.DynamicShadow:Enable(false)
        doer:ScreenFade(false)
        doer:DoTaskInTime(3, oncameraarrive)
		doer:DoTaskInTime(4, ondoerarrive)
		doer:DoTaskInTime(5, ondoerwormholespit)

	elseif doer.SoundEmitter then
		inst.SoundEmitter:PlaySound("dontstarve/common/teleportworm/swallow")
	end
end

local function OnActivateOther_mod(inst, other, doer)
	if  not other.components.wormhole_marks:CheckMark() then
		other.components.wormhole_marks:Mark()
		GLOBAL.TheWorld.components.wormhole_counter:Set()
	end
	other.sg:GoToState("open")
end

function WormholePrefabPostInit(inst)
	inst:AddComponent("wormhole_marks")
	if inst and inst.components.teleporter then
		inst.components.teleporter.onActivate = OnActivate_mod
		inst.components.teleporter.onActivateOther = OnActivateOther_mod
	end

end

AddPrefabPostInit("wormhole", WormholePrefabPostInit)

function ForestPrefabPostInit(inst)
	inst:AddComponent("wormhole_counter")
end

if GLOBAL.TheNet:GetIsServer() then
	AddPrefabPostInit("forest", ForestPrefabPostInit)
end
