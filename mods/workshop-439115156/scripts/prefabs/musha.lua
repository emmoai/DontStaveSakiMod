local MakePlayerCharacter = require "prefabs/player_common"

local assets = {

        Asset( "ANIM", "anim/player_basic.zip" ),
        Asset( "ANIM", "anim/player_idles_shiver.zip" ),
        Asset( "ANIM", "anim/player_actions.zip" ),
        Asset( "ANIM", "anim/player_actions_axe.zip" ),
        Asset( "ANIM", "anim/player_actions_pickaxe.zip" ),
        Asset( "ANIM", "anim/player_actions_shovel.zip" ),
        Asset( "ANIM", "anim/player_actions_blowdart.zip" ),
        Asset( "ANIM", "anim/player_actions_eat.zip" ),
        Asset( "ANIM", "anim/player_actions_item.zip" ),
        Asset( "ANIM", "anim/player_actions_uniqueitem.zip" ),
        Asset( "ANIM", "anim/player_actions_bugnet.zip" ),
        Asset( "ANIM", "anim/player_actions_fishing.zip" ),
        Asset( "ANIM", "anim/player_actions_boomerang.zip" ),
        Asset( "ANIM", "anim/player_bush_hat.zip" ),
        Asset( "ANIM", "anim/player_attacks.zip" ),
        Asset( "ANIM", "anim/player_idles.zip" ),
        Asset( "ANIM", "anim/player_rebirth.zip" ),
        Asset( "ANIM", "anim/player_jump.zip" ),
        Asset( "ANIM", "anim/player_amulet_resurrect.zip" ),
        Asset( "ANIM", "anim/player_teleport.zip" ),
        Asset( "ANIM", "anim/wilson_fx.zip" ),
        Asset( "ANIM", "anim/player_one_man_band.zip" ),
        Asset( "ANIM", "anim/shadow_hands.zip" ),
        Asset( "SOUND", "sound/sfx.fsb" ),
        Asset( "SOUND", "sound/wilson.fsb" ),
        Asset( "ANIM", "anim/beard.zip" ),

        Asset( "ANIM", "anim/musha_battle.zip" ),
        Asset( "ANIM", "anim/musha.zip" ),
        Asset( "ANIM", "anim/musha_normal.zip" ),
	Asset( "ANIM", "anim/musha_hunger.zip" ),
	Asset( "ANIM", "anim/ghost_musha_build.zip" ),

}
local prefabs = {}

local start_inv = 
{
	--"mushasword_frost",
	--"mushasword",
   --"broken_frosthammer",
    --"frosthammer",
	--"armor_mushaa",	
	--"armor_mushab",
    -- "hat_mprincess",
--	"mushasword_base",
--	"musha_flute",
	"musha_egg",
	--[["musha_egg1",
	"musha_egg2",
	"musha_egg3",
	"musha_eggs1",
	"musha_eggs2",
	"musha_eggs3",
	"musha_egg8",	]]
 --   "musha_small",

	"glowdust",
	"glowdust",
	"glowdust",
--	"cristal",

}

-----------------------------
--active skill

-- passive skills
-- critical hit
local function on_Critical_1(inst, data)
local hitcriticalchance1 = 0.15
local other = data.target
    if math.random() < hitcriticalchance1 and inst.components.hunger.current > 30 then
    SpawnPrefab("explode_small").Transform:SetPosition(other:GetPosition():Get())
	 inst.SoundEmitter:PlaySound("dontstarve/tentacle/tentacle_emerge")
	other.components.health:DoDelta(-30)
			inst:RemoveEventCallback("onhitother", on_Critical_1) end end
local function on_Critical_2(inst, data)
local hitcriticalchance2 = 0.18
local other = data.target
    if math.random() < hitcriticalchance2 and inst.components.hunger.current > 30 then
    SpawnPrefab("explode_small").Transform:SetPosition(other:GetPosition():Get())
	other.components.health:DoDelta(-34)
			inst:RemoveEventCallback("onhitother", on_Critical_2) end end 
local function on_Critical_3(inst, data)
local hitcriticalchance3 = 0.22
local other = data.target
    if math.random() < hitcriticalchance3 and inst.components.hunger.current > 30 then
    SpawnPrefab("explode_small").Transform:SetPosition(other:GetPosition():Get())
	other.components.health:DoDelta(-38)
			inst:RemoveEventCallback("onhitother", on_Critical_3) end end 
local function on_Critical_4(inst, data)	
local hitcriticalchance4 = 0.26		
local other = data.target
    if math.random() < hitcriticalchance4 and inst.components.hunger.current > 30 then
    SpawnPrefab("explode_small").Transform:SetPosition(other:GetPosition():Get())
	other.components.health:DoDelta(-42)
			inst:RemoveEventCallback("onhitother", on_Critical_4) end end 
local function on_Critical_5(inst, data)	
local hitcriticalchance5 = 0.3		
local other = data.target
    if math.random() < hitcriticalchance5 and inst.components.hunger.current > 30 then
    SpawnPrefab("explode_small").Transform:SetPosition(other:GetPosition():Get())
	other.components.health:DoDelta(-46)
			inst:RemoveEventCallback("onhitother", on_Critical_5) end end 
local function on_Critical_6(inst, data)	
local hitcriticalchance6 = 0.34		
local other = data.target
    if math.random() < hitcriticalchance6 and inst.components.hunger.current > 30 then
    SpawnPrefab("explode_small").Transform:SetPosition(other:GetPosition():Get())
	other.components.health:DoDelta(-50)
			inst:RemoveEventCallback("onhitother", on_Critical_6) end end
local function on_Critical_7(inst, data)		
local hitcriticalchance7 = 0.38	
local other = data.target
    if math.random() < hitcriticalchance7 and inst.components.hunger.current > 30 then
    SpawnPrefab("explode_small").Transform:SetPosition(other:GetPosition():Get())
	other.components.health:DoDelta(-55)
			inst:RemoveEventCallback("onhitother", on_Critical_7) end end			
	local function Critical_level_1(inst)
   	inst:ListenForEvent("onhitother", on_Critical_1) end
	local function Critical_level_2(inst)
   	inst:ListenForEvent("onhitother", on_Critical_2) end
	local function Critical_level_3(inst)
   	inst:ListenForEvent("onhitother", on_Critical_3) end
	local function Critical_level_4(inst)
   	inst:ListenForEvent("onhitother", on_Critical_4) end
	local function Critical_level_5(inst)
   	inst:ListenForEvent("onhitother", on_Critical_5) end
	local function Critical_level_6(inst)
   	inst:ListenForEvent("onhitother", on_Critical_6) end
	local function Critical_level_7(inst)
   	inst:ListenForEvent("onhitother", on_Critical_7) end


	--Electric Shield (sanity shield)
local function on_Lshield_1(inst, attacked)
   local Lshield1 = 0.2
   if math.random() < Lshield1 and inst.components.sanity.current >= 1 and inst.components.health:GetPercent() < .95 and not inst.components.health:IsDead() then
	SpawnPrefab("shock_fx").Transform:SetPosition(inst:GetPosition():Get())
	inst.SoundEmitter:PlaySound("dontstarve/common/lightningrod")
        inst.components.health:DoDelta(5)
        inst.components.sanity:DoDelta(-1)
		inst:RemoveEventCallback("attacked", on_Lshield_1)
	end end
local function on_Lshield_2(inst, attacked)
   local Lshield2 = 0.24
   if math.random() < Lshield2 and inst.components.sanity.current >= 1 and inst.components.health:GetPercent() < .96 and not inst.components.health:IsDead() then
	SpawnPrefab("shock_fx").Transform:SetPosition(inst:GetPosition():Get())
	inst.SoundEmitter:PlaySound("dontstarve/common/lightningrod")
        inst.components.health:DoDelta(7)
        inst.components.sanity:DoDelta(-1)
		inst:RemoveEventCallback("attacked", on_Lshield_2)
	end end
local function on_Lshield_3(inst, attacked)
   local Lshield3 = 0.28
   if math.random() < Lshield3 and inst.components.sanity.current >= 1 and inst.components.health:GetPercent() < .97 and not inst.components.health:IsDead() then
	SpawnPrefab("shock_fx").Transform:SetPosition(inst:GetPosition():Get())
	inst.SoundEmitter:PlaySound("dontstarve/common/lightningrod")
        inst.components.health:DoDelta(9)
        inst.components.sanity:DoDelta(-1)
		inst:RemoveEventCallback("attacked", on_Lshield_3)
	end end
local function on_Lshield_4(inst, attacked)
   local Lshield4 = 0.32
   if math.random() < Lshield4 and inst.components.sanity.current >= 1 and inst.components.health:GetPercent() < .98 and not inst.components.health:IsDead() then
	SpawnPrefab("shock_fx").Transform:SetPosition(inst:GetPosition():Get())
	inst.SoundEmitter:PlaySound("dontstarve/common/lightningrod")
        inst.components.health:DoDelta(12)
        inst.components.sanity:DoDelta(-1)
		inst:RemoveEventCallback("attacked", on_Lshield_4)
	end end	
local function on_Lshield_5(inst, attacked)
   local Lshield5 = 0.36
   if math.random() < Lshield5 and inst.components.sanity.current >= 1 and inst.components.health:GetPercent() < .98 and not inst.components.health:IsDead() then
	SpawnPrefab("shock_fx").Transform:SetPosition(inst:GetPosition():Get())
	inst.SoundEmitter:PlaySound("dontstarve/common/lightningrod")
        inst.components.health:DoDelta(15)
        inst.components.sanity:DoDelta(-1)
		inst:RemoveEventCallback("attacked", on_Lshield_5)
	end end		
    local function Lshield_level_1(inst)
    inst:ListenForEvent("attacked", on_Lshield_1)
	end
    local function Lshield_level_2(inst)
    inst:ListenForEvent("attacked", on_Lshield_2)
	end
    local function Lshield_level_3(inst)
    inst:ListenForEvent("attacked", on_Lshield_3)
	end
    local function Lshield_level_4(inst)
    inst:ListenForEvent("attacked", on_Lshield_4)
	end
	local function Lshield_level_5(inst)
    inst:ListenForEvent("attacked", on_Lshield_5)
	end	

	--auto shadow lightning strike
local function on_hitLightnings_1(inst, data)
	local other = data.target
	if other and other.components.health and not other:HasTag("wall") and not other:HasTag("structure")  then
			SpawnPrefab("statue_transition_2").Transform:SetPosition(other:GetPosition():Get())
        	SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
			other.components.health:DoDelta(-5)
inst.components.combat:SetRange(2)
inst.AnimState:SetBloomEffectHandle( "" )
inst:RemoveEventCallback("onhitother", on_hitLightnings_1)
	elseif other:HasTag("wall") or other:HasTag("structure") then
            SpawnPrefab("statue_transition_2").Transform:SetPosition(other:GetPosition():Get())
			SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
	        SpawnPrefab("collapse_small").Transform:SetPosition(other:GetPosition():Get())
		other.components.health:DoDelta(-5)
inst.components.combat:SetRange(2)
inst.AnimState:SetBloomEffectHandle( "" )
inst:RemoveEventCallback("onhitother", on_hitLightnings_1)
	end end
local function on_hitLightnings_2(inst, data)
	local other = data.target
	if other and other.components.health and not other:HasTag("wall") and not other:HasTag("structure")  then
			SpawnPrefab("statue_transition_2").Transform:SetPosition(other:GetPosition():Get())
        	SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
			other.components.health:DoDelta(-10)
inst.components.combat:SetRange(2)

inst.AnimState:SetBloomEffectHandle( "" )
inst:RemoveEventCallback("onhitother", on_hitLightnings_2)
	elseif other:HasTag("wall") or other:HasTag("structure") then
            SpawnPrefab("statue_transition_2").Transform:SetPosition(other:GetPosition():Get())
			SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
	        SpawnPrefab("collapse_small").Transform:SetPosition(other:GetPosition():Get())
		other.components.health:DoDelta(-10)
inst.components.combat:SetRange(2)
inst.AnimState:SetBloomEffectHandle( "" )
inst:RemoveEventCallback("onhitother", on_hitLightnings_2)
	end end
local function on_hitLightnings_3(inst, data)
	local other = data.target
	if other and other.components.health and not other:HasTag("wall") and not other:HasTag("structure")  then
			SpawnPrefab("statue_transition_2").Transform:SetPosition(other:GetPosition():Get())
        	SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
			other.components.health:DoDelta(-15)
inst.components.combat:SetRange(2)
inst.AnimState:SetBloomEffectHandle( "" )
inst:RemoveEventCallback("onhitother", on_hitLightnings_3)
	elseif other:HasTag("wall") or other:HasTag("structure") then
            SpawnPrefab("statue_transition_2").Transform:SetPosition(other:GetPosition():Get())
			SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
	        SpawnPrefab("collapse_small").Transform:SetPosition(other:GetPosition():Get())
		other.components.health:DoDelta(-15)
 inst.components.combat:SetRange(2)
inst.AnimState:SetBloomEffectHandle( "" )
inst:RemoveEventCallback("onhitother", on_hitLightnings_3)
	end end
local function on_hitLightnings_4(inst, data)
	local other = data.target
	if other and other.components.health and not other:HasTag("wall") and not other:HasTag("structure")  then
			SpawnPrefab("statue_transition_2").Transform:SetPosition(other:GetPosition():Get())
        	SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
			other.components.health:DoDelta(-20)
inst.components.combat:SetRange(2)
inst.AnimState:SetBloomEffectHandle( "" )
inst:RemoveEventCallback("onhitother", on_hitLightnings_4)
	elseif other:HasTag("wall") or other:HasTag("structure") then
            SpawnPrefab("statue_transition_2").Transform:SetPosition(other:GetPosition():Get())
			SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
	        SpawnPrefab("collapse_small").Transform:SetPosition(other:GetPosition():Get())
		other.components.health:DoDelta(-20)
 inst.components.combat:SetRange(2)
inst.AnimState:SetBloomEffectHandle( "" )
inst:RemoveEventCallback("onhitother", on_hitLightnings_4)
	end 
	end
local function on_hitLightnings_5(inst, data)
	local other = data.target
	if other and other.components.health and not other:HasTag("wall") and not other:HasTag("structure")  then
			SpawnPrefab("statue_transition_2").Transform:SetPosition(other:GetPosition():Get())
        	SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
			other.components.health:DoDelta(-25)
inst.components.combat:SetRange(2)
inst.AnimState:SetBloomEffectHandle( "" )
inst:RemoveEventCallback("onhitother", on_hitLightnings_5)
	elseif other:HasTag("wall") or other:HasTag("structure") then
            SpawnPrefab("statue_transition_2").Transform:SetPosition(other:GetPosition():Get())
			SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
	        SpawnPrefab("collapse_small").Transform:SetPosition(other:GetPosition():Get())
		other.components.health:DoDelta(-25)
 inst.components.combat:SetRange(2)
inst.AnimState:SetBloomEffectHandle( "" )
inst:RemoveEventCallback("onhitother", on_hitLightnings_5)
	end 
	end
local function on_hitLightnings_6(inst, data)
	local other = data.target
	if other and other.components.health and not other:HasTag("wall") and not other:HasTag("structure")  then
			SpawnPrefab("statue_transition_2").Transform:SetPosition(other:GetPosition():Get())
        	SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
			other.components.health:DoDelta(-30)
inst.components.combat:SetRange(2)
inst.AnimState:SetBloomEffectHandle( "" )
inst:RemoveEventCallback("onhitother", on_hitLightnings_6)
	elseif other:HasTag("wall") or other:HasTag("structure") then
            SpawnPrefab("statue_transition_2").Transform:SetPosition(other:GetPosition():Get())
			SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
	        SpawnPrefab("collapse_small").Transform:SetPosition(other:GetPosition():Get())
		other.components.health:DoDelta(-30)
 inst.components.combat:SetRange(2)
inst.AnimState:SetBloomEffectHandle( "" )
inst:RemoveEventCallback("onhitother", on_hitLightnings_6)
	end 
	end
local function on_hitLightnings_7(inst, data)
	local other = data.target
	if other and other.components.health and not other:HasTag("wall") and not other:HasTag("structure")  then
			SpawnPrefab("statue_transition_2").Transform:SetPosition(other:GetPosition():Get())
        	SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
			other.components.health:DoDelta(-35)
inst.components.combat:SetRange(2)
inst.AnimState:SetBloomEffectHandle( "" )
inst:RemoveEventCallback("onhitother", on_hitLightnings_7)
	elseif other:HasTag("wall") or other:HasTag("structure") then
            SpawnPrefab("statue_transition_2").Transform:SetPosition(other:GetPosition():Get())
			SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
	        SpawnPrefab("collapse_small").Transform:SetPosition(other:GetPosition():Get())
		other.components.health:DoDelta(-35)
 inst.components.combat:SetRange(2)
inst.AnimState:SetBloomEffectHandle( "" )
inst:RemoveEventCallback("onhitother", on_hitLightnings_7)
	end 
	end
local function on_hitLightnings_8(inst, data)
	local other = data.target
	if other and other.components.health and not other:HasTag("wall") and not other:HasTag("structure")  then
			SpawnPrefab("statue_transition_2").Transform:SetPosition(other:GetPosition():Get())
        	SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
			other.components.health:DoDelta(-40)
inst.components.combat:SetRange(2)
inst.AnimState:SetBloomEffectHandle( "" )
inst:RemoveEventCallback("onhitother", on_hitLightnings_8)
	elseif other:HasTag("wall") or other:HasTag("structure") then
            SpawnPrefab("statue_transition_2").Transform:SetPosition(other:GetPosition():Get())
			SpawnPrefab("shock_fx").Transform:SetPosition(other:GetPosition():Get())
	        SpawnPrefab("collapse_small").Transform:SetPosition(other:GetPosition():Get())
		other.components.health:DoDelta(-40)
 inst.components.combat:SetRange(2)
inst.AnimState:SetBloomEffectHandle( "" )
inst:RemoveEventCallback("onhitother", on_hitLightnings_8)
	end 
	end
	
  local function Lightnings_level_1(inst)
    inst:ListenForEvent("onhitother", on_hitLightnings_1)
	inst.components.combat:SetRange(9)	end
  local function Lightnings_level_2(inst)
    inst:ListenForEvent("onhitother", on_hitLightnings_2)
	inst.components.combat:SetRange(9)	end
  local function Lightnings_level_3(inst)
    inst:ListenForEvent("onhitother", on_hitLightnings_3)
	inst.components.combat:SetRange(9)	end
  local function Lightnings_level_4(inst)
    inst:ListenForEvent("onhitother", on_hitLightnings_4)
	inst.components.combat:SetRange(9)	end
 local function Lightnings_level_5(inst)
    inst:ListenForEvent("onhitother", on_hitLightnings_5)
	inst.components.combat:SetRange(9)	end
 local function Lightnings_level_6(inst)
    inst:ListenForEvent("onhitother", on_hitLightnings_6)
	inst.components.combat:SetRange(9)	end
 local function Lightnings_level_7(inst)
    inst:ListenForEvent("onhitother", on_hitLightnings_7)
	inst.components.combat:SetRange(9)	end
 local function Lightnings_level_8(inst)
    inst:ListenForEvent("onhitother", on_hitLightnings_8)
	inst.components.combat:SetRange(9)	end

	-- valkyrie armor 
		------------------    
	local function On_frameshield_1(attacked, data) -- 
        if data.attacker.components.burnable and data.attacker.components.health and data.attacker.components.burnable and not data.attacker:HasTag("thorny") and not data.attacker:HasTag("gruef") then
            data.attacker.components.health:DoDelta(-12)
            data.attacker.components.burnable:Ignite()
		end
    if data.attacker.components.burnable and data.attacker.components.burnable:IsBurning() then
        data.attacker.components.burnable:Extinguish()
        end end
	local function On_frameshield_2(attacked, data)  --
        if data.attacker.components.burnable and data.attacker.components.health and data.attacker.components.burnable and not data.attacker:HasTag("thorny") and not data.attacker:HasTag("gruef") then
            data.attacker.components.health:DoDelta(-18)
            data.attacker.components.burnable:Ignite()
		end
    if data.attacker.components.burnable and data.attacker.components.burnable:IsBurning() then
        data.attacker.components.burnable:Extinguish()
        end end
	local function On_frameshield_3(attacked, data)  --
        if data.attacker.components.burnable and data.attacker.components.health and data.attacker.components.burnable and not data.attacker:HasTag("thorny") and not data.attacker:HasTag("gruef") then
            data.attacker.components.health:DoDelta(-24)
            data.attacker.components.burnable:Ignite()
		end
    if data.attacker.components.burnable and data.attacker.components.burnable:IsBurning() then
        data.attacker.components.burnable:Extinguish()
        end end
	local function On_frameshield_4(attacked, data)  --
        if data.attacker.components.burnable and data.attacker.components.health and data.attacker.components.burnable and not data.attacker:HasTag("thorny") and not data.attacker:HasTag("gruef") then
            data.attacker.components.health:DoDelta(-30)
            data.attacker.components.burnable:Ignite()
		end
    if data.attacker.components.burnable and data.attacker.components.burnable:IsBurning() then
        data.attacker.components.burnable:Extinguish()
        end end
		
	   local function frameshield_1(inst)
	inst:ListenForEvent("attacked", On_frameshield_1)
	end
	   local function frameshield_2(inst)
	inst:ListenForEvent("attacked", On_frameshield_2)
	end
	   local function frameshield_3(inst)
	inst:ListenForEvent("attacked", On_frameshield_3)
	end
	   local function frameshield_4(inst)
	inst:ListenForEvent("attacked", On_frameshield_4)
	end
	
	local Lightningo = .15
    local function on_Valkyrie_1(inst, attacked, data)
	
	if inst.components.hunger.current > 30 and math.random() < Lightningo and not inst.components.health:IsDead() then
	inst.strength = "valkyrie"
	inst.deactive_valkyrie = true
		inst.components.talker:Say("Valkyrie !")
		inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")
		SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
		--inst.components.health:SetAbsorptionAmount(0)
			scheduler:ExecuteInTime(7, function() SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get()) inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")
			inst:RemoveEventCallback("onhitother", on_hitLightnings_1)	
			inst:RemoveEventCallback("attacked", On_frameshield_1)		
			if inst.components.hunger.current >= 160 then
			inst.strength = "full"
			inst.components.combat:SetRange(2)
			--inst.AnimState:SetBuild("musha") 
			elseif inst.components.hunger.current < 160 and inst.components.hunger.current >= 30 then
			inst.components.combat:SetRange(2)
			inst.strength = "normal"
			elseif inst.components.hunger.current < 30 then
			inst.components.combat:SetRange(2)
			inst.strength = "berserk"
			end inst.deactive_valkyrie = false end)
			inst:RemoveEventCallback("attacked", on_Valkyrie_1)
			inst:RemoveEventCallback("onhitother", on_Valkyrie_1)
			     end 
				 end
	
    local function on_Valkyrie_2(inst, attacked, data)  
	
	if inst.components.hunger.current > 30 and math.random() < Lightningo and not inst.components.health:IsDead() then
	inst.strength = "valkyrie"
	inst.deactive_valkyrie = true
		inst.components.talker:Say("Valkyrie !")
		--inst.components.health:StartRegen(1, 1)
		inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")
		inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) 
		SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
		Lightnings_level_1(inst)
		--frameshield_1(inst)
		--inst.components.health:SetAbsorptionAmount(0)
			scheduler:ExecuteInTime(4, function() SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())  
			inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )  inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear") 
			Lightnings_level_1(inst) end)
			scheduler:ExecuteInTime(7, function() SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get()) inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")
			 inst.AnimState:SetBloomEffectHandle( "" )
			--inst.components.health:SetAbsorptionAmount(0)
			inst:RemoveEventCallback("onhitother", on_hitLightnings_1)	
			--inst:RemoveEventCallback("attacked", On_frameshield_1)		
			if inst.components.hunger.current >= 160 then
			inst.strength = "full"
			inst.components.combat:SetRange(2)
			--inst.AnimState:SetBuild("musha") 
			inst.components.health:StartRegen(0, 0)
			elseif inst.components.hunger.current < 160 and inst.components.hunger.current >= 30 then
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			inst.strength = "normal"
			elseif inst.components.hunger.current < 30 then
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)			
			inst.strength = "berserk"
			end inst.deactive_valkyrie = false end)
			inst:RemoveEventCallback("attacked", on_Valkyrie_2)
			inst:RemoveEventCallback("onhitother", on_Valkyrie_2)
			     end 
				 end
   local function on_Valkyrie_3(inst, attacked, data)  
	
	if inst.components.hunger.current > 30 and math.random() < Lightningo and not inst.components.health:IsDead() then
	inst.strength = "valkyrie"
	inst.deactive_valkyrie = true
		inst.components.talker:Say("Valkyrie !")
		inst.components.health:StartRegen(1, 6)
		inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")
		inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) 
		SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
		Lightnings_level_1(inst)
		frameshield_1(inst)
		--inst.components.health:SetAbsorptionAmount(0.15)
			scheduler:ExecuteInTime(4, function() SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())  
			inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )  inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear") 
			Lightnings_level_1(inst) end)
			scheduler:ExecuteInTime(9, function() SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get()) inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")
			 inst.AnimState:SetBloomEffectHandle( "" )
			--inst.components.health:SetAbsorptionAmount(0)
			inst:RemoveEventCallback("onhitother", on_hitLightnings_1)	
			inst:RemoveEventCallback("attacked", On_frameshield_1)		
			if inst.components.hunger.current >= 160 then
			inst.strength = "full"
			inst.components.combat:SetRange(2)
			--inst.AnimState:SetBuild("musha") 
			elseif inst.components.hunger.current < 160 and inst.components.hunger.current >= 30 then
			inst.components.combat:SetRange(2)
			inst.strength = "normal"
			elseif inst.components.hunger.current < 30 then
			inst.components.combat:SetRange(2)
			inst.strength = "berserk"
			end inst.deactive_valkyrie = false end)
			inst:RemoveEventCallback("attacked", on_Valkyrie_3)
			inst:RemoveEventCallback("onhitother", on_Valkyrie_3)
			     end 
				 end
  local function on_Valkyrie_4(inst, attacked, data)  
	
	if inst.components.hunger.current > 30 and math.random() < Lightningo and not inst.components.health:IsDead() then
	inst.strength = "valkyrie"
	inst.deactive_valkyrie = true
		inst.components.talker:Say("Valkyrie !")
		inst.components.health:StartRegen(1, 6)
		inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")
		inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) 
		SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
		Lightnings_level_2(inst)
		frameshield_1(inst)
		--inst.components.health:SetAbsorptionAmount(0.15)
			scheduler:ExecuteInTime(4, function() SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())  
			inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )  inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear") 
			Lightnings_level_2(inst) end)
			scheduler:ExecuteInTime(9, function() SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get()) inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")
			 inst.AnimState:SetBloomEffectHandle( "" )
			--inst.components.health:SetAbsorptionAmount(0)
			inst:RemoveEventCallback("onhitother", on_hitLightnings_2)	
			inst:RemoveEventCallback("attacked", On_frameshield_1)		
			if inst.components.hunger.current >= 160 then
			inst.strength = "full"
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			--inst.AnimState:SetBuild("musha") 
			elseif inst.components.hunger.current < 160 and inst.components.hunger.current >= 30 then
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			inst.strength = "normal"
			elseif inst.components.hunger.current < 30 then
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			inst.strength = "berserk"
			end inst.deactive_valkyrie = false end)
			inst:RemoveEventCallback("attacked", on_Valkyrie_4)
			inst:RemoveEventCallback("onhitother", on_Valkyrie_4)
			     end 
				 end
  local function on_Valkyrie_5(inst, attacked, data)  
	
	if inst.components.hunger.current > 30 and math.random() < Lightningo and not inst.components.health:IsDead() then
	inst.strength = "valkyrie"
	inst.deactive_valkyrie = true
		inst.components.talker:Say("Valkyrie !")
		inst.components.health:StartRegen(1, 3)
		inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")
		inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) 
		SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
		Lightnings_level_2(inst)
		frameshield_2(inst)
		--inst.components.health:SetAbsorptionAmount(0.3)
			scheduler:ExecuteInTime(4, function() SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())  
			inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )  inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear") 
			Lightnings_level_2(inst) end)
			scheduler:ExecuteInTime(10, function() SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get()) inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")
			 inst.AnimState:SetBloomEffectHandle( "" )
			--inst.components.health:SetAbsorptionAmount(0)
			inst:RemoveEventCallback("onhitother", on_hitLightnings_2)	
			inst:RemoveEventCallback("attacked", On_frameshield_2)		
			if inst.components.hunger.current >= 160 then
			inst.strength = "full"
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			--inst.AnimState:SetBuild("musha") 
			elseif inst.components.hunger.current < 160 and inst.components.hunger.current >= 30 then
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			inst.strength = "normal"
			elseif inst.components.hunger.current < 30 then
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			inst.strength = "berserk"
			end inst.deactive_valkyrie = false end)
			inst:RemoveEventCallback("attacked", on_Valkyrie_5)
			inst:RemoveEventCallback("onhitother", on_Valkyrie_5)
			     end 
				 end
 local function on_Valkyrie_6(inst, attacked, data)  
	
	if inst.components.hunger.current > 30 and math.random() < Lightningo and not inst.components.health:IsDead() then
	inst.strength = "valkyrie"
	inst.deactive_valkyrie = true
		inst.components.talker:Say("Valkyrie !")
		inst.components.health:StartRegen(1, 3)
		inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")
		inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) 
		SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
		Lightnings_level_3(inst)
		frameshield_2(inst)
		--inst.components.health:SetAbsorptionAmount(0.3)
			scheduler:ExecuteInTime(4, function() SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())  
			inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )  inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear") 
			Lightnings_level_2(inst) end)
			scheduler:ExecuteInTime(10, function() SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get()) inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")
			 inst.AnimState:SetBloomEffectHandle( "" )
			--inst.components.health:SetAbsorptionAmount(0)
			inst:RemoveEventCallback("onhitother", on_hitLightnings_3)	
			inst:RemoveEventCallback("attacked", On_frameshield_2)		
			if inst.components.hunger.current >= 160 then
			inst.strength = "full"
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			--inst.AnimState:SetBuild("musha") 
			elseif inst.components.hunger.current < 160 and inst.components.hunger.current >= 30 then
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			inst.strength = "normal"
			elseif inst.components.hunger.current < 30 then
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			inst.strength = "berserk"
			end inst.deactive_valkyrie = false end)
			inst:RemoveEventCallback("attacked", on_Valkyrie_6)
			inst:RemoveEventCallback("onhitother", on_Valkyrie_6)
			     end 
				 end
 local function on_Valkyrie_7(inst, attacked, data)  
	
	if inst.components.hunger.current > 30 and math.random() < Lightningo and not inst.components.health:IsDead() then
	inst.strength = "valkyrie"
	inst.deactive_valkyrie = true
		inst.components.talker:Say("Valkyrie !")
		inst.components.health:StartRegen(1, 3)
		inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")
		inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) 
		SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
		Lightnings_level_3(inst)
		frameshield_3(inst)
		--inst.components.health:SetAbsorptionAmount(0.45)
			scheduler:ExecuteInTime(4, function() SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())  
			inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )  inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear") 
			Lightnings_level_3(inst) end)
			scheduler:ExecuteInTime(11, function() SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get()) inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")
			 inst.AnimState:SetBloomEffectHandle( "" )
			--inst.components.health:SetAbsorptionAmount(0)
			inst:RemoveEventCallback("onhitother", on_hitLightnings_3)	
			inst:RemoveEventCallback("attacked", On_frameshield_3)		
			if inst.components.hunger.current >= 160 then
			inst.strength = "full"
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			--inst.AnimState:SetBuild("musha") 
			elseif inst.components.hunger.current < 160 and inst.components.hunger.current >= 30 then
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			inst.strength = "normal"
			elseif inst.components.hunger.current < 30 then
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			inst.strength = "berserk"
			end inst.deactive_valkyrie = false end)
			inst:RemoveEventCallback("attacked", on_Valkyrie_7)
			inst:RemoveEventCallback("onhitother", on_Valkyrie_7)
			     end 
				 end
 local function on_Valkyrie_8(inst, attacked, data)  
	
	if inst.components.hunger.current > 30 and math.random() < Lightningo and not inst.components.health:IsDead() then
	inst.strength = "valkyrie"
	inst.deactive_valkyrie = true
		inst.components.talker:Say("Valkyrie !")
		inst.components.health:StartRegen(1, 3)
		inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")
		inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) 
		SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
		Lightnings_level_4(inst) 
		frameshield_3(inst)
		--inst.components.health:SetAbsorptionAmount(0.45)
			scheduler:ExecuteInTime(4, function() SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())  
			inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )  inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear") 
			Lightnings_level_4(inst) end)
			scheduler:ExecuteInTime(11, function() SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get()) inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")
			 inst.AnimState:SetBloomEffectHandle( "" )
			--inst.components.health:SetAbsorptionAmount(0)
			inst:RemoveEventCallback("onhitother", on_hitLightnings_4)	
			inst:RemoveEventCallback("attacked", On_frameshield_3)		
			if inst.components.hunger.current >= 160 then
			inst.strength = "full"
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			--inst.AnimState:SetBuild("musha") 
			elseif inst.components.hunger.current < 160 and inst.components.hunger.current >= 30 then
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			inst.strength = "normal"
			elseif inst.components.hunger.current < 30 then
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			inst.strength = "berserk"
			end inst.deactive_valkyrie = false end)
			inst:RemoveEventCallback("attacked", on_Valkyrie_8)
			inst:RemoveEventCallback("onhitother", on_Valkyrie_8)
			     end 
				 end
 local function on_Valkyrie_9(inst, attacked, data)  
	
	if inst.components.hunger.current > 30 and math.random() < Lightningo and not inst.components.health:IsDead() then
	inst.strength = "valkyrie"
	inst.deactive_valkyrie = true
		inst.components.talker:Say("Valkyrie !")
		inst.components.health:StartRegen(1, 3)
		inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")
		inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) 
		SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
		Lightnings_level_4(inst)
		frameshield_4(inst)
		--inst.components.health:SetAbsorptionAmount(0.6)
			scheduler:ExecuteInTime(4, function() SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())  
			inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )  inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear") 
			Lightnings_level_4(inst) end)
			scheduler:ExecuteInTime(12, function() SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get()) inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")
			 inst.AnimState:SetBloomEffectHandle( "" )
			--inst.components.health:SetAbsorptionAmount(0)
			inst:RemoveEventCallback("onhitother", on_hitLightnings_4)	
			inst:RemoveEventCallback("attacked", On_frameshield_4)		
			if inst.components.hunger.current >= 160 then
			inst.strength = "full"
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			--inst.AnimState:SetBuild("musha") 
			elseif inst.components.hunger.current < 160 and inst.components.hunger.current >= 30 then
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			inst.strength = "normal"
			elseif inst.components.hunger.current < 30 then
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			inst.strength = "berserk"
			end inst.deactive_valkyrie = false end)
			inst:RemoveEventCallback("attacked", on_Valkyrie_9)
			inst:RemoveEventCallback("onhitother", on_Valkyrie_9)
			     end 
				 end
 local function on_Valkyrie_10(inst, attacked, data)  
	
	if inst.components.hunger.current > 30 and math.random() < Lightningo and not inst.components.health:IsDead() then
	inst.strength = "valkyrie"
	inst.deactive_valkyrie = true
		inst.components.talker:Say("Valkyrie !")
		inst.components.health:StartRegen(1, 3)
		inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")
		inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) 
		SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
		Lightnings_level_5(inst)
		frameshield_4(inst)
		--inst.components.health:SetAbsorptionAmount(0.6)
			scheduler:ExecuteInTime(4, function() SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())  
			inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )  inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear") 
			Lightnings_level_5(inst) end)
			scheduler:ExecuteInTime(12, function() SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get()) inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")
			 inst.AnimState:SetBloomEffectHandle( "" )
			--inst.components.health:SetAbsorptionAmount(0)
			inst:RemoveEventCallback("onhitother", on_hitLightnings_5)	
			inst:RemoveEventCallback("attacked", On_frameshield_4)		
			if inst.components.hunger.current >= 160 then
			inst.strength = "full"
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			--inst.AnimState:SetBuild("musha") 
			elseif inst.components.hunger.current < 160 and inst.components.hunger.current >= 30 then
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			inst.strength = "normal"
			elseif inst.components.hunger.current < 30 then
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			inst.strength = "berserk"
			end inst.deactive_valkyrie = false end)
			inst:RemoveEventCallback("attacked", on_Valkyrie_10)
			inst:RemoveEventCallback("onhitother", on_Valkyrie_10)
			     end 
				 end
local function on_Valkyrie_11(inst, attacked, data)  
	
	if inst.components.hunger.current > 30 and math.random() < Lightningo and not inst.components.health:IsDead() then
	inst.strength = "valkyrie"
	inst.deactive_valkyrie = true
		inst.components.talker:Say("Valkyrie !")
		inst.components.health:StartRegen(1, 3)
		inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")
		inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) 
		SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
		Lightnings_level_6(inst)
		frameshield_4(inst)
		--inst.components.health:SetAbsorptionAmount(0.6)
			scheduler:ExecuteInTime(4, function() SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())  
			inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )  inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear") 
			Lightnings_level_6(inst) end)
			scheduler:ExecuteInTime(12, function() SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get()) inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")
			 inst.AnimState:SetBloomEffectHandle( "" )
			--inst.components.health:SetAbsorptionAmount(0)
			inst:RemoveEventCallback("onhitother", on_hitLightnings_6)	
			inst:RemoveEventCallback("attacked", On_frameshield_4)		
			if inst.components.hunger.current >= 160 then
			inst.strength = "full"
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			--inst.AnimState:SetBuild("musha") 
			elseif inst.components.hunger.current < 160 and inst.components.hunger.current >= 30 then
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			inst.strength = "normal"
			elseif inst.components.hunger.current < 30 then
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			inst.strength = "berserk"
			end inst.deactive_valkyrie = false end)
			inst:RemoveEventCallback("attacked", on_Valkyrie_11)
			inst:RemoveEventCallback("onhitother", on_Valkyrie_11)
			     end 
				 end
local function on_Valkyrie_12(inst, attacked, data)  
	
	if inst.components.hunger.current > 30 and math.random() < Lightningo and not inst.components.health:IsDead() then
	inst.strength = "valkyrie"
	inst.deactive_valkyrie = true
		inst.components.talker:Say("Valkyrie !")
		inst.components.health:StartRegen(1, 3)
		inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")
		inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) 
		SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
		Lightnings_level_7(inst)
		frameshield_4(inst)
		--inst.components.health:SetAbsorptionAmount(0.6)
			scheduler:ExecuteInTime(4, function() SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())  
			inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )  inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear") 
			Lightnings_level_7(inst) end)
			scheduler:ExecuteInTime(12, function() SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get()) inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")
			 inst.AnimState:SetBloomEffectHandle( "" )
			--inst.components.health:SetAbsorptionAmount(0)
			inst:RemoveEventCallback("onhitother", on_hitLightnings_7)	
			inst:RemoveEventCallback("attacked", On_frameshield_4)		
			if inst.components.hunger.current >= 160 then
			inst.strength = "full"
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			--inst.AnimState:SetBuild("musha") 
			elseif inst.components.hunger.current < 160 and inst.components.hunger.current >= 30 then
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			inst.strength = "normal"
			elseif inst.components.hunger.current < 30 then
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			inst.strength = "berserk"
			end inst.deactive_valkyrie = false end)
			inst:RemoveEventCallback("attacked", on_Valkyrie_12)
			inst:RemoveEventCallback("onhitother", on_Valkyrie_12)
			     end 
				 end
local function on_Valkyrie_13(inst, attacked, data)  
	
	if inst.components.hunger.current > 30 and math.random() < Lightningo and not inst.components.health:IsDead() then
	inst.strength = "valkyrie" 
	inst.deactive_valkyrie = true
		inst.components.talker:Say("Valkyrie !")
		inst.components.health:StartRegen(1, 3)
		inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")
		inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) 
		SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
		Lightnings_level_8(inst)
		frameshield_4(inst)
		--inst.components.health:SetAbsorptionAmount(0.6)
			scheduler:ExecuteInTime(4, function() SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())  
			inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )  inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear") 
			Lightnings_level_8(inst) end)
			scheduler:ExecuteInTime(12, function() SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get()) inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")
			 inst.AnimState:SetBloomEffectHandle( "" )
			--inst.components.health:SetAbsorptionAmount(0)
			inst:RemoveEventCallback("onhitother", on_hitLightnings_8)	
			inst:RemoveEventCallback("attacked", On_frameshield_4)		
			if inst.components.hunger.current >= 160 then
			inst.strength = "full"
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			--inst.AnimState:SetBuild("musha") 
			elseif inst.components.hunger.current < 160 and inst.components.hunger.current >= 30 then
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			inst.strength = "normal"
			elseif inst.components.hunger.current < 30 then
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			inst.strength = "berserk"
			end inst.deactive_valkyrie = false end)
			inst:RemoveEventCallback("attacked", on_Valkyrie_13)
			inst:RemoveEventCallback("onhitother", on_Valkyrie_13)
			     end 
				 end
local function on_Valkyrie_14(inst, attacked, data)  
	
	if inst.components.hunger.current > 30 and math.random() < Lightningo and not inst.components.health:IsDead() then
	inst.strength = "valkyrie"
	inst.deactive_valkyrie = true
		inst.components.talker:Say("Valkyrie !")
		inst.components.health:StartRegen(1, 3)
		inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear")
		inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" ) 
		SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())
		Lightnings_level_8(inst)
		frameshield_4(inst)
		--inst.components.health:SetAbsorptionAmount(0.6)
			scheduler:ExecuteInTime(4, function() SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get())  
			inst.AnimState:SetBloomEffectHandle( "shaders/anim.ksh" )  inst.SoundEmitter:PlaySound("dontstarve/maxwell/shadowmax_appear") 
			Lightnings_level_8(inst) end)
			scheduler:ExecuteInTime(22, function() SpawnPrefab("sparks").Transform:SetPosition(inst:GetPosition():Get()) inst.SoundEmitter:PlaySound("dontstarve/common/fireOut")
			 inst.AnimState:SetBloomEffectHandle( "" )
			--inst.components.health:SetAbsorptionAmount(0)
			inst:RemoveEventCallback("onhitother", on_hitLightnings_8)	
			inst:RemoveEventCallback("attacked", On_frameshield_4)		
			if inst.components.hunger.current >= 160 then
			inst.strength = "full"
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			--inst.AnimState:SetBuild("musha") 
			elseif inst.components.hunger.current < 160 and inst.components.hunger.current >= 30 then
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			inst.strength = "normal"
			elseif inst.components.hunger.current < 30 then
			inst.components.combat:SetRange(2)
			inst.components.health:StartRegen(0, 0)
			inst.strength = "berserk"
			end inst.deactive_valkyrie = false end)
			inst:RemoveEventCallback("attacked", on_Valkyrie_14)
			inst:RemoveEventCallback("onhitother", on_Valkyrie_14)
			     end 
				 end
				 
    local function Valkyrie_level_1(inst)
	if inst.components.hunger.current >= 30 and not inst.deactive_valkyrie then
	inst:ListenForEvent("attacked", on_Valkyrie_1)
	inst:ListenForEvent("onhitother", on_Valkyrie_1)
		end end
   local function Valkyrie_level_2(inst)
	if inst.components.hunger.current >= 30 and not inst.deactive_valkyrie then
	inst:ListenForEvent("attacked", on_Valkyrie_2)
	inst:ListenForEvent("onhitother", on_Valkyrie_2)
		end end	
   local function Valkyrie_level_3(inst)
	if inst.components.hunger.current >= 30 and not inst.deactive_valkyrie then
	inst:ListenForEvent("attacked", on_Valkyrie_3)
	inst:ListenForEvent("onhitother", on_Valkyrie_3)
		end end	
		   local function Valkyrie_level_4(inst)
	if inst.components.hunger.current >= 30 and not inst.deactive_valkyrie then
	inst:ListenForEvent("attacked", on_Valkyrie_4)
	inst:ListenForEvent("onhitother", on_Valkyrie_4)
		end end	
		   local function Valkyrie_level_5(inst)
	if inst.components.hunger.current >= 30 and not inst.deactive_valkyrie then
	inst:ListenForEvent("attacked", on_Valkyrie_5)
	inst:ListenForEvent("onhitother", on_Valkyrie_5)
		end end	
		   local function Valkyrie_level_6(inst)
	if inst.components.hunger.current >= 30 and not inst.deactive_valkyrie then
	inst:ListenForEvent("attacked", on_Valkyrie_6)
	inst:ListenForEvent("onhitother", on_Valkyrie_6)
		end end	
		   local function Valkyrie_level_7(inst)
	if inst.components.hunger.current >= 30 and not inst.deactive_valkyrie then
	inst:ListenForEvent("attacked", on_Valkyrie_7)
	inst:ListenForEvent("onhitother", on_Valkyrie_7)
		end end	
		   local function Valkyrie_level_8(inst)
	if inst.components.hunger.current >= 30 and not inst.deactive_valkyrie then
	inst:ListenForEvent("attacked", on_Valkyrie_8)
	inst:ListenForEvent("onhitother", on_Valkyrie_8)
		end end	
		   local function Valkyrie_level_9(inst)
	if inst.components.hunger.current >= 30 and not inst.deactive_valkyrie then
	inst:ListenForEvent("attacked", on_Valkyrie_9)
	inst:ListenForEvent("onhitother", on_Valkyrie_9)
		end end	
		   local function Valkyrie_level_10(inst)
	if inst.components.hunger.current >= 30 and not inst.deactive_valkyrie then
	inst:ListenForEvent("attacked", on_Valkyrie_10)
	inst:ListenForEvent("onhitother", on_Valkyrie_10)
		end end	
		   local function Valkyrie_level_11(inst)
	if inst.components.hunger.current >= 30 and not inst.deactive_valkyrie then
	inst:ListenForEvent("attacked", on_Valkyrie_11)
	inst:ListenForEvent("onhitother", on_Valkyrie_11)
		end end	
		   local function Valkyrie_level_12(inst)
	if inst.components.hunger.current >= 30 and not inst.deactive_valkyrie then
	inst:ListenForEvent("attacked", on_Valkyrie_12)
	inst:ListenForEvent("onhitother", on_Valkyrie_12)
		end end	
		   local function Valkyrie_level_13(inst)
	if inst.components.hunger.current >= 30 and not inst.deactive_valkyrie then
	inst:ListenForEvent("attacked", on_Valkyrie_13)
	inst:ListenForEvent("onhitother", on_Valkyrie_13)
		end end	
		   local function Valkyrie_level_14(inst)
	if inst.components.hunger.current >= 30 and not inst.deactive_valkyrie then
	inst:ListenForEvent("attacked", on_Valkyrie_14)
	inst:ListenForEvent("onhitother", on_Valkyrie_14)
		end end	
	
	---berserk passive skill
local function On_freeze_1(attacked, data)
        if data and data.attacker and data.attacker.components.freezable then
            data.attacker.components.freezable:AddColdness(0.2)
            data.attacker.components.freezable:SpawnShatterFX()
        end 
    end
local function On_freeze_2(attacked, data)
        if data and data.attacker and data.attacker.components.freezable then
            data.attacker.components.freezable:AddColdness(0.4)
            data.attacker.components.freezable:SpawnShatterFX()
        end 
    end
	
--berserk
local function OnHitfreeze(inst, data)
local hitfreeze = .1
	 local other = data.target
     if other and math.random() < hitfreeze and other.components.freezable then
        other.components.freezable:AddColdness(0.1)
       -- other.components.freezable:SpawnShatterFX()
    end
    if other.components.burnable and other.components.burnable:IsBurning() then
        other.components.burnable:Extinguish()
end
end
	
local function berserk_hit(inst, data)
    local other = data.target
	SpawnPrefab("small_puff").Transform:SetPosition(other:GetPosition():Get())
	end
		
	function on_berserk_ability_1(inst, data)
	if inst.components.hunger.current < 30 then
			--inst.components.health:SetAbsorptionAmount(0.25)
			inst:ListenForEvent("attacked", On_freeze_1)
			--inst.components.combat:SetAreaDamage(2.5, .5)
			--inst:ListenForEvent("onhitother", berserk_hit)
			inst.components.health:StartRegen(1, 20)
		end end
	function on_berserk_ability_2(inst, data)
	if inst.components.hunger.current < 30 then
			--inst.components.health:SetAbsorptionAmount(0.5)
			inst:ListenForEvent("attacked", On_freeze_2)
				inst.components.health:StartRegen(1, 15)		
			--inst.components.combat:SetAreaDamage(2.5, .5)
			--inst:ListenForEvent("onhitother", berserk_hit)
		end end
	function on_berserk_ability_3(inst, data)
	if inst.components.hunger.current < 30 then
			--inst.components.health:SetAbsorptionAmount(0.5)
			inst:ListenForEvent("attacked", On_freeze_2)
			inst.components.combat:SetAreaDamage(2, .5)
			inst.components.health:StartRegen(1, 10)
			inst:ListenForEvent("onhitother", berserk_hit)
		end end
	function berserk_abil_1(inst, data)
	if inst.components.hunger.current < 30 then
	inst:ListenForEvent("hungerdelta", on_berserk_ability_1)
		end end
	function berserk_abil_2(inst, data)
	if inst.components.hunger.current < 30 then
	inst:ListenForEvent("hungerdelta", on_berserk_ability_2)
		end end
	function berserk_abil_3(inst, data)
	if inst.components.hunger.current < 30 then
	inst:ListenForEvent("hungerdelta", on_berserk_ability_3)
		end end		
    ---force berserk
	   local function force_berserk(inst)
		inst.components.hunger:SetPercent(.1)
		inst:RemoveEventCallback("attacked", on_Valkyrie_1)
		inst:RemoveEventCallback("onhitother", on_Valkyrie_1)
		end 

	
local function levelexp(inst,data)

	local max_exp = 99999999999999997000
	local level = math.min(inst.level, max_exp)

	local health_percent = inst.components.health:GetPercent()
	local sanity_percent = inst.components.sanity:GetPercent()

if inst.level <7000 then
inst.components.talker:Say("[EXP] \n".. (inst.level))
end
--stat 
	--level 1
if inst.level <5 then
	inst.components.health.maxhealth = math.ceil (80)
	inst.components.sanity.max = math.ceil (120)
	--level 2
elseif inst.level >=5 and inst.level <10  then
	inst.components.health.maxhealth = math.ceil (85)
	inst.components.sanity.max = math.ceil (125)
	--level 3
elseif inst.level >=10 and inst.level <30  then
	inst.components.health.maxhealth = math.ceil (90)
	inst.components.sanity.max = math.ceil (130)
	--level 4
elseif inst.level >=30 and inst.level <50  then
	inst.components.health.maxhealth = math.ceil (95)
	inst.components.sanity.max = math.ceil (135)
	--level 5
elseif inst.level >=50 and inst.level <80  then
	inst.components.health.maxhealth = math.ceil (100)
	inst.components.sanity.max = math.ceil (140)
	--level 6
elseif inst.level >=80 and inst.level <125  then
	inst.components.health.maxhealth = math.ceil (105)
	inst.components.sanity.max = math.ceil (145)
	--level 7
elseif inst.level >=125 and inst.level <200  then
	inst.components.health.maxhealth = math.ceil (110)
	inst.components.sanity.max = math.ceil (150)
	--level 8
elseif inst.level >=200 and inst.level <340  then
	inst.components.health.maxhealth = math.ceil (115)
	inst.components.sanity.max = math.ceil (155)
	--level 9
elseif inst.level >=340 and inst.level <430  then
	inst.components.health.maxhealth = math.ceil (120)
	inst.components.sanity.max = math.ceil (160)
	--level 10
elseif inst.level >=430 and inst.level <530  then
	inst.components.health.maxhealth = math.ceil (125)
	inst.components.sanity.max = math.ceil (165)
	--level 11
elseif inst.level >=530 and inst.level <640  then
	inst.components.health.maxhealth = math.ceil (130)
	inst.components.sanity.max = math.ceil (170)
	--level 12
elseif inst.level >=640 and inst.level <760  then
	inst.components.health.maxhealth = math.ceil (135)
	inst.components.sanity.max = math.ceil (175)
	--level 13
elseif inst.level >=760 and inst.level <890  then
	inst.components.health.maxhealth = math.ceil (140)
	inst.components.sanity.max = math.ceil (180)
	--level 14
elseif inst.level >=890 and inst.level <1030  then
	inst.components.health.maxhealth = math.ceil (145)
	inst.components.sanity.max = math.ceil (185)
	--level 15
elseif inst.level >=1030 and inst.level <1180  then
	inst.components.health.maxhealth = math.ceil (150)
	inst.components.sanity.max = math.ceil (190)
	--level 16
elseif inst.level >=1180 and inst.level <1340  then
	inst.components.health.maxhealth = math.ceil (155)
	inst.components.sanity.max = math.ceil (195)
	--level 17
elseif inst.level >=1340 and inst.level <1510  then
	inst.components.health.maxhealth = math.ceil (160)
	inst.components.sanity.max = math.ceil (200)
	--level 18
elseif inst.level >=1510 and inst.level <1690  then
	inst.components.health.maxhealth = math.ceil (165)
	inst.components.sanity.max = math.ceil (205)
	--level 19
elseif inst.level >=1690 and inst.level <1880  then
	inst.components.health.maxhealth = math.ceil (170)
	inst.components.sanity.max = math.ceil (210)
	--level 20
elseif inst.level >=1880 and inst.level <2080  then
	inst.components.health.maxhealth = math.ceil (175)
	inst.components.sanity.max = math.ceil (215)
	--level 21
elseif inst.level >=2080 and inst.level <2290  then
	inst.components.health.maxhealth = math.ceil (180)
	inst.components.sanity.max = math.ceil (220)
	--level 22
elseif inst.level >=2290 and inst.level <2500  then
	inst.components.health.maxhealth = math.ceil (185)
	inst.components.sanity.max = math.ceil (225)
	--level 23
elseif inst.level >=2500 and inst.level <2850  then
	inst.components.health.maxhealth = math.ceil (190)
	inst.components.sanity.max = math.ceil (230)
	--level 24
elseif inst.level >=2850 and inst.level <3200  then
	inst.components.health.maxhealth = math.ceil (195)
	inst.components.sanity.max = math.ceil (235)
	--level 25
elseif inst.level >=3200 and inst.level <3700  then
	inst.components.health.maxhealth = math.ceil (200)
	inst.components.sanity.max = math.ceil (240)
	--level 26
elseif inst.level >=3700 and inst.level <4200  then
	inst.components.health.maxhealth = math.ceil (205)
	inst.components.sanity.max = math.ceil (245)
	--level 27
elseif inst.level >=4200 and inst.level <4700  then
	inst.components.health.maxhealth = math.ceil (210)
	inst.components.sanity.max = math.ceil (250)
	--level 28
elseif inst.level >=4700 and inst.level <5500 then
	inst.components.health.maxhealth = math.ceil (215)
	inst.components.sanity.max = math.ceil (255)
	--level 29
elseif inst.level >=5500 and inst.level <7000 then
	inst.components.health.maxhealth = math.ceil (220)
	inst.components.sanity.max = math.ceil (260)
	-- level 30
elseif inst.level >=7000  then
	inst.components.health.maxhealth = math.ceil (225)
	inst.components.sanity.max = math.ceil (265 + level* 0.005)
	inst.components.combat.damagemultiplier = 1.1
end

	inst.components.health:SetPercent(health_percent)
	inst.components.sanity:SetPercent(sanity_percent)

----level and skill
--[[test]] 
--[[
if inst.level >= 0 then
Critical_level_3(inst)  --max 7 (damage )
Lshield_level_3(inst)  --max 4 (defense heal + reflect)
Valkyrie_level_4(inst)	--max 14 (prototype1 + Lightning 8 + Armor 4 + Duration 1)
berserk_abil_3(inst)  --max3 (armor + AOS attack)]]


			if inst.level >0 and inst.level <= 4 then

			elseif inst.level >4 and inst.level <= 5 then
	inst.components.talker:Say("Level 2\n Unlock: [Ligntnig Shield]\nLV 1/5")
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
	Lshield_level_1(inst)
			elseif inst.level >5 and inst.level <= 9 then
--inst.components.talker:Say("Next :EXP[10]\n[EXP] + ".. (inst.level))
	Lshield_level_1(inst)
		elseif inst.level >9 and inst.level <= 10 then
	inst.components.talker:Say("Level 3\n Unlock:[Critical Hit]\nLV 1/7")
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
Lshield_level_1(inst)
Critical_level_1(inst)
			elseif inst.level >10 and inst.level <= 29 then
--inst.components.talker:Say("Next :EXP[30]\n[EXP] + ".. (inst.level))
Lshield_level_1(inst)
Critical_level_1(inst)
		elseif inst.level >29 and inst.level <= 30 then
	inst.components.talker:Say("Level 4\n Unlock: [Valkyrie]\n 1/2")
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
Lshield_level_1(inst)
Critical_level_1(inst)
Valkyrie_level_1(inst)
			elseif inst.level > 30 and inst.level <= 49  then
--inst.components.talker:Say("Next :EXP[50]\n[EXP] + ".. (inst.level))
Lshield_level_1(inst)
Critical_level_1(inst)
Valkyrie_level_1(inst)
		elseif inst.level >49 and inst.level <= 50 then
	inst.components.talker:Say("Level 5\n Unlock: [Valkyrie Shadow Strike]\nLV 1/8")
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
Lshield_level_1(inst)
Critical_level_1(inst)
Valkyrie_level_2(inst)
			elseif inst.level >50 and inst.level <=79  then
--inst.components.talker:Say("Next :EXP[80]\n[EXP] + ".. (inst.level))
Lshield_level_1(inst)
Critical_level_1(inst)
Valkyrie_level_2(inst)
		elseif inst.level >79 and inst.level <= 80 then
	inst.components.talker:Say("Level 6\n Unlock : [Electric Shield]\nLV 2/5")
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
Lshield_level_2(inst)
Critical_level_1(inst)
Valkyrie_level_2(inst)
		elseif inst.level >80 and inst.level <=124  then
Lshield_level_2(inst)
Critical_level_1(inst)
Valkyrie_level_2(inst)		
		elseif inst.level >124 and inst.level <= 125 then
	inst.components.talker:Say("Level 7\n Unlock: [Critical Hit]\nLV 2/7")
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
Lshield_level_2(inst)
Critical_level_2(inst)
Valkyrie_level_2(inst)
			elseif inst.level >125 and inst.level <=199  then
--inst.components.talker:Say("Next :EXP[200]\n[EXP] + ".. (inst.level))
Lshield_level_2(inst)
Critical_level_2(inst)
Valkyrie_level_2(inst)
		elseif inst.level >199 and inst.level <= 200 then
	inst.components.talker:Say("Level 8\n Unlock : [Valkyrie Armor]\nLV 1/4")
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
Lshield_level_2(inst)
Critical_level_2(inst)
Valkyrie_level_3(inst)
			elseif inst.level >200 and inst.level <=339  then
--inst.components.talker:Say("Next :EXP[340]\n[EXP] + ".. (inst.level))
Lshield_level_2(inst)
Critical_level_2(inst)
Valkyrie_level_3(inst)
		elseif inst.level >339 and inst.level <= 340 then
	inst.components.talker:Say("Level 9\n Unlock : [Valkyrie Shadow Strike]\nLV 2/8")
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
Lshield_level_2(inst)
Critical_level_2(inst)
Valkyrie_level_4(inst)
			elseif inst.level >340 and inst.level <=429  then
--inst.components.talker:Say("Next :EXP[430]\n[EXP] + ".. (inst.level))
Lshield_level_2(inst)
Critical_level_2(inst)
Valkyrie_level_4(inst)
		elseif inst.level >429 and inst.level <= 430 then
	inst.components.talker:Say("Level 10\n Unlock :[Electric Shield]\nLV 3/5 \nUpgrade [Active Skills]")
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
Lshield_level_3(inst)
Critical_level_2(inst)
Valkyrie_level_4(inst)
			elseif inst.level >430 and inst.level <=529  then
--inst.components.talker:Say("Next :EXP[530]\n[EXP] + ".. (inst.level))
Lshield_level_3(inst)
Critical_level_2(inst)
Valkyrie_level_4(inst)
		elseif inst.level >529 and inst.level <= 530 then
	inst.components.talker:Say("Level 11\n Unlock: [Critical Hit]\nLV 3/7")
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
Lshield_level_3(inst)
Critical_level_3(inst)
Valkyrie_level_4(inst)
			elseif inst.level >530 and inst.level <=639  then
--inst.components.talker:Say("Next :EXP[640]\n[EXP] + ".. (inst.level))
Lshield_level_3(inst)
Critical_level_3(inst)
Valkyrie_level_4(inst)
		elseif inst.level >639 and inst.level <= 640 then
	inst.components.talker:Say("Level 12\n Unlock: [Berserk Armor]\nLV 1/2")
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
Lshield_level_3(inst)
Critical_level_3(inst)
Valkyrie_level_4(inst)
berserk_abil_1(inst)
			elseif inst.level >640 and inst.level <=759  then
--inst.components.talker:Say("Next :EXP[760]\n[EXP] + ".. (inst.level))
Lshield_level_3(inst)
Critical_level_3(inst)
Valkyrie_level_4(inst)
berserk_abil_1(inst)
		elseif inst.level >759 and inst.level <= 760 then
inst.components.talker:Say("Level 13\n Unlock: [Valkyrie Armor]\nLV 2/4")
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
Lshield_level_3(inst)
Critical_level_3(inst)
Valkyrie_level_5(inst)
berserk_abil_1(inst)
			elseif inst.level >760 and inst.level <=889  then
--inst.components.talker:Say("Next :EXP[890]\n[EXP] + ".. (inst.level))
Lshield_level_3(inst)
Critical_level_3(inst)
Valkyrie_level_5(inst)
berserk_abil_1(inst)
		elseif inst.level >889 and inst.level <= 890 then
	inst.components.talker:Say("Level 14\n Unlock: [Valkyrie Ligntnig]\nLV 3/8")
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
Lshield_level_3(inst)
Critical_level_3(inst)
Valkyrie_level_6(inst)
berserk_abil_1(inst)
			elseif inst.level >890 and inst.level <=1029  then
--inst.components.talker:Say("Next :EXP[1030]\n[EXP] + ".. (inst.level))
Lshield_level_3(inst)
Critical_level_3(inst)
Valkyrie_level_6(inst)
berserk_abil_1(inst)
		elseif inst.level >1029 and inst.level <= 1030 then
	inst.components.talker:Say("Level 15\n Unlock: [Ligntnig Shield]\nLV 4/5")
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
Lshield_level_4(inst)
Critical_level_3(inst)
Valkyrie_level_6(inst)
berserk_abil_1(inst)
			elseif inst.level >1030 and inst.level <=1179  then
--inst.components.talker:Say("Next :EXP[1180]\n[EXP] + ".. (inst.level))
Lshield_level_4(inst)
Critical_level_3(inst)
Valkyrie_level_6(inst)
berserk_abil_1(inst)
		elseif inst.level >1179 and inst.level <= 1180 then
inst.components.talker:Say("Level 16\n Unlock: [Critical Hit]\nLV 4/7")
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
Lshield_level_4(inst)
Critical_level_4(inst)
Valkyrie_level_6(inst)
berserk_abil_1(inst)
			elseif inst.level >1180 and inst.level <=1339  then
--inst.components.talker:Say("Next :EXP[1340]\n[EXP] + ".. (inst.level))
Lshield_level_4(inst)
Critical_level_4(inst)
Valkyrie_level_6(inst)
berserk_abil_1(inst)
		elseif inst.level >1339 and inst.level <= 1340 then
inst.components.talker:Say("Level 17\n Unlock : [Valkyrie Armor]\nLV 3/4")
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
Lshield_level_4(inst)
Critical_level_4(inst)
Valkyrie_level_7(inst)
berserk_abil_1(inst)
			elseif inst.level >1340 and inst.level <=1509  then
--inst.components.talker:Say("Next :EXP[1510]\n[EXP] + ".. (inst.level))
Lshield_level_4(inst)
Critical_level_4(inst)
Valkyrie_level_7(inst)
berserk_abil_1(inst)
		elseif inst.level >1509 and inst.level <= 1510 then
	inst.components.talker:Say("Level 18\n Unlock : [Valkyrie Shadow Strike]\nLV 4/8")
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
Lshield_level_4(inst)
Critical_level_4(inst)
Valkyrie_level_8(inst)
berserk_abil_1(inst)
			elseif inst.level >1510 and inst.level <=1689  then
--inst.components.talker:Say("Next :EXP[1690]\n[EXP] + ".. (inst.level))
Lshield_level_4(inst)
Critical_level_4(inst)
Valkyrie_level_8(inst)
berserk_abil_1(inst)
		elseif inst.level >1689 and inst.level <= 1690 then
inst.components.talker:Say("Level 19\n Unlock : [Berserk Armor]\nLV 2/2")
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
Lshield_level_4(inst)
Critical_level_4(inst)
Valkyrie_level_8(inst)
berserk_abil_2(inst)
			elseif inst.level >1690 and inst.level <=1879  then
--inst.components.talker:Say("Next :EXP[1880]\n[EXP] + ".. (inst.level))
Lshield_level_4(inst)
Critical_level_4(inst)
Valkyrie_level_8(inst)
berserk_abil_2(inst)
		elseif inst.level >1879 and inst.level <= 1880 then
inst.components.talker:Say("Level 20\n Unlock : Unlock : [Critical Hit]\nLV 5/7\nUpgrade [Active Skills]")
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
Lshield_level_4(inst)
Critical_level_5(inst)
Valkyrie_level_8(inst)
berserk_abil_2(inst)
			elseif inst.level >1880 and inst.level <=2079  then
--inst.components.talker:Say("Next :EXP[2080]\n[EXP] + ".. (inst.level))
Lshield_level_4(inst)
Critical_level_5(inst)
Valkyrie_level_8(inst)
berserk_abil_2(inst)
		elseif inst.level >2079 and inst.level <= 2080 then
	inst.components.talker:Say("Level 21\n Unlock : [Electric Shield]\nLV 5/5")
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
Lshield_level_5(inst)
Critical_level_5(inst)
Valkyrie_level_8(inst)
berserk_abil_2(inst)
			elseif inst.level >2080 and inst.level <=2289  then
--inst.components.talker:Say("Next :EXP[2289]\n[EXP] + ".. (inst.level))
Lshield_level_5(inst)
Critical_level_5(inst)
Valkyrie_level_8(inst)
berserk_abil_2(inst)
		elseif inst.level >2189 and inst.level <= 2290 then
	inst.components.talker:Say("Level 22\n Unlock : [Valkyrie Armor]\nLV 4/4")
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
Lshield_level_5(inst)
Critical_level_5(inst)
Valkyrie_level_9(inst)
berserk_abil_2(inst)
			elseif inst.level >2290 and inst.level <=2499  then
--inst.components.talker:Say("Next :EXP[2500]\n[EXP] + ".. (inst.level))
Lshield_level_5(inst)
Critical_level_5(inst)
Valkyrie_level_9(inst)
berserk_abil_2(inst)
		elseif inst.level >2499 and inst.level <= 2500 then
	inst.components.talker:Say("Level 23\n Unlock : [Valkyrie Shadow Strike]\nLV 5/8")
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
Lshield_level_5(inst)
Critical_level_5(inst)
Valkyrie_level_10(inst)
berserk_abil_2(inst)
			elseif inst.level >2500 and inst.level <=2849  then
--inst.components.talker:Say("Next :EXP[2850]\n[EXP] + ".. (inst.level))
Lshield_level_5(inst)
Critical_level_5(inst)
Valkyrie_level_10(inst)
berserk_abil_2(inst)
		elseif inst.level >2849 and inst.level <= 2850 then
	inst.components.talker:Say("Level 24\n Unlock : [Berserk Master]\nLV 2/2")
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
Lshield_level_5(inst)
Critical_level_5(inst)
Valkyrie_level_10(inst)
berserk_abil_3(inst)
			elseif inst.level >2850 and inst.level <=3199  then
--inst.components.talker:Say("Next :EXP[3200]\n[EXP] + ".. (inst.level))
Lshield_level_5(inst)
Critical_level_5(inst)
Valkyrie_level_10(inst)
berserk_abil_3(inst)
		elseif inst.level >3199 and inst.level <= 3200 then
inst.components.talker:Say("Level 25\n Unlock : [Critical Hit]\nLV 6/7")
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
Lshield_level_5(inst)
Critical_level_6(inst)
Valkyrie_level_10(inst)
berserk_abil_3(inst)
			elseif inst.level >3200 and inst.level <=3699  then
--inst.components.talker:Say("Next :EXP[3700]\n[EXP] + ".. (inst.level))
Lshield_level_5(inst)
Critical_level_6(inst)
Valkyrie_level_10(inst)
berserk_abil_3(inst)
		elseif inst.level >3699 and inst.level <= 3700 then
inst.components.talker:Say("Level 26\n Unlock : [Valkyrie Shadow Strike]\nLV 6/8")
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
Lshield_level_5(inst)
Critical_level_6(inst)
Valkyrie_level_11(inst)
berserk_abil_3(inst)
			elseif inst.level >3700 and inst.level <=4199  then
--inst.components.talker:Say("Next :EXP[4200]\n[EXP] + ".. (inst.level))
Lshield_level_5(inst)
Critical_level_6(inst)
Valkyrie_level_11(inst)
berserk_abil_3(inst)
		elseif inst.level >4199 and inst.level <= 4200 then
inst.components.talker:Say("Level 27\n Unlock : [Critical]\nLV 7/7")
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
Lshield_level_5(inst)
Critical_level_7(inst)
Valkyrie_level_11(inst)
berserk_abil_3(inst)
			elseif inst.level >4200 and inst.level <=4699  then
--inst.components.talker:Say("Next :EXP[4700]\n[EXP] + ".. (inst.level))
Lshield_level_5(inst)
Critical_level_7(inst)
Valkyrie_level_11(inst)
berserk_abil_3(inst)
		elseif inst.level >4699 and inst.level <= 4700 then
inst.components.talker:Say("Level 28\n Unlock : [Valkyrie Shadow Strike]\nLV 7/8")
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
Lshield_level_5(inst)
Critical_level_7(inst)
Valkyrie_level_12(inst)
berserk_abil_3(inst)
			elseif inst.level >4700 and inst.level <=5499  then
--inst.components.talker:Say("Next :EXP[5500]\n[EXP] + ".. (inst.level))
Lshield_level_5(inst)
Critical_level_7(inst)
Valkyrie_level_12(inst)
berserk_abil_3(inst)
		elseif inst.level >5499 and inst.level <= 5500 then
	inst.components.talker:Say("Level 29\n Unlock : [Valkyrie Shadow Strike]\nLV 4/4")
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
Lshield_level_5(inst)
Critical_level_7(inst)
Valkyrie_level_13(inst)
berserk_abil_3(inst)
			elseif inst.level >5500 and inst.level <=6999  then
--inst.components.talker:Say("Next :EXP[7000]\n[EXP] + ".. (inst.level))
Lshield_level_5(inst)
Critical_level_7(inst)
Valkyrie_level_13(inst)
berserk_abil_3(inst)
		elseif inst.level >6999 and inst.level <= 7000 then
inst.components.talker:Say("Level 30\n Unlock : [Double Damage]\n Unlock : [Valkyrie Master] \nLV 2/2\nUpgrade [Active Skills]")
inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
inst.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
Lshield_level_5(inst)
Critical_level_7(inst)
Valkyrie_level_14(inst)
berserk_abil_3(inst)
		elseif inst.level > 7000 then
		Lshield_level_5(inst)
Critical_level_7(inst)
Valkyrie_level_14(inst)
berserk_abil_3(inst)
	end
end



local tynychance = 0.06
local smallllchance = 0.15
local smallchance = 0.2
local normalchance = 0.3
local largechance = 0.7
local foodnormalchance = 0.4
local foodgoodchance = 0.6
local foodlargechance = 0.8

local function spawnspirit(inst, x, y, z, scale)
    local fx = SpawnPrefab("wathgrithr_spirit")
    fx.Transform:SetPosition(x, y, z)
    fx.Transform:SetScale(scale, scale, scale)
end

local smallScale = 0.5
local medScale = 0.7
local largeScale = 1.1
local function onkilll(inst, data)
	local victim = data.victim
	   if not (victim:HasTag("prey") or
            victim:HasTag("veggie") or
            victim:HasTag("eyeplant") or
            victim:HasTag("insect") or			
            victim:HasTag("structure")) then
    local delta = victim.components.combat.defaultdamage * 0.25
		   if math.random() < largechance then
    				inst.level = inst.level + 1
 		--inst.components.health:DoDelta(delta, false, "battleborn")
		inst.components.sanity:DoDelta(delta)
			levelexp(inst)					
            local time = victim.components.health.destroytime or 2
            local x, y, z = victim.Transform:GetWorldPosition()
            local scale = (victim:HasTag("smallcreature") and smallScale)
                        or (victim:HasTag("largecreature") and largeScale)
                        or medScale
					inst:DoTaskInTime(time, spawnspirit, x, y, z, scale)
				 	   if not inst.berserk and math.random() < 0.05 then
					   --inst.components.talker:Say("Come to me! Ghost puppy")
					     scheduler:ExecuteInTime(1, function() SpawnPrefab("statue_transition_2").Transform:SetPosition(victim:GetPosition():Get()) SpawnPrefab("ghosthound2").Transform:SetPosition(victim:GetPosition():Get()) end) end
					end					
				end
		  if (victim:HasTag("prey") or
              victim:HasTag("insect") or			
            victim:HasTag("frog")) then
    local delta = victim.components.combat.defaultdamage * 0.1
		   if math.random() < smallllchance then
    				inst.level = inst.level + 1
 			inst.components.sanity:DoDelta(delta)
			levelexp(inst)					
            local time = victim.components.health.destroytime or 2
            local x, y, z = victim.Transform:GetWorldPosition()
            local scale = (victim:HasTag("smallcreature") and smallScale)
                        or (victim:HasTag("largecreature") and largeScale)
                        or medScale
					inst:DoTaskInTime(time, spawnspirit, x, y, z, scale)
					end end 	
							  if (victim:HasTag("epic") ) then
    local delta = victim.components.combat.defaultdamage * 0.1
		   if math.random() <= 1 then
    				inst.level = inst.level + 10
 			inst.components.sanity:DoDelta(delta)
			levelexp(inst)		
			inst.components.talker:Say("Kill Epic Monster\n [EXP] + 10 ")
            local time = victim.components.health.destroytime or 2
            local x, y, z = victim.Transform:GetWorldPosition()
            local scale = (victim:HasTag("smallcreature") and smallScale)
                        or (victim:HasTag("largecreature") and largeScale)
                        or medScale
					inst:DoTaskInTime(time, spawnspirit, x, y, z, scale)
					end end 	
							  if ( victim:HasTag("deerclops") or 
							  victim:HasTag("bearger") or
							  victim:HasTag("moose") or 
							  victim:HasTag("dragonfly")  ) then
    local delta = victim.components.combat.defaultdamage * 0.1
		   if math.random() <= 1 then
    				inst.level = inst.level + 25
 			inst.components.sanity:DoDelta(delta)
			levelexp(inst)		
			inst.components.talker:Say("Kill Giant\n [EXP] + 35 ")
            local time = victim.components.health.destroytime or 2
            local x, y, z = victim.Transform:GetWorldPosition()
            local scale = (victim:HasTag("smallcreature") and smallScale)
                        or (victim:HasTag("largecreature") and largeScale)
                        or medScale
					inst:DoTaskInTime(time, spawnspirit, x, y, z, scale)
					end 
					end 	
				end 

		
local function expeat(inst, food)

if food.components.edible.hungervalue >= 150 and food.components.edible.healthvalue >= 100 then 
if food.components.edible then
	inst.level = inst.level + 25
	levelexp(inst)
	inst.components.talker:Say("Musha Love Soup !!\n [EXP] + 25 ")
end
elseif food.components.edible.hungervalue > 140 or food.components.edible.healthvalue > 35 then 
if food.components.edible and math.random() < foodlargechance then
	inst.level = inst.level + 1
	levelexp(inst)
end
elseif food.components.edible.hungervalue > 55 or food.components.edible.healthvalue > 29 or food.components.edible.sanityvalue > 19 then 
if food.components.edible and math.random() < foodgoodchance then
	inst.level = inst.level + 1
	levelexp(inst)
end
elseif food.components.edible.hungervalue > 24 or food.components.edible.healthvalue > 19 or food.components.edible.sanityvalue > 14 then 
if food.components.edible and math.random() < foodnormalchance then
	inst.level = inst.level + 1
	levelexp(inst)
end
elseif food.components.edible.hungervalue > 9 or food.components.edible.healthvalue > 9 or food.components.edible.sanityvalue > 9 then 
if food.components.edible and math.random() < tynychance then
	inst.level = inst.level + 1
	levelexp(inst)
end
end
--force bersek
 if string.find(tostring(food),"monsterm") then
 		 	force_berserk(inst)
	end
end


local function onpreload(inst, data)
	if data then
		if data.level then
			inst.level = data.level
			levelexp(inst)
			if data.health and data.health.health then inst.components.health.currenthealth = data.health.health end
			if data.sanity and data.sanity.current then inst.components.sanity.current = data.sanity.current end
			inst.components.health:DoDelta(0)
			inst.components.sanity:DoDelta(0)
		end
	end
end

local function onsave(inst, data)
	data.level = inst.level
	end


local function phasechange(inst, data)
  if inst.sg:HasStateTag("nomorph") or
          inst:HasTag("playerghost") or
          inst.components.health:IsDead() then
          return
  end

	if inst.strength == "full" then
			----inst.AnimState:SetBuild("musha")
			inst.soundsname = "willow"
			inst.components.combat:SetAreaDamage(0, 0)
			inst.components.health:StartRegen(0, 0)
			--inst.components.health:SetAbsorptionAmount(0)
			--[[TUNING.SANITY_DAY_GAIN = 10/60
			TUNING.SANITY_NIGHT_LIGHT = 5/60
			TUNING.SANITY_NIGHT_MID = 2/60
			TUNING.SANITY_NIGHT_DARK = 0/60]]
			--inst.components.sanityaura.aura = TUNING.SANITYAURA_SMALL
			inst.components.sanity.dapperness = (TUNING.DAPPERNESS_LARGE)
			inst:RemoveEventCallback("onhitother", berserk_hit)
			inst:RemoveEventCallback("attacked", On_freeze_1)		
			inst:RemoveEventCallback("attacked", On_freeze_2)			
			--inst:RemoveEventCallback("onhitother", OnHitfreeze)
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.3)
			inst.components.health.fire_damage_scale = 1
			inst.components.combat:SetAttackPeriod(TUNING.WILSON_ATTACK_PERIOD * 2.4)
			inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1 )
			inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1 )	
			inst.berserk = false
			if not inst.visual_hold then
			inst.AnimState:SetBuild("musha")
			end
		if inst.components.hunger.current < 160 and inst.components.hunger.current >= 30 then

			inst.strength = "normal"
			----inst.AnimState:SetBuild("musha_normal")
			inst.soundsname = "willow"
			inst.components.combat:SetAreaDamage(0, 0)
			inst.components.health:StartRegen(0, 0)
			--inst.components.health:SetAbsorptionAmount(0)
			--[[TUNING.SANITY_DAY_GAIN = 0/60
			TUNING.SANITY_NIGHT_LIGHT = 0/60
			TUNING.SANITY_NIGHT_MID = -8/60
			TUNING.SANITY_NIGHT_DARK = -16/60]]
						--inst.components.sanityaura.aura = 0
			inst.components.sanity.dapperness = (TUNING.DAPPERNESS_TYNY)
			inst:RemoveEventCallback("onhitother", berserk_hit)
			inst:RemoveEventCallback("attacked", On_freeze_1)		
			inst:RemoveEventCallback("attacked", On_freeze_2)	
			--inst:RemoveEventCallback("onhitother", OnHitfreeze)	
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1)
			inst.components.health.fire_damage_scale = 1
			inst.components.combat:SetAttackPeriod(TUNING.WILSON_ATTACK_PERIOD * 1.4)
			inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1.15 )
			inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1.15 )	
			inst.berserk = false
			if not inst.visual_hold then
			inst.AnimState:SetBuild("musha_normal")
			end
		elseif inst.components.hunger.current < 30 then

			inst.strength = "berserk"
			----inst.AnimState:SetBuild("musha_hunger")
			inst.soundsname = "wendy"
		--	inst.components.combat:SetAreaDamage(2.5, .5)
		--	--inst.components.health:SetAbsorptionAmount(0.5)
					--inst.components.sanityaura.aura = 0
			inst.components.sanity.dapperness = (TUNING.DAPPERNESS_LARGE*-6)
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 0.5)
			--inst:ListenForEvent("onhitother", OnHitfreeze)
			inst.components.health.fire_damage_scale = 0
			inst.components.combat:SetAttackPeriod(TUNING.WILSON_ATTACK_PERIOD * .75)
			inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1.6 )
			inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1.6 )	
			inst.berserk = true
			if not inst.visual_hold then
			inst.AnimState:SetBuild("musha_hunger")
			end
		end
	else	
	if inst.strength == "normal" then
			
			----inst.AnimState:SetBuild("musha_normal")
			inst.soundsname = "willow"
			inst.components.combat:SetAreaDamage(0, 0)
			inst.components.health:StartRegen(0, 0)
			--inst.components.health:SetAbsorptionAmount(0)
			--inst.components.sanityaura.aura = 0
			inst.components.sanity.dapperness = (TUNING.DAPPERNESS_TYNY)
			inst:RemoveEventCallback("onhitother", berserk_hit)
			inst:RemoveEventCallback("attacked", On_freeze_1)		
			inst:RemoveEventCallback("attacked", On_freeze_2)	
				--inst:RemoveEventCallback("onhitother", OnHitfreeze)
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1)
			inst.components.health.fire_damage_scale = 1
			inst.components.combat:SetAttackPeriod(TUNING.WILSON_ATTACK_PERIOD * 1.4)
			inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1 )
			inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1 )		
			inst.berserk = false
			if not inst.visual_hold then
			inst.AnimState:SetBuild("musha_normal")
			end
	if inst.components.hunger.current >= 160 then
		
			inst.strength = "full"
		--	--inst.AnimState:SetBuild("musha")
			inst.soundsname = "willow"
			inst.components.combat:SetAreaDamage(0, 0)
			inst.components.health:StartRegen(0, 0)
			--inst.components.health:SetAbsorptionAmount(0)		
			--inst.components.sanityaura.aura = TUNING.SANITYAURA_SMALL
			inst.components.sanity.dapperness = (TUNING.DAPPERNESS_LARGE)
			inst:RemoveEventCallback("onhitother", berserk_hit)
			inst:RemoveEventCallback("attacked", On_freeze_1)		
			inst:RemoveEventCallback("attacked", On_freeze_2)		
			--inst:RemoveEventCallback("onhitother", OnHitfreeze)
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.3)
			inst.components.health.fire_damage_scale = 1
			inst.components.combat:SetAttackPeriod(TUNING.WILSON_ATTACK_PERIOD * 2.4)
			inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1 )
			inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1 )	
			inst.berserk = false
			if not inst.visual_hold then
			--inst.AnimState:SetBuild("musha")
			end
			elseif inst.components.hunger.current < 30 then

			inst.strength = "berserk"
		--	--inst.AnimState:SetBuild("musha_hunger")
			inst.soundsname = "wendy"
			--inst.components.combat:SetAreaDamage(2.5, .5)
			----inst.components.health:SetAbsorptionAmount(0.5)
			--inst.components.sanityaura.aura = 0
			inst.components.sanity.dapperness = (TUNING.DAPPERNESS_LARGE*-6)
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 0.5)
			inst.components.health.fire_damage_scale = 0
			inst.components.combat:SetAttackPeriod(TUNING.WILSON_ATTACK_PERIOD * .75)
			inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1.6 )
			inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1.6 )inst.berserk = true	
			if not inst.visual_hold then
			inst.AnimState:SetBuild("musha_hunger")
			end
		end
	else
	if inst.strength == "valkyrie" then

		--	--inst.AnimState:SetBuild("musha_battle")
			inst.soundsname = "willow"
			inst.components.combat:SetAreaDamage(0, 0)
			----inst.components.health:SetAbsorptionAmount(0.5)
			--inst.components.sanityaura.aura = 0
			inst.components.sanity.dapperness = (TUNING.DAPPERNESS_TYNY)
			inst:RemoveEventCallback("onhitother", berserk_hit)
			inst:RemoveEventCallback("attacked", On_freeze_1)		
			inst:RemoveEventCallback("attacked", On_freeze_2)					
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 2)
			--inst:RemoveEventCallback("onhitother", OnHitfreeze)
			inst.components.health.fire_damage_scale = 0
			inst.components.combat:SetAttackPeriod(TUNING.WILSON_ATTACK_PERIOD * .5)
			inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1.6 )
			inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1.6 )	
			inst.berserk = false
			if not inst.visual_hold then
			inst.AnimState:SetBuild("musha_battle")
			end
	else
	if inst.strength == "berserk" then
			
		--	--inst.AnimState:SetBuild("musha_hunger")
			inst.soundsname = "wendy"
			--inst.components.combat:SetAreaDamage(2.5, .5)
			----inst.components.health:SetAbsorptionAmount(0.5)
			--inst.components.sanityaura.aura = 0
			inst.components.sanity.dapperness = (TUNING.DAPPERNESS_LARGE*-6)
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 0.75)
			--inst:ListenForEvent("onhitother", OnHitfreeze)	
			inst.components.health.fire_damage_scale = 0
			inst.components.combat:SetAttackPeriod(TUNING.WILSON_ATTACK_PERIOD * .75)
			inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1.6 )
			inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1.6 )	
			inst.berserk = true
			if not inst.visual_hold then
			inst.AnimState:SetBuild("musha_hunger")
			end
		if inst.components.hunger.current >= 160 then
		
			inst.strength = "full"
			----inst.AnimState:SetBuild("musha")
			inst.soundsname = "willow"
			inst.components.combat:SetAreaDamage(0, 0)
			--inst.components.health:SetAbsorptionAmount(0.5)
			--inst.components.health:SetAbsorptionAmount(0)		
			--inst.components.sanityaura.aura = TUNING.SANITYAURA_SMALL		
			inst.components.health:StartRegen(0, 0)
			inst.components.sanity.dapperness = (TUNING.DAPPERNESS_LARGE)
			inst:RemoveEventCallback("onhitother", berserk_hit)
			inst:RemoveEventCallback("attacked", On_freeze_1)		
			inst:RemoveEventCallback("attacked", On_freeze_2)									
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1.3)
			--inst:RemoveEventCallback("onhitother", OnHitfreeze)	
			inst.components.health.fire_damage_scale = 1
			inst.components.combat:SetAttackPeriod(TUNING.WILSON_ATTACK_PERIOD * 2.4)
			inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1 )
			inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1 )	
			inst.berserk = false
			if not inst.visual_hold then
			inst.AnimState:SetBuild("musha")
			end
		elseif inst.components.hunger.current < 160 and inst.components.hunger.current >= 30 then

			inst.strength = "normal"
			----inst.AnimState:SetBuild("musha_normal")
			inst.soundsname = "willow"
			inst.components.combat:SetAreaDamage(0, 0)
			--inst.components.health:SetAbsorptionAmount(0.5)
			--inst.components.health:SetAbsorptionAmount(0)
			--inst.components.sanityaura.aura = 0	
			inst.components.health:StartRegen(0, 0)
			inst.components.sanity.dapperness = (TUNING.DAPPERNESS_TYNY)
			inst:RemoveEventCallback("onhitother", berserk_hit)
			inst:RemoveEventCallback("attacked", On_freeze_1)		
			inst:RemoveEventCallback("attacked", On_freeze_2)						
			inst.components.hunger:SetRate(TUNING.WILSON_HUNGER_RATE * 1)
			--inst:RemoveEventCallback("onhitother", OnHitfreeze)	
			inst.components.health.fire_damage_scale = 1
			inst.components.combat:SetAttackPeriod(TUNING.WILSON_ATTACK_PERIOD * 1.4)
			inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1.15 )
			inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1.15 )inst.berserk = false		
			if not inst.visual_hold then
			inst.AnimState:SetBuild("musha_normal")
			end			
end end end end end end 

local function ondeath(inst)
    inst.components.health.numrevives = 0
end

local function onnewstate(inst)
    if inst._wasnomorph ~= inst.sg:HasStateTag("nomorph") then
        inst._wasnomorph = not inst._wasnomorph
        if not inst._wasnomorph then
            phasechange(inst)
        end
    end
end

local function onbecamehuman(inst)
    if inst._wasnomorph == nil then
        inst.strength = "full"
        inst._wasnomorph = inst.sg:HasStateTag("nomorph")
        inst.talksoundoverride = nil
        inst.hurtsoundoverride = nil
        inst:ListenForEvent("hungerdelta", phasechange)
        inst:ListenForEvent("newstate", onnewstate)
        phasechange(inst, nil, true)
    end
end

local function onbecameghost(inst)
    if inst._wasnomorph ~= nil then
        inst.strength = "full"
        inst._wasnomorph = nil
        inst.talksoundoverride = nil
        inst.hurtsoundoverride = nil
        inst:RemoveEventCallback("hungerdelta", phasechange)
        inst:RemoveEventCallback("newstate", onnewstate)
    end
end


local function onload(inst)
    inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
    inst:ListenForEvent("ms_becameghost", onbecameghost)

    if inst:HasTag("playerghost") then
        onbecameghost(inst)
    else
        onbecamehuman(inst)
    end
end
	
-- This initializes for both clients and the host
local common_postinit = function(inst) 

	inst.soundsname = "willow"
	inst.MiniMapEntity:SetIcon( "musha.tex" )
	inst:AddTag("bookbuilder")
	inst:AddTag("musha")

    inst.entity:AddLight()
	inst.Light:SetRadius(2.5)
    inst.Light:SetFalloff(.8)
    inst.Light:SetIntensity(.8)
    inst.Light:SetColour(150/255,150/255,150/255)
	inst:AddComponent("keyhandler")
    inst.components.keyhandler:AddActionListener("musha", TUNING.MUSHA.KEY, "INFO")
	inst.components.keyhandler:AddActionListener("musha", TUNING.MUSHA.KEY5, "INFO2")
    inst.components.keyhandler:AddActionListener("musha", TUNING.MUSHA.KEY2, "Lightning_a")
	inst.components.keyhandler:AddActionListener("musha", TUNING.MUSHA.KEY3, "on_shield_act")
	inst.components.keyhandler:AddActionListener("musha", TUNING.MUSHA.KEY4, "buff")
	inst.components.keyhandler:AddActionListener("musha", TUNING.MUSHA.KEY6, "yamche")
	inst.components.keyhandler:AddActionListener("musha", TUNING.MUSHA.KEY7, "visual_hold")
	inst.components.keyhandler:AddActionListener("musha", TUNING.MUSHA.KEY8, "yamche2")
	inst.components.keyhandler:AddActionListener("musha", TUNING.MUSHA.KEY9, "yamche3")
	 inst:AddComponent("sanityaura")
	 
	inst:ListenForEvent("killed", onkilll)
	inst:ListenForEvent("death", ondeath)
end

--local function master_postinit(inst)
local master_postinit = function(inst)

	inst.level = 0
	inst.components.eater:SetOnEatFn(expeat)
	inst:ListenForEvent("levelup", levelexp)
	
	inst.Transform:SetScale(0.95,0.95,0.95)

	inst.components.health:SetMaxHealth(80)
	inst.components.hunger:SetMax(200)
	inst.components.sanity:SetMax(120)

    --inst.components.combat.damagemultiplier = TUNING.WENDY_DAMAGE_MULT
	inst.components.combat.damagemultiplier = .55
	inst.components.combat.playerdamagepercent = 0
	inst.components.temperature.hurtrate = 0.5
-----------
--inst.follow = true
    inst._wasnomorph = nil
    inst.talksoundoverride = nil
    inst.hurtsoundoverride = nil

	inst.components.eater.strongstomach = true
	
	inst:AddComponent("reader")
    inst.components.eater.stale_hunger = TUNING.WICKERBOTTOM_STALE_FOOD_HUNGER
    inst.components.eater.stale_health = TUNING.WICKERBOTTOM_STALE_FOOD_HEALTH
    inst.components.eater.spoiled_hunger = TUNING.WICKERBOTTOM_SPOILED_FOOD_HUNGER
    inst.components.eater.spoiled_health = TUNING.WICKERBOTTOM_SPOILED_FOOD_HEALTH
	inst.components.builder.science_bonus = 1

 inst.strength = "full"   
phasechange(inst)	
inst:ListenForEvent("hungerdelta", phasechange)

	   inst.OnLoad = onload
    inst.OnNewSpawn = onload
	
	inst.OnSave = onsave
	inst.OnPreLoad = onpreload

    return inst
end

return MakePlayerCharacter("musha", prefabs, assets, common_postinit, master_postinit, start_inv)

	
	
	
	