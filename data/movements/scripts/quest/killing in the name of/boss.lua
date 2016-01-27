local function roomIsOccupied(centerPosition, rangeX, rangeY)
	local spectators = Game.getSpectators(centerPosition, false, true, rangeX, rangeX, rangeY, rangeY)
	if #spectators ~= 0 then
		return true
	end

	return false
end

function clearBossRoom(playerId, bossId, centerPosition, rangeX, rangeY, exitPosition)
	local spectators, spectator = Game.getSpectators(centerPosition, false, false, rangeX, rangeX, rangeY, rangeY)
	for i = 1, #spectators do
		spectator = spectators[i]
		if spectator:isPlayer() and spectator.uid == playerId then
			spectator:teleportTo(exitPosition)
			exitPosition:sendMagicEffect(CONST_ME_TELEPORT)
		end

		if spectator:isMonster() and spectator:getId() == bossId then
			spectator:remove()
		end
	end
end

local bosses = {
	[3210] = {bossName = 'the snapper', storage = 3501, playerPosition = Position(699, 489, 11), bossPosition = Position(706, 490, 11), centerPosition = Position(703, 489, 11), rangeX = 8, rangeY = 9, flamePosition = Position(656, 529, 10)},
	[3211] = {bossName = 'hide', storage = 3502, playerPosition = Position(666, 488, 11), bossPosition = Position(667, 494, 11), centerPosition = Position(667, 492, 11), rangeX = 7, rangeY = 7, flamePosition = Position(663, 529, 10)},
	[3212] = {bossName = 'deathbine', storage = 3503, playerPosition = Position(633, 489, 11), bossPosition = Position(641, 487, 11), centerPosition = Position(638, 488, 11), rangeX = 9, rangeY = 8, flamePosition = Position(656, 523, 10)},
	[3213] = {bossName = 'the bloodtusk', storage = 3504, playerPosition = Position(694, 490, 11), bossPosition = Position(602, 491, 11), centerPosition = Position(600, 491, 11), rangeX = 9, rangeY = 6, flamePosition = Position(663, 523, 10)},
	[3214] = {bossName = 'shardhead', storage = 3505, playerPosition = Position(593, 455, 11), bossPosition = Position(601, 456, 11), centerPosition = Position(599, 456, 11), rangeX = 10, rangeY = 7, flamePosition = Position(656, 517, 10)},
	
	-- Poprawić--
	[3215] = {bossName = 'esmeralda', storage = 3506, playerPosition = Position(32759, 31252, 9), bossPosition = Position(32759, 31258, 9), centerPosition = Position(32759, 31254, 9), rangeX = 4, rangeY = 4, flamePosition = Position(32758, 31248, 9)},
	[3216] = {bossName = 'fleshcrawler', storage = 3507, playerPosition = Position(33100, 32785, 11), bossPosition = Position(33121, 32797, 11), centerPosition = Position(33112, 32789, 11), rangeX = 15, rangeY = 13, flamePosition = Position(33106, 32775, 11)},
	[3217] = {bossName = 'ribstride', storage = 3508, playerPosition = Position(33012, 32813, 13), bossPosition = Position(33013, 32801, 13), centerPosition = Position(33012, 32805, 13), rangeX = 10, rangeY = 9, flamePosition = Position(33018, 32814, 13)},
	[3218] = {bossName = 'bloodweb', storage = 3509, playerPosition = Position(32019, 31037, 8), bossPosition = Position(32032, 31033, 8), centerPosition = Position(32023, 31033, 8), rangeX = 11, rangeY = 11, flamePosition = Position(32010, 31031, 8)},
	[3219] = {bossName = 'thul', storage = 3510, playerPosition = Position(32078, 32780, 13), bossPosition = Position(32088, 32780, 13), centerPosition = Position(32083, 32781, 13), rangeX = 6, rangeY = 6, flamePosition = Position(32086, 32776, 13)},
	[3220] = {bossName = 'the old widow', storage = 3511, playerPosition = Position(32805, 32280, 8), bossPosition = Position(32797, 32281, 8), centerPosition = Position(32801, 32276, 8), rangeX = 5, rangeY = 5, flamePosition = Position(32808, 32283, 8)},
	[3221] = {bossName = 'hemming', storage = 3512, playerPosition = Position(32999, 31452, 8), bossPosition = Position(33013, 31441, 8), centerPosition = Position(33006, 31445, 8), rangeX = 9, rangeY = 7, flamePosition = Position(33005, 31437, 8)},
	[3222] = {bossName = 'tormentor', storage = 3513, playerPosition = Position(32043, 31258, 11), bossPosition = Position(32058, 31267, 11), centerPosition = Position(32051, 31264, 11), rangeX = 11, rangeY = 14, flamePosition = Position(32051, 31249, 11)},
	[3223] = {bossName = 'flameborn', storage = 3514, playerPosition = Position(32940, 31064, 8), bossPosition = Position(32947, 31058, 8), centerPosition = Position(32944, 31060, 8), rangeX = 11, rangeY = 10, flamePosition = Position(32818, 31026, 7)},
	[3224] = {bossName = 'fazzrah', storage = 3515, playerPosition = Position(32990, 31171, 7), bossPosition = Position(33005, 31174, 7), centerPosition = Position(33003, 31177, 7), rangeX = 14, rangeY = 6, flamePosition = Position(33007, 31171, 7)},
	[3225] = {bossName = 'tromphonyte', storage = 3516, playerPosition = Position(33111, 31184, 8), bossPosition = Position(33120, 31195, 8), centerPosition = Position(33113, 31188, 8), rangeX = 11, rangeY = 18, flamePosition = Position(33109, 31168, 8)},
	[3226] = {bossName = 'sulphur scuttler', storage = 3517, playerPosition = Position(33269, 31046, 9), bossPosition = Position(33274, 31037, 9), centerPosition = Position(33088, 31012, 8), rangeX = 11, rangeY = 11, flamePosition = Position(0, 0, 0)},
	[3227] = {bossName = 'bruise payne', storage = 3518, playerPosition = Position(33237, 31006, 2), bossPosition = Position(33266, 31016, 2), centerPosition = Position(33251, 31016, 2), rangeX = 22, rangeY = 11, flamePosition = Position(33260, 31003, 2)},
	[3228] = {bossName = 'the many', storage = 3519, playerPosition = Position(32921, 32893, 8), bossPosition = Position(32926, 32903, 8), centerPosition = Position(32921, 32898, 8), rangeX = 5, rangeY = 6, flamePosition = Position(32921, 32890, 8)},
	[3229] = {bossName = 'the noxious spawn', storage = 3520, playerPosition = Position(32842, 32667, 11), bossPosition = Position(32843, 32675, 11), centerPosition = Position(32843, 32670, 11), rangeX = 5, rangeY = 5, flamePosition = Position(0, 0, 0)},
	[3230] = {bossName = 'gorgo', storage = 3521, playerPosition = Position(32759, 32447, 11), bossPosition = Position(32763, 32435, 11), centerPosition = Position(32759, 32440, 11), rangeX = 9, rangeY = 10, flamePosition = Position(32768, 32440, 11)},
	[3231] = {bossName = 'stonecracker', storage = 3522, playerPosition = Position(33259, 31694, 15), bossPosition = Position(33257, 31705, 15), centerPosition = Position(33259, 31670, 15), rangeX = 5, rangeY = 7, flamePosition = Position(33259, 31689, 15)},
	[3232] = {bossName = 'leviathan', storage = 3523, playerPosition = Position(31915, 31071, 10), bossPosition = Position(31903, 31072, 10), centerPosition = Position(31909, 31072, 10), rangeX = 8, rangeY = 7, flamePosition = Position(31918, 31071, 10)},
	[3233] = {bossName = 'kerberos', storage = 3524, playerPosition = Position(32048, 32581, 15), bossPosition = Position(32032, 32565, 15), centerPosition = Position(32041, 32569, 15), rangeX = 11, rangeY = 13, flamePosition = Position(32030, 32555, 15)},
	[3234] = {bossName = 'ethershreck', storage = 3525, playerPosition = Position(33089, 31021, 8), bossPosition = Position(33085, 31004, 8), centerPosition = Position(33088, 31012, 8), rangeX = 11, rangeY = 11, flamePosition = Position(33076, 31007, 8)},
	[3235] = {bossName = 'paiz the pauperizer', storage = 3526, playerPosition = Position(33069, 31110, 1), bossPosition = Position(33082, 31105, 1), centerPosition = Position(33076, 31110, 1), rangeX = 8, rangeY = 6, flamePosition = Position(33076, 31110, 1)},
	[3236] = {bossName = 'bretzecutioner', storage = 3527, playerPosition = Position(31973, 31184, 10), bossPosition = Position(31979, 31176, 10), centerPosition = Position(31973, 31177, 10), rangeX = 15, rangeY = 10, flamePosition = Position(31973, 31166, 10)},
	[3237] = {bossName = 'zanakeph', storage = 3528, playerPosition = Position(33077, 31040, 12), bossPosition = Position(33082, 31056, 12), centerPosition = Position(33077, 31050, 12), rangeX = 13, rangeY = 10, flamePosition = Position(33070, 31039, 12)},
	[3238] = {bossName = 'demodras', storage = Storage.KillingInTheNameOf.DemodrasTeleport, playerPosition = Position(32748, 32287, 10), bossPosition = Position(32747, 32294, 10), centerPosition = Position(32887, 32583, 4), rangeX = 6, rangeY = 5, flamePosition = Position(33076, 31029, 12)},
	[3259] = {bossName = 'tiquandas revenge', storage = Storage.KillingInTheNameOf.TiquandasRevengeTeleport, playerPosition = Position(32888, 32580, 4), bossPosition = Position(32888, 32586, 4), centerPosition = Position(32748, 32293, 10), rangeX = 8, rangeY = 7, flamePosition = Position(33076, 31029, 11)},
	[3260] = {bossName = 'necropharus', storage = 3531, playerPosition = Position(33028, 32426, 12), bossPosition = Position(33026, 32422, 12), centerPosition = Position(33028, 32424, 12), rangeX = 6, rangeY = 5, flamePosition = Position(33070, 31035, 12)},
	[3261] = {bossName = 'the horned fox', storage = 3522, playerPosition = Position(32458, 31994, 9), bossPosition = Position(32458, 32005, 9), centerPosition = Position(32450, 31400, 9), rangeX = 5, rangeY = 8, flamePosition = Position(33070, 31029, 12)}
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local boss = bosses[item.uid]
	if not boss then
		return true
	end

	if player:getStorageValue(boss.storage) ~= 1 or roomIsOccupied(boss.centerPosition, boss.rangeX, boss.rangeY) then
		player:teleportTo(fromPosition)
		return true
	end
	
	player:setStorageValue(boss.storage, 0)
	player:teleportTo(boss.playerPosition)
	boss.playerPosition:sendMagicEffect(CONST_ME_TELEPORT)

	local monster = Game.createMonster(boss.bossName, boss.bossPosition)
	if not monster then
		return true
	end

	addEvent(clearBossRoom, 10 * 60 * 1000, player.uid, monster:getId(), boss.centerPosition, boss.rangeX, boss.rangeY, fromPosition)
	player:say('You have ten minutes to kill and loot this boss. Otherwise you will lose that chance and will be kicked out.', TALKTYPE_MONSTER_SAY)
	return true
end