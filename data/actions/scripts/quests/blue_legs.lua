function onUse(player, item, frompos, item2, topos)

local reward = {
	[3151] = { item = 7730, count = 1, storage = Storage.Blue.Reward02},
	[3152] = { item = 2160, count = math.random(3, 12), storage = Storage.Blue.Reward01}
	}
local v = reward[item.uid]
	
if v and player:getStorageValue(v.storage) == -1 then
	if player:getFreeCapacity() >= ItemType(v.item):getWeight() then
		if player:addItem(v.item, v.count, false) then
			else
			return player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found ' .. ItemType(v.item):getName() .. ', but you have no room to take it.')
		end
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. ItemType(v.item):getName() .. '.')
			player:setStorageValue(v.storage, 1)
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. ItemType(v.item):getName() .. ' weighing ' .. string.format('%.2f', (ItemType(v.item):getWeight() / 100)) ..  ' oz it\'s too heavy.')
		end
	else
	player:sendTextMessage(MESSAGE_INFO_DESCR, "It is empty.")
end
return true
end