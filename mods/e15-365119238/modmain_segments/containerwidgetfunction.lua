local require = GLOBAL.require
require "prefabutil"
require "class"
local InvSlot = require "widgets/invslot"
local UtilSlot = require "widgets/utilslot"--mod
local Widget = require "widgets/widget"
local Text = require "widgets/text"
local UIAnim = require "widgets/uianim"
local ImageButton = require "widgets/imagebutton"
local ItemTile = require "widgets/itemtile"
local cooking = require "cooking"
local ContainerWidget = require("widgets/containerwidget")




ContainerWidget.old_container_open = ContainerWidget.Open
ContainerWidget.old_container_close = ContainerWidget.Close
ContainerWidget.old_on_item_get = ContainerWidget.OnItemGet
ContainerWidget.old_on_item_lose = ContainerWidget.OnItemLose
function ContainerWidget:Open(container, doer)
    self:old_container_open(container, doer)
    if container:HasTag("SMARTERCROCKPOT") then
        --this makes the widget's background to be taller
        --Using this allows me to avoid overriding the animation with a bad one
        self.bganim.inst.UITransform:SetScale(1,1.4,1)

    local widget = container.replica.container:GetWidget()
    
    if widget.buttoninfo2 ~= nil and not GLOBAL.TheInput:ControllerAttached() then
        self.button2 = self:AddChild(ImageButton("images/ui.xml", "button_small.tex", "button_small_over.tex", "button_small_disabled.tex"))
	    self.button2:SetPosition(widget.buttoninfo2.position)
	    self.button2:SetText(widget.buttoninfo2.text)
        if widget.buttoninfo2.fn ~= nil then
            self.button2:SetOnClick(function() widget.buttoninfo2.fn(container, doer) end)
        end
	    self.button2:SetFont(GLOBAL.BUTTONFONT)
	    self.button2:SetTextSize(35)
	    self.button2.text:SetVAlign(GLOBAL.ANCHOR_MIDDLE)
	    self.button2.text:SetColour(0, 0, 0, 1)

		if widget.buttoninfo2.validfn ~= nil then
			if widget.buttoninfo2.validfn(container) then
				self.button2:Enable()
			else
				self.button2:Disable()
			end
		end
	end
    
    --mod
    self.onpredictionfn = function(inst, data) self:OnPrediction(data) end
    self.inst:ListenForEvent("prediction", self.onpredictionfn, container)
    
    self.container:RemoveTag("PREDICTED") --mod
    end
end


function ContainerWidget:Close()
        --mod
        if self.button2 ~= nil then
			self.button2:Kill()
			self.button2 = nil
		end
       
        if self.utilslots then
            for k,v in pairs(self.utilslots) do
                self:RemoveChild(v)
                v:Kill()
            end
        end
        self.utilslots={}
        if self.container then
            self.container:RemoveTag("PREDICTED") --mod
        end
        
        if self.onpredictionfn ~= nil then
            self.inst:RemoveEventCallback("prediction", self.onpredictionfn, self.container)
            self.onpredictionfn = nil
        end
        
        --end mod
        self:old_container_close(container, doer)
end


function ContainerWidget:OnPrediction(data)--mod
    local widget = self.container.replica.container:GetWidget()
    
	if widget.slotpos then
		--delete the current util slot to avoid stacking
		if self.utilslots and self.utilslots[1] then
			self:RemoveChild(self.utilslots[1])
		end
		self.utilslots={}
		--create slot
		local slot = UtilSlot(1,"images/hud.xml", "inv_slot.tex", self.owner, self.container.replica.container)
		local tile = ItemTile(data.item)
		tile:SetPercent(data.odds)
		--place item in slot
		slot:SetTile(tile)
		--add slot to the crock pot for users to see
		self:AddChild(slot)
		--remember slots for later deleting or more sophisticated unimplemented use
		table.insert(self.utilslots,slot)
          
		--give location
		slot:SetPosition(widget.utilslotpos[1])
		self.container:AddTag("PREDICTED") --mod
		if not self.container.replica.container:IsSideWidget() then
			slot.side_align_tip = (widget.side_align_tip or 0) - widget.utilslotpos[1].x
		end
	end
		
end

local function RefreshButton2(inst, self)
    --mod
    if self.isopen then
        -- if self.button2 ~= nil and self.container ~= nil then
            local widget = self.container.replica.container:GetWidget()
            if widget ~= nil and widget.buttoninfo2 ~= nil and widget.buttoninfo2.validfn ~= nil then
                if widget.buttoninfo2.validfn(self.container) then
                    self.button2:Enable()
                else
                    self.button2:Disable()
                end
            end
        -- end
    end
    
    
end
function ContainerWidget:OnItemGet(data)
    self:old_on_item_get(data)
    if self.button2 ~= nil and self.container ~= nil then
        RefreshButton2(self.inst, self)
        self.inst:DoTaskInTime(0, RefreshButton2, self)
    end
end
function ContainerWidget:OnItemLose(data)
    self:old_on_item_lose(data)
    --mod
    if self.utilslots then
            for k,v in pairs(self.utilslots) do
                self:RemoveChild(v)
                v:Kill()
            end
        end
        self.utilslots={}
        if self.container then
            self.container:RemoveTag("PREDICTED") --mod
        end
    if self.button2 ~= nil and self.container ~= nil then
        RefreshButton2(self.inst, self)
        self.inst:DoTaskInTime(0, RefreshButton2, self)
    end
    --end mod
end
