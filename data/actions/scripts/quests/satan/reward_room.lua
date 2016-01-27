function onUse(player, item, fromPosition, target, toPosition, isHotkey)

local pos = {x=758, y=398, z=15}
local dead
dead = Tile(761,397,15):getItemById(5527)
local wall
wall = Tile(755,399,15):getItemById(3385)

if item.itemid == 1945 and (dead ~= nil) then
 if player:getStorageValue(Storage.Satan.Final) == -1 then
		doSummonCreature("Demon", {x = pos.x+1, y = pos.y+3, z = pos.z})
		doSummonCreature("Demon", {x = pos.x+2, y = pos.y+1, z = pos.z})
		doSummonCreature("Demon", {x = pos.x+2, y = pos.y+2, z = pos.z})
		doSummonCreature("Demon", {x = pos.x+2, y = pos.y+3, z = pos.z})
		player:setStorageValue(Storage.Satan.Final, 1)
		wall:remove()
		item:transform(1946)
	else
		wall:remove()
		item:transform(1946)
end

elseif item.itemid == 1946 and dead then
	Game.createItem(3385,1,Position(755,399,15))
	item:transform(1945)
else
	player:sendTextMessage(MESSAGE_STATUS_SMALL, Game.getReturnMessage(RETURNVALUE_NOTPOSSIBLE))
end
return true
end