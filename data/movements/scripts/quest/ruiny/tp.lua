function onStepIn(player, item, position, fromPosition, lastPosition)

if item.uid == 3134 then
 if player:getStorageValue(Storage.Ruiny.FastAcces) == -1 then
	player:setStorageValue(Storage.Ruiny.FastAcces, 1)
	player:teleportTo(Position(237,565,7))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
	player:teleportTo(Position(237,565,7))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
end

elseif item.uid == 3135 and player:getStorageValue(Storage.Ruiny.FastAcces) == 1 then
	player:teleportTo(Position(121,523,14))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
else
	player:teleportTo(fromPosition)
	player:say("You don\'t have access to entry teleport.", TALKTYPE_MONSTER_SAY)	
end
return true
end