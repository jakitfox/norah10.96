function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
local config = {
	[3266] = {item = 2495},
	[3267] = {item = 8905},
	[3268] = {item = 16111},
	[3269] = {item = 16112}
}

local v = config[item.uid]
if v and player:getStorageValue(Storage.DemonOak.Done) == 4 then
	if player:getFreeCapacity() >= ItemType(v.item):getWeight() then
		if player:addItem(v.item, 1, false) then
			else
			return player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found ' .. ItemType(v.item):getName() .. ', but you have no room to take it.')
		end
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. ItemType(v.item):getName() .. '.')
			player:addOutfitAddon(542, 2)
			player:addOutfitAddon(541, 2)
			player:setStorageValue(Storage.DemonOak.Done, 5)
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. ItemType(v.item):getName() .. ' weighing ' .. string.format('%.2f', (ItemType(v.item):getWeight() / 100)) ..  ' oz it\'s too heavy.')
		end
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "It is empty.")
end
return true
end
