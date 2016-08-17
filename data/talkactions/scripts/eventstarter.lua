function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end
	
	local params = param:split(", ")

	if params[1] == "spider" then
		if SPIDER_init() then
			return player:sendCancelMessage("Spider event is active.")
		end
	elseif params[1] == "swim" then
		if SE_init() then
			return player:sendCancelMessage("Swim event is active.")
		end
	elseif params[1] == "exp" then
		if EXP_init() then
			return player:sendCancelMessage("EXP event is active.")
		end
	elseif params[1] == "loot" then
		if LOOT_init() then
			return player:sendCancelMessage("Loot event is active.")
		end	
end		
return true
end
