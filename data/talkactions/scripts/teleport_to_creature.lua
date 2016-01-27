function onSay(cid, words, param)
	local player = Player(cid)
	if not player:getGroup():getAccess() then
		return true
	end

	
	
	local target = Creature(param)
	if target == nil then
		if type(param) == "string" and param:find("{") then
			t = "destinatnion = "..param
			k = loadstring(t)
			k()
			if destinatnion then
				player:teleportTo(Position(destinatnion))
			end
			return false;
		end
	
		player:sendCancelMessage("Creature not found.")
		return false
	end

	player:teleportTo(target:getPosition())
	return false
end