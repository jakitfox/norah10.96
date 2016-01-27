function onStepIn(player, item, pos)

local config = {
	[3011] = { monster = "Zugurosh", storage = Storage.Satan.Zugurosh, pos = {x=483, y=394, z=15}},
	[3012] = { monster = "Ushuriel", storage = Storage.Satan.Ushuriel, pos = {x=520, y=491, z=15}},
	[3013] = { monster = "Golgordan", storage = Storage.Satan.Golgordan, pos = {x=580, y=463, z=15}},	
	[3014] = { monster = "Annihilon", storage = Storage.Satan.Annihilion, pos = {x=632, y=501, z=15}},
	[3015] = { monster = "Madareth", storage = Storage.Satan.Madareth, pos = {x=642, y=398, z=15}},
	[3016] = { monster = "Latrivan", storage = Storage.Satan.Latrivan, pos = {x=708, y=438, z=15}},
	[3017] = { monster = "Hellgorak", storage = Storage.Satan.Hellgorak, pos = {x=759, y=501, z=15}}
}
local v = config[item.uid]

if v and player:getStorageValue(v.storage) == 1 and isPlayer(cid) == TRUE then
		Game.createMonster(v.monster, v.pos)
        player:setStorageValue(v.storage,2)
		player:say('You have absorbed some energy out of the throne!', TALKTYPE_MONSTER_SAY)
end
return true
end