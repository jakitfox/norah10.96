function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)

if player:getStorageValue(Storage.Satan.Mission01) == 1 then
		if player:getFreeCapacity() >= ItemType(6561):getWeight() then
			if player:addItem(6561, 1, false) then
			else
				return player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found ' .. ItemType(6561):getName() .. ', but you have no room to take it.')
			end
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. ItemType(6561):getName() .. '.')
			player:setStorageValue(Storage.Satan.Mission01,2)
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. ItemType(6561):getName() .. ' weighing ' .. string.format('%.2f', (ItemType(6561):getWeight() / 100)) ..  ' oz it\'s too heavy.')
		end
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "It is empty.")
	end
	return true
end