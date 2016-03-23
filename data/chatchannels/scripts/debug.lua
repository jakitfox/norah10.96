-- function canJoin(cid)
	-- return canInteract(cid)
-- end
local muted = createConditionObject(CONDITION_CHANNELMUTEDTICKS)
setConditionParam(muted, CONDITION_PARAM_SUBID, 32)
setConditionParam(muted, CONDITION_PARAM_TICKS, 1000)

function send_d_motd(cid)
if s_events_list ~= nil then
		if #s_events_list > 0 then
			Creature(cid):sendChannelMessage("", 32, TALKTYPE_CHANNEL_O, "[Notice]: Upcoming events: " .. table.concat(s_events_list, ", "))
		end
	end
   return Creature(cid):sendChannelMessage("", "[Channel]: Welcome to the events channel. Here you may talk about in-game events and receive news about their status. Type !help to see list of available commands.", TALKTYPE_CHANNEL_O, 32)
end

function onJoin(cid)
	addEvent(send_d_motd, 100, cid.uid)
	return true
end

function onSpeak(cid, type, message)
	if getCreatureCondition(cid, CONDITION_CHANNELMUTEDTICKS, 32) then
		Creature(cid):sendChannelMessage("", "Please do not spam.", TALKTYPE_CHANNEL_O, 32)
		return false
	end
	doAddCondition(cid, muted)
return false
end
