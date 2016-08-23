function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    
local function HadesFire()
	Tile(Position(428,530,12)):getItemById(1946):transform(1945)
	Tile(Position(416,525,11)):getItemById(1484):transform(1485)
	Tile(Position(416,543,11)):getItemById(1484):transform(1485)
	Tile(Position(440,525,11)):getItemById(1484):transform(1485)
	Tile(Position(440,543,11)):getItemById(1484):transform(1485)
end
 
if item.itemid == 1945 then
    if Tile(Position(416,525,11)):getItemById(1484) and Tile(Position(416,543,11)):getItemById(1484) and Tile(Position(440,525,11)):getItemById(1484) and Tile(Position(440,543,11)):getItemById(1484) then
        player:say('Fight!', TALKTYPE_MONSTER_SAY)
        Tile(Position(428,530,11)):getItemById(1945):transform(1946)
        Game.createMonster("hades",Position(428,533,11))
        addEvent(HadesFire, 60 * 60 * 1000) -- 60 min
    else
        player:sendTextMessage(MESSAGE_STATUS_SMALL, Game.getReturnMessage(RETURNVALUE_NOTPOSSIBLE))
    end
end
return true
end