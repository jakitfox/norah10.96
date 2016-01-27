function onUse(cid, item, fromPosition, itemEx, toPosition)

    -- Define positions.
    local charPos = getCreaturePosition(cid)
    local doorPos = item:getPosition(item.uid)
    local monkOne = {x = doorPos.x + 2, y = doorPos.y - 1, z = doorPos.z}
    local monkTwo = {x = doorPos.x + 2, y = doorPos.y + 1, z = doorPos.z}
    local checkPlayer = {x = doorPos.x + 1, y = doorPos.y, z = doorPos.z, stackpos = 253}
    -- Define directions.
    local newDir  = 1
    local oldDir  = 3
    
    -- Check where the player is located at.
    if ( charPos.x == doorPos.x - 1 and charPos.z == doorPos.z ) then
        -- Check if someone already uses the training booth.
        if isPlayer(getThingfromPos(checkPlayer).uid) == TRUE then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Someone is already using this booth.")
            doSendMagicEffect(getCreaturePos(cid), 2)
        else
            -- Teleport player.
            doTeleportThing(cid, doorPos)
            doMoveCreature(cid, newDir)
            -- Summon training monks.
            doSummonCreature("Trainer", monkOne)
            doSummonCreature("Trainer", monkTwo)
	    doCreatureSay(cid, "Train!", TALKTYPE_ORANGE_1)
	    doSendMagicEffect(getCreaturePosition(cid), 30)
        end
    else
        -- Teleport player.
        doTeleportThing(cid, doorPos)
        doMoveCreature(cid, oldDir)
        -- Remove training monks.
        doRemoveCreature(getThingfromPos({x = monkOne.x, y = monkOne.y, z = monkOne.z, stackpos = 253}).uid)
        doRemoveCreature(getThingfromPos({x = monkTwo.x, y = monkTwo.y, z = monkTwo.z, stackpos = 253}).uid)
        -- Send magic effect.
        doSendMagicEffect(monkOne, 65)
        doSendMagicEffect(monkTwo, 65)
        -- Define last character.
        local charName = getCreatureName(cid)
        doSetItemSpecialDescription(getThingfromPos(doorPos).uid, "Last one to use this booth was player:\n" .. charName .. ".")
    end
    return TRUE

end  