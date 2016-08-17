function onStepIn(player, item, pos)

uid = {
		[3052] = {boss=Dipthrah, pos = {x=410, y=305, z=12}},
		[3054] = {boss=Thalas, pos = {x=481, y=399, z=11}},
		[3059] = {boss=Hegard, pos = {x=493, y=353, z=11}},
		[3066] = {boss=Syzam, pos = {x=361, y=502, z=10}}
		}
local v = uid[item.uid]	
if v then
	player:teleportTo(v.pos)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:say('You have left the arena.', TALKTYPE_MONSTER_SAY)
	stopEvent(v.boss)
end
return true
end 
