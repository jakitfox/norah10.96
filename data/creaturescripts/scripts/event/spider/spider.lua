dofile('data/lib/Norah/spider_lib.lua')

function onDeath(cid, corpse, killer, mostDamage, unjustified, mostDamage_unjustified)
    local monster = Monster(cid)
    monster:say("I WILL BE BACK!", TALKTYPE_MONSTER_YELL)
    monster:getPosition():sendMagicEffect(CONST_ME_MORTAREA)
    doSummonZombie()
    Game.setStorageValue(zeZombieCountGlobalStorage, Game.getStorageValue(zeZombieCountGlobalStorage) - 1)
end

function onPrepareDeath(cid, killer)
    local player = Player(cid)
    local winner = 0
    if player:getStorageValue(zeJoinStorage) == 1 then
        Game.setStorageValue(zeJoinedCountGlobalStorage, Game.getStorageValue(zeJoinedCountGlobalStorage) - 1)
        player:teleportTo(player:getTown():getTemplePosition())
        player:setStorageValue(zeJoinStorage, 0)
        player:addHealth(player:getMaxHealth())
		player:changeSpeed(player:getBaseSpeed() - player:getSpeed())
		player:sendTextMessage(MESSAGE_INFO_DESCR, ("You was catched by spider"))
		
        if Game.getStorageValue(zeJoinedCountGlobalStorage) <= 1 then --Event ended, someone won!
            local players = Game.getPlayers()
            for _, tmpPlayer in ipairs(players) do
                local stor = tmpPlayer:getStorageValue(zeJoinStorage)
                if stor == 1 then
                    winner = tmpPlayer:getId()
                    break
                end
            end
            winner = Player(winner)
            if winner then
                winner:teleportTo(winner:getTown():getTemplePosition())
				winner:changeSpeed(winner:getBaseSpeed() - winner:getSpeed())
			local coin = winner:setCoinsBalance(winner:getCoinsBalance() + 20)	
			if coin then
			end
                 Game.broadcastMessage(string.format('%s is the winner of Spider Event Versus %s Spiders.', winner:getName(), Game.getStorageValue(zeZombieCountGlobalStorage)), MESSAGE_STATUS_WARNING)
            end
			table.remove(active_events, table.find(active_events,4))
            doClearZombieArena()
            resetVariables()
        end
        return false
    end
    return true
end