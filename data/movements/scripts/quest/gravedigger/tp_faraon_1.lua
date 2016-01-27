local spawnplayer = {x=410,y=275,z=12}
local deny = {x=410, y=288, z=12}
local NW = {x = 403, y = 264, z = 12}
local SE = {x = 416, y = 278, z = 12}
local boss = "dipthrah"

function kickDipthrah(player, item, position, fromPosition)
	if isPlayerInArea(NW, SE) then
		player:teleportTo(deny)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say('The time is over.', TALKTYPE_MONSTER_SAY)
	end
end

function onStepIn(player, item, pos)
    if player:getStorageValue(Storage.Grave.Pharaoh01) == 1 then
		if isPlayerInArea(NW, SE) then
			player:teleportTo(deny)
			player:getPosition():sendMagicEffect(CONST_ME_GROUNDSHAKER)
			player:say('Someone is still in this room. Please wait for your turn(max ' .. getGlobalStorageValue(Storage.Grave.Pharaoh01)-os.time() .. ' seconds left).', TALKTYPE_MONSTER_SAY)
		else
			doRemoveMonsterFromArea(NW, SE)
			player:teleportTo(Position(spawnplayer))
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:say('You have ten minutes to slain your enemy, otherwise you will be kicked out.', TALKTYPE_MONSTER_SAY)
			setGlobalStorageValue(Storage.Grave.Pharaoh01, os.time() + (10 * 60 * 1000 / 1000))
			Game.createItem(1550,1,Position(410,287,12))
			Game.createMonster(boss,Position(410,271,12))
			Dipthrah = addEvent(kickDipthrah, 10 * 60 * 1000, cid)
		end
	else
		player:teleportTo(deny)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say('You are not allowed to enter here!', TALKTYPE_MONSTER_SAY)
	end
	doSendMagicEffect(getThingPos(item.uid), CONST_ME_PURPLEENERGY)
    return true
end 