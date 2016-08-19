function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)

if player:getStorageValue(Storage.Black.Key) == -1 then
	if player:getFreeCapacity() >= ItemType(2087):getWeight() then
		if player:addItem(2087,1, false):setActionId(3215) then 
			else
			return player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found ' .. ItemType(2087):getName() .. ', but you have no room to take it.')
		end
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. ItemType(2087):getName() .. '.')
			player:setStorageValue(v.storage, 1)
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. ItemType(2087):getName() .. ' weighing ' .. string.format('%.2f', (ItemType(2087):getWeight() / 100)) ..  ' oz it\'s too heavy.')
		end
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "It is empty.")
end
return true
end