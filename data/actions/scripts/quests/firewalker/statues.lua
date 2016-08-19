function onUse(player, item, fromPosition, target, toPosition, isHotkey)

local config = {
	[3165] = {storage = Storage.Firewalker.Statue01, pos = Position(309,1218,11)},
	[3166] = {storage = Storage.Firewalker.Statue02, pos = Position(341,1218,11)},
	[3167] = {storage = Storage.Firewalker.Statue03, pos = Position(324,1248,12)},
	[3168] = {storage = Storage.Firewalker.Statue04, pos = Position(342,1234,13)},
	[3169] = {storage = Storage.Firewalker.Statue05, pos = Position(313,1234,13)}
}

local napis = {'Arrr','Grrr','Noobs','OMG','Why?'}
local monster = {'Demon','Shaburak Prince','Vampire Bride','Diabolic Imp',"Askarak Prince"}
local v = config[item.uid]

function Statues01()
	Tile(v.pos):getItemById(9242):transform(9241)
end

if v and item.itemid == 9241 and player:getStorageValue(v.storage) == -1  then
	player:say(napis[math.random(#napis)], TALKTYPE_MONSTER_SAY, false, 0, v.pos)
	player:setStorageValue(v.storage, 1)
	Game.createMonster(monster[math.random(#monster)],Position(v.pos.x+1,v.pos.y+1,v.pos.z))
	Tile(v.pos):getItemById(9241):transform(9242)
	addEvent(Statues01, 15*1000) -- 15 sek
else
	player:sendTextMessage(MESSAGE_STATUS_SMALL, Game.getReturnMessage(RETURNVALUE_NOTPOSSIBLE))
end
return true
end