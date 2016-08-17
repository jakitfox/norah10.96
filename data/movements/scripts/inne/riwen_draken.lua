function onStepIn(player, item, position, fromPosition, lastPosition)

if item.uid == 3171 then
	if player:getStorageValue(Storage.Riwen.RiwenPass) == 1 then
		player:teleportTo(Position(417,1146,6))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
	player:teleportTo(fromPosition)
	player:sendTextMessage(MESSAGE_INFO_DESCR,"You don\'t have access to entry.")
end

elseif item.actionid == 3175 and player:getStorageValue(Storage.Riwen.RiwenPass) == -1 then
	player:setStorageValue(Storage.Riwen.RiwenPass, 1)
end	
return true
end