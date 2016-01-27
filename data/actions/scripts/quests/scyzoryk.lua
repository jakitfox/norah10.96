function onUse(player, item, frompos, item2, topos)

local TYPES = {10511, 10513, 10515}	
local random = math.random(1, table.maxn(TYPES))

if item.uid == 3154 and player:getStorageValue(Storage.Blue.Reward04) == -1 then
	if player:getFreeCapacity() >= ItemType(TYPES[random]):getWeight() then
		if player:addItem(TYPES[random], 1, false) then
			else
			return player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found ' .. ItemType(TYPES[random]):getName() .. ', but you have no room to take it.')
		end
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. ItemType(TYPES[random]):getName() .. '.')
			player:setStorageValue(Storage.Blue.Reward04, 1)
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. ItemType(TYPES[random]):getName() .. ' weighing ' .. string.format('%.2f', (ItemType(TYPES[random]):getWeight() / 100)) ..  ' oz it\'s too heavy.')
		end
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "It is empty.")
end
return true
end