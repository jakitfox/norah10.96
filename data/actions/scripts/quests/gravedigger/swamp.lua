function onUse(player, item, frompos, item2, topos)

if player:getItemCount(5898) >= 1 then
	if player:removeItem(5898,1) then
	player:teleportTo(Position(493,340,11))
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
end
return true
end