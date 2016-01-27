function onStepIn(cid, item, position, fromPosition)
local inst_id = 4
local pay_value = {5882, 1}
local p = getThingPos(item.uid)
local npos = {x = p.x, y = p.y + 2, z = p.z}
local enter_errors = {
	[2] = 'Area under maintenance.',
	[3] = 'Portal activation is in progress, please wait.'
}

	doSendMagicEffect(p, CONST_ME_PURPLEENERGY)
	if not isPlayer(cid) then
		doTeleportThing(cid, npos)
		doSendMagicEffect(npos, CONST_ME_PURPLEENERGY)
		return true
	end

	if (dungeon_status[inst_id] == nil or dungeon_status[inst_id] == 0) then
		if getPlayerItemCount(cid, pay_value[1]) >= pay_value[2] then
			generateDungeon(inst_id, os.time(), true)
			doTeleportThing(cid, npos)
			doSendMagicEffect(npos, CONST_ME_PURPLEENERGY)
			doCreatureSay(cid, 'Portal activation initialized.', TALKTYPE_ORANGE_1, true, cid, npos)
			return true
		else
			doTeleportThing(cid, npos)
			doSendMagicEffect(npos, CONST_ME_PURPLEENERGY)
			doCreatureSay(cid, 'Something is missing here.', TALKTYPE_ORANGE_1, true, cid, npos)
			return true
		end
	elseif dungeon_status[inst_id] == 1 then
		if pits_spawns[inst_id] ~= nil then
			if doPlayerRemoveItem(cid, pay_value[1], pay_value[2]) then
				doTeleportThing(cid, pits_spawns[inst_id])
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[" .. pits_event_config.caves[inst_id].map_name .. "]: Welcome to random area. If you are stuck, type !quit to leave.")
				if pits_event_config.main.output then sendChannelMessage(pits_event_config.main.output_channel_id, TALKTYPE_CHANNEL_O, "["..pits_event_config.caves[inst_id].map_name.."]: ".. getPlayerName(cid) .. " has joined the area.") end
				if table.find(players_inside[inst_id], getPlayerName(cid)) == nil then
					table.insert(players_inside[inst_id], getPlayerName(cid))
				end
				doSendMagicEffect(pits_spawns[inst_id], CONST_ME_PURPLEENERGY)
				doCreatureSay(cid, 'Teleportation completed.', TALKTYPE_ORANGE_1, true, cid, pits_spawns[inst_id])
				return true
			else
				doTeleportThing(cid, npos)
				doSendMagicEffect(npos, CONST_ME_PURPLEENERGY)
				doCreatureSay(cid, 'Something is missing here.', TALKTYPE_ORANGE_1, true, cid, npos)
				return true
			end
		else
			closeDungeon(inst_id, 0)
			doTeleportThing(cid, npos)
			doSendMagicEffect(npos, CONST_ME_PURPLEENERGY)
			doCreatureSay(cid, 'Connected to destination.', TALKTYPE_ORANGE_1, true, cid, npos)
			return true
		end
		return true
	end
	
	doTeleportThing(cid, npos)
	doSendMagicEffect(npos, CONST_ME_PURPLEENERGY)
	if enter_errors[dungeon_status[inst_id]] == nil then
		doCreatureSay(cid, 'Area unavailable.', TALKTYPE_ORANGE_1, true, cid, npos)
		return true
	end
	doCreatureSay(cid, enter_errors[dungeon_status[inst_id]], TALKTYPE_ORANGE_1, true, cid, npos)
	return true
end