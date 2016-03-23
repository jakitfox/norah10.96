function onStepIn(player, item, position, fromPosition, lastPosition)

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
local v = config[item.actionid]

if v and player:getStorageValue(v.storage) == 1 then
	player:teleportTo(fromPosition)
    player:say("You haven\'t completed all the rooms!", TALKTYPE_MONSTER_SAY)
end
return true
end