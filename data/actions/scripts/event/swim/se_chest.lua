function onUse(cid, item, frompos, item2, topos)
local player = Player(cid)
	if tonumber(table.find(active_events,3)) ~= nil then
		player:setCoinsBalance(player:getCoinsBalance() + 20)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You won.")
		SE_stop(getPlayerName(cid), 10 .. "x " .. 24115)
		return true
	end
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Event inactive.")
	return true
end
  