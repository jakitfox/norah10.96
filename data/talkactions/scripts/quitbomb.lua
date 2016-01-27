function onSay(cid, words, param)
	
	if getPlayerDungeon(cid) > 0 then
		if pits_event_config.main.output then sendChannelMessage(pits_event_config.main.output_channel_id, TALKTYPE_CHANNEL_O, "["..pits_event_config.caves[getPlayerDungeon(cid)].map_name.."]: ".. getCreatureName(cid) .. " has left the area.") end
		doTeleportThing(cid, pits_event_config.caves[getPlayerDungeon(cid)].map_exit)
		return false
	end
				
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "No event area detected.")
return false
end