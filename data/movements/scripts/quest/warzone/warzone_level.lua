function onStepIn(cid, item, pos, lastPosition)

local config = {
	[5614] = { tp = {x=1392, y=1066, z=8}, storage = 17154 },
	[5615] = { tp = {x=714, y=884, z=15},  storage = 17155 },
	[5624] = { tp = {x=968, y=652, z=11},  storage = 17156 }
	}
local v = config[item.uid]

if v and getPlayerStorageValue(cid,v.storage) == 1 then
	Player(cid):teleportTo(v.tp)
	Player(cid):getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else 
	doCreatureSay(cid, "You don\'t have access to entry", TALKTYPE_ORANGE_1)
	doTeleportThing(cid, lastPosition)
	end
return true
end