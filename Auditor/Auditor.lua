Auditor = {}
Auditor.New = function()
	local self = {}
	
	self.GemAuditor = GemAuditor.New()
	self.EnchantAuditor = EnchantAuditor.New()
	self.BeltBuckleAuditor = BeltBuckleAuditor.New()
	
	self.ProfessionAuditor = ProfessionAuditor.New()
	
	self.Audit = function()
		for itemId, itemInfo in pairs(items) do
			self.AuditItem(itemInfo.name)
		end
	
		self.AuditCharacter()
	end
	
	self.AuditItem = function(item)
		local itemId = GetInventorySlotInfo(item)
		
		self.GemAuditor.Audit(itemId)		
		self.EnchantAuditor.Audit(itemId)
		
	end
	
	self.AuditCharacter = function()
    self.ProfessionAuditor.Audit()
	end
	
	return self
end