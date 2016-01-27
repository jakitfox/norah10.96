function onUse(player, item, fromPosition, itemEx, toPosition)
local config = {
	[3093] = {Storage = Storage.Yala.Menor, pos = {x = 172, y = 1474, z = 9}, monster = 'Menor'},
	[3094] = {Storage = Storage.Yala.Adness, pos = {x = 129, y = 1491, z = 9}, monster = 'Adness'},
    [3095] = {Storage = Storage.Yala.Kaneler, pos = {x = 84, y = 1461, z = 9}, monster = 'Kaneler'},
	[3096] = {Storage = Storage.Yala.Zomer, pos = {x = 107, y = 1420, z = 9}, monster = 'Zomer'},
	[3097] = {Storage = Storage.Yala.Dazzer, pos = {x = 72, y = 1451, z = 10}, monster = 'Dazzer'},
	[3098] = {Storage = Storage.Yala.Enorien, pos = {x = 140, y = 1426, z = 11}, monster = 'Enorien'},
	[3099] = {Storage = Storage.Yala.Rotter, pos = {x = 139, y = 1482, z = 11}, monster = 'Rotter'}
	}

local v = config[item.uid]

if v and player:getStorageValue(v.Storage) == 1 then
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE,'You havent\'t destroyed first column!')
			
elseif player:getStorageValue(v.Storage) == 2 then
	Game.createMonster(v.monster, {x = v.pos.x+1, y = v.pos.y+1, z = v.pos.z})
	player:setStorageValue(v.Storage, 3)
			
elseif player:getStorageValue(v.Storage) == 3 then
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE,'You\'ve destroyed both columns!')
end	
return true
end