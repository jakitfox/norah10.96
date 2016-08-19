function onUse(player, item, frompos, item2, topos)

if player:getStorageValue(Storage.Yala.Addon) == -1 then
	player:addOutfitAddon(325, 2)
	player:addOutfitAddon(324, 2)
	player:setStorageValue(Storage.Yala.Addon,1)
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
	player:sendTextMessage(MESSAGE_INFO_DESCR,"You have found second Yalaharian addon.")
else
	player:sendTextMessage(MESSAGE_INFO_DESCR,"It is empty.")
end
return true
end