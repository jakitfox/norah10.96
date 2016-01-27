function onStepIn(player, item, position, fromPosition)
 
	local gobletPosition = player:getPosition()
	gobletPosition.y = gobletPosition.y - 1
	 
	if player:getStorageValue(Storage.Grave.Medal) == -1 then
		player:setStorageValue(Storage.Grave.Medal, 1)
		local goblet = Game.createItem(5785, 1, gobletPosition)
		goblet:setAttribute("description", ("It is given to the courageous victor of the gravedigger mission.\nAwarded to %s."):format(player:getName()))
	end
	return true
end