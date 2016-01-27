function onUse(player, item, position, fromPosition)
	local config = {
		[3001] = {storage = Storage.Satan.AddonFirst, addon = 1, text = "First"},
		[3025] = {storage = Storage.Satan.AddonSecond, addon = 2, text = "Second"}
	}
	local v = config[item.uid]
	
	if v and player:getStorageValue(v.storage) == -1 then
		player:addOutfitAddon(289, v.addon)
		player:addOutfitAddon(288, v.addon)
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You have received the " ..v.text.." Demonhunter addon!")
		player:setStorageValue(v.storage,1)
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "It is empty.")
	end
	return true
end