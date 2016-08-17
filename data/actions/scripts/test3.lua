function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)

player:setCoinsBalance(player:getCoinsBalance() + 20)

return true
end