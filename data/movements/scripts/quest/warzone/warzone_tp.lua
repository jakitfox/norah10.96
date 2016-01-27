local config = {
	[5607] = {tp = {x=945, y=510, z=10}, stronge = 17140},
	[5612] = {tp = {x=1551, y=957, z=8}, stronge = 17141},
	[5613] = {tp = {x=804, y=879, z=15}, stronge = 17142}
}

function setPlayerBossTimer(cid, storage)
	setPlayerStorageValue(cid, storage, os.time()+(20*60*60*1)) --ustawiamy w (s)
end
function getPlayerBossTimer(cid, storage)
	return {bool = (os.time() >= getPlayerStorageValue(cid, storage)), result = getPlayerStorageValue(cid, storage)-os.time()}
end
function numberToTime( second )
	if second < 60 then
		return second.." seconds"
	elseif second >= 60 and second < 3600 then
		return math.floor(second/60).." minutes and "..second%60 .." seconds"
	elseif second >= 3600 then
		return math.floor(second/3600).." houers, "..math.floor((second%3600)/60).." minutes and "..second%60 .." seconds"
	end
end
function onStepIn(cid, item, position, fromPosition)
	local v = config[item.uid]
	
	if not v then
		return doTeleportThing(cid, fromPosition)
	end
	if getPlayerBossTimer(cid, v.stronge).bool then
		doTeleportThing(cid, v.tp)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		setPlayerBossTimer(cid, v.stronge)
		return true
	end
	doTeleportThing(cid, fromPosition)
	doCreatureSay(cid, "You have to wait "..numberToTime(getPlayerBossTimer(cid, v.stronge).result).." to enter the boss room.", TALKTYPE_ORANGE_1)
	return true
end