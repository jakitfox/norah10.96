function onUse(player, item, fromPosition, target, toPosition, isHotkey)

function Statues01()
	item:transform(9241)
end

local config = {
	[3165] = {storage = Storage.Firewalker.Statue01, pos = {x=309, y=1218, z=11}},
	[3166] = {storage = Storage.Firewalker.Statue02, pos = {x=341, y=1218, z=11}},
	[3167] = {storage = Storage.Firewalker.Statue03, pos = {x=324, y=1248, z=12}},
	[3168] = {storage = Storage.Firewalker.Statue04, pos = {x=313, y=1234, z=13}},
	[3169] = {storage = Storage.Firewalker.Statue05, pos = {x=342, y=1234, z=13}}
}

local napis = {'Arrr','Grrr','Noobs','OMG','Why?'}
local monster = {'Demon','Shaburak Prince','Vampire Bride','Diabolic Imp',"Askarak Prince"}
local v = config[item.uid]

if v and item.itemid == 9241 and player:getStorageValue(v.storage) == -1  then
	target:say(napis[math.random(#napis)],(v.pos), TALKTYPE_MONSTER_SAY)
	player:setStorageValue(v.storage, 1)
	Game.createMonster(monster[math.random(#monster)],Position(v.pos.x+1,v.pos.y+1,v.pos.z))
	item:transform(9242)
	addEvent(Statues01, 30*1000) -- 30 sek
else
	player:sendTextMessage(MESSAGE_STATUS_SMALL, Game.getReturnMessage(RETURNVALUE_NOTPOSSIBLE))
end
return true
end