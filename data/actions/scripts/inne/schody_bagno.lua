function onUse(player, item, fromPosition, itemEx, toPosition)

local pos = {x = 862, y = 590, z = 5}

if item.uid == 3300 then
	player:teleportTo(pos)
end
return true
end
