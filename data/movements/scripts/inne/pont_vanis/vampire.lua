local config = {
	[3187] = {pos = {x=664, y=595, z=7}},
	[3188] = {pos = {x=697, y=593, z=7}},
	[3189] = {pos = {x=688, y=611, z=7}},
	[3190] = {pos = {x=657, y=607, z=7}},
	[3191] = {pos = {x=649, y=576, z=7}}
}

local monster = {"Vampire", "Bandit", "Smuggler", "Ghoul"}

function onStepIn(player, item, fromPosition, itemEx, toPosition)

local v = config[item.uid]

if isPlayer(cid) == TRUE then

if v and player:getLevel() >= 50 then
	if math.random(30) <= 1 then
		Game.createMonster(monster[math.random(#monster)],v.pos)
	end
end
end
return true
end