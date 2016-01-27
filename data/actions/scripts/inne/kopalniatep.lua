function onUse(player, item, fromPosition, itemEx, toPosition)

local config = {
	[3195] = {pos = {x=1199, y=1251, z=10}},
	[3196] = {pos = {x=1199, y=1251, z=8}}		
	}

local v = config[item.uid]

if v and item.itemid == 9825 then
	player:teleportTo(v.pos)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	item:transform(9826)
else
	item:transform(9825)
end
return true
end