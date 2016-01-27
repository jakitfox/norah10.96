function onUse(player, item, frompos, item2, topos)

local ball
ball = Tile(286,281,12):getItemById(2176)

local killedMonsters = player:getStorageValue(Storage.Grave.BallMonster)
	if(killedMonsters == -1) then
		killedMonsters = 1
	end

if ball and player:getStorageValue(Storage.Grave.Mission07) == 1 and player:getStorageValue(Storage.Grave.BallMonster) <= 60 then
		player:setStorageValue(Storage.Grave.BallMonster, killedMonsters + 1)
	if player:getStorageValue(Storage.Grave.BallMonster) <= 10 then
		Game.createMonster("Vampire",Position(286,283,12))
	elseif player:getStorageValue(Storage.Grave.BallMonster) >= 11 and player:getStorageValue(Storage.Grave.BallMonster) <= 17 then
		Game.createMonster("Undead Gladiator",Position(286,283,12))
	elseif player:getStorageValue(Storage.Grave.BallMonster) >= 18 and player:getStorageValue(Storage.Grave.BallMonster) <= 26 then
		Game.createMonster("Lost Soul",Position(286,283,12))
	elseif player:getStorageValue(Storage.Grave.BallMonster) >= 27 and player:getStorageValue(Storage.Grave.BallMonster) <= 34 then
		Game.createMonster("Undead Dragon",Position(286,283,12))
	elseif player:getStorageValue(Storage.Grave.BallMonster) >= 35 and player:getStorageValue(Storage.Grave.BallMonster) <= 42 then
		Game.createMonster("Destroyer",Position(286,283,12))
	elseif player:getStorageValue(Storage.Grave.BallMonster) >= 43 and player:getStorageValue(Storage.Grave.BallMonster) <= 59 then
		Game.createMonster("Ghastly Dragon",Position(286,283,12))
	elseif player:getStorageValue(Storage.Grave.BallMonster) >= 60 and player:getStorageValue(Storage.Grave.BallMonster) <= 61 then
		Game.createMonster("Green Frog",Position(286,283,12))
		player:setStorageValue(Storage.Grave.Mission07, 2)
	end
end
return true
end