function onUse(player, item, fromPosition, itemEx, toPosition)
local config = {
	[3197] = {pos = {x=918, y=803, z=8}},
	[3198] = {pos = {x=1022, y=824, z=8}}			
	}
	
local v = config[item.uid]
if v and player:getItemCount(5461) >= 1 then
		player:teleportTo(v.pos)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don\'t have Helmet of the Deep.")
	end
	return true
end