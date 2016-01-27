function onUse(player, item, frompos, item2, topos)

local config = {
	[3060] = { storage = Storage.Grave.Plague01, item = 7720, text = "first"},
	[3061] = { storage = Storage.Grave.Plague02, item = 7844, text = "second"},
	[3062] = { storage = Storage.Grave.Plague03, item = 7845, text = "third"},
	[3063] = { storage = Storage.Grave.Plague04, item = 7846, text = "fourth"}
}

local v = config[item.uid]

if v and player:getStorageValue(v.storage) == -1 then
	if player:getStorageValue(Storage.Grave.Mission06) == 1 then
		if player:getFreeCapacity() >= ItemType(v.item):getWeight() then
			if player:addItem(v.item, 1, false) then
			else
				return player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found '.. v.text ..' document of Plague, but you have no room to take it.')
			end
			player:sendTextMessage(MESSAGE_INFO_DESCR, "You have found ".. v.text .." document of Plague.")
			player:setStorageValue(v.storage, 1)
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a '.. v.text ..' document of Plague weighing ' .. string.format('%.2f', (ItemType(v.item):getWeight() / 100)) ..  ' oz it\'s too heavy.')
		end
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, "This cheast is only for special mission.")
		end
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "It is empty.")
	end
	return true
end