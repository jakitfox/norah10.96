function onUse(player, item, position, fromPosition)

local config = {
	[3128] = { storage = Storage.Ruiny.Kaplica01},
	[3129] = { storage = Storage.Ruiny.Kaplica02},
	[3130] = { storage = Storage.Ruiny.Kaplica03},
	[3131] = { storage = Storage.Ruiny.Kaplica04}
}

local v = config[item.uid]
if v then	
	if player:getStorageValue(Storage.Ruiny.Mission01) == 1 and player:getStorageValue(v.storage) == -1 then	
		player:setStorageValue(v.storage, 1)
		player:say("Take my blessing ".. player:getName() .."", TALKTYPE_MONSTER_SAY)
	else
		player:sendTextMessage(MESSAGE_STATUS_SMALL, Game.getReturnMessage(RETURNVALUE_NOTPOSSIBLE))
    end
end
return true
end