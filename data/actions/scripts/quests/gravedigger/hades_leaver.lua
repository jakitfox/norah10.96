function onUse(player, item, fromPosition, target, toPosition, isHotkey)

local fire01
fire01 = Tile(416,525,11):getItemById(1484)
local fire02
fire02 = Tile(416,543,11):getItemById(1484)
local fire03
fire03 = Tile(440,525,11):getItemById(1484)
local fire04
fire04 = Tile(440,543,11):getItemById(1484)
local lever
lever = Tile(428,530,11):getItemById(1945)
         
local function HadesFire(fire01, fire02, fire03, fire04, lever)
    if (lever ~= nil) and (fire01 ~= nil) and (fire02 ~= nil) and (fire03 ~= nil) and (fire04 ~= nil) then
        lever:transform(1945)
        fire01:transform(1485)
        fire02:transform(1485)
        fire03:transform(1485)
        fire04:transform(1485)
    else
    return print("Error:: One of parameters has nil value.")
end
return true;
end
 
if item.itemid == 1945 then
    if fire01 and fire02 and fire03 and fire04 then
        player:say('Fight!', TALKTYPE_MONSTER_SAY)
        item:transform(1946)
        Game.createMonster("hades",Position(428,533,11))
        addEvent(HadesFire, 60 * 60 * 1000, fire01, fire02, fire03, fire04, lever) -- 60 min
    else
        player:sendTextMessage(MESSAGE_STATUS_SMALL, Game.getReturnMessage(RETURNVALUE_NOTPOSSIBLE))
    end
end
return true
end