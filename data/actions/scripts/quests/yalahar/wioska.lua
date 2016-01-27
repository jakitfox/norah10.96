function onUse(player, item, frompos, item2, topos)

local itempos
itempos = Tile(325,1304,7):getItemById(5924)

if item.itemid == 1945 then 
	if	player:getStorageValue(Storage.Yala.Helmet) == -1 and itempos then
		item:transform(1946)
		itempos:remove()
		player:setStorageValue(Storage.Yala.Helmet,1)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Hahaha ,I made it")
		else
		player:sendTextMessage(MESSAGE_STATUS_SMALL, Game.getReturnMessage(RETURNVALUE_NOTPOSSIBLE))
end

elseif item.itemid == 1946 then
	item:transform(1945)
end
return true
end