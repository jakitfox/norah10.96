local combat = Combat()
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTH)
combat:setParameter(COMBAT_PARAM_CREATEITEM, ITEM_WILDGROWTH)

local area = {Position(1009, 546, 7), Position(1098, 611, 7)}

function onCastSpell(creature, var)

local swim = Game.getSpectators(Position(388,897,7), false, true, 20, 15)
	for k = 1, #swim do
		if swim[k] then
			return swim[k]:sendTextMessage(MESSAGE_INFO_DESCR, "You can not cast spells during the event.") and false;
		end
	end	
	
	c_pos = creature:getPosition()
	if creature:isPlayer() and c_pos.x >= area[1].x and c_pos.x <= area[2].x and c_pos.y >= area[1].y and c_pos.y <= area[2].y and c_pos.z >= area[1].z and c_pos.z <= area[2].z then
		return creature:sendTextMessage(MESSAGE_INFO_DESCR, "You can not cast spells during the event.") and false;
	end
	
	return combat:execute(creature, var)
end