function onStepIn(cid, item, pos)

local config = {
	[5050] = {room = {x=1315,y=958,z=9}},
	[5051] = {room = {x=1392,y=1065,z=8}},
	[5052] = {room = {x=1404,y=1088,z=9}},
	[5053] = {room = {x=1441,y=1224,z=6}}
}

local v = config[item.uid] 

if v then
	Player(cid):teleportTo(v.room)
	Player(cid):getPosition():sendMagicEffect(CONST_ME_TELEPORT)
end
return true	
end
