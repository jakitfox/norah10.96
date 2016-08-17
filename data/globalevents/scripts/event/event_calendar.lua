events_calendar = {
	channel_id = 32,
	[1] = { -- pn
		[12] = {{1}},
		[16] = {{3}},
		[18] = {{4}},
		[20] = {{1}}
	},
	[2] = { -- wt
		[12] = {{1}},
		[16] = {{4}},
		[18] = {{3}},
		[20] = {{1}}
	},
	[3] = { -- sr
		[12] = {{1}},
		[16] = {{3}},
		[18] = {{4}},
		[20] = {{1}}
	},
	[4] = { -- cz
		[12] = {{1}},
		[16] = {{4}},
		[18] = {{3}},
		[20] = {{1}}
	},
	[5] = { -- pt
		[12] = {{1}},
		[16] = {{3}},
		[18] = {{4}},
		[20] = {{1}}
	},
	[6] = { -- so
		[12] = {{1}},
		[16] = {{4}},
		[18] = {{3}},
		[20] = {{1}}
	},
	[0] = { -- nd
		[12] = {{1}},
		[16] = {{3}},
		[18] = {{4}},
		[20] = {{1}}
	}
}

events_calendar_list = {
	[1] = "extra exp",
	[2] = "extra loot",
	[3] = "pass the river", 
	[4] = "spider event"
}

function doExecuteScheduledEvent(day, hour, id)
	if tonumber(table.find(active_events,id)) ~= nil then
		error("Event with id " .. id .. " is already active!")
		sendChannelMessage(32, TALKTYPE_CHANNEL_O, "[Notice]: Unable to start " .. events_calendar_list[id] .. ". The event is already running.")
		return true
	end

	if id == 1 then
		EXP_init()
		return true
	elseif id == 2 then
		LOOT_init()
		return true
	elseif id == 3 then
		SE_init()
		return true	
	elseif id == 4 then
		SPIDER_init()
		return true
	end
end

function onThink(interval)
	local weekday = tonumber(os.date("%w"))
	local hour = tonumber(os.date("%H"))
	local minute = tonumber(os.date("%M"))
	local second = tonumber(os.date("%S"))

	if events_calendar[weekday] ~= nil then
		if minute == 0 then
			if events_calendar[weekday][hour] ~= nil then
				for i = 1, #events_calendar[weekday][hour] do
					doExecuteScheduledEvent(events_calendar[weekday], hour, events_calendar[weekday][hour][i][1])
				end
			end
			return true
		else
			if isInArray({5, 10, 15, 20, 25, 30, 35, 40}, minute) then -- message only 30 minutes before event
				if events_calendar[weekday][hour + 1] ~= nil then
					if #events_calendar[weekday][hour + 1] > 0 then
						s_events_list = {}
						for i = 1, #events_calendar[weekday][hour + 1] do
							table.insert(s_events_list, events_calendar_list[events_calendar[weekday][hour + 1][i][1]])
						end
						local m = 60 - minute
						sendChannelMessage(32, TALKTYPE_CHANNEL_O, "[Notice]: Upcoming events: " .. table.concat(s_events_list, ", ") .. " (" .. m .. " minute" .. (m > 1 and "s" or "") .. " left).")
					end
				end
				return true
			elseif isInArray({45, 50, 55}, minute) then
				if events_calendar[weekday][hour + 1] ~= nil then
					if #events_calendar[weekday][hour + 1] > 0 then
						s_events_list = {}
						for i = 1, #events_calendar[weekday][hour + 1] do
							table.insert(s_events_list, events_calendar_list[events_calendar[weekday][hour + 1][i][1]])
						end
						local m = 60 - minute
						sendChannelMessage(32, TALKTYPE_CHANNEL_O, "[Notice]: " .. ((#s_events_list > 1 and "Events: ") or "") .. table.concat(s_events_list, ", ") .. " will begin in " .. m .. " minute" .. (m > 1 and "s" or "") .. "!")
					end
				end
				return true
			end
			return true
		end
	end
end