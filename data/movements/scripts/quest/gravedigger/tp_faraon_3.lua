local spawnplayer = {x=502, y=297, z=11}
local deny = {x=502, y=302, z=11}
local NW = {x = 495, y = 285, z = 11}
local SE = {x = 509, y = 299, z = 11}

local boss = "hegard"

function kickHegard(player, item, position, fromPosition)
	if isPlayerInArea(NW, SE) then
		player:teleportTo(deny)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say('The time is over.', TALKTYPE_MONSTER_SAY)
	end
end

function onStepIn(player, item, pos)
    if player:getStorageValue(Storage.Grave.Pharaoh03) == 1 then
		if isPlayerInArea(NW, SE) then
			player:teleportTo(deny)
			player:getPosition():sendMagicEffect(CONST_ME_GROUNDSHAKER)
			player:say('Someone is still in this room. Please wait for your turn(max ' .. getGlobalStorageValue(Storage.Grave.Pharaoh03)-os.time() .. ' seconds left).', TALKTYPE_MONSTER_SAY)
		else
			doRemoveMonsterFromArea(NW, SE)
			player:teleportTo(Position(spawnplayer))
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:say('You have ten minutes to slain your enemy, otherwise you will be kicked out.', TALKTYPE_MONSTER_SAY)
			setGlobalStorageValue(Storage.Grave.Pharaoh03, os.time() + (10 * 60 * 1000 / 1000))
			Game.createMonster(boss,Position(502,292,11))
			Hegard = addEvent(kickHegard, 10 * 60 * 1000, cid)
		end
	else
		player:teleportTo(deny)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say('You are not allowed to enter here!', TALKTYPE_MONSTER_SAY)
	end
	doSendMagicEffect(getThingPos(item.uid), CONST_ME_PURPLEENERGY)
    return true
end 