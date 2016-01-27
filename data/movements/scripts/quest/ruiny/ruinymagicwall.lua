function onStepIn(player, item, position, fromPosition, lastPosition)

local text = {'It\'s not possible to pass this barrier' , 'We need to go around somehow' , 'We can\'t go through this barrier'}

if item.actionid == 3139 then	
	player:teleportTo(fromPosition)
    player:say(text[math.random(#text)], TALKTYPE_MONSTER_SAY)			
end
return true
end