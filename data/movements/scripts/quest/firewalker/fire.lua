function onStepIn(player, item, position, fromPosition, lastPosition)

if player:getStorageValue(Storage.Firewalker.Statue01) == 1 and player:getStorageValue(Storage.Firewalker.Statue02) == 1 and player:getStorageValue(Storage.Firewalker.Statue03) == 1 and player:getStorageValue(Storage.Firewalker.Statue04) == 1 and player:getStorageValue(Storage.Firewalker.Statue05) == 1 then
	player:teleportTo(Position(310,1330,11))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)	
else
	player:teleportTo(fromPosition)
	player:say("What is it?", TALKTYPE_MONSTER_SAY)
end
return true
end