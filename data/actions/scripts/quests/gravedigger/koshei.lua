function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)

local config = {
	[3040] = { storage = Storage.Grave.Koshei01, item = 8262},
	[3041] = { storage = Storage.Grave.Koshei02, item = 8263},
	[3042] = { storage = Storage.Grave.Koshei03, item = 8264},
	[3043] = { storage = Storage.Grave.Koshei04, item = 8265}
	
}

local v = config[item.uid]

if v and player:getStorageValue(v.storage) == -1 then
	if player:getStorageValue(Storage.Grave.Questline) == 1 then
		if player:getFreeCapacity() >= ItemType(v.item):getWeight() then
			if player:addItem(v.item, 1, false) then
			else
				return player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found ' .. ItemType(v.item):getName() .. ', but you have no room to take it.')
			end
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. ItemType(v.item):getName() .. '.')
			player:setStorageValue(v.storage, 1)
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. ItemType(v.item):getName() .. ' weighing ' .. string.format('%.2f', (ItemType(v.item):getWeight() / 100)) ..  ' oz it\'s too heavy.')
		end
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"This cheast is only for special mission.")
		end
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "It is empty.")
	end
	return true
end