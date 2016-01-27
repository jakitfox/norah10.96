function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	if player:getLevel() < 120 then
		player:say("LEAVE LITTLE FISH, YOU ARE NOT WORTH IT!", TALKTYPE_MONSTER_YELL, false, player, Position(774,906,7))
		player:teleportTo(Position(774,918,7))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end

	if player:getStorageValue(Storage.DemonOak.Done) == 2 and #Game.getSpectators(Position(774,906,7), false, true, 9, 9, 6, 6) == 0 then
		player:teleportTo(Position(774,912,7))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say("I AWAITED YOU! COME HERE AND GET YOUR REWARD!", TALKTYPE_MONSTER_YELL, false, player, Position(774,906,7))
	else
		player:teleportTo(Position(774,918,7))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	return true
end