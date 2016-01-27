function onUse(player, item, fromPosition, itemEx, toPosition)
local config = {
	[3086] = {Storage = Storage.Yala.Menor, pos = {x = 172, y = 1474, z = 9}},
	[3087] = {Storage = Storage.Yala.Adness, pos = {x = 129, y = 1491, z = 9}},
    [3088] = {Storage = Storage.Yala.Kaneler, pos = {x = 84, y = 1461, z = 9}},
	[3089] = {Storage = Storage.Yala.Zomer, pos = {x = 107, y = 1420, z = 9}},
	[3090] = {Storage = Storage.Yala.Dazzer, pos = {x = 72, y = 1451, z = 10}},
	[3091] = {Storage = Storage.Yala.Enorien, pos = {x = 140, y = 1426, z = 11}},
	[3092] = {Storage = Storage.Yala.Rotter, pos = {x = 139, y = 1482, z = 11}}
	}


local resp = {'Demon','Dark Torturer','Blightwalker','Hellhound','Hand of Cursed Fate','Plaguesmith','Hand of Cursed Fate','Spectre','Fury','Phantasm','Lost Soul','Destroyer','Betrayed Wraith'}		
local v = config[item.uid]
local statue_pos = v.pos
	if v and player:getStorageValue(v.Storage) == 1 then
	        player:setStorageValue(v.Storage, 2)
			Game.createMonster(resp[math.random(#resp)], {x = statue_pos.x+1, y = statue_pos.y+1, z = statue_pos.z})
			Game.createMonster(resp[math.random(#resp)], {x = statue_pos.x+1, y = statue_pos.y+1, z = statue_pos.z})
			Game.createMonster(resp[math.random(#resp)], {x = statue_pos.x+1, y = statue_pos.y+1, z = statue_pos.z})
			Game.createMonster(resp[math.random(#resp)], {x = statue_pos.x+1, y = statue_pos.y+1, z = statue_pos.z})
			Game.createMonster(resp[math.random(#resp)], {x = statue_pos.x+1, y = statue_pos.y+1, z = statue_pos.z})
			Game.createMonster(resp[math.random(#resp)], {x = statue_pos.x+1, y = statue_pos.y+1, z = statue_pos.z})
			Game.createMonster(resp[math.random(#resp)], {x = statue_pos.x+1, y = statue_pos.y+1, z = statue_pos.z})
	
	elseif player:getStorageValue(v.Storage) == 2 then
          player:sendTextMessage(MESSAGE_EVENT_ADVANCE,'This column is out of engergy already.')
			
	elseif player:getStorageValue(v.Storage) == 3 then
          player:sendTextMessage(MESSAGE_EVENT_ADVANCE,'You\'ve destroyed both columns!')
		end	
	return true
end