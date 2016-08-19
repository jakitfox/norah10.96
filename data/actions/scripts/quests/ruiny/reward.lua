function onUse(player, item, frompos, item2, topos)

local config = {
	[3145] = {item = 22398},
	[3146] = {item = 22401},
	[3147] = {item = 22410},
	[3148] = {item = 22413},
	[3149] = {item = 22404},
	[3375] = {item = 22407},
	[3372] = {item = 22416},
	[3373] = {item = 22419},
	[3374] = {item = 22422}
	}

local v = config[item.uid]
if v and player:getStorageValue(Storage.Ruiny.Reward) == -1 then
	if player:getFreeCapacity() >= ItemType(v.item):getWeight() then
		if player:addItem(v.item, 1, false) then
			else
			return player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found ' .. ItemType(v.item):getName() .. ', but you have no room to take it.')
		end
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. ItemType(v.item):getName() .. '.')
			player:setStorageValue(Storage.Ruiny.Reward, 1)
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. ItemType(v.item):getName() .. ' weighing ' .. string.format('%.2f', (ItemType(v.item):getWeight() / 100)) ..  ' oz it\'s too heavy.')
		end
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "It is empty.")
end
return true
end