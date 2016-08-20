function onStepIn(player, item, position, fromPosition, lastPosition)

local druid = "Only Druids of level 30 and higher are able to enter this portal."
local sorc = "Only Sorcerers of level 30 and higher are able to enter this portal."

local enchanting = {
	[3200] = {vocmin = 1, vocmax = 5, pos = {x=654, y=777, z=7}, text = sorc},
	[3201] = {vocmin = 1, vocmax = 5, pos = {x=776, y=847, z=7}, text = sorc},
	[3202] = {vocmin = 2, vocmax = 6, pos = {x=1265, y=1358, z=7}, text = druid},
	[3203] = {vocmin = 2, vocmax = 6, pos = {x=658, y=476, z=7}, text = druid}
}

local v = enchanting[item.actionid]
if v then
	if player:getVocation():getId() == v.vocmin or player:getVocation():getId() == v.vocmax then
		if player:getLevel() >= 30 then
			player:teleportTo(v.pos)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)	
		else
			player:teleportTo(fromPosition)
			player:say(v.text, TALKTYPE_MONSTER_SAY)
			end
		else
			player:teleportTo(fromPosition)
			player:say(v.text, TALKTYPE_MONSTER_SAY)
		end
end	
return true
end