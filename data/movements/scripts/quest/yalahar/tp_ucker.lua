local spawnplayer = {x=442,y=1166,z=7}
local deny = {x=436, y=1167, z=7}
local NW = {x = 442, y = 1162, z = 7}
local SE = {x = 448, y = 1171, z = 7}
local boss = "ucker"

function kickUcker(player, item, position, fromPosition)
	if isPlayerInArea(NW, SE) then
		player:teleportTo(deny)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say('The time is over.', TALKTYPE_MONSTER_SAY)
	end
end

function onStepIn(player, item, pos)
    if player:getStorageValue(Storage.Yala.Ucker) == -1 and player:getStorageValue(Storage.Yala.Mission03) == 1 then
		if isPlayerInArea(NW, SE) then
			player:teleportTo(deny)
			player:getPosition():sendMagicEffect(CONST_ME_GROUNDSHAKER)
			player:say('Someone is still in this room. Please wait for your turn(max ' .. getGlobalStorageValue(Storage.Yala.Ucker)-os.time() .. ' seconds left).', TALKTYPE_MONSTER_SAY)
		else
			doRemoveMonsterFromArea(NW, SE)
			player:teleportTo(Position(spawnplayer))
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:say('You have ten minutes to slain your enemy, otherwise you will be kicked out.', TALKTYPE_MONSTER_SAY)
			setGlobalStorageValue(Storage.Yala.Ucker, os.time() + (10 * 60 * 1000 / 1000))
			Game.createItem(12653,1,Position(435,1167,7))
			Game.createMonster(boss,Position(445,1166,7))
			Ucker = addEvent(kickUcker, 10 * 60 * 1000, cid)
		end
	else
		player:teleportTo(deny)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say('You are not allowed to enter here!', TALKTYPE_MONSTER_SAY)
	end
	doSendMagicEffect(getThingPos(item.uid), CONST_ME_PURPLEENERGY)
    return true
end 