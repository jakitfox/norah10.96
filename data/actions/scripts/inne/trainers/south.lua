function onUse(player, item, fromPosition, target, toPosition, isHotkey)

    -- Define positions.
    local doorPos = item:getPosition(item.uid)
    local monkOne = {x = doorPos.x - 1, y = doorPos.y + 2, z = doorPos.z}
    local monkTwo = {x = doorPos.x + 1, y = doorPos.y + 2, z = doorPos.z}
    local checkPlayer = {x = doorPos.x, y = doorPos.y + 1, z = doorPos.z}
	local topPlayer = Tile(checkPlayer):getTopCreature()
    
    -- Check where the player is located at.
	if player:getPosition() ~= Position(doorPos.x, doorPos.y + 1, doorPos.z) then
        -- Check if someone already uses the training booth.
        if topPlayer then
			player:sendTextMessage(MESSAGE_INFO_DESCR,"Someone is already using this booth.")
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
        else
            -- Teleport player.
			player:teleportTo(Position(doorPos.x,doorPos.y + 1,doorPos.z))
            -- Summon training monks.
            doSummonCreature("Trainer", monkOne)
            doSummonCreature("Trainer", monkTwo)
			player:say("Train!", TALKTYPE_MONSTER_SAY)
			player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_BLUE)
        end
    else
        -- Teleport player.
        player:teleportTo(Position(doorPos.x,doorPos.y - 1,doorPos.z))
        -- Remove training monks.
		doRemoveMonsterFromArea(monkOne, monkTwo)
		-- Send magic effect.
        doSendMagicEffect(monkOne, CONST_ME_YALAHARIGHOST)
        doSendMagicEffect(monkTwo, CONST_ME_YALAHARIGHOST)
    end
return true
end  