local function ContainerPostInit(inst)

	inst._CanTakeItemInSlot = inst.CanTakeItemInSlot

	function inst:CanTakeItemInSlot(item, slot)
		if item.components and item.components.characterspecific and not item.components.characterspecific:CanPickUp(inst.opener) and not item.components.characterspecific:IsStorable() then
    		inst.components.talker:Say(item.components.characterspecific:GetComment())
    		inst.opener.components.inventory:DropItem(item)
    		return false
    	end

    	if item.components and item.components.characterspecific and not item.components.characterspecific:CanPickUp(inst.opener) and inst.type == "pack" then
    		inst.components.talker:Say(item.components.characterspecific:GetComment())
    		inst.opener.components.inventory:DropItem(item)
    		return false
    	end

    	return inst:_CanTakeItemInSlot(item, slot)
	end

	inst._GiveItem = inst.GiveItem

	function inst:GiveItem( inst, slot, src_pos, drop_on_fail )
		
		if not self:CanTakeItemInSlot(inst, slot) then
			return false
		end
		drop_on_fail = drop_on_fail == nil and true or false
		if item and item.components.inventoryitem and self:CanTakeItemInSlot(item, slot) then
		
		--try to burn off stacks if we're just dumping it in there
		if item.components.stackable ~= nil and self.acceptsstacks then
            --Added this for when we want to dump a stack back into a
            --specific spot (e.g. moving half a stack failed, so we
            --need to dump the leftovers back into the original stack)
            if slot ~= nil and slot <= self.numslots then
                local other_item = self.slots[slot]
                if other_item ~= nil and other_item.prefab == item.prefab and not other_item.components.stackable:IsFull() then

                    if self.inst.components.inventoryitem ~= nil and self.inst.components.inventoryitem.owner ~= nil then
                        self.inst.components.inventoryitem.owner:PushEvent("containergotitem", { item = item, src_pos = src_pos })
                    end

                    item = other_item.components.stackable:Put(item, src_pos)
                    if item == nil then
                        return true
                    end

                    slot = nil
                end
            end

            if slot == nil then
                for k = 1,self.numslots do
    				local other_item = self.slots[k]
    				if other_item and other_item.prefab == item.prefab and not other_item.components.stackable:IsFull() then
    					
    					if self.inst.components.inventoryitem and self.inst.components.inventoryitem.owner then
    						self.inst.components.inventoryitem.owner:PushEvent("containergotitem", {item = item, src_pos = src_pos})
    					end
    					
    		            item = other_item.components.stackable:Put(item, src_pos)
    		            if not item then
    						return true
    		            end
    				end
                end
            end
		end
		
        local use_slot = slot and slot <= self.numslots and not self.slots[slot]
        local in_slot = nil
        if use_slot then
            in_slot = slot
        elseif self.numslots > 0 then
            for k = 1,self.numslots do
                if not self.slots[k] then
                    in_slot = k
                    break
                end
            end
        end
        
        if in_slot then

			--weird case where we are trying to force a stack into a non-stacking container. this should probably have been handled earlier, but this is a failsafe        
			if item.components.stackable and item.components.stackable:StackSize() > 1 and not self.acceptsstacks then
				item = item.components.stackable:Get()
				self.slots[in_slot] = item
				item.components.inventoryitem:OnPutInInventory(self.inst)
				self.inst:PushEvent("itemget", {slot = in_slot, item = item, src_pos = src_pos})	
				return false
			end
			
			self.slots[in_slot] = item
			item.components.inventoryitem:OnPutInInventory(self.inst)
			self.inst:PushEvent("itemget", {slot = in_slot, item = item, src_pos = src_pos})
			
			if self.inst.components.inventoryitem and self.inst.components.inventoryitem.owner and not self.ignoresound then
				self.inst.components.inventoryitem.owner:PushEvent("containergotitem", {item = item, src_pos = src_pos})
			end
			
			return true
        else
            if drop_on_fail then
				item.Transform:SetPosition(self.inst.Transform:GetWorldPosition())
				if item.components.inventoryitem then
	                item.components.inventoryitem:OnDropped(true)
				end
			end				
            return false
        end
        
    end


		return self:_GiveItem(inst , slot, src_pos, drop_on_fail)
end


	inst._TakeActiveItemFromAllOfSlot = inst.TakeActiveItemFromAllOfSlot
	
	function inst:TakeActiveItemFromAllOfSlot(slot)
		local item = nil

		if self.slots ~= nil then
			item = self.slots[slot]
		elseif self._items ~= nil then
			item = self._items[slot]
		end

		if item and item.components and item.components.characterspecific and not item.components.characterspecific:CanPickUp(self.opener) then
			inst.opener.components.talker:Say(item.components.characterspecific:GetComment())
    		return 
    	end

		inst:_TakeActiveItemFromAllOfSlot(slot)
	end

	inst._SwapActiveItemWithSlot = inst.SwapActiveItemWithSlot

	function inst:SwapActiveItemWithSlot(slot)
		local item = nil

		if self.slots ~= nil then
			item = self.slots[slot]
		elseif self._items ~= nil then
			item = self._items[slot]
		end

		if item and item.components and item.components.characterspecific and not item.components.characterspecific:CanPickUp(self.opener) then
			inst.opener.components.talker:Say(item.components.characterspecific:GetComment())
    		return 
    	end

		inst:_SwapActiveItemWithSlot(slot)
	end

	inst._MoveItemFromAllOfSlot = inst.MoveItemFromAllOfSlot

	function inst:MoveItemFromAllOfSlot(slot, container)
		local item = nil

		if self.slots ~= nil then
			item = self.slots[slot]
		elseif self._items ~= nil then
			item = self._items[slot]
		end

		if item and item.components and item.components.characterspecific and not item.components.characterspecific:CanPickUp(self.opener) then
			inst.opener.components.talker:Say(item.components.characterspecific:GetComment())
    		return 
    	end

		inst:_MoveItemFromAllOfSlot(slot, container)
	end

	return inst
end

AddComponentPostInit("container", ContainerPostInit)
AddComponentPostInit("container_replica", ContainerPostInit)
AddPrefabPostInit("container_classified", ContainerPostInit)