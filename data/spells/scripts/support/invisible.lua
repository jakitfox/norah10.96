local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local condition = Condition(CONDITION_INVISIBLE)
condition:setParameter(CONDITION_PARAM_TICKS, 200000)
combat:setCondition(condition)

function onCastSpell(creature, var)

local swim = Game.getSpectators(Position(388,897,7), false, true, 20, 15)
	for k = 1, #swim do
		if swim[k] then
			return swim[k]:sendTextMessage(MESSAGE_INFO_DESCR, "You can not cast spells during the event.") and false;
		end
	end	
	
local spider = Game.getSpectators(Position(1053,576,7), false, true, 48, 38)
	for k = 1, #spider do
		if spider[k] then
			return spider[k]:sendTextMessage(MESSAGE_INFO_DESCR, "You can not cast spells during the event.") and false;
		end
	end	
	
	return combat:execute(creature, var)
end