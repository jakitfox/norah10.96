	PTR = {
		from = {x = 371, y = 892, z = 7},
		to = {x = 403, y = 902, z = 7},
		water_from = {x = 381, y = 894, z = 7},
		water_to = {x = 395, y = 901, z = 7},
		spawn = {x = 375, y = 898, z = 7}, -- poczatek
		kick = {x = 666, y = 576, z = 8}, -- wyjscie
		shot_eff = CONST_ANI_ENERGYBALL,
		area_eff = CONST_ME_WATERSPLASH,
		eff_interval = 200, -- odstep miedzy falami
		eff_sync = 150, -- odstep miedzy efektem strzalu a efektem na kratce
		tile_chance = 6, -- procent ze walnie w dana kratke
		event_time = 15 * 60 * 1000, -- ile trwa event
	}
	
	--[[
	
	function isPathable(pos) -- 0.3.7/0.4
		local pos.stackpos = 0
		local tile = getThingfromPos(pos).uid
		if tile > 0 then
			return not hasProperty(tile, CONST_PROP_BLOCKSOLID))
		end
		return false
	end
	
	-- reward chest
	function onUse(cid, item, ...)
		doPlayerAddItem(cid, reward.itemid, count)
		-- jakis msg albo cos
		SE_stop(getPlayerName(cid), count .. "x " .. getItemName(reward.itemid))
		return true
	end
	]]--
	
	function isSwimEventPlayer(cid)
	if PTR == nil then
		return false
	end

	if getPlayerStorageValue(cid, Storage.SwimEvent) == 1 then
		local p = Player(cid)
		if isInRange(p:getPosition(), PTR.from, PTR.to) then
			return true
		end

		setPlayerStorageValue(cid, Storage.SwimEvent, -1)
		return false
	end
	return false
	end
	
	function SE_stop(winner_name, reward)
		table.remove(active_events, table.find(active_events,3))
		for x = PTR.from.x, PTR.to.x do
		for y = PTR.from.y, PTR.to.y do
		for z = PTR.from.z, PTR.to.z do
		for i = 1, 10 do
			local cpos = {x = x, y = y, z = z}
			local cid = getTopCreature(cpos).uid
			if cid > 0 then
				doTeleportThing(cid, PTR.kick)
				if winner_name ~= nil then
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, winner_name .. " has reached the chest. The event is over.")
					Player(cid):changeSpeed(Player(cid):getBaseSpeed() - Player(cid):getSpeed())
				else
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Game over.")
					Player(cid):changeSpeed(Player(cid):getBaseSpeed() - Player(cid):getSpeed())
				end
			end
		end
		end
		end
		end
			
		if winner_name ~= nil then
			sendChannelMessage(events_calendar.channel_id, TALKTYPE_CHANNEL_O, "[PTR]: Event ended. " .. winner_name .. " won " .. getItemName(reward) .. ".")
		else
			sendChannelMessage(events_calendar.channel_id, TALKTYPE_CHANNEL_O, "[PTR]: Event ended. No winner this time.")
		end
		
		return true
	end

	function SE_drop(pos)
		doSendMagicEffect(pos, PTR.area_eff)
		local pid = getTopCreature(pos).uid
		if pid > 0 then
			doTeleportThing(pid, PTR.spawn)
			doPlayerSendTextMessage(pid, MESSAGE_INFO_DESCR, "Try again.")
		end
		return true
	end
	
	function SE_wave()
		if isInArray(active_events,3) then
			for x = PTR.water_from.x, PTR.water_to.x do
			for y = PTR.water_from.y, PTR.water_to.y do
			for z = PTR.water_from.z, PTR.water_to.z do
				local cpos = {x = x, y = y, z = z}
				if isPathable(cpos) then
					if math.random(1, 100) <= PTR.tile_chance then
						doSendDistanceShoot({x = cpos.x - 3, y = cpos.y - 3, z = cpos.z}, cpos, PTR.shot_eff)
						addEvent(SE_drop, PTR.eff_sync, cpos)
					end
				end
			end
			end
			end
			addEvent(SE_wave, PTR.eff_interval)
		end
		return true
	end
	
	function SE_init()
		table.insert(active_events,3)
		
		sendChannelMessage(events_calendar.channel_id, TALKTYPE_CHANNEL_O, "[PTR]: Event started.")
		SE_wave()
		addEvent(SE_stop, PTR.event_time)
		return true
	end