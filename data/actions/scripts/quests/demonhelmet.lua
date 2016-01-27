function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)

if player:getStorageValue(Storage.DemonHelmet.Questline) == -1 then
		if player:getFreeCapacity() >= ItemType(2493):getWeight() then
			if player:addItem(2493, 1, false) then
			else
				return player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found ' .. ItemType(2493):getName() .. ', but you have no room to take it.')
			end
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. ItemType(2493):getName() .. '.')
			player:addOutfitAddon(542, 1)
			player:addOutfitAddon(541, 1)
			player:setStorageValue(Storage.DemonHelmet.Questline, 1)
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. ItemType(2493):getName() .. ' weighing ' .. string.format('%.2f', (ItemType(2493):getWeight() / 100)) ..  ' oz it\'s too heavy.')
		end
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "It is empty.")
	end
	return true
end