function onUse(player, item, frompos, item2, topos)

local wall
wall = Tile(500,324,11):getItemById(1060)

local wall2
wall2 = Tile(495,321,11):getItemById(1061)

if item.uid == 3056 and item.itemid == 1945 and wall then
	wall:remove()
	Game.createItem(1061,1,Position(495,321,11))
	item:transform(1946)
elseif item.uid == 3056 and item.itemid == 1946 and wall2 then
	wall2:remove()
	Game.createItem(1060,1,Position(500,324,11))
	item:transform(1945)
else
	player:sendTextMessage(MESSAGE_STATUS_SMALL, Game.getReturnMessage(RETURNVALUE_NOTPOSSIBLE))
end
  return true
end