function onStepIn(player, item, position, lastPosition)

if item.uid == 3101  then
	if player:isPlayer() == TRUE then
		player:teleportTo(Position(149,1422,12))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say("The apparatus in the centre looks odd! You should inspect it.", TALKTYPE_MONSTER_SAY)
	else
		player:teleportTo(lastPosition)
	end
	
elseif item.uid == 3102 and player:isPlayer() == TRUE then
	if(getGlobalStorageValue(Storage.Yala.FinalBoss) < 1) then
		player:teleportTo(Position(154,1434,12))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		player:teleportTo(lastPosition)
	end
end
return true
end