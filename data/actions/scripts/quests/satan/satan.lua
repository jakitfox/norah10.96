function onUse(player, cid, item, fromPosition, itemEx, toPosition)

if player:getStorageValue(Storage.Satan.Zugurosh) == 2 and player:getStorageValue(Storage.Satan.Ushuriel) == 2 and player:getStorageValue(Storage.Satan.Golgordan) == 2 and player:getStorageValue(Storage.Satan.Annihilion) == 2 and player:getStorageValue(Storage.Satan.Madareth) == 2 and player:getStorageValue(Storage.Satan.Latrivan) == 2 and player:getStorageValue(Storage.Satan.Hellgorak) == 2 then
		player:teleportTo({x=767, y=397, z=15})
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
else
	player:sendTextMessage(MESSAGE_INFO_DESCR,'You aren\'t standed on all thrones!')
end
return true
end