function onUse(player, item, fromPosition, target, toPosition, isHotkey)

local piece1
piece1 = Tile(363,1318,10):getItemById(2179)
local piece2
piece2 = Tile(363,1315,10):getItemById(2179)
local piece3
piece3 = Tile(369,1310,10):getItemById(2179)
local piece4
piece4 = Tile(373,1310,10):getItemById(2179)

if item.itemid == 1945 and player:getStorageValue(Storage.Firewalker.Questline) == -1 then
	if piece1 and piece2 and piece3 and piece4 then
		piece1:remove()
		piece2:remove()
		piece3:remove()
		piece4:remove()
		player:teleportTo(Position(370,1318,10))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		Game.createMonster("Yodense",Position(371,1317,10))
		item:transform(1946)
	else 
		player:sendTextMessage(MESSAGE_STATUS_SMALL, Game.getReturnMessage(RETURNVALUE_NOTPOSSIBLE))
	end
elseif item.itemid == 1946 then
	item:transform(1945)
end
return true
end