local spawnplayer = {x=355, y=502, z=10}
local deny = {x=361, y=502, z=10}
local NW = {x = 348, y = 498, z = 10}
local SE = {x = 357, y = 507, z = 10}

local boss = "syzam"

function kickSyzam(player, item, position, fromPosition)
	if isPlayerInArea(NW, SE) then
		player:teleportTo(deny)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say('The time is over.', TALKTYPE_MONSTER_SAY)
	end
end

function onStepIn(player, item, pos)
    if player:getStorageValue(Storage.Grave.PlagueBoss) == 1 then
		if isPlayerInArea(NW, SE) then
			player:teleportTo(deny)
			player:getPosition():sendMagicEffect(CONST_ME_GROUNDSHAKER)
			player:say('Someone is still in this room. Please wait for your turn(max ' .. getGlobalStorageValue(Storage.Grave.PlagueBoss)-os.time() .. ' seconds left).', TALKTYPE_MONSTER_SAY)
		else
			doRemoveMonsterFromArea(NW, SE)
			player:teleportTo(Position(spawnplayer))
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:say('You have ten minutes to slain your enemy, otherwise you will be kicked out.', TALKTYPE_MONSTER_SAY)
			setGlobalStorageValue(Storage.Grave.PlagueBoss, os.time() + (10 * 60 * 1000 / 1000))
			Game.createItem(8835,1,Position(360,502,10))
			Game.createMonster(boss,Position(349,502,10))
			Syzam = addEvent(kickSyzam, 10 * 60 * 1000, cid)
		end
	else
		player:teleportTo(deny)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say('You are not allowed to enter here!', TALKTYPE_MONSTER_SAY)
	end
	doSendMagicEffect(getThingPos(item.uid), CONST_ME_PURPLEENERGY)
    return true
end 