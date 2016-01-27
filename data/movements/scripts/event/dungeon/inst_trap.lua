local bleed_I = createConditionObject(CONDITION_BLEEDING)
setConditionParam(bleed_I, CONDITION_PARAM_DELAYED, true)
setConditionParam(bleed_I, CONDITION_PARAM_MINVALUE, -50)
setConditionParam(bleed_I, CONDITION_PARAM_MAXVALUE, -120)
setConditionParam(bleed_I, CONDITION_PARAM_STARTVALUE, -5)
setConditionParam(bleed_I, CONDITION_PARAM_TICKINTERVAL, 4000)
setConditionParam(bleed_I, CONDITION_PARAM_FORCEUPDATE, true)

local bleed_II = createConditionObject(CONDITION_BLEEDING)
setConditionParam(bleed_II, CONDITION_PARAM_DELAYED, true)
setConditionParam(bleed_II, CONDITION_PARAM_MINVALUE, -100)
setConditionParam(bleed_II, CONDITION_PARAM_MAXVALUE, -220)
setConditionParam(bleed_II, CONDITION_PARAM_STARTVALUE, -15)
setConditionParam(bleed_II, CONDITION_PARAM_TICKINTERVAL, 2500)
setConditionParam(bleed_II, CONDITION_PARAM_FORCEUPDATE, true)

local bleed_III = createConditionObject(CONDITION_BLEEDING)
setConditionParam(bleed_III, CONDITION_PARAM_DELAYED, true)
setConditionParam(bleed_III, CONDITION_PARAM_MINVALUE, -300)
setConditionParam(bleed_III, CONDITION_PARAM_MAXVALUE, -600)
setConditionParam(bleed_III, CONDITION_PARAM_STARTVALUE, -50)
setConditionParam(bleed_III, CONDITION_PARAM_TICKINTERVAL, 1000)
setConditionParam(bleed_III, CONDITION_PARAM_FORCEUPDATE, true)

local c_traps = {bleed_I, bleed_II, bleed_III}
function onStepIn(cid, item, position, fromPosition)
	doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_RED)
	doSetItemActionId(item.uid, 0)
	doTransformItem(item.uid, 419)
	if isPlayer(cid) then
		local choose_trap = math.random(1, 10)
		if choose_trap == 1 then
			doAddCondition(cid, c_traps[math.random(1, #c_traps)])
			return true
		elseif choose_trap == 2 then
			if getPlayerDungeon(cid) > 0 then
			local inst_tier = pits_event_config.caves[getPlayerDungeon(cid)]
				repeat trap_to_pos = {x = math.random(inst_tier.map_corner.x, inst_tier.map_corner.x + inst_tier.map_size[1] - 1), y = math.random(inst_tier.map_corner.y, inst_tier.map_corner.y + inst_tier.map_size[2]-1), z = math.random(inst_tier.map_corner.z, inst_tier.map_corner.z + inst_tier.map_size[3]-1)}
				until isPathable(trap_to_pos)
				doTeleportThing(cid, trap_to_pos)
				doSendMagicEffect(getThingPos(cid), CONST_ME_GROUNDSHAKER)
			end
			return true
		else
			doTargetCombatHealth(0, cid, COMBAT_PHYSICALDAMAGE, -10, -600, CONST_ME_DRAWBLOOD)
			return true
		end
	end
	return true
end