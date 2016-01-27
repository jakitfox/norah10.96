function onStepIn(cid, item, position, lastPosition)

if item.uid == 3101  then
	if isPlayer(cid) then
		Player(cid):teleportTo(Position(149,1422,12))
		Player(cid):getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player(cid):say("The apparatus in the centre looks odd! You should inspect it.", TALKTYPE_MONSTER_SAY)
	else
		Player(cid):teleportTo(lastPosition)
	end
	
elseif(item.uid == 3102 and isPlayer(cid)) then
	if(getGlobalStorageValue(Storage.Yala.FinalBoss) < 1) then
		Player(cid):teleportTo(Position(154,1434,12))
		Player(cid):getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		Player(cid):teleportTo(lastPosition)
	end
end
return true
end