function onUse(cid, item, fromPosition, itemEx, toPosition)
local config = {
	[3004] = { pos = {x=487, y=409, z=15}},
	[3005] = { pos = {x=511, y=501, z=15}},
	[3006] = { pos = {x=584, y=479, z=15}},
	[3007] = { pos = {x=631, y=517, z=15}},
	[3008] = { pos = {x=650, y=410, z=15}},
	[3009] = { pos = {x=714, y=453, z=15}},
	[3010] = { pos = {x=740, y=510, z=15}}
}
local v = config[item.uid]
	if v then
		Player(cid):teleportTo(v.pos)
		Player(cid):getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		end
	return true
end