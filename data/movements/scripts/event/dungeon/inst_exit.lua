function onStepIn(cid, item, position, fromPosition)
if not isPlayer(cid) then return true end

local inst_id = item.actionid - pits_event_config.main.spawn_exit_actionid
local exit_inst = pits_event_config.caves[inst_id].map_exit_inst
	if pits_event_config.main.output then sendChannelMessage(pits_event_config.main.output_channel_id, TALKTYPE_CHANNEL_O, "["..pits_event_config.caves[inst_id].map_name.."]: ".. getPlayerName(cid) .. " has left the area.") end
	if exit_inst ~= nil then
		if dungeon_status[exit_inst] == 1 then
			doTeleportThing(cid, pits_spawns[exit_inst])
		else
			doTeleportThing(cid, pits_event_config.caves[inst_id].map_exit)
		end
		doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
	end
	return true
end