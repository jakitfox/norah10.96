function onSay(cid, words, param)
	if exhaustion.get(cid, 830) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Bug Report]: Report failed. You may send only one report per minute.")
		return false
	end

	if(param == '') then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Bug Report]: Please specify report reason, example: \"" .. words .. " this lever doesn't work\"")
		return false
	end
	
	exhaustion.set(cid, 830, 60)
	local p = Player(cid)
	local pos = p:getPosition()
	file = io.open("bug_reports.txt", "a+")
	file:write("[" .. os.date("%a %d %B %Y %X", os.time()).."][" .. Game.convertIpToString(p:getIp()) .. "][x: ".. pos.x ..", y: ".. pos.y ..", z: ".. pos.z .."][" .. p:getName() .. "]: ".. param .."\n")
	file:close()
	p:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "[Bug Report]: Report sent.")
	return false
end