FIRSTITEMS = {
			[1] = {	[2175] = {amount = 1, slot = 6}, -- r. hand
					[2190] = {amount = 1, slot = 5}, -- l. hand
					[8820] = {amount = 1, slot = 1}, --head,
					[8819] = {amount = 1, slot = 4}, --body
					[2643] =  {amount = 1, slot = 8}, --boots
					[2000] = {amount = 1, slot = 3, -- bp
												inside = {
															[7618] = {amount = 10},
															[7620]= {amount = 10},
															[2554]= {amount = 1},
															[2120]= {amount = 1} 
														}
										} 
					},
			[2] = {	[2175] = {amount = 1, slot = 6}, -- r. hand
					[2182] = {amount = 1, slot = 5}, -- l. hand
					[8820] = {amount = 1, slot = 1}, --head,
					[8819] = {amount = 1, slot = 4}, --body
					[2643] =  {amount = 1, slot = 8}, --boots
					[2000] = {amount = 1, slot = 3, -- bp
												inside = {
															[7618] = {amount = 10},
															[7620]= {amount = 10},
															[2554]= {amount = 1},
															[2120]= {amount = 1} 
														}
										} 
					},
			[3] = {	[2660] = {amount = 1, slot = 4}, --body
					[2456] = {amount = 1, slot = 5}, --l. hand
					[8923] =  {amount = 1, slot = 7}, --legs
					[2643] =  {amount = 1, slot = 8}, --boots
					[2544] = {amount = 10, slot = 100}, -- ammo
					[2000] = {amount = 1, slot = 3, -- bp
												inside = {
															[7618] = {amount = 10},
															[7620]= {amount = 10},
															[2389]= {amount = 1},
															[2554]= {amount = 1},
															[2120]= {amount = 1} 
														}
										} 
					},
			[4] = {	[2509] = {amount = 1, slot = 6}, -- r. hand
					[2481] = {amount = 1, slot = 1}, --head
					[8602] = {amount = 1, slot = 7}, --l. hand
					[2478] = {amount = 1, slot = 7}, --legs
					[2465] = {amount = 1, slot = 4}, --body
					[2643] =  {amount = 1, slot = 8}, --boots
					[2000] = {amount = 1, slot = 3, -- bp
												inside = {
															[7618] = {amount = 10},
															[7620]= {amount = 10},
															[8601]= {amount = 1},
															[2439]= {amount = 1},
															[2554]= {amount = 1},
															[2120]= {amount = 1},
															[8602] = {amount = 1}
														}
										} 
					}
			}

function onLogin(cid)
	if getPlayerStorageValue(cid, 127655) == 1 then return true end
		local tab = FIRSTITEMS[getPlayerVocation(cid)]
	if getPlayerVocation(cid) <= 8 and getPlayerVocation(cid) >= 5 then
		a=getPlayerVocation(cid)-4
		local tab = FIRSTITEMS[a]
	end
	if not tab then
		return true
	end
	for k, v in pairs(tab) do
		if v.slot == 6 or v.slot == 5 then
			doPlayerAddItem(cid, k, v.amount)
		end
	end
	for k, v in pairs(tab) do
		if v.slot ~= 6 and v.slot ~= 5 and v.slot ~= 3 then
			doPlayerAddItem(cid, k, v.ammount, false, v.slot)
		end
	end
	for k, v in pairs(tab) do
		if v.slot == 3 then
			doPlayerAddItem(cid, k, v.ammount)
			for id, amm in pairs(v.inside) do
				doAddContainerItem(getPlayerSlotItem(cid, v.slot).uid, id, amm.amount)
			end
		end
	end
	setPlayerStorageValue(cid, 127655, 1)
	return true
end