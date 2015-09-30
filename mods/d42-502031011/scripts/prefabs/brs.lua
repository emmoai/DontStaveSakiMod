
local MakePlayerCharacter = require "prefabs/player_common"


local assets = {

        Asset( "ANIM", "anim/brs.zip" ),
        Asset("ANIM", "anim/brs_insane.zip"),
        Asset( "ANIM", "anim/ghost_brs_build.zip" ),
        --Asset("ANIM", "anim/brs_transform.zip"),

        Asset("SOUNDPACKAGE", "sound/brs.fev"),
        Asset("SOUND", "sound/brs.fsb"),
}
local prefabs = {}

-- Custom starting items
local start_inv = {
"blackblade"

}

local foldername = KnownModIndex:GetModActualName("Black Rock Shooter")
local clothes = GetModConfigData("clothes", foldername)


local function becomenormal(inst)

    inst.AnimState:SetBuild("brs")

    --if not silent then
        if inst.strength == "insane" then
            inst.components.talker:Say("¶î.. ÎÒµÄÍ·..")
            inst.sg:PushEvent("powerdown")
            inst.SoundEmitter:PlaySound("brs/brs/detransform")
       end
    --end

    inst.talksoundoverride = nil
    inst.hurtsoundoverride = nil
    inst.strength = "normal"
end

local function becomeinsane(inst)

    inst.AnimState:SetBuild("brs_insane")

        inst.components.talker:Say("°¡°¡°¡°¡!!!")
        inst.sg:PushEvent("powerdown")
        inst.AnimState:PlayAnimation("transform", true)
        inst.SoundEmitter:PlaySound("brs/brs/transform")

    --inst.talksoundoverride = "dontstarve/characters/wolfgang/talk_large_LP"
    --inst.hurtsoundoverride = "dontstarve/characters/wolfgang/hurt_large"
    inst.strength = "insane"

    
end

local function onsanitychange(inst, phase)
    if inst.sg:HasStateTag("nomorph") or
        inst:HasTag("playerghost") or
        inst.components.health:IsDead() then
        return
    end


    if inst.strength == "insane" then
            if inst.components.sanity.current >= 80 then
                becomenormal(inst, true)
                inst:RemoveTag("monster")
                inst.components.combat.damagemultiplier = 1
                inst.components.sanity.night_drain_mult = 1.1
                inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 2.0)
                inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 2.0)
                inst.components.sanityaura.aurafn = function(inst, observer)
                    if observer:HasTag("player") and not observer:HasTag("playerghost") then
                    return 0
                    end
                return 0
                end
    
            end
    end
    if inst.strength == "normal" then
            if inst.components.sanity.current <= 40 then
                becomeinsane(inst, true)
                inst:AddTag("monster")
                inst.components.combat.damagemultiplier = 1.25
                inst.components.sanity.night_drain_mult = 1.1
                inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 2.5)
                inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 2.5)
                inst.components.sanityaura.aurafn = function(inst, observer)
                    if observer:HasTag("player") and not observer:HasTag("playerghost") then
                    return -TUNING.SANITYAURA_MED
                    end
                return 0
                end
            end
    end

end

local function onnewstate(inst)
    if inst._wasnomorph ~= inst.sg:HasStateTag("nomorph") then
        inst._wasnomorph = not inst._wasnomorph
        if not inst._wasnomorph then
            onsanitychange(inst)
        end
    end
end

-- When the character is revived from human
local function onbecamehuman(inst)
	if inst._wasnomorph == nil then
        inst.strength = "normal"
        inst._wasnomorph = inst.sg:HasStateTag("nomorph")
        inst.talksoundoverride = nil
        inst.hurtsoundoverride = nil
        inst:ListenForEvent("sanitydelta", onsanitychange)
        inst:ListenForEvent("newstate", onnewstate)
        onsanitychange(inst, nil, true)
    end
end

local function onbecameghost(inst)
    if inst._wasnomorph ~= nil then
        inst.strength = "normal"
        inst._wasnomorph = nil
        inst.talksoundoverride = nil
        inst.hurtsoundoverride = nil
        inst:RemoveEventCallback("sanitydelta", onsanitychange)
        inst:RemoveEventCallback("newstate", onnewstate)
    end
end

-- When loading or spawning the character
local function onload(inst)
    inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
    inst:ListenForEvent("ms_becameghost", onbecameghost)

    if inst:HasTag("playerghost") then
        onbecameghost(inst)
    else
        onbecamehuman(inst)
    end
end

-- This initializes for both the server and client. Tags can be added here.
local common_postinit = function(inst) 
	-- Minimap icon
	inst.MiniMapEntity:SetIcon( "brs.tex" )
	inst:AddTag("blue_shot_builder")
	inst:AddTag("rockcannon_builder")
    inst:AddTag("blackblade_builder")
    inst:AddTag("bladeclaw_builder")
    inst:AddTag("cannonlance_builder")
end

-- This initializes for the server only. Components are added here.
local master_postinit = function(inst)
    
    inst.strength = "normal"
    inst._wasnomorph = nil
    inst.talksoundoverride = nil
    inst.hurtsoundoverride = nil
	-- choose which sounds this character will play
	inst.soundsname = "willow"
	-- Uncomment if "wathgrithr"(Wigfrid) or "webber" voice is used
    --inst.talker_path_override = "dontstarve_DLC001/characters/"

    if clothes == "true" then
    inst:ListenForEvent("equip", function()
		inst.AnimState:ClearOverrideSymbol("swap_hat")
		inst.AnimState:Show("hair")
		inst.AnimState:ClearOverrideSymbol("swap_body")
		inst.AnimState:Show("body")
	end)
    end
	
	-- Stats	
	inst.components.health:SetMaxHealth(180)
	inst.components.hunger:SetMax(150)
	inst.components.sanity:SetMax(120)
    --inst.components.sanity.current = 120
	
	-- Damage multiplier (optional)
    inst.components.combat.damagemultiplier = 1
    inst.components.sanity.night_drain_mult = 1.1

    inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 2.0)
	inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 2.0)

    inst:AddComponent("sanityaura")
    
    	
	-- sanity rate (optional)
	--inst.components.sanity.sanityrate = 1 * TUNING.WILSON_sanity_RATE
    inst:WatchWorldState("phase", onsanitychange)
	
	inst.OnLoad = onload
    inst.OnNewSpawn = onload
end

return MakePlayerCharacter("brs", prefabs, assets, common_postinit, master_postinit, start_inv)
