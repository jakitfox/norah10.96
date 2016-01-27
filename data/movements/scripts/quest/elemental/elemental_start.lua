function onStepIn(player, item, position, fromPosition)

local elemental = {Storage.Elemental.Mechanicals, Storage.Elemental.Grounds, Storage.Elemental.Sludges, Storage.Elemental.Fires, Storage.Elemental.Magicals, Storage.Elemental.Poisons, Storage.Elemental.Ices, Storage.Elemental.Waters}

if player:getStorageValue(Storage.Elemental.Questline) == -1 then
	for i = 1, #elemental do
	player:setStorageValue(elemental[i],1)
	end
	player:setStorageValue(Storage.Elemental.Questline,1)
	player:say("Welcome on the dark side!", TALKTYPE_MONSTER_SAY)
end
return true
end