function onUse(player, item, fromPosition, itemEx, toPosition)

local rand = math.random(0, 2)

 if item.itemid == 2177 and rand < 1 then
	  player:say("You have a life ring.", TALKTYPE_MONSTER_SAY)
	  player:addItem(2168,1)
	  Item(item.uid):remove(1)
    else
      player:say("Broken.", TALKTYPE_MONSTER_SAY)
	  Item(item.uid):remove(1)
	end
return true
end