local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)

local condition = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 20000)
condition:setFormula(-0.9, 0, -0.9, 0)
combat:setCondition(condition)

function onCastSpell(creature, var)
	if not combat:execute(creature, variant) then
		return false
	end

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

	creature:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	return true
end