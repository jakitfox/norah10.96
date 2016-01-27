function onStepIn(player, cid, item, pos)

local tablica = {Storage.Satan.Zugurosh, Storage.Satan.Ushuriel, Storage.Satan.Golgordan, Storage.Satan.Annihilion, Storage.Satan.Madareth, Storage.Satan.Latrivan, Storage.Satan.Hellgorak, Storage.Satan.Mission02}
	
if player:getStorageValue(Storage.Satan.Mission02) == -1 then
	for i = 1, #tablica do
		player:setStorageValue(tablica[i], 1)
	end
end
return true
end