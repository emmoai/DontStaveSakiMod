AddClassPostConstruct("widgets/textedit", function(self,...)
	if not self.OnTextInput then return end
	--self.OldOnTextInput=self.OnTextInput
	local function NewOnTextInput(self,...)
		--self.OldOnTextInput(...)--run the orginal fn  OnTextInput(text)
		--orginal steps
		if not self.editing then return end
		if not self.shown then return end

		if self.limit then
			local str = self:GetString()
			--print("len", string.len(str), "limit", self.limit)
			if string.len(str) >= self.limit then
				return
			end
		end
		--to comment
		-- if self.validchars then
			-- if not string.find(self.validchars, text, 1, true) then
				-- return
			-- end
		-- end		
		if ... == "\r" then--return - enter
			return
		end
		if ... == "\b" then--backspace		
			local SPCHARSET = [[ abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,:;[]\@!#$%&()'*+-/=?^_{|}~<>`_"]]
			if not string.find(SPCHARSET, string.sub(self:GetString(),-1), 1, true)  then
				self:SetString(string.sub(self:GetString(),1,-2))
			end
			return
		end		
		self.inst.TextEditWidget:OnTextInput(...)	
	end	
	self.OnTextInput=NewOnTextInput
	--解除房间名称等地方的粘贴限制↓↓
		if not self.SetAllowClipboardPaste then return end
	OldSetAllowClipboardPaste=self.SetAllowClipboardPaste
	local function NewSetAllowClipboardPaste(self,...)
		OldSetAllowClipboardPaste(self,true)		
	end	
	self.SetAllowClipboardPaste=NewSetAllowClipboardPaste
end)