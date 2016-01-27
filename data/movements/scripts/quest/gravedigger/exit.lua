function onStepIn(player, item, pos)

if player:getStorageValue(Storage.Grave.Mission08) == 1 then
	player:teleportTo(Position(428,520,10))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:setStorageValue(Storage.Grave.Mission08, 2)
else
	player:teleportTo(Position(428,520,10))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
end
return true	
end