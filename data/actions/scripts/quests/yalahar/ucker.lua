function onUse(player, item, frompos, item2, topos)

local mage
mage = Tile(435,1167,7):getItemById(12653)

if item.itemid == 9827 and mage and player:getStorageValue(Storage.Yala.Questline) == 5 then
	item:transform(9828)
	mage:remove()
elseif item.itemid == 9828 and mage and player:getStorageValue(Storage.Yala.Questline) == 5 then
	item:transform(9827)
end
return true
end