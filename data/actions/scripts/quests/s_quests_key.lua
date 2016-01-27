function onUse(player, item, frompos, item2, topos)
if item.uid == 3151 and player:getStorageValue(Storage.Black.Key) == -1 then
		local bkkey = doPlayerAddItem(cid,2087,1)
		doSetItemActionId(bkkey, 3215)
		player:setStorageValue(Storage.Black.Key, 1)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found wooden key.")
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "The " .. ItemType(item.itemid):getName() .. " is empty.")
	end
return true
end