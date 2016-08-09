function onUse(player, item, frompos, item2, topos)

if player:getStorageValue(Storage.Ruiny.Mount) == -1 then
	player:addMount(88)
	player:sendTextMessage(MESSAGE_INFO_DESCR,"You have found a mount.")
	player:setStorageValue(Storage.Ruiny.Mount,1)
else
	player:sendTextMessage(MESSAGE_INFO_DESCR, "It is empty.")
end
return true
end