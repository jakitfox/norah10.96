function onStepIn(player, item, pos)

local newPosition  = {x=199, y=1452, z=9}
local newPosition1  = {x=224, y=1383, z=9}

local tablica = {Storage.Yala.Menor, Storage.Yala.Adness, Storage.Yala.Kaneler, Storage.Yala.Zomer, Storage.Yala.Dazzer, Storage.Yala.Enorien, Storage.Yala.Rotter, Storage.Yala.YalaharTP}

if item.uid == 3084 then
	if player:getStorageValue(Storage.Yala.YalaharTP) == -1 then
		for i = 1, #tablica do
		player:setStorageValue(tablica[i], 1)
		end
		player:teleportTo(Position(newPosition))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		else
		player:teleportTo(Position(newPosition))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
		
elseif item.uid == 3085 then
	player:teleportTo(Position(newPosition1))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
end
return true
end