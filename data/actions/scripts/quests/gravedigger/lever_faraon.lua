local config = {
	[3360] = {pos = Position(406,289,12)},
	[3361] = {pos = Position(406,292,12)},
	[3362] = {pos = Position(414,289,12)},
	[3363] = {pos = Position(414,292,12)},
	[3365] = {pos = Position(479,413,11)},
	[3366] = {pos = Position(480,413,11)},
	[3367] = {pos = Position(482,413,11)},
	[3368] = {pos = Position(483,413,11)},
}

function onUse(cid, item, fromPosition, itemEx, toPosition)


local v = config[item.uid]

if v and Tile(v.pos):getItemById(1425) then
	Tile(v.pos):getItemById(1425):transform(1424)
	doSendMagicEffect(v.pos,CONST_ME_POFF)
	doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)

elseif v and Tile(v.pos):getItemById(1424) then
	Tile(v.pos):getItemById(1424):transform(1423)
	doSendMagicEffect(v.pos,CONST_ME_POFF)
	doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)
	
elseif v and Tile(v.pos):getItemById(1423) then
	Tile(v.pos):getItemById(1423):transform(1425)
	doSendMagicEffect(v.pos,CONST_ME_POFF)
	doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)	
end
return true
end