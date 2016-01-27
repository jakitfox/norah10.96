function onUse(cid, item, frompos, itemEx, topos)
local entry_config = {
inst_id = 1,
basin_pos = {x = 649, y = 516, z = 9},
portal_pos = {x = 648, y = 515, z = 9},
portal_id = 1387,
portal_aid = 2700, -- reference on map
portal_time = 15 * 60 * 1000,
pay_value = {2129},
delay_gs = 2700, -- avoid stuck on /reload
}
if item.itemid == 1945 then
	if (dungeon_status[entry_config.inst_id] == nil or dungeon_status[entry_config.inst_id] == 0) then
		doTransformItem(item.uid, 1946)
		setGlobalStorageValue(entry_config.delay_gs, os.time() + 5)
		local r = getTileItemById(entry_config.basin_pos, entry_config.pay_value[1]).uid
		if r == 0 then
			Creature(cid):say('Something seems to be missing here.', TALKTYPE_MONSTER_SAY)
		return true
		end
		doRemoveItem(r)
		generateDungeon(entry_config.inst_id, os.time(), true)
		return true
	elseif dungeon_status[entry_config.inst_id] == 1 then
		Creature(cid):say('The device is already running.', TALKTYPE_MONSTER_SAY)
		return false
	elseif dungeon_status[entry_config.inst_id] == 2 then
		Creature(cid):say('Area under maintenance.', TALKTYPE_MONSTER_SAY)
		return false
	elseif dungeon_status[entry_config.inst_id] == 3 then
		Creature(cid):say('Portal activation is in progress, please wait.', TALKTYPE_MONSTER_SAY)
		return false
	else
		Creature(cid):say("The portal can't be maintained. Please come back later.", TALKTYPE_MONSTER_SAY)
		return false
	end
else
	if os.time() > getGlobalStorageValue(entry_config.delay_gs) then
		doTransformItem(item.uid, 1945)
		return true
	else
		Creature(cid):say('Unable to trigger the device.', TALKTYPE_MONSTER_SAY)
		return false
	end
end
end