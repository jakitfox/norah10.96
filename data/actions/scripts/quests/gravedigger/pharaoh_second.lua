function onUse(player, item, fromPosition, target, toPosition, isHotkey)

local function PharaonLeaver02()
	if Tile(Position(481,409,11)):getItemById(3654) then
		Tile(Position(481,409,11)):getItemById(3654):transform(1551)
	end
end
		
if Tile(Position(481,409,11)):getItemById(1551) and Tile(Position(479,413,11)):getItemById(1424) and Tile(Position(480,413,11)):getItemById(1425) and Tile(Position(482,413,11)):getItemById(1424) and Tile(Position(483,413,11)):getItemById(1423) then
		player:say('You can enter this room!', TALKTYPE_MONSTER_SAY)
		Tile(Position(479,413,11)):getItemById(1424):transform(1425)
		Tile(Position(482,413,11)):getItemById(1424):transform(1425)
		Tile(Position(483,413,11)):getItemById(1423):transform(1425) 
		Tile(Position(481,409,11)):getItemById(1551):transform(3654) -- statue
		doSendMagicEffect(Position(481,413,11),CONST_ME_EXPLOSIONHIT)
		addEvent(PharaonLeaver02, 30*1000) -- 30 sek
		doTransformItem(item.uid, item.itemid == 9827 and 9828 or 9827)
	else
		doTransformItem(item.uid, item.itemid == 9827 and 9828 or 9827)
end
return true
end
  