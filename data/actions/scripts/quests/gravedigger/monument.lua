function onUse(player, item, frompos, item2, topos)

if item.uid == 3044 then
	if player:getStorageValue(Storage.Grave.Mission01) == 1 then
		player:teleportTo({x=398, y=356, z=8})
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:setStorageValue(Storage.Grave.Monument,1)
else
	player:sendTextMessage(MESSAGE_INFO_DESCR,"You don\'t have access to entry.")
end

elseif item.uid == 3045 then
	player:teleportTo({x=416, y=353, z=7})
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:setStorageValue(Storage.Grave.Monument,-1)
end
return true
end