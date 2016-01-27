function onStepIn(player, item, position, fromPosition, lastPosition)
local config = {
	[3137] = {wartoscstartowa = -1, wartosc = 1},
	[3138] = {wartoscstartowa = 1, wartosc = 2},
	[3139] = {wartoscstartowa = 2, wartosc = 3},
	[3140] = {wartoscstartowa = 3, wartosc = 4}
}
local v = config[item.uid]
if v then
if player:getStorageValue(Storage.Ruiny.Sala) == v.wartoscstartowa then
	player:teleportTo(Position(83,429,14))
	player:getPosition():sendMagicEffect(CONST_ME_HOLYDAMAGE)
	player:setStorageValue(Storage.Ruiny.Sala, v.wartosc)
else
	player:teleportTo(Position(83,429,14))
	player:getPosition():sendMagicEffect(CONST_ME_FIREAREA)
	player:setStorageValue(Storage.Ruiny.Sala, -1)	
end
		
elseif player:getStorageValue(Storage.Ruiny.Sala) == 4 and item.uid == 3136 then
	player:setStorageValue(Storage.Ruiny.Sala, -1)	
else	
	player:teleportTo(Position(83,429,14))
	player:getPosition():sendMagicEffect(CONST_ME_FIREAREA)
	player:setStorageValue(Storage.Ruiny.Sala, -1)
end
return true
end