function onStepIn(player, item, position, fromPosition, lastPosition)

local newPosition = {x=351, y=1278, z=8}

if player:getStorageValue(Storage.Yala.Helmet) == -1 then
	doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"Teleport is closed.")
	player:teleportTo(fromPosition)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
elseif player:getStorageValue(Storage.Yala.Helmet) == 1 then
	player:teleportTo(newPosition)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:setStorageValue(Storage.Yala.Helmet,2)
else
	player:teleportTo(fromPosition)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
end
return true
end