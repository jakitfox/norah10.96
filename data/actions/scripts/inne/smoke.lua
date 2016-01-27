function onUse(player, item, fromPosition, itemEx, toPosition)

local random = math.random(1, table.maxn(SOUNDS))
local SOUNDS = {"xD!", "Zchhhhhh!", "Grooaaaaar*cough*", "Aaa... CHOO!", "You... will.... burn!!"}

player:say( SOUNDS[random], TALKTYPE_MONSTER_SAY)
player:getPosition():sendMagicEffect(CONST_ME_POFF)
Item(item.uid):remove(1)
player:addHealth(10)
	
return true
end