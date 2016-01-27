function onStepIn(player, item, position, fromPosition, lastPosition)

if player:getStorageValue(Storage.Riwen.Lever01) == 1 and player:getStorageValue(Storage.Riwen.Lever02) == 1 and player:getStorageValue(Storage.Riwen.Lever03) == 1 and player:getStorageValue(Storage.Riwen.Lever04) == 1 and player:getStorageValue(Storage.Riwen.Lever05) == 1 and player:getStorageValue(Storage.Riwen.Lever06) == 1 then
	player:teleportTo(Position(497,1353,8))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
else
	player:say("Hmm something needs to activate this teleport", TALKTYPE_MONSTER_SAY)
	player:teleportTo(fromPosition)
end
return true
end