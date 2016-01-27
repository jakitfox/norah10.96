function onStepIn(cid, item, pos)

function HadesWall()
	Game.createItem(3362,1,Position(428,546,11))
	setGlobalStorageValue(Storage.Grave.HadesWall, -1)
end

if getGlobalStorageValue(Storage.Grave.HadesWall) == -1 then
	setGlobalStorageValue(Storage.Grave.HadesWall, 1)
	addEvent(HadesWall, 3*60*1000) --3 minutes
end
return true
end