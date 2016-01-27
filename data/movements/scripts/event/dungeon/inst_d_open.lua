function onAddItem(moveItem, tileItem, position)
	if tileItem.actionid == 20404 then
		return true
	end

local entry_config = {
inst_id = 3,
portal_pos = {x = 937, y = 903, z = 9},
portal_id = 11798,
portal_aid = 20404,
portal_time = 15 * 60 * 1000,
pay_value = {5882, 1},
delay_gs = 20403
}
	local text_spect = getSpectators(position, 7, 5, false, true)
	if text_spect == nil then
		return true
	end

	if (dungeon_status[entry_config.inst_id] == nil or dungeon_status[entry_config.inst_id] == 0) then
		if moveItem.itemid == entry_config.pay_value[1] and moveItem.type >= entry_config.pay_value[2] then
			doRemoveItem(moveItem.uid)
			doSendMagicEffect(position, CONST_ME_FIREAREA)
			setGlobalStorageValue(entry_config.delay_gs, os.time() + 5)
			generateDungeon(entry_config.inst_id, os.time(), true)
			return true
		end
		Player(text_spect[1]):say('Nothing happens.', TALKTYPE_ORANGE_1, false, 0, position)
		return true
	elseif dungeon_status[entry_config.inst_id] == 1 then
		Player(text_spect[1]):say('The device is already running.', TALKTYPE_ORANGE_1, false, 0, position)
		return true
	elseif dungeon_status[entry_config.inst_id] == 2 then
		Player(text_spect[1]):say('Area under maintenance.', TALKTYPE_ORANGE_1, false, 0, position)
		return true
	elseif dungeon_status[entry_config.inst_id] == 3 then
		Player(text_spect[1]):say('Portal activation is in progress, please wait.', TALKTYPE_ORANGE_1, false, 0, position)
		return true
	else
		Player(text_spect[1]):say("The portal can't be maintained. Please come back later.", TALKTYPE_ORANGE_1, false, 0, position)
		return true
	end
return true
end

function onStepIn(cid, item, position, fromPosition)
	if item.actionid == 20403 then
		return true
	end

local inst_id = 3
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