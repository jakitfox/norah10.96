function onUse(player, item, frompos, item2, topos)

local BACKPACKS = {11243, 10522, 11119, 11244, 10521}	
local random = math.random(1, table.maxn(BACKPACKS))

if item.uid == 3153 and player:getStorageValue(Storage.Blue.Reward03) == -1 then
	if player:getFreeCapacity() >= ItemType(BACKPACKS[random]):getWeight() then
		if player:addItem(BACKPACKS[random], 1, false) then
			else
			return player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found ' .. ItemType(BACKPACKS[random]):getName() .. ', but you have no room to take it.')
		end
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. ItemType(BACKPACKS[random]):getName() .. '.')
			player:setStorageValue(Storage.Blue.Reward03, 1)
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. ItemType(BACKPACKS[random]):getName() .. ' weighing ' .. string.format('%.2f', (ItemType(BACKPACKS[random]):getWeight() / 100)) ..  ' oz it\'s too heavy.')
		end
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "It is empty.")
end
return true
end