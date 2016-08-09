function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.itemid ~= 2700 then
		return false
	end
	
	local chance = math.random(100)
	
	if chance <= 10 then
	item:remove(1)
	player:addItem(13539, 1)
	toPosition:sendMagicEffect(CONST_ME_EXPLOSIONAREA)
	else
	item:remove(1)
end
return true
end