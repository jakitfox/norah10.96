function onUse(player, item, fromPosition, target, toPosition, isHotkey)

local statue
statue = Tile(410,287,12):getItemById(1550)
local switch1
switch1 = Tile(406,294,12):getItemById(1945)
local switch2
switch2 = Tile(407,294,12):getItemById(1946)
local switch3
switch3 = Tile(413,294,12):getItemById(1946)
local switch4
switch4 = Tile(414,294,12):getItemById(1946)

local function PharaonLeaver01(switch2, switch3, switch4)
	if (switch2 ~= nil) and (switch3 ~= nil) and (switch4 ~= nil) then
		switch2:transform(1945)
		switch3:transform(1945)
		switch4:transform(1945)
    else
    return print("Error:: One of parameters has nil value.")
end
return true;
end

if item.itemid == 1945 and item.actionid == 3046 then
	if switch1 and switch2 and switch3 and switch4 and statue then
		statue:remove()
		player:say('You can enter this room!', TALKTYPE_MONSTER_SAY)
		addEvent(PharaonLeaver01, 30*1000, switch2, switch3, switch4) -- 30 sek
		else
		item:transform(1946)	
	end
	
elseif item.itemid == 1946 and item.actionid == 3046 then
	if switch1 and switch2 and switch3 and switch4 and statue then
		statue:remove()
		player:say('You can enter this room!', TALKTYPE_MONSTER_SAY)
		addEvent(PharaonLeaver01, 30*1000, switch2, switch3, switch4) -- 30 sek
		else
		item:transform(1945)	
	end
end
return true
end