function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)

local config = {
	[3070] = {bag = 10518, item = 8881},
	[3071] = {bag = 15646, item = 8882},
	[3072] = {bag = 10522, item = 8883}	
	}

	local v = config[item.uid]
	if v and player:getStorageValue(Storage.Grave.Mission08) == 1 and player:getStorageValue(Storage.Grave.Armor) == -1 then
		if player:getFreeCapacity() >= ItemType(v.item):getWeight() and ItemType(v.bag):getWeight() then
			
			local container = player:addItem(v.bag, 1, false)
			if container then
				container:addItem(v.item, 1)
				container:addItem(2160, 50)
			else
				return player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found ' .. ItemType(v.bag):getName() .. ', but you have no room to take it.')
			end
			player:setStorageValue(Storage.Grave.Armor,1)
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. ItemType(v.item):getName() .. '.')
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. ItemType(v.item):getName() .. ' weighing ' .. string.format('%.2f', ((ItemType(v.item):getWeight() + ItemType(v.bag):getWeight()) / 100)) ..  ' oz it\'s too heavy.')
		end
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "It is empty.")
	end
	return true
end