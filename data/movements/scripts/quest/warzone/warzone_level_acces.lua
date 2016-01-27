function onStepIn(cid, item, pos, lastPosition)

local config = {
	[5608] = { tp = {x=992, y=459, z=10}, storage = 17150, acces = 17154},
	[5609] = { tp = {x=1518, y=998, z=8}, storage = 17151, acces = 17155},
	[5610] = { tp = {x=706, y=799, z=15}, storage = 17152, acces = 17156},
	[5626] = { tp = {x=923, y=637, z=11}, storage = 17180, acces = 17181}
	}
local v = config[item.uid]

if v and getGlobalStorageValue(v.storage) == 1 then

function onBoss1()
	setGlobalStorageValue(v.storage, -1)
end
	setPlayerStorageValue(cid, v.acces, 1)
	Player(cid):teleportTo(v.tp)
	Player(cid):getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	addEvent(onBoss1, 2*60*1000) --2 minutes
	else 
	doCreatureSay(cid, "You don\'t have access to entry", TALKTYPE_ORANGE_1)
	doTeleportThing(cid, lastPosition)
	end
	return true
end