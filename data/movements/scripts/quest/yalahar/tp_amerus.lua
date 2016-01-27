function onStepIn(player, item, pos, lastPosition)


if player:getStorageValue(Storage.Yala.Menor) == 3 and player:getStorageValue(Storage.Yala.Adness) == 3 and player:getStorageValue(Storage.Yala.Kaneler) == 3 and player:getStorageValue(Storage.Yala.Zomer) == 3 and player:getStorageValue(Storage.Yala.Dazzer) == 3 and player:getStorageValue(Storage.Yala.Enorien) == 3 and player:getStorageValue(Storage.Yala.Rotter) == 3 then
	player:teleportTo(Position(161,1443,12))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
else
	player:teleportTo(lastPosition)
    player:sendTextMessage(MESSAGE_INFO_DESCR,'You dont have access to go here')
end
return true
end