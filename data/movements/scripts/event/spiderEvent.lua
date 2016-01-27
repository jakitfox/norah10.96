function onEquip(cid, item, slot)
	local player = Player(cid)
	if spiderEvent and spiderEvent:isActive() and spiderEvent:isPlayerInEvent(player) and spiderEvent:isPlayerOnArea(player) then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You can not put during the event.")
		return false
	end
	return true
end