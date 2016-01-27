events_calendar = {
	channel_id = 32,
	[1] = { -- pn
		[14] = {{7}},
		[17] = {{2}},
		[18] = {{7}},
		[18] = {{8}},
		[19] = {{7}}
	},
	[2] = { -- wt
		[16] = {{7}},
		[17] = {{1}},
		[18] = {{7}},
		[19] = {{8}},
		[20] = {{7}}
	},
	[3] = { -- sr
		[16] = {{7}},
		[17] = {{2}},
		[18] = {{7}},
		[19] = {{8}},
		[20] = {{7}}
	},
	[4] = { -- cz
		[16] = {{7}},
		[17] = {{1}},
		[18] = {{7}},
		[19] = {{8}},
		[20] = {{7}}
	},
	[5] = { -- pt
		[16] = {{7}},
		[17] = {{2}},
		[18] = {{7}},
		[19] = {{8}},
		[20] = {{7}}
	},
	[6] = { -- so
		[16] = {{7}},
		[17] = {{1}},
		[18] = {{7}},
		[19] = {{8}},
		[20] = {{7}}
	},
	[0] = { -- nd
		[16] = {{7}},
		[17] = {{1}},
		[18] = {{7}},
		[19] = {{8}},
		[20] = {{7}}
	}
}

events_calendar_list = {
	[1] = "extra exp",
	[2] = "extra loot",
	[3] = "random gift",
	[4] = "sheep",
	[5] = "raining fire",
	[6] = "hardcore dungeon",
	[7] = "spider event", 
	[8] = "pass the river"
}

function doExecuteScheduledEvent(day, hour, id)
	if tonumber(table.find(active_events,id)) ~= nil then
		error("Event with id " .. id .. " is already active!")
		sendChannelMessage(32, TALKTYPE_CHANNEL_O, "[Notice]: Unable to start " .. events_calendar_list[id] .. ". The event is already running.")
		return true
	end

	if id == 7 then
		SPIDER_init()
		return true
	elseif id == 8 then
		SE_init()
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