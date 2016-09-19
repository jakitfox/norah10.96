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
	[3215] = {bossName = 'esmeralda', storage = 3506, playerPosition = Position(635, 458, 11), bossPosition = Position(635, 453, 11), centerPosition = Position(636, 456, 11), rangeX = 7, rangeY = 6, flamePosition = Position(663, 517, 10)},
	[3216] = {bossName = 'fleshcrawler', storage = 3507, playerPosition = Position(669, 455, 11), bossPosition = Position(674, 459, 11), centerPosition = Position(672, 458, 11), rangeX = 11, rangeY = 8, flamePosition = Position(655, 512, 10)},
	[3217] = {bossName = 'ribstride', storage = 3508, playerPosition = Position(699, 456, 11), bossPosition = Position(705, 456, 11), centerPosition = Position(703, 456, 11), rangeX = 8, rangeY = 7, flamePosition = Position(650, 512, 10)},
	[3218] = {bossName = 'the bloodweb', storage = 3509, playerPosition = Position(592, 424, 11), bossPosition = Position(600, 427, 11), centerPosition = Position(598, 425, 11), rangeX = 10, rangeY = 8, flamePosition = Position(645, 512, 10)},
	[3219] = {bossName = 'thul', storage = 3510, playerPosition = Position(628, 424, 11), bossPosition = Position(636, 423, 11), centerPosition = Position(633, 423, 11), rangeX = 7, rangeY = 9, flamePosition = Position(640, 512, 10)},
	[3220] = {bossName = 'the old widow', storage = 3511, playerPosition = Position(670, 431, 11), bossPosition = Position(670, 424, 11), centerPosition = Position(670, 426, 11), rangeX = 12, rangeY = 8, flamePosition = Position(635, 512, 10)},
	[3221] = {bossName = 'hemming', storage = 3512, playerPosition = Position(698, 424, 11), bossPosition = Position(707, 424, 11), centerPosition = Position(704, 424, 11), rangeX = 11, rangeY = 10, flamePosition = Position(635, 507, 10)},
	[3222] = {bossName = 'tormentor', storage = 3513, playerPosition = Position(590, 397, 11), bossPosition = Position(599, 392, 11), centerPosition = Position(597, 392, 11), rangeX = 10, rangeY = 10, flamePosition = Position(640, 507, 10)},
	[3223] = {bossName = 'flameborn', storage = 3514, playerPosition = Position(623, 395, 11), bossPosition = Position(633, 391, 11), centerPosition = Position(631, 392, 11), rangeX = 12, rangeY = 10, flamePosition = Position(645, 507, 10)},
	[3224] = {bossName = 'fazzrah', storage = 3515, playerPosition = Position(663, 394, 11), bossPosition = Position(673, 392, 11), centerPosition = Position(669, 392, 11), rangeX = 10, rangeY = 10, flamePosition = Position(650, 507, 10)},
	[3225] = {bossName = 'tromphonyte', storage = 3516, playerPosition = Position(701, 398, 11), bossPosition = Position(710, 394, 11), centerPosition = Position(706, 396, 11), rangeX = 11, rangeY = 10, flamePosition = Position(655, 507, 10)},
	[3226] = {bossName = 'sulphur scuttler', storage = 3517, playerPosition = Position(591, 365, 11), bossPosition = Position(600, 364, 11), centerPosition = Position(596, 365, 11), rangeX = 10, rangeY = 8, flamePosition = Position(664, 507, 10)},
	[3227] = {bossName = 'bruise payne', storage = 3518, playerPosition = Position(630, 365, 11), bossPosition = Position(629, 359, 11), centerPosition = Position(629, 361, 11), rangeX = 13, rangeY = 11, flamePosition = Position(669, 507, 10)},
	[3228] = {bossName = 'the many', storage = 3519, playerPosition = Position(664, 367, 11), bossPosition = Position(666, 360, 11), centerPosition = Position(667, 363, 11), rangeX = 12, rangeY = 10, flamePosition = Position(674, 507, 10)},
	[3229] = {bossName = 'the noxious spawn', storage = 3520, playerPosition = Position(710, 370, 11), bossPosition = Position(704, 365, 11), centerPosition = Position(707, 366, 11), rangeX = 7, rangeY = 7, flamePosition = Position(679, 507, 10)},
	[3230] = {bossName = 'gorgo', storage = 3521, playerPosition = Position(596, 340, 11), bossPosition = Position(590, 334, 11), centerPosition = Position(593, 336, 11), rangeX = 9, rangeY = 9, flamePosition = Position(684, 507, 10)},
	[3231] = {bossName = 'stonecracker', storage = 3522, playerPosition = Position(623, 331, 11), bossPosition = Position(630, 331, 11), centerPosition = Position(628, 331, 11), rangeX = 7, rangeY = 9, flamePosition = Position(684, 512, 10)},
	[3232] = {bossName = 'leviathan', storage = 3523, playerPosition = Position(656, 334, 11), bossPosition = Position(667, 333, 11), centerPosition = Position(664, 333, 11), rangeX = 12, rangeY = 11, flamePosition = Position(679, 512, 10)},
	[3233] = {bossName = 'kerberos', storage = 3524, playerPosition = Position(706, 328, 11), bossPosition = Position(707, 339, 11), centerPosition = Position(706, 335, 11), rangeX = 11, rangeY = 13, flamePosition = Position(674, 512, 10)},
	[3234] = {bossName = 'ethershreck', storage = 3525, playerPosition = Position(588, 303, 11), bossPosition = Position(596, 303, 11), centerPosition = Position(593, 303, 11), rangeX = 11, rangeY = 11, flamePosition = Position(669, 512, 10)},
	[3235] = {bossName = 'paiz the pauperizer', storage = 3526, playerPosition = Position(623, 305, 11), bossPosition = Position(630, 305, 11), centerPosition = Position(627, 305, 11), rangeX = 8, rangeY = 8, flamePosition = Position(664, 512, 10)},
	[3236] = {bossName = 'bretzecutioner', storage = 3527, playerPosition = Position(663, 295, 11), bossPosition = Position(663, 306, 11), centerPosition = Position(663, 302, 11), rangeX = 11, rangeY = 10, flamePosition = Position(656, 502, 10)},
	[3237] = {bossName = 'zanakeph', storage = 3528, playerPosition = Position(699, 293, 11), bossPosition = Position(708, 300, 11), centerPosition = Position(704, 298, 11), rangeX = 13, rangeY = 10, flamePosition = Position(663, 502, 10)},
	[3238] = {bossName = 'demodras', storage = Storage.KillingInTheNameOf.DemodrasTeleport, playerPosition = Position(589, 272, 11), bossPosition = Position(598, 266, 11), centerPosition = Position(594, 268, 11), rangeX = 9, rangeY = 9, flamePosition = Position(656, 494, 10)},
	[3259] = {bossName = 'tiquandas revenge', storage = Storage.KillingInTheNameOf.TiquandasRevengeTeleport, playerPosition = Position(637, 270, 11), bossPosition = Position(628, 270, 11), centerPosition = Position(631, 271, 11), rangeX = 10, rangeY = 8, flamePosition = Position(663, 494, 10)},
	[3260] = {bossName = 'necropharus', storage = 3531, playerPosition = Position(660, 268, 11), bossPosition = Position(669, 267, 11), centerPosition = Position(666, 267, 11), rangeX = 10, rangeY = 10, flamePosition = Position(650, 494, 10)},
	[3261] = {bossName = 'the horned fox', storage = 3522, playerPosition = Position(698, 268, 11), bossPosition = Position(703, 263, 11), centerPosition = Position(701, 266, 11), rangeX = 8, rangeY = 8, flamePosition = Position(669, 494, 10)}
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