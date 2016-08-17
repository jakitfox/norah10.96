function onStepIn(player, item, pos)

local config = {
	[3011] = { monster = "Zugurosh", storage = Storage.Satan.Zugurosh, fromPos = Position(474,390,15), toPos = Position(491, 401, 15)},
	[3012] = { monster = "Ushuriel", storage = Storage.Satan.Ushuriel, fromPos = Position(511,486,15), toPos = Position(528, 494, 15)},
	[3013] = { monster = "Golgordan", storage = Storage.Satan.Golgordan, fromPos = Position(574,458,15), toPos = Position(587, 470, 15)},	
	[3014] = { monster = "Annihilon", storage = Storage.Satan.Annihilion, fromPos = Position(626,497,15), toPos = Position(639, 507, 15)},
	[3015] = { monster = "Madareth", storage = Storage.Satan.Madareth, fromPos = Position(636,394,15), toPos = Position(648, 403, 15)},
	[3016] = { monster = "Latrivan", storage = Storage.Satan.Latrivan, fromPos = Position(701,437,15), toPos = Position(714, 447, 15)},
	[3017] = { monster = "Hellgorak", storage = Storage.Satan.Hellgorak, fromPos = Position(751,499,15), toPos = Position(762, 507, 15)}
}
local v = config[item.uid]

if v and player:getStorageValue(v.storage) == 1 and player:isPlayer() == TRUE then
		Game.createMonster(v.monster, {x = math.random(v.fromPos.x, v.toPos.x), y = math.random(v.fromPos.y, v.toPos.y), z = math.random(v.fromPos.z, v.toPos.z)})
        player:setStorageValue(v.storage,2)
		player:say('You have absorbed some energy out of the throne!', TALKTYPE_MONSTER_SAY)
end
return true
end