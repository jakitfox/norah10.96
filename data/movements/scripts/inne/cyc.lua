function onStepIn(player, item, position, fromPosition, lastPosition)

local tp = {
	[3175] = {pos = {x=462, y=377, z=7}},
	[3176] = {pos = {x=462, y=384, z=7}}
}

local v = tp[item.uid]
if v then
		player:teleportTo(v.pos)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
end
return true
end