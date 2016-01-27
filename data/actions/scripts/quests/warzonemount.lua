function onUse(cid, item, frompos, item2, topos)
local p = Player(cid)

if p:getStorageValue(17686) == -1 then
		doPlayerAddMount(cid, 9)
		p:sendTextMessage(MESSAGE_INFO_DESCR,"You have found a mount.")
		p:setStorageValue(17686,1)
	else
		p:sendTextMessage(MESSAGE_INFO_DESCR, "The " .. getItemName(item.itemid) .. " is empty.")
end
return true
end