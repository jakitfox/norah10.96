function onUse(player, item, fromPosition, itemEx, toPosition)

local items = {2237, 2328, 5894, 5902, 5890, 5899, 5879, 2114, 5880}
local items1 = {5895, 13926, 13925, 2195, 5885, 13508, 5804,}

if math.random(20) <= 1 then
		player:addItem(items1[math.random(#items1)], 1)
		player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
		Item(item.uid):remove(1)
	else
		player:addItem(items[math.random(#items)], 1)
		player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
		Item(item.uid):remove(1)
end
return true
end