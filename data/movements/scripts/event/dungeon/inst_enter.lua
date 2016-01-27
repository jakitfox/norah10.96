function onStepIn(cid, item, position, fromPosition)
local inst_id = 1
if isPlayer(cid) then
	if (dungeon_status[inst_id] == nil or dungeon_status[inst_id] == 0) then
		doTeleportThing(cid, pits_event_config.caves[inst_id].map_exit)
		doCreatureSay(cid, 'Device is offline.', TALKTYPE_ORANGE_1)
	return true
	elseif dungeon_status[inst_id] == 1 then
		doTeleportThing(cid, pits_spawns[inst_id])
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[" .. pits_event_config.caves[inst_id].map_name .. "]: Welcome to random area. If you are stuck, type !quit to leave.")
		if pits_event_config.main.output then sendChannelMessage(pits_event_config.main.output_channel_id, TALKTYPE_CHANNEL_O, "["..pits_event_config.caves[inst_id].map_name.."]: ".. getPlayerName(cid) .. " has joined the area.") end
		if table.find(players_inside[inst_id], getPlayerName(cid)) == nil then
			table.insert(players_inside[inst_id], getPlayerName(cid))
		end
	return true
	elseif dungeon_status[inst_id] == 2 then
		doTeleportThing(cid, pits_event_config.caves[inst_id].map_exit)
		doCreatureSay(cid, 'Area under maintenance.', TALKTYPE_ORANGE_1)
	return true
	elseif dungeon_status[inst_id] == 3 then
		doTeleportThing(cid, pits_event_config.caves[inst_id].map_exit)
		doCreatureSay(cid, 'Portal activation is in progress, please wait.', TALKTYPE_ORANGE_1)
	return true
	else
		doTeleportThing(cid, pits_event_config.caves[inst_id].map_exit)
		doCreatureSay(cid, "Area unavailable.", TALKTYPE_ORANGE_1)
	return true
	end
end
return true
end