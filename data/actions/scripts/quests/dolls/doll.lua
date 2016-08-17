function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)

local config = {
	[3030] = {Storage = Storage.Doll.Tropy01, item = 10125},
	[3031] = {Storage = Storage.Doll.Tropy02, item = 10126},
    [3032] = {Storage = Storage.Doll.Tropy03, item = 10127},
	[3033] = {Storage = Storage.Doll.Tropy04, item = 10128},
	[3034] = {Storage = Storage.Doll.Tropy05, item = 10129},
	[3035] = {Storage = Storage.Doll.Tropy06, item = 10130},
	[3036] = {Storage = Storage.Doll.Tropy07, item = 10131},
	[3037] = {Storage = Storage.Doll.Tropy08, item = 10132}					
	}

local v = config[item.uid]

if v and player:getStorageValue(v.Storage) == 1 then
		if player:getFreeCapacity() >= ItemType(v.item):getWeight() then
			if player:addItem(v.item, 1, false) then
			else
				return player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found ' .. ItemType(v.item):getName() .. ', but you have no room to take it.')
			end
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. ItemType(v.item):getName() .. '.')
			player:setStorageValue(v.Storage, 2)
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. ItemType(v.item):getName() .. ' weighing ' .. string.format('%.2f', (ItemType(v.item):getWeight() / 100)) ..  ' oz it\'s too heavy.')
		end
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "It is empty.")
	end
	return true
end