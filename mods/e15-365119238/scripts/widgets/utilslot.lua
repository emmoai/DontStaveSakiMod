--mod widget.
-- Identical in interface to InvSlot
-- only the click\trade methods are blank.
--inspect is untouched

local ItemSlot = require "widgets/itemslot"


local UtilSlot = Class(ItemSlot, function(self, num, atlas, bgim, owner, container)
    ItemSlot._ctor(self, atlas, bgim, owner)
    self.owner = owner
    self.container = container
    self.num = num
end)

function UtilSlot:GetSlotNum()
    if self.tile and self.tile.item then
        return self.tile.item.components.inventoryitem:GetSlotNum()
    end
end

function UtilSlot:OnControl(control, down)
    if UtilSlot._base.OnControl(self, control, down) then return true end
    if down then
        if control == CONTROL_ACCEPT then
            --generic click, with possible modifiers
            if TheInput:IsControlPressed(CONTROL_FORCE_INSPECT) then
                self:Inspect()
            --[[else                
                if TheInput:IsControlPressed(CONTROL_FORCE_TRADE) then
                    self:TradeItem(TheInput:IsControlPressed(CONTROL_FORCE_STACK))
                else
                    self:Click(TheInput:IsControlPressed(CONTROL_FORCE_STACK))
                end
			]]
            end
        --[[  the rest are explicit control presses for controllers
        elseif control == CONTROL_SPLITSTACK then
            self:Click(true)
        elseif control == CONTROL_TRADEITEM then
            self:TradeItem(false)
        elseif control == CONTROL_TRADESTACK then
            self:TradeItem(true)
        elseif control == CONTROL_INSPECT then
            self:Inspect()
        else
            return false
			]]
        end
        return true
    end


end


function UtilSlot:Click(stack_mod)    
end


--moves items between open containers
function UtilSlot:TradeItem(stack_mod)
end

return UtilSlot
