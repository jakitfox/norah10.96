function onSay(cid, words, param)

	events_list_command = ""
	if #active_events > 0 then
		events_list_command = events_list_command .. "Active events:\n"
		for i = 1, #active_events do
			events_list_command = events_list_command .. "- " .. events_calendar_list[active_events[i]] .. "\n"
		end
		events_list_command = events_list_command .. "\n"
	end
	
	events_list_command = events_list_command .. "Events:\n"
	for i = 1, 24 do
		local c_ev = events_calendar[tonumber(os.date("%w"))][i]
		if c_ev ~= nil then
			events_list_command = events_list_command .. "[" .. i .. ":00] - "
			local t_ev = {}
			for j = 1, #c_ev do
				table.insert(t_ev, events_calendar_list[c_ev[j][1]])
			end
			events_list_command = events_list_command .. table.concat(t_ev, ", ") .. "\n"
		end
	end


	events_list_command = events_list_command .. "\nServer time: " .. os.date("%X") .. "\n"
	doPlayerPopupFYI(cid, events_list_command)
	return false
end
