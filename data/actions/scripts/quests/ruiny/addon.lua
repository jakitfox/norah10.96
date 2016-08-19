function onUse(player, item, frompos, item2, topos)

if player:getStorageValue(Storage.Ruiny.Addon) == -1 then
	player:addOutfitAddon(635, 3)
	player:addOutfitAddon(634, 3)
	player:setStorageValue(Storage.Ruiny.Addon,1)
	player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
	player:sendTextMessage(MESSAGE_INFO_DESCR,"You have found Conjurer outfit.")
else
	player:sendTextMessage(MESSAGE_INFO_DESCR,"It is empty.")
end
return true
end