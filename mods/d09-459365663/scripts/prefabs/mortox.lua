--[[	Copyright (c) 2015 Kzisor/Ysovuka	]]

local MakePlayerCharacter = require("prefabs/player_common")
local easing = require("easing")

local assets = 
{
	Asset("ANIM", "anim/mortox.zip"),

	Asset("ANIM", "anim/ghost_wortox_build.zip"),
}

local function OnRespawn( inst )

	inst:AddTag( "monster" )
	inst:AddTag( "demon" )
	inst:AddTag( "wortox" )
	inst:AddTag( "inverseaura" )
	inst:AddTag( "wortelisk_builder" )

end

local function common_postinit(inst)
	inst.MiniMapEntity:SetIcon( "mortox.tex" )
	inst.ghostbuild = "ghost_wortox_build"

	-- choose which sounds this character will play
    inst.soundsname = "wortox"

	inst:AddTag( "monster" )
	inst:AddTag( "demon" )
	inst:AddTag( "wortox" )
	inst:AddTag( "inverseaura" )
	inst:AddTag( "wortelisk_builder" )

end

local function master_postinit( inst )

	-- -- [[ Base Stats for Wortox ]]
	inst.components.health:SetMaxHealth( TUNING.MORTOX_HEALTH )
	inst.components.hunger:SetMax( TUNING.MORTOX_HUNGER )
	inst.components.sanity:SetMax( TUNING.MORTOX_SANITY )

	inst.components.hunger.hungerrate = TUNING.WILSON_HUNGER_RATE or 1

	local _DoDelta = inst.components.sanity.DoDelta

	function inst.components.sanity:DoDelta( delta, overtime )

		if delta < 0 then

	    	delta = ( delta * -2 )

	    else

	    	delta = ( delta * -1 )

	    end

	    _DoDelta(self, delta, overtime)

	end

	local _Recalc = inst.components.sanity.Recalc
	function inst.components.sanity:Recalc( dt )

		local total_dapperness = self.dapperness or 0
	    local mitigates_rain = false
	    for k,v in pairs (self.inst.components.inventory.equipslots) do
	        if v.components.equippable then
	            total_dapperness = total_dapperness + v.components.equippable:GetDapperness(self.inst)
	        end
	    end

	    total_dapperness = total_dapperness * self.dapperness_mult

	    local dapper_delta = total_dapperness * TUNING.SANITY_DAPPERNESS

	    local moisture_delta = easing.inSine(self.inst.components.moisture:GetMoisture(), 0, TUNING.MOISTURE_SANITY_PENALTY_MAX, self.inst.components.moisture:GetMaxMoisture())
	    
	    local light_delta = 0
	    local lightval = self.inst.LightWatcher:GetLightValue()
	    
	    local day = TheWorld.state.isday and not TheWorld:HasTag("cave")

	    if day then
	        light_delta = TUNING.SANITY_DAY_GAIN
	    else
	        local highval = TUNING.SANITY_HIGH_LIGHT
	        local lowval = TUNING.SANITY_LOW_LIGHT

	        if lightval > highval then
	            light_delta =  TUNING.SANITY_NIGHT_LIGHT
	        elseif lightval < lowval then
	            light_delta = TUNING.SANITY_NIGHT_DARK
	        else
	            light_delta = TUNING.SANITY_NIGHT_MID
	        end

	        light_delta = light_delta*self.night_drain_mult
	    end

	    local aura_delta = 0
	    local x,y,z = self.inst.Transform:GetWorldPosition()
	    local ents = TheSim:FindEntities(x,y,z, TUNING.SANITY_EFFECT_RANGE, nil, {"FX", "NOCLICK", "DECOR","INLIMBO"} )
	    for k,v in pairs(ents) do 
	        if v.components.sanityaura and v ~= self.inst then
	            local distsq = self.inst:GetDistanceSqToInst(v)
	            local aura_val = v.components.sanityaura:GetAura(self.inst)/math.max(1, distsq)
	            if aura_val < 0 then
	                aura_val = aura_val * self.neg_aura_mult
	            end

	            aura_delta = aura_delta + aura_val
	        end
	    end

	    self:RecalcGhostDrain()
	    local ghost_delta = TUNING.SANITY_GHOST_PLAYER_DRAIN * self.ghost_drain_mult

	    self.rate = (dapper_delta + moisture_delta + light_delta + aura_delta + ghost_delta)  
	    
	    if self.custom_rate_fn then
	        self.rate = self.rate + self.custom_rate_fn(self.inst)
	    end

	    self.rate = self.rate * self.rate_modifier
	    
	    if self.rate < 0 then

	    	self.rate = ( self.rate * -2 )

	    else

	    	self.rate = ( self.rate * -1 )

	    end

	    self.ratescale =
	        (self.rate > .2 and RATE_SCALE.INCREASE_HIGH) or
	        (self.rate > .1 and RATE_SCALE.INCREASE_MED) or
	        (self.rate > .01 and RATE_SCALE.INCREASE_LOW) or
	        (self.rate < -.3 and RATE_SCALE.DECREASE_HIGH) or
	        (self.rate < -.1 and RATE_SCALE.DECREASE_MED) or
	        (self.rate < -.02 and RATE_SCALE.DECREASE_LOW) or
	        RATE_SCALE.NEUTRAL

	    if self.rate < 0 then

	    	self.rate = ( self.rate * -1 )

	    else

	    	self.rate = ( self.rate * -2 )

	    end

	    --print (string.format("dapper: %2.2f light: %2.2f TOTAL: %2.2f", dapper_delta, light_delta, self.rate*dt))
	    self:DoDelta( self.rate * dt, true)

	end

	inst:ListenForEvent( "respawnfromghost", OnRespawn )

	return inst

end

return MakePlayerCharacter( "mortox", prefabs,assets, common_postinit, master_postinit, nil)