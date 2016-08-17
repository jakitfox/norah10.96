function onStepIn(player, item, pos)
	player:teleportTo({x=436, y=1167, z=7})
	player:say('You have left the arena.', TALKTYPE_ORANGE_1)
	stopEvent(Ucker)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
end 