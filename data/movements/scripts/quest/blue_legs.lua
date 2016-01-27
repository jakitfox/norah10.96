function onStepIn(player, item, pos)

if player:getStorageValue(Storage.Blue.Questline) == -1 and player:getStorageValue(Storage.Blue.QuestTime) <= os.time() then
		Game.createMonster("Koshei the Deathless", Position(328,434,8))
		player:setStorageValue(Storage.Blue.QuestTime,(os.time()+600))
end
return true 
end