function onUse(player, item, fromPosition, target, toPosition, isHotkey)

local function PharaonLeaver01()
	if Tile(Position(410,287,12)):getItemById(3654) then
		Tile(Position(410,287,12)):getItemById(3654):transform(1550)
	end
end
		
if Tile(Position(410,287,12)):getItemById(1550) and Tile(Position(406,289,12)):getItemById(1423) and Tile(Position(406,292,12)):getItemById(1423) and Tile(Position(414,289,12)):getItemById(1424) and Tile(Position(414,292,12)):getItemById(1425) then
		player:say('You can enter this room!', TALKTYPE_MONSTER_SAY)
		Tile(Position(406,289,12)):getItemById(1423):transform(1425)
		Tile(Position(406,292,12)):getItemById(1423):transform(1425)
		Tile(Position(414,289,12)):getItemById(1424):transform(1425) 
		Tile(Position(410,287,12)):getItemById(1550):transform(3654) -- statue
		doSendMagicEffect(Position(410,291,12),CONST_ME_EXPLOSIONHIT)
		addEvent(PharaonLeaver01, 30*1000) -- 30 sek
		doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)
	else
		doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)
end
return true
end