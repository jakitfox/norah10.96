function onStepIn(player, item, pos)

local config = {
	[3047] = {pos = {x=419, y=327, z=8}}, 
	[3048] = {pos = {x=426, y=337, z=7}},
	[3049] = {pos = {x=464, y=376, z=8}},  
	[3050] = {pos = {x=430, y=359, z=7}}
	}
	
local v = config[item.uid]
if v then
	player:teleportTo(v.pos)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
end
return true	
end