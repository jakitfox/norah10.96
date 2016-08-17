function onUse(player, item, fromPosition, itemEx, toPosition)
local config = {
	[3086] = {Storage = Storage.Yala.Menor, fromPos = Position(169,1470,9), toPos = Position(176, 1477, 9)},
	[3087] = {Storage = Storage.Yala.Adness, fromPos = Position(123,1489,9), toPos = Position(134, 1493, 9)},
    [3088] = {Storage = Storage.Yala.Kaneler, fromPos = Position(77,1454,9), toPos = Position(87, 1469, 9)},
	[3089] = {Storage = Storage.Yala.Zomer, fromPos = Position(101,1412,9), toPos = Position(113, 1421, 9)},
	[3090] = {Storage = Storage.Yala.Dazzer, fromPos = Position(66,1446,10), toPos = Position(75, 1457, 10)},
	[3091] = {Storage = Storage.Yala.Enorien, fromPos = Position(133,1421,11), toPos = Position(147, 1431, 11)},
	[3092] = {Storage = Storage.Yala.Rotter, fromPos = Position(134,1480,11), toPos = Position(146, 1488, 11)}
	}


local resp = {'Demon','Dark Torturer','Blightwalker','Hellhound','Hand of Cursed Fate','Plaguesmith','Hand of Cursed Fate','Spectre','Fury','Phantasm','Lost Soul','Destroyer','Betrayed Wraith'}		
local v = config[item.uid]
local statue_pos = v.pos
	if v and player:getStorageValue(v.Storage) == 1 then
	        player:setStorageValue(v.Storage, 2)
			Game.createMonster(resp[math.random(#resp)], {x = math.random(v.fromPos.x, v.toPos.x), y = math.random(v.fromPos.y, v.toPos.y), z = math.random(v.fromPos.z, v.toPos.z)})
			Game.createMonster(resp[math.random(#resp)], {x = math.random(v.fromPos.x, v.toPos.x), y = math.random(v.fromPos.y, v.toPos.y), z = math.random(v.fromPos.z, v.toPos.z)})
			Game.createMonster(resp[math.random(#resp)], {x = math.random(v.fromPos.x, v.toPos.x), y = math.random(v.fromPos.y, v.toPos.y), z = math.random(v.fromPos.z, v.toPos.z)})
			Game.createMonster(resp[math.random(#resp)], {x = math.random(v.fromPos.x, v.toPos.x), y = math.random(v.fromPos.y, v.toPos.y), z = math.random(v.fromPos.z, v.toPos.z)})
			Game.createMonster(resp[math.random(#resp)], {x = math.random(v.fromPos.x, v.toPos.x), y = math.random(v.fromPos.y, v.toPos.y), z = math.random(v.fromPos.z, v.toPos.z)})
			Game.createMonster(resp[math.random(#resp)], {x = math.random(v.fromPos.x, v.toPos.x), y = math.random(v.fromPos.y, v.toPos.y), z = math.random(v.fromPos.z, v.toPos.z)})
			Game.createMonster(resp[math.random(#resp)], {x = math.random(v.fromPos.x, v.toPos.x), y = math.random(v.fromPos.y, v.toPos.y), z = math.random(v.fromPos.z, v.toPos.z)})	
	elseif player:getStorageValue(v.Storage) == 2 then
          player:sendTextMessage(MESSAGE_EVENT_ADVANCE,'This column is out of engergy already.')
			
	elseif player:getStorageValue(v.Storage) == 3 then
          player:sendTextMessage(MESSAGE_EVENT_ADVANCE,'You\'ve destroyed both columns!')
		end	
	return true
end