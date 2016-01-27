local config = {
  [3160] = { pos = {x=374, y=1290, z=10}},
  [3161] = { pos = {x=346, y=1289, z=9}},
  [3162] = { pos = {x=325, y=1200, z=11}},
  [3163] = { pos = {x=306, y=1264, z=10}}
}

function onStepIn(player, item, pos)
local v = config[item.uid]
if v then
	player:teleportTo(v.pos)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
end
return true
end