function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(Storage.DemonOak.Done) == 4 then
		player:teleportTo(Position(700,921,8))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end
end