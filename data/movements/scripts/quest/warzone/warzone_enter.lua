local config = {
	[5600] = { tp = {x=893, y=625, z=11}},
	[5601] = { tp = {x=897, y=682, z=11}},
	[5602] = { tp = {x=929, y=617, z=11}},
	[5603] = { tp = {x=1518, y=998, z=8}},
	[5604] = { tp = {x=988, y=578, z=9}},
	[5605] = { tp = {x=928, y=613, z=11}},
	[5606] = { tp = {x=992, y=459, z=10}},
	[5619] = { tp = {x=929, y=621, z=11}},
	[5620] = { tp = {x=706, y=799, z=15}},
	[5625] = { tp = {x=923, y=637, z=11}}
}

function onStepIn(cid, item, pos)
local v = config[item.uid]
if v then
	Player(cid):teleportTo(v.tp)
	Player(cid):getPosition():sendMagicEffect(CONST_ME_TELEPORT)
end
return true
end