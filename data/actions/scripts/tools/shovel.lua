local holes = {468, 481, 483}
function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if toPosition.x == CONTAINER_POSITION then
		return false
	end

	local tile = Tile(toPosition)
	if not tile then
		return false
	end

	local ground = tile:getGround()
	if not ground then
		return false
	end


	local targetId, targetActionId = target.itemid, target.actionid
	if isInArray(holes, targetId) then
		target:transform(targetId + 1)
		target:decay()

	elseif isInArray({231, 9059}, targetId) then
		local rand = math.random(100)
		if target.actionid == 100 and rand <= 20 then
			target:transform(489)
			target:decay()
		elseif rand == 1 then
			Game.createItem(2159, 1, toPosition)
		elseif rand > 95 then
			Game.createMonster("Scarab", toPosition)
		end
		toPosition:sendMagicEffect(CONST_ME_POFF)

	elseif isInArray({9632, 20230, 20267}, targetId) then
		if player:getStorageValue(Storage.SwampDiggingTimeout) >= os.time() then
			return false
		end

		local config = { {from = 1, to = 39, itemId = 2817}, {from = 40, to = 79, itemId = 2145}, {from = 80, to = 100, itemId = 20138} }
		local chance = math.random(100)

		for i = 1, #config do
			local randItem = config[i]
			if chance >= randItem.from and chance <= randItem.to then
				player:addItem(randItem.itemId, 1)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You dug up a ' .. ItemType(randItem.itemId):getName() .. '.')
				player:setStorageValue(Storage.SwampDiggingTimeout, os.time() + 604800)
				toPosition:sendMagicEffect(CONST_ME_GREEN_RINGS)
				break
			end
		end
	end
	return true
end