function onUse(player, item, fromPosition, itemEx, toPosition)
	Item(item.uid):remove(1)
	player:say("KABOOOOOOOOOOM!", TALKTYPE_MONSTER_SAY)
	player:getPosition():sendMagicEffect(CONST_ME_FIREAREA)
end