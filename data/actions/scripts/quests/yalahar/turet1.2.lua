function onUse(player, item, fromPosition, itemEx, toPosition)
local config = {
	[3093] = {Storage = Storage.Yala.Menor, monster = 'Menor', fromPos = Position(167,1470,9), toPos = Position(176, 1477, 9)},
	[3094] = {Storage = Storage.Yala.Adness, monster = 'Adness', fromPos = Position(122,1487,9), toPos = Position(135, 1497, 9)},
    [3095] = {Storage = Storage.Yala.Kaneler, monster = 'Kaneler', fromPos = Position(77,1454,9), toPos = Position(87, 1469, 9)},
	[3096] = {Storage = Storage.Yala.Zomer, monster = 'Zomer', fromPos = Position(103,1415,9), toPos = Position(110, 1420, 9)},
	[3097] = {Storage = Storage.Yala.Dazzer, monster = 'Dazzer', fromPos = Position(66,1446,10), toPos = Position(75, 1457, 10)},
	[3098] = {Storage = Storage.Yala.Enorien, monster = 'Enorien', fromPos = Position(133,1421,11), toPos = Position(147, 1431, 11)},
	[3099] = {Storage = Storage.Yala.Rotter, monster = 'Rotter', fromPos = Position(134,1480,11), toPos = Position(146, 1488, 11)}
	}

local v = config[item.uid]

if v and player:getStorageValue(v.Storage) == 1 then
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE,'You havent\'t destroyed first column!')
			
elseif player:getStorageValue(v.Storage) == 2 then
	Game.createMonster(v.monster, {x = math.random(v.fromPos.x, v.toPos.x), y = math.random(v.fromPos.y, v.toPos.y), z = math.random(v.fromPos.z, v.toPos.z)})
	player:setStorageValue(v.Storage,3)
elseif player:getStorageValue(v.Storage) == 3 then
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE,'You\'ve destroyed both columns!')
end	
return true
end