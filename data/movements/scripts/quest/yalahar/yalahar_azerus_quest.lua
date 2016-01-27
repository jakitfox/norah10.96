function onStepIn(player, item, position, fromPosition)

if item.uid == 3103 then
	player:say("Do you think that when you'll defeat me ,the mighty Amerus , you will stop my army? HAHAHAA. Better run as far as you can!", TALKTYPE_MONSTER_SAY)
	player:setStorageValue(Storage.Yala.RewardDoor, 1) --Value ID WHAT THE PLAYER CAN ENTER THE DOOR WHERE ARE THE REWARDS
end
return true
end