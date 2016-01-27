function onSay(cid, words, param)
	local player = Player(cid)
	if not canUseCommand(cid, words, param) then
		return false
	end
	
	local split = param:split(",")
	local id = tonumber(split[1])
	local count = tonumber(split[2])

	if not id then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Usage: " .. words .. " id, count")
		return false
	end
	
	if count > 500 or count < 1 then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Invalid amount specified.")
		return false
	end
	
	online_add_item_c = 1
	if count then
		online_add_item_c = count
	end
	
	for k, tmpPlayer in ipairs(Game.getPlayers()) do
		tmpPlayer:addItem(id, online_add_item_c)
		tmpPlayer:sendTextMessage(MESSAGE_INFO_DESCR, player:getName() .. " gave " .. online_add_item_c .. "x" .. getItemName(id) .. " to all online players.")
	end
	
	return false
end
