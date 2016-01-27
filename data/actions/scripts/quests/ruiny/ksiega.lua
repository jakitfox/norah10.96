function onUse(player, item, position, fromPosition)

if player:getStorageValue(Storage.Ruiny.Notes) == -1 then
	if player:getFreeCapacity() >= ItemType(12406):getWeight() then
		if player:addItem(12406, 1, false) then
			else
			return player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found ' .. ItemType(12406):getName() .. ', but you have no room to take it.')
		end
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. ItemType(12406):getName() .. '.')
			player:setStorageValue(Storage.Ruiny.Notes, 1)
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. ItemType(12406):getName() .. ' weighing ' .. string.format('%.2f', (ItemType(12406):getWeight() / 100)) ..  ' oz it\'s too heavy.')
		end
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "It is empty.")
end
return true
end