function onSay(cid, words, param)
	local params = param:split(", ")
	local player = Player(cid)

if params[1] == "on" then
		if not player:getGroup():getAccess() then
			return true
		end
		if SPIDER_init() then
			return player:sendCancelMessage("Spider event is active.")
		end
		if not SPIDER_init() then
			SPIDER_init()
		end
		
elseif params[1] == "swim" then
		if not player:getGroup():getAccess() then
			return true
		end
		if SE_init() then
			return player:sendCancelMessage("Swim event is active.")
		end
		if not SE_init() then
			SE_init()
		end
		
end		
return true
end
