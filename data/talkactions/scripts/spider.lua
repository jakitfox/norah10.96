function onSay(cid, words, param)
	local params = param:split(", ")
	local player = Player(cid)

	if params[1] == nil then
		if not spiderEvent then
			return player:sendCancelMessage("Event is disabled.")
		end
		if spiderEvent:isPlayerInEvent(player) then
			return player:sendCancelMessage("You are already subscribed.")
		end
		if spiderEvent:isActive() and (not spiderEvent:canSubscription()) then
			return player:sendCancelMessage("It's too late. Event has started up!")
		end
		if spiderEvent:isActive() then
			spiderEvent:addPlayerToEvent(player)
		else
			return player:sendCancelMessage("Event is disabled.")
		end	
	elseif params[1] == "on" then
		if not player:getGroup():getAccess() then
			return true
		end
		if spiderEvent and spiderEvent:isActive() then
			return player:sendCancelMessage("Spider event is active.")
		end
		if not spiderEvent then
			spiderEvent = SpiderEvent:new(1)
		end
		
		spiderEvent:activeSubscription( 20 )
	end
end