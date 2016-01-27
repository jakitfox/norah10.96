local config = { 
    message = "Azerus ran into teleporter! It will disappear in 2 minutes. Enter It!", 
    timeToRemove = 180 -- seconds
}

local function removal(position)
	position.stackpos = 1
	if (getThingfromPos(position).itemid == 1387) then
		doRemoveItem(getThingfromPos(position).uid)
	end
	return TRUE
end

function onKill(cid, target)
	if(isMonster(target) and string.lower(getCreatureName(target)) == "azerus") then
		doCreateTeleport(1387, {x=143, y=1441, z=12}, { x = 153, y = 1424, z = 12 })
		doCreatureSay(target, config.message, TALKTYPE_ORANGE_1, 0, 0, { x = 153, y = 1424, z = 12 })
		addEvent(removal, config.timeToRemove * 1000, { x = 153, y = 1424, z = 12 })
	end
	return true
end