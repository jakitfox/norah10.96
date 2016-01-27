function onUse(player, item, frompos, item2, topos)

local wall
wall = Tile(495,321,11):getItemById(1061)

if item.uid == 3057 and item.itemid == 1945 and wall then
	wall:remove()
	item:transform(1946)	
elseif item.uid == 3057 and item.itemid == 1946 then
	Game.createItem(1061,1,Position(495,321,11))
	item:transform(1945)	
else
	player:sendTextMessage(MESSAGE_STATUS_SMALL, Game.getReturnMessage(RETURNVALUE_NOTPOSSIBLE))
end
return true
end