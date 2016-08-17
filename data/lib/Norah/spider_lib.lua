-- Zombie Variables
zeZombieName = 'Spider Event' --Zombie Name
zombieSpawnInterval = 5 --how many seconds until a new zombie spawns
zeMaxZombies = 30 --max zombies in the arena?
zeJoinedCountGlobalStorage = 100 --Player joined event count

zeZombieCountGlobalStorage = 110

-- Players Variables
zeJoinStorage = 1000 --player join storage
zeMinPlayers = 2 --min players needed when time runout
zeMaxPlayers = 40 --max players to join
zeTrophy = 7369 --trophy itemid
zeJoinedCountGlobalStorage = 101 --Zombie spawned Count

-- Other Variables
zeWaitMinutes = 1 --when event has opened, how long until it starts?
zeWaitingRoomPos = Position(648, 543, 9) --middle of waiting room
zeZombieArena = Position(1040, 600, 7) --when even start where should player be teleported in the zombie arena?
zeArenaFromPosition = Position(1009, 546, 7) --pos of top left corner
zeArenaToPosition = Position(1098, 611, 7) --pos of bottom right corner
zeMiddleZombieArena = Position(1054, 577, 7) --Middle pos of the arena
zeWaitingRoomRadiusX = 20 --depends how big the waiting room is 20sqm to x
zeWaitingRoomRadiusY = 20 --depends how big the waiting room is 20sqm to y
zeZombieArenaRadiusX = 50 --Depends how big the zombie arena is 50sqm to x
zeZombieArenaRadiusY = 50 --Depends how big the zombie arena is 50sqm to y
zeStartedGlobalStorage = 102 -- Value: 0 == false, 1 == true, 2 == started --State of the event

function startZombie()
    local specs = Game.getSpectators(zeWaitingRoomPos, false, true, 0, zeWaitingRoomRadiusX, 0, zeWaitingRoomRadiusY)
        if getGlobalStorageValue(zeJoinedCountGlobalStorage) < zeMinPlayers then
            for i = 1, #specs do
                    specs[i]:teleportTo(specs[i]:getTown():getTemplePosition(), false)
                    specs[i]:setStorageValue(zeJoinStorage, 0)
            end
            resetVariables()
			table.remove(active_events, table.find(active_events,4))
			sendChannelMessage(events_calendar.channel_id, TALKTYPE_CHANNEL_O, '[Spider Event]: Spider Event failed to start, because of to little players joined the event!')
            return true
        end
 
        for i = 1, #specs do
            specs[i]:teleportTo(zeZombieArena)
			specs[i]:changeSpeed(- specs[i]:getSpeed() + 350)
        end
		sendChannelMessage(events_calendar.channel_id, TALKTYPE_CHANNEL_O, '[Spider Event]: Spider Event has started, good luck to all participant.')
        setGlobalStorageValue(zeStartedGlobalStorage, 2)
        doStartZombieEvasion()
end

function doSummonZombie()
        if getGlobalStorageValue(zeZombieCountGlobalStorage) > zeMaxZombies then
            return false
        end
 
        local zombie = Game.createMonster(zeZombieName, {x = math.random(zeArenaFromPosition.x, zeArenaToPosition.x), y = math.random(zeArenaFromPosition.y, zeArenaToPosition.y), z = math.random(zeArenaFromPosition.z, zeArenaToPosition.z)})
        if zombie then
            Game.createMonster(zeZombieName, {x = math.random(zeArenaFromPosition.x, zeArenaToPosition.x), y = math.random(zeArenaFromPosition.y, zeArenaToPosition.y), z = math.random(zeArenaFromPosition.z, zeArenaToPosition.z)})
        end
        setGlobalStorageValue(zeZombieCountGlobalStorage, getGlobalStorageValue(zeZombieCountGlobalStorage) + 1)
end

function doStartZombieEvasion()
        if getGlobalStorageValue(zeStartedGlobalStorage) == 2 then
               doSummonZombie()
            addEvent(doStartZombieEvasion, 5 * 1000)
        end
end

function resetVariables()
        Game.setStorageValue(zeJoinedCountGlobalStorage, 0)
		Game.setStorageValue(zeZombieCountGlobalStorage, 0)
		Game.setStorageValue(zeStartedGlobalStorage, 0)
end

function doClearZombieArena()
	doRemoveMonsterFromArea(zeArenaFromPosition, zeArenaToPosition)
end

function SPIDER_init()
	table.insert(active_events,4)	
	sendChannelMessage(events_calendar.channel_id, TALKTYPE_CHANNEL_O, '[Spider Event]: The Spider Event has started! You have '.. zeWaitMinutes ..' minutes to join!')
	Game.setStorageValue(zeJoinedCountGlobalStorage, 0)
	Game.setStorageValue(zeStartedGlobalStorage, 1)
	addEvent(startZombie, zeWaitMinutes * 60 * 1000)
	return true
end