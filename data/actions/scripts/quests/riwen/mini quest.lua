function onUse(player, item, frompos, topos)

local config = {
	[3120] = {str = Storage.RiwenTown.Lever01, item = 9844, item1 = 9845},
	[3121] = {str = Storage.RiwenTown.Lever02, item = 9844, item1 = 9845},
    [3122] = {str = Storage.RiwenTown.Lever03, item = 9844, item1 = 9845},
	[3123] = {str = Storage.RiwenTown.Lever04, item = 9842, item1 = 9843},
	[3124] = {str = Storage.RiwenTown.Lever05, item = 9844, item1 = 9845},
	[3125] = {str = Storage.RiwenTown.Lever06, item = 9842, item1 = 9843}			
	}	

local v = config[item.uid]

local function Energy()
	item:transform(v.item)
end	

local text = {'Wooo it need to be here for some reason.Maby I\'ll find more of those switches in this city', 'I need to turn on all of those switches'}

if v and item.itemid == v.item and player:getStorageValue(v.str) == -1 then
	item:transform(v.item1)
	player:setStorageValue(v.str,1)
	player:say(text[math.random(#text)], TALKTYPE_MONSTER_SAY)
	addEvent(Energy, 5*1000)
end
return true
end