function Creature:onTargetCombat(target)
	if not self then
		return true
	end

	if self:isPlayer() and target:isPlayer() then
		local party = self:getParty()
		if party then
			local targetParty = target:getParty()
			if targetParty and targetParty == party then
				return RETURNVALUE_YOUMAYNOTATTACKTHISPLAYER
			end
		end
	end
	return true
end