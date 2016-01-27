function onUse(cid, item, fromPosition, itemEx, toPosition)

local outfits = {"Rat", "Green Frog", "Chicken", "Pig", "Parrot", "Crab", "Skunk", "Squirrel"}

	if math.random(20) <= 1 then
		Game.createMonster("Mad Sheep",Position(toPosition))
		Item(item.uid):remove(1)
	end
	if isPlayer(itemEx.uid) == TRUE then
		doSetMonsterOutfit(itemEx.uid,outfits[math.random(#outfits)],45*1000)
		Creature(cid):getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		else
		Player(cid):sendCancelMessage("Sorry not possible.")
	end
return true
end