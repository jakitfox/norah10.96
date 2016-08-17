local npos = {[3285] = PTR.spawn}
local Equipment = {11374, 2195, 12646, 12607, 15490, 9956, 18404, 18406, 21691, 8908, 2169, 11301, 11303}
local condition_speed = createConditionObject(CONDITION_HASTE)
	setConditionParam(condition_speed, CONDITION_PARAM_TICKS, 1)
	setConditionParam(condition_speed, CONDITION_PARAM_SPEED, 0)
	
function onStepIn(cid, item, position, fromPosition)

local function newspeed()
	doChangeSpeed(cid, - getCreatureSpeed(cid) + 350)
	return true
end

	if(not isPlayer(cid)) then
		doTeleportThing(cid, npos[item.uid])
		return true
	end
	
	if item.uid ~= 3285 then
		doTeleportThing(cid, npos[item.uid])
		return true
	end
	
	if tonumber(table.find(active_events,3)) == nil then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "This event is not active.")
		Player(cid):teleportTo(fromPosition, true)
		return true
	end
	
	for i = 1, #Equipment do
		if getPlayerItemCount(cid,Equipment[i]) ~= 0 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "No equipment allowed here.")
			Player(cid):teleportTo(fromPosition, true)
			return true
		end
	end
	setPlayerStorageValue(cid, Storage.SwimEvent, 1)
	doAddCondition(cid, condition_speed)
	addEvent(newspeed, 10)
	doTeleportThing(cid, npos[item.uid])
	return true
end