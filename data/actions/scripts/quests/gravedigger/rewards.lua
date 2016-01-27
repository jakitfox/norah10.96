function onUse(player, item, frompos, item2, topos)

local config = {
	[3073] = {item = 8925},
	[3074] = {item = 8931},
	[3075] = {item = 8927}	
	}

local v = config[item.uid]
if v and player:getStorageValue(Storage.Grave.Weapon) == -1 then
	if player:getFreeCapacity() >= ItemType(v.item):getWeight() then
		if player:addItem(v.item, 1, false) then
			else
			return player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found ' .. ItemType(v.item):getName() .. ', but you have no room to take it.')
		end
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. ItemType(v.item):getName() .. '.')
			player:setStorageValue(Storage.Grave.Weapon, 1)
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. ItemType(v.item):getName() .. ' weighing ' .. string.format('%.2f', (ItemType(v.item):getWeight() / 100)) ..  ' oz it\'s too heavy.')
		end
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "It is empty.")
end
return true
end