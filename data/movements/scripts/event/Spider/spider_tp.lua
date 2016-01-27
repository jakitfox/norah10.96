function onStepIn(cid, item, position, fromPosition)
        local player = Player(cid)
		local Equipment = {11374, 2195, 12646, 12607, 15490, 9956, 18404, 18406, 21691, 8908, 2169, 11301, 11303}
		
    if not player then
            return false
        end
  
        if getGlobalStorageValue(zeStartedGlobalStorage) == 2 then
            player:sendTextMessage(MESSAGE_INFO_DESCR, 'The Spider Event has already started.')
            player:teleportTo(fromPosition, true)
            return false
        end
  
        if getGlobalStorageValue(zeStartedGlobalStorage) <= 0 then
            player:sendTextMessage(MESSAGE_INFO_DESCR, 'This event is not active.')
            player:teleportTo(fromPosition, true)
            return false
        end
  
       if getGlobalStorageValue(zeJoinedCountGlobalStorage) > zeMaxPlayers then
            player:teleportTo(fromPosition, true)
            player:sendTextMessage(MESSAGE_INFO_DESCR, 'The Spider Event is already full! ['.. Game.getStorageValue(zeJoinedCountGlobalStorage) ..'/'.. zeMaxPlayers ..']')
            return false
        end
  
		for i = 1, #Equipment do
		if player:getItemCount(Equipment[i]) ~= 0 then
			 player:sendTextMessage(MESSAGE_INFO_DESCR, 'No equipment allowed here.')
			 player:teleportTo(fromPosition, true)
			return true
			end
		end
  
        player:teleportTo(zeWaitingRoomPos)
        setGlobalStorageValue(zeJoinedCountGlobalStorage, getGlobalStorageValue(zeJoinedCountGlobalStorage) + 1)
		sendChannelMessage(events_calendar.channel_id, TALKTYPE_CHANNEL_O, string.format('[Spider Event]: %s has joined the Spider Event! [%s/'.. zeMaxPlayers ..'].', player:getName(), getGlobalStorageValue(zeJoinedCountGlobalStorage)))
		player:setStorageValue(zeJoinStorage, 1)
        return true
end