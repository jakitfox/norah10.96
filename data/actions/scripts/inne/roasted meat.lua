function onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if target.itemid == 1423 or target.itemid == 1424 then
		item:remove(1)
		player:say('You are roasting the fresh and bloody meat over the fire. Soon it smells appetizing.', TALKTYPE_MONSTER_SAY)
		toPosition:sendMagicEffect(CONST_ME_HITBYFIRE)
		player:addItem(24843,1)
	end
return true
end
