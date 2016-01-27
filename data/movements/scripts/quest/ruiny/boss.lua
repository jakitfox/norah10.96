function onStepIn(player, item, pos, lastPosition)

local function RuinyGhaz()
	Game.setStorageValue(Storage.Ruiny.Gazh,-1)
end			

if Game.getStorageValue(Storage.Ruiny.Gazh) == 1 then
	player:teleportTo(Position(107,398,14))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	Game.setStorageValue(Storage.Ruiny.Gazh,2)
	addEvent(RuinyGhaz, 5*60*1000) -- 5 min
else 
	player:say("You don\'t have access to entry", TALKTYPE_MONSTER_SAY)
	player:teleportTo(Position(lastPosition))
end	
	
if Game.getStorageValue(Storage.Ruiny.Gazh) == 2 then
	player:teleportTo(Position(107,398,14))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
end
return true
end