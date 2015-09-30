table.insert(GLOBAL.STRINGS, "DFV_LANG")
table.insert(GLOBAL.STRINGS, "DFV_HUNGER")
table.insert(GLOBAL.STRINGS, "DFV_HEALTH")
table.insert(GLOBAL.STRINGS, "DFV_SANITY")
table.insert(GLOBAL.STRINGS, "DFV_PERISHSOON")
table.insert(GLOBAL.STRINGS, "DFV_PERISHIN")
table.insert(GLOBAL.STRINGS, "DFV_SPOILSOON")
table.insert(GLOBAL.STRINGS, "DFV_SPOILIN")
table.insert(GLOBAL.STRINGS, "DFV_STALESOON")
table.insert(GLOBAL.STRINGS, "DFV_STALEIN")
table.insert(GLOBAL.STRINGS, "DFV_SPOILDAY")
table.insert(GLOBAL.STRINGS, "DFV_MIN")
table.insert(GLOBAL.STRINGS, "DFV_REMAININGBURNTIME")
table.insert(GLOBAL.STRINGS, "DFV_TIMETILLMORNING")
local DFV_SHOWDUR = not(GetModConfigData("DFV_PercentReplace", true)=="default")
local DFV_FUELEDSET = GetModConfigData("DFV_FueledSettings", true)
local DFV_SHOWFIRETIME = not(GetModConfigData("DFV_ShowFireTime", true)=="default")
local show_damage = (GetModConfigData("DFV_ShowDamage", true)=="default")
local show_uses = (GetModConfigData("DFV_ShowUses", true)=="default")
local show_temp = (GetModConfigData("DFV_ShowTemperature", true)=="default")
local show_insul = (GetModConfigData("DFV_ShowInsulation", true)=="default")
local show_acond = (GetModConfigData("DFV_ShowACondition", true)=="default")
local show_adef = (GetModConfigData("DFV_ShowADefence", true)=="default")
local show_atype = (GetModConfigData("DFV_ShowAType", true)=="default")
local require = GLOBAL.require
local itemvalues = require "components/itemvalues"
local ItemTile = require "widgets/itemtile"
local Inv = require "widgets/inventorybar"
local Text = require "widgets/text" 
local DFV_LANG = GetModConfigData("DFV_Language")
local DFV_MIN = not (GetModConfigData("DFV_MinimalMode", true)=="default")

GLOBAL.STRINGS.DFV_MIN = DFV_MIN
GLOBAL.STRINGS.DFV_LANG = DFV_LANG

if DFV_LANG == "FR" then
	GLOBAL.STRINGS.DFV_HUNGER = "Points de faim"
	GLOBAL.STRINGS.DFV_HEALTH = "Points de vie"
	GLOBAL.STRINGS.DFV_SANITY = "Sante mentale"
	GLOBAL.STRINGS.DFV_PERISHSOON = "Perira bientot"
	GLOBAL.STRINGS.DFV_PERISHIN = "Perira"
	GLOBAL.STRINGS.DFV_SPOILSOON = "Pourrira bientot"
	GLOBAL.STRINGS.DFV_SPOILIN = "Pourrira dans"
	GLOBAL.STRINGS.DFV_SPOILDAY = "jour"
	GLOBAL.STRINGS.DFV_STALESOON = "Ira tres vite perime"
	GLOBAL.STRINGS.DFV_STALEIN = "Ira vicie dans"
	GLOBAL.STRINGS.DFV_REMAININGBURNTIME = "Temps de combustion restant: "
	GLOBAL.STRINGS.DFV_TIMETILLMORNING = "Temps jusqu'au matin: "
else
	GLOBAL.STRINGS.DFV_HUNGER = "饥饿值: "
	GLOBAL.STRINGS.DFV_HEALTH = "生命值: "
	GLOBAL.STRINGS.DFV_SANITY = "精神值: "
	GLOBAL.STRINGS.DFV_PERISHSOON = "很快会损坏"
	GLOBAL.STRINGS.DFV_PERISHIN = "会损坏在"
	GLOBAL.STRINGS.DFV_SPOILSOON = "很快会腐烂"
	GLOBAL.STRINGS.DFV_SPOILIN = "会腐烂在"
	GLOBAL.STRINGS.DFV_STALESOON = "很快会变味"
	GLOBAL.STRINGS.DFV_STALEIN = "会变味在"
	GLOBAL.STRINGS.DFV_SPOILDAY = "天"
	GLOBAL.STRINGS.DFV_REMAININGBURNTIME = "燃烧时间: "
	GLOBAL.STRINGS.DFV_TIMETILLMORNING = "距离天亮: "
end

 
local ItemTile_GetDescriptionString_base = ItemTile.GetDescriptionString or function() return "" end
local Inv_UpdateCursorText_base = Inv.UpdateCursorText or function() return "" end







function ItemTile:UpdateTooltip()
	local player = GLOBAL.ThePlayer
	local keydown = false
	local ctrlkeydown = false
	if GLOBAL.TheInput:IsControlPressed(GLOBAL.CONTROL_FORCE_INSPECT) then
		keydown = true
	end
	if GLOBAL.TheInput:IsControlPressed(GLOBAL.CONTROL_FORCE_STACK) then
		ctrlkeydown = true
	end
	
	
	SendModRPCToServer(MOD_RPC["FoodValues - ItemTooltips"]["FIU"], self.item, keydown, ctrlkeydown, DFV_FUELEDSET, show_damage, show_uses, show_temp, show_insul, show_acond, show_adef, show_atype)
	

		self.isupdated = false
	player:ListenForEvent("item_value_updated", function()
		
		local str = self:GetDescriptionString()
		self:SetTooltip(str)
		if self.item:GetIsWet() then
			self:SetTooltipColour(GLOBAL.unpack(GLOBAL.WET_TEXT_COLOUR))
		else
			self:SetTooltipColour(GLOBAL.unpack(GLOBAL.NORMAL_TEXT_COLOUR))
		end
		self.isupdated = true
	end)
	

	
end

function ItemTile:GetDescriptionString()
		
	local player = GLOBAL.ThePlayer
	local strings = GLOBAL.STRINGS
	local str = ItemTile_GetDescriptionString_base(self)
	local ModString = player.components.itemvalues.string_dirty:value()
	if ModString then
		str = str .. ModString
	end
    return str
       
end


function ItemTile:SetPerishPercent(percent)
    self.spoilage:GetAnimState():SetPercent("anim", 1 - percent)
	if self.focus then
		self:UpdateTooltip()
	end
end

function ItemTile:SetPercent(percent)
    --if self.item.replica.stackable == nil then
        
    if not self.percent then
        self.percent = self:AddChild(Text(GLOBAL.NUMBERFONT, 42))
        if GLOBAL.JapaneseOnPS4() then
            self.percent:SetHorizontalSqueeze(0.7)
        end
        self.percent:SetPosition(5,-32+15,0)
    end
    local val_to_show = percent*100
    if val_to_show > 0 and val_to_show < 1 then
        val_to_show = 1
    end
    self.percent:SetString(string.format("%2.0f%%", val_to_show))
        
	if self.focus then
		self:UpdateTooltip()
	end
    --end
end


function Inv:UpdateCursorText()
 
	local tmp = Inv_UpdateCursorText_base(self)
 
    local inv_item = self:GetCursorItem()
    if inv_item ~= nil and inv_item.replica.inventoryitem == nil then
        inv_item = nil
    end
    
 	if self.open then
	    if inv_item ~= nil then
	    
	        local controller_id = GLOBAL.TheInput:GetControllerID()
			local realfood = nil
			local show_spoil = GLOBAL.TheInput:IsControlPressed(GLOBAL.CONTROL_INSPECT)
			
	        local player = GLOBAL.ThePlayer
	        local active_item = player.replica.inventory:GetActiveItem()
	        
	 	    local strings = GLOBAL.STRINGS
			local str = {}
			table.insert(str, self.actionstringbody:GetString())
	
			
			local keydown = GLOBAL.TheInput:IsControlPressed(GLOBAL.CONTROL_FOCUS_RIGHT)
			
			local ctrlkeydown = GLOBAL.TheInput:IsControlPressed(GLOBAL.CONTROL_FOCUS_LEFT)
			
			if GLOBAL.TheInput:IsControlPressed(GLOBAL.CONTROL_FOCUS_UP) then
				keydown = true
				ctrlkeydown = true
			end
			
			SendModRPCToServer(MOD_RPC["FoodValues - ItemTooltips"]["FIU"], inv_item, keydown, ctrlkeydown, DFV_FUELEDSET, show_damage, show_uses, show_temp, show_insul, show_acond, show_adef, show_atype)

			local ModString = string.sub(player.components.itemvalues.string_dirty:value(), 2)
			if ModString ~= "" then
				table.insert(str, ModString)
			end
			    	    
			local TIP_YFUDGE = 16
			local W = 68
			local CURSOR_STRING_DELAY = 10
	        local was_shown = self.actionstring.shown
	        local old_string = self.actionstringbody:GetString()
	        local new_string = table.concat(str, '\n')
	        
	        if old_string ~= new_string then
	            self.actionstringbody:SetString(new_string)
	            self.actionstringtime = CURSOR_STRING_DELAY
	            self.actionstring:Show()
	        end
	
	        local w0, h0 = self.actionstringtitle:GetRegionSize()
	        local w1, h1 = self.actionstringbody:GetRegionSize()
	
	        local wmax = math.max(w0, w1)
	
	        local dest_pos = self.active_slot:GetWorldPosition()
	
	        local xscale, yscale, zscale = self.root:GetScale():Get()
	
	        if self.active_slot.side_align_tip then
	            -- in-game containers, chests, fridge
	            self.actionstringtitle:SetPosition(wmax/2, h0/2)
	            self.actionstringbody:SetPosition(wmax/2, -h1/2)
	
	            dest_pos.x = dest_pos.x + self.active_slot.side_align_tip * xscale
	        elseif self.active_slot.top_align_tip then
	            -- main inventory
	            self.actionstringtitle:SetPosition(0, h0/2 + h1)
	            self.actionstringbody:SetPosition(0, h1/2)
	
	            dest_pos.y = dest_pos.y + (self.active_slot.top_align_tip + TIP_YFUDGE) * yscale
	        else
	            -- old default as fallback ?
	            self.actionstringtitle:SetPosition(0, h0/2 + h1)
	            self.actionstringbody:SetPosition(0, h1/2)
	
	            dest_pos.y = dest_pos.y + (W/2 + TIP_YFUDGE) * yscale
	        end
	
	       
	        if dest_pos:DistSq(self.actionstring:GetPosition()) > 1 then
	            self.actionstringtime = CURSOR_STRING_DELAY
	            if was_shown then
	                self.actionstring:MoveTo(self.actionstring:GetPosition(), dest_pos, .1)
	            else
	                self.actionstring:SetPosition(dest_pos)
	                self.actionstring:Show()
	            end
	        end
	
	end
	end
end


AddPrefabPostInitAny(function(inst)
	if inst:HasTag("campfire") then 
			inst.basename = inst.name
			inst._name = GLOBAL.net_string(inst.GUID, "fueled_name", "fueled_name_dirty")
			
			local function FuledNameDirty(inst)
					inst.name =  inst._name:value()
			end
			
			if not GLOBAL.TheWorld.ismastersim then
				inst:ListenForEvent("fueled_name_dirty", FuledNameDirty)
			end
		if inst.components.fueled then	
			inst.components.fueled:SetUpdateFn(function() 
				local minutes_left = math.floor((inst.components.fueled.currentfuel / inst.components.fueled.rate) / 60)
				local seconds_left = math.floor(inst.components.fueled.currentfuel - minutes_left * 60)
				local zero = ""
				if seconds_left < 10 then
					zero = "0"
				end
				if inst.components.fueled:IsEmpty() or DFV_SHOWFIRETIME then
					inst.name = inst.basename
				else
					inst.name = inst.basename .. "\n" .. GLOBAL.STRINGS.DFV_REMAININGBURNTIME .. minutes_left .. ":" .. zero .. seconds_left
				end
				
				inst._name:set(inst.name)
			end)
		end
	end
end)

AddPlayerPostInit(function(inst) 
	inst:AddComponent("itemvalues")
end)


AddModRPCHandler("FoodValues - ItemTooltips", "FIU", function(player, item, keydown, crtlkeydown, DFV_FUELEDSET, show_damage, show_uses, show_temp, show_insul, show_acond, show_adef, show_atype)
	player.components.itemvalues:On_ItemValue_Changed(player, item, keydown, crtlkeydown, DFV_FUELEDSET, show_damage, show_uses, show_temp, show_insul, show_acond, show_adef, show_atype)
end)

