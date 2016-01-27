function onStepIn(player, item, pos)

local config = {
	[3111] = {storage = Storage.Elemental.Mechanicals},
	[3112] = {storage = Storage.Elemental.Grounds},
	[3113] = {storage = Storage.Elemental.Sludges},
	[3114] = {storage = Storage.Elemental.Fires},
	[3115] = {storage = Storage.Elemental.Magicals},
	[3116] = {storage = Storage.Elemental.Poisons},
	[3117] = {storage = Storage.Elemental.Ices},
	[3118] = {storage = Storage.Elemental.Waters}
}
local v = config[item.uid]

if v and player:getStorageValue(v.storage) == 1 then
	if not player:isPlayer() then
		return true
	end
	player:setStorageValue(v.storage, 2)
	player:say('You have absorbed some energy out of the throne!', TALKTYPE_MONSTER_SAY)
end
return true	
end