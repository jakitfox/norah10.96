function onUse(player, item, fromPosition, itemEx, toPosition)

if player:getStorageValue(Storage.Satan.Mission01) == 3 and player:getItemCount(6561) >= 1 then
		player:teleportTo(Position(492,448,14))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You don\'t have access to entry hell.")
	end
return true
end