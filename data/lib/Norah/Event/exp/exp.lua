function EXP_stop(player)
	table.remove(active_events, table.find(active_events, 1))
	setGlobalStorageValue(Storage.EXP_Event, -1)
	sendChannelMessage(events_calendar.channel_id, TALKTYPE_CHANNEL_O, "[EXP Event]: Event ended.")
return true
end
	
function EXP_init()
	table.insert(active_events,1)
	sendChannelMessage(events_calendar.channel_id, TALKTYPE_CHANNEL_O, "[EXP Event]: Event started.")
	setGlobalStorageValue(Storage.EXP_Event, 1)
	addEvent(EXP_stop, 60 * 60 * 1000)
return true
end