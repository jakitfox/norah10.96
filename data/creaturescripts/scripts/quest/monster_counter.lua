local monsters = {
	["hades"] = 3180,
	["hegard"] = 3181,
	["dipthrah"] = 3182,
	["thalas"] = 3183,
	["hydra"] = 3184,
	["wyrm"] = 3184,	
	["lich"] = 3184,
	["syzam"] = 3187,
	["koshei the deathless"] = 3188,
	["yodense"] = 3189,
	["ucker"] = 3190,
	["hatebreeder"] = 3191,
	["deathstrike"] = 3192,
	["gnomevil"] = 3193,
	["versperoth"] = 3194,
	["abyssador"] = 3195,
	["gaz'haragoth"] = 3196
}

function onKill(cid, target, lastHit)
	local name = getCreatureName(target)
	local monster = monsters[string.lower(name)]

-----------------------------------------Special--------------------
	if name == "Ucker" and getPlayerStorageValue(cid,Storage.Yala.Questline) == 5 then
		if(isPlayer(target) == FALSE and monster) then	
                if getPlayerStorageValue(cid, Storage.Yala.Mission03) == 1 then 
                	setPlayerStorageValue(cid, Storage.Yala.Questline, 6)
					setPlayerStorageValue(cid, Storage.Yala.Mission03, 2)
                	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You\'ve killed Ucker, now go back to Omer")
			end
		end
		
		
	elseif name == "Hatebreeder" then
		if(isPlayer(target) == FALSE and monster) then	
  			if getPlayerStorageValue(cid, 3148) == -1 then 
                	setPlayerStorageValue(cid, 3148, 1)
					setPlayerStorageValue(cid, 3146, 1)
					setPlayerStorageValue(cid, 3135, 5)
                	doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have killed Yodense.")
			end
		end
		
	elseif name == "Yodense" then
		if(isPlayer(target) == FALSE and monster) then	
  			if getPlayerStorageValue(cid, Storage.Firewalker.Questline) == -1 then 
                	setPlayerStorageValue(cid, Storage.Firewalker.Questline, 1)
                	doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have killed Yodense.")
			end
		end
---------------------------Gravedigger------------------------		
	elseif name == "Hades" then
		if(isPlayer(target) == FALSE and monster) then	
			hades = {x=428, y=546, z=11, stackpos=1}
			gethades = getThingfromPos(hades)
			doRemoveItem(gethades.uid,1)
		end	
		
	elseif name == "Hegard" and getPlayerStorageValue(cid,Storage.Grave.Mission05) == 2 then
		if(isPlayer(target) == FALSE and monster) then	
  			if getPlayerStorageValue(cid, Storage.Grave.Pharaoh01Boss) == 2 then 
                	setPlayerStorageValue(cid, Storage.Grave.Mission05, 3)
                	setPlayerStorageValue(cid, Storage.Grave.Pharaoh03, -1)
					setPlayerStorageValue(cid, Storage.Grave.Pharaoh01Boss, 3)
                	doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have killed Hegard. Unfortunately Mour\'s husbend is dead.")
			end
		end
	elseif name == "Dipthrah" and getPlayerStorageValue(cid,Storage.Grave.Mission02) == 1 then
		if(isPlayer(target) == FALSE and monster) then	
                if getPlayerStorageValue(cid, Storage.Grave.Pharaoh01Boss) == -1 then 
				setPlayerStorageValue(cid, Storage.Grave.Mission02, 2)
				setPlayerStorageValue(cid, Storage.Grave.Pharaoh01, -1)
				setPlayerStorageValue(cid, Storage.Grave.Pharaoh01Boss, 1)     
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have killed Pharaoh, now back to city.")
                end
		end
	elseif name == "Thalas" and getPlayerStorageValue(cid,Storage.Grave.Mission03) == 1 then
		if(isPlayer(target) == FALSE and monster) then	
                if getPlayerStorageValue(cid, Storage.Grave.Pharaoh01Boss) == 1 then 
				setPlayerStorageValue(cid, Storage.Grave.Mission03, 2)
				setPlayerStorageValue(cid, Storage.Grave.Pharaoh02, -1)
				setPlayerStorageValue(cid, Storage.Grave.Pharaoh01Boss, 2)
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have killed second Pharaoh, now back to city.")
			end
		end
	elseif name == "Syzam" and getPlayerStorageValue(cid,Storage.Grave.Mission06) == 2 then
		if(isPlayer(target) == FALSE and monster) then	
                if getPlayerStorageValue(cid, Storage.Grave.PlagueBoss) == 1 then 
                	setPlayerStorageValue(cid, Storage.Grave.Mission06, 3)
					setPlayerStorageValue(cid, Storage.Grave.PlagueBoss, 2)
                	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You have killed Syzam.")
			end
		end
				
	elseif (name == "Hydra" or name == "Wyrm" or name == "Lich") and getPlayerStorageValue(cid,Storage.Grave.Monument) == 1 then
		if(isPlayer(target) == FALSE and monster) then	
			if getPlayerStorageValue(cid, monster) < 100 then 
				local killedMonsters = getPlayerStorageValue(cid, monster)
				if(killedMonsters == -1) then
					killedMonsters = 1
				end
				setPlayerStorageValue(cid, monster, killedMonsters + 1)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You have killed " .. killedMonsters .. " of 100 monsters.")
			else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You have killed enough monsters.")
				setPlayerStorageValue(cid, Storage.Grave.Mission01, 2)
			end
		end
-----------------------------------------------------------------------------------------------		
	elseif name == "Koshei The Deathless" then
		if(isPlayer(target) == FALSE and monster) then
			if getPlayerStorageValue(cid, Storage.Blue.Questline) == -1 then 
				setPlayerStorageValue(cid, Storage.Blue.Questline, 1)
               	doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have killed Koshei The Deathless.")
		end
	end
	---------------Special-------------------
	
	---------------Warzone-------------------
	elseif name == "Deathstrike" then
		if(isPlayer(target) == FALSE and monster) then	
                if getGlobalStorageValue(17150) == -1 then 
                	setGlobalStorageValue(17150, 1)
			end
		end
	
	elseif name == "Gnomevil" then
		if(isPlayer(target) == FALSE and monster) then	
                if getGlobalStorageValue(17151) == -1 then 
                	setGlobalStorageValue(17151, 1)
			end
		end
		
	elseif name == "Versperoth" then
		if(isPlayer(target) == FALSE and monster) then	
                if getGlobalStorageValue(17152) == -1 then 
                	setGlobalStorageValue(17152, 1)
			end
		end
		
	elseif name == "Abyssador" then
		if(isPlayer(target) == FALSE and monster) then	
                if getGlobalStorageValue(17180) == -1 then 
                	setGlobalStorageValue(17180, 1)
			end
		end
				
	elseif name == "Gaz'haragoth" then
		if(isPlayer(target) == FALSE and monster) then	
                if getGlobalStorageValue(Storage.Ruiny.Gazh) == -1 then 
                	setGlobalStorageValue(Storage.Ruiny.Gazh,1)
			end
		end	
end
return true
end