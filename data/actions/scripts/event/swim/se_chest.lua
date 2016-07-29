function onUse(cid, item, frompos, item2, topos)
	if tonumber(table.find(active_events,8)) ~= nil then
		doPlayerAddItem(cid, 24115, 10)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You won.")
		SE_stop(getPlayerName(cid), 10 .. "x " .. 24115)
		return true
	end
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Event inactive.")
	return true
end
  