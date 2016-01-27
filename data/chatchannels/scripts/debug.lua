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
local t = string.explode(message, " ", 3)
local debug_commands = {["!dhelp"] = 1, ["!dspawn"] = 2, ["!exit"] = 3, ["!status"] = 4, ["!reset"] = 5, ["!close"] = 6, ["!kick"] = 7}
	-- 7 - yellow
	-- 8 - orange
	-- 13 - red

	if canInteract(cid) then
		if debug_commands[t[1]] ~= nil then
			Creature(cid):sendChannelMessage("", message, TALKTYPE_CHANNEL_R1, 32)
			if debug_commands[t[1]] == 1 then
				if getPlayerAccountType(cid) > pits_event_config.main.output_mingroup_admin then
					doPlayerPopupFYI(cid,"Available commands:\n!dspawn - back to spawn\n!exit - leave dungeon\n!status - current dungeon status\n\nDebug commands:\n!reset id seed - closes cave and makes new one\n!close id - closes dungeon\n!kick name - kick player from dungeon\n\n*Your account type allows you to manage dungeons,\neven if you're using normal character.")
				else
					if getPlayerDungeon(cid) > 0 then
						doPlayerPopupFYI(cid,"Available commands:\n!dspawn - back to spawn\n!exit - leave dungeon\n!status - current dungeon status")
					else
						doPlayerPopupFYI(cid,"No commands available for this area.")
					end
				end
			return false
			elseif debug_commands[t[1]] == 2 then
				if getPlayerDungeon(cid) > 0 then
					if pits_spawns[getPlayerDungeon(cid)] ~= nil and (dungeon_status[getPlayerDungeon(cid)] == nil or dungeon_status[getPlayerDungeon(cid)] == 1) then
						Creature(cid):teleportTo(pits_spawns[getPlayerDungeon(cid)])
					else
						Creature(cid):sendChannelMessage("", "[Error]: Area unavailable. If you are stuck, you may use !exit.", TALKTYPE_CHANNEL_R1, 32)
					end
				else
					Creature(cid):sendChannelMessage("", "[Error]: You need to be in the dungeon to use this command.", TALKTYPE_CHANNEL_R1, 32)
				end
			return false
			elseif debug_commands[t[1]] == 3 then
				if getPlayerDungeon(cid) > 0 then
					if pits_event_config.main.output then sendChannelMessage(32, TALKTYPE_CHANNEL_O, "["..pits_event_config.caves[getPlayerDungeon(cid)].map_name.."]: ".. getPlayerName(cid) .. " has left the area.") end
					Creature(cid):teleportTo(pits_event_config.caves[getPlayerDungeon(cid)].map_exit)
				else
					Creature(cid):sendChannelMessage("", "[Error]: You need to be in the dungeon to use this command.", TALKTYPE_CHANNEL_R1, 32)
				end
			return false
			elseif debug_commands[t[1]] == 4 then
				if getPlayerDungeon(cid) > 0 then
					local dc_seed_string = g_d_world_seeds[getPlayerDungeon(cid)] or "Unknown"					
					local id = getPlayerDungeon(cid)
					
					if inst_time[id] == nil then
						dc_time_left_string = "Unknown"
					else
						local basenumber = inst_time[id] - os.time()
						local clocknum = os.date("!%X",basenumber):split(":")
						local hour = clocknum[1]
						local minute = clocknum[2]
						local second = clocknum[3]

						if basenumber < 0 then
							dc_time_left_string = "Expired"
						else
							dc_time_left_string = table.concat({tonumber(hour), minute, second}, ":")
						end
					end
					local inst_s_checknil = dungeon_status[getPlayerDungeon(cid)] or 0
					if pits_spawns[getPlayerDungeon(cid)] ~= nil then dc_spawn_string = pits_spawns[getPlayerDungeon(cid)].x ..", " .. pits_spawns[getPlayerDungeon(cid)].y .. ", " .. pits_spawns[getPlayerDungeon(cid)].z else dc_spawn_string = "Unknown" end
					doPlayerPopupFYI(cid,"Area: ".. pits_event_config.caves[getPlayerDungeon(cid)].map_name .."\nStatus: ".. inst_statename[inst_s_checknil] .. "\n\n--------\nPlayers inside: " .. checkDungeonPlayers(getPlayerDungeon(cid), cid) .."\nTime left: " .. dc_time_left_string .. "\n\n--------\nSeed: ".. dc_seed_string .."\nSpawn: ".. dc_spawn_string .. "\nSize: " .. pits_event_config.caves[getPlayerDungeon(cid)].map_size[1] .. " x " .. pits_event_config.caves[getPlayerDungeon(cid)].map_size[2] .. " x " .. pits_event_config.caves[getPlayerDungeon(cid)].map_size[3] .. "\n\n                                        - Dungeon Generator 1.0\n                                                                    - by Zbizu")
				else
					Creature(cid):sendChannelMessage("", "[Error]: You need to be in the dungeon to use this command.", TALKTYPE_CHANNEL_R1, 32)
				end
			return false
			elseif debug_commands[t[1]] == 5 then
				if getPlayerAccountType(cid) > pits_event_config.main.output_mingroup_admin then
				local inst_s_checknil = dungeon_status[tonumber(t[2])]
					if pits_event_config.caves[tonumber(t[2])] ~= nil then
						if inst_s_checknil == 3 then
							Creature(cid):sendChannelMessage("", "[Error]: Dungeon is in rendering state. If it isn't, please use '!close id' first", TALKTYPE_CHANNEL_R1, 32)
						else
							command_seed = os.time()
							if tonumber(t[3]) ~= nil then
								command_seed = tonumber(t[3])
							end
							resetDungeon(tonumber(t[2]), command_seed)
							sendChannelMessage(32, TALKTYPE_CHANNEL_R1, "["..pits_event_config.caves[tonumber(t[2])].map_name.."]: Manual dungeon reset executed. Next seed: ".. command_seed)
						end
					else
						Creature(cid):sendChannelMessage("", "[Error]: Dungeon not found. Usage: !reset id seed", TALKTYPE_CHANNEL_R1, 32)
					end
				else
					return true
				end
			return false
			elseif debug_commands[t[1]] == 6 then
				if getPlayerAccountType(cid) > pits_event_config.main.output_mingroup_admin then
					if pits_event_config.caves[tonumber(t[2])] ~= nil then
						closeDungeon(tonumber(t[2]), t[3])
						sendChannelMessage(32, TALKTYPE_CHANNEL_R1, "["..pits_event_config.caves[tonumber(t[2])].map_name.."]: Manual dungeon termination executed. We apologise for any inconvenience.")
					else
						Creature(cid):sendChannelMessage("", "[Error]: Dungeon not found. Usage: !close id newstate (0 - closed, 1 - open, 2 - maintenance, 3 - rendering)", TALKTYPE_CHANNEL_R1, 32)
					end
				else
					return true
				end
			return false
			elseif debug_commands[t[1]] == 7 then
				if getPlayerAccountType(cid) > pits_event_config.main.output_mingroup_admin then
				inst_d_pid = t[2]
					if(t[3] ~= nil) then
						for j = 3, #t do
							inst_d_pid = inst_d_pid .. " " .. t[j]
						end
					end
					local pid = getPlayerByName(inst_d_pid)
					if pid then
						if getPlayerDungeon(pid) > 0 then
							doTeleportThing(pid, pits_event_config.caves[getPlayerDungeon(pid)].map_exit)
							Creature(cid):sendChannelMessage("", "[Channel]: ".. inst_d_pid .." has been kicked.", TALKTYPE_CHANNEL_R1, 32)
							doPlayerSendTextMessage(pid, MESSAGE_STATUS_WARNING, "You have been kicked from the event area.")
						else
							Creature(cid):sendChannelMessage("", "[Error]: This player is outside event area.", TALKTYPE_CHANNEL_R1, 32)
						end
					else
						Creature(cid):sendChannelMessage("", "[Error]: Target not found.", TALKTYPE_CHANNEL_R1, 32)
					end
				else
					return true
				end
			return false
			end
		end
		if getPlayerAccountType(cid) > pits_event_config.main.output_mingroup_admin then
			if getPlayerGroupId(cid) > 2 then
				local groupnames = {[3] = "Mod", [4] = "Admin"}
				sendChannelMessage(32, TALKTYPE_CHANNEL_R1, getCreatureName(cid) .. " [" .. (groupnames[getPlayerGroupId(cid)] or "GM") .. "]: ".. message)
				return false
			end
		end
		return true
	end
	Creature(cid):sendChannelMessage("", "[Error]: Chatting enabled only for participants.", TALKTYPE_CHANNEL_R1, 32)
	return false
end