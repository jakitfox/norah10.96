local waves = {
	{x = 150, y = 1422, z = 12},
	{x = 156, y = 1422, z = 12},
	{x = 152, y = 1419, z = 12},
	{x = 154, y = 1419, z = 12},
	{x = 152, y = 1425, z = 12},
	{x = 154, y = 1425, z = 12}
}

local function doClearArea(fromPos, toPos)
	if(getGlobalStorageValue(Storage.Yala.FinalBoss) == 1) then
		for x = fromPos.x, toPos.x do
			for y = fromPos.y, toPos.y do
				if(getTopCreature({x = x, y = y, z = 10, stackpos = 255}).uid > 0) then
					if(isMonster(getTopCreature({x = x, y = y, z = 10, stackpos = 255}).uid)) then
						doRemoveCreature(getTopCreature({x = x, y = y, z = 10, stackpos = 255}).uid)
					end
				end
			end
		end
		setGlobalStorageValue(Storage.Yala.FinalBoss, 0)
	end
	return true
end

local function doChangeAzerus(fromPos, toPos)
	for _x = fromPos.x, toPos.x do
		for _y = fromPos.y, toPos.y do
			for _z = fromPos.z, toPos.z do
				creature = getTopCreature({x = _x, y = _y, z = _z})
				if (creature.type == THING_TYPE_MONSTER and getCreatureName(creature.uid) == "Azerus") then
					doCreatureSay(creature.uid, "No! I am losing my energy!", TALKTYPE_ORANGE_1)
					Game.createMonster("Azerus", getThingPos(creature.uid))
					doRemoveCreature(creature.uid)
					return true
				end
			end
		end
	end
	return false
end		

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3104) then
		if(getGlobalStorageValue(Storage.Yala.FinalBoss) < 1) then -- Fight
    		local amountOfPlayers = 3
    		local p = getSpectators(getCreaturePosition(cid), 7, 7, false, true)  
 
    		local players = #p
    		if (players < amountOfPlayers) then
	  		for _, pid in pairs(p) do
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You need atleast "..amountOfPlayers.." players inside the quest room.")
			end
		return true
		end
			setGlobalStorageValue(Storage.Yala.FinalBoss, 1)
			addEvent(doSummonCreature, 18 * 1000, "Azerus2", {x = 153, y = 1425, z = 12})
			for i = 1, 4 do
				if(i == 1) then
					creature = "rift worm"
				elseif(i == 2) then
					creature = "rift scythe"
				elseif(i == 3) then
					creature = "rift brood"
				elseif(i == 4) then
					creature = "war golem"
				end
				for k = 1, table.maxn(waves) do			
					addEvent(doSummonCreature, i * 20 * 1000, creature, waves[k])
					addEvent(doSendMagicEffect, i * 20 * 1000, waves[k], CONST_ME_TELEPORT)
				end
			end
			addEvent(doChangeAzerus, 4 * 20 * 1000, {x = 146, y = 1414, z = 12}, {x = 161, y = 1429, z = 12})
			addEvent(doClearArea, 5 * 1000 * 60, {x = 146, y = 1414, z = 12}, {x = 161, y = 1429, z = 12})
		else
			doCreatureSay(cid, 'You have to wait some time before this globe charges.', TALKTYPE_ORANGE_1)
		end
	end
	return true
end