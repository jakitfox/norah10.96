local config = {
	[3178] = { pos1 ={x=677, y=583, z=7}, pos2 ={x=679, y=587, z=7}, pos3 ={x=670, y=583, z=8}, pos4 ={x=654, y=585, z=8}},
	[3179] = { pos1 ={x=669, y=574, z=7}, pos2 ={x=664, y=573, z=7}, pos3 ={x=675, y=577, z=6}, pos4 ={x=674, y=579, z=5}}, 
	[3180] = { pos1 ={x=680, y=587, z=7}, pos2 ={x=670, y=584, z=7}, pos3 ={x=678, y=578, z=7}, pos4 ={x=689, y=579, z=7}}, 
	[3181] = { pos1 ={x=679, y=582, z=7}, pos2 ={x=676, y=590, z=7}, pos3 ={x=682, y=594, z=7}, pos4 ={x=670, y=594, z=7}}, 
	[3182] = { pos1 ={x=676, y=585, z=7}, pos2 ={x=680, y=591, z=7}, pos3 ={x=655, y=586, z=7}, pos4 ={x=657, y=571, z=7}}, 
	[3183] = { pos1 ={x=688, y=579, z=7}, pos2 ={x=691, y=582, z=7}, pos3 ={x=688, y=594, z=7}, pos4 ={x=683, y=583, z=7}}, 
	[3184] = { pos1 ={x=666, y=604, z=7}, pos2 ={x=654, y=614, z=7}, pos3 ={x=666, y=610, z=7}, pos4 ={x=640, y=605, z=7}}, 
	[3185] = { pos1 ={x=640, y=608, z=7}, pos2 ={x=654, y=611, z=7}, pos3 ={x=640, y=595, z=7}, pos4 ={x=654, y=592, z=7}},
	[3186] = { pos1 ={x=637, y=586, z=7}, pos2 ={x=639, y=581, z=7}, pos3 ={x=659, y=577, z=7}, pos4 ={x=667, y=584, z=7}}
}

function onStepIn(cid, item, pos)

local v = config[item.uid]
	if v then
		doSendMagicEffect(v.pos1,CONST_ME_BATS)
		doSendMagicEffect(v.pos2,CONST_ME_BATS)
		doSendMagicEffect(v.pos3,CONST_ME_BATS)
		doSendMagicEffect(v.pos4,CONST_ME_BATS)
	end
return true
end