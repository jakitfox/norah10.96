table.find = function (table, value)
for i, v in pairs(table) do
if(v == value) then
return i
end
end

return nil
end


active_events = {}
	
	function spairs(t, order)
    local keys = {}
    for k in pairs(t) do keys[#keys+1] = k end

    if order then
        table.sort(keys, function(a,b) return order(t, a, b) end)
    else
        table.sort(keys)
    end

    local i = 0
		return function()
			i = i + 1
			if keys[i] then
				return keys[i], t[keys[i]]
			end
		end
	end

function Player.withdrawMoney(self, amount)
	local balance = self:getBankBalance()
	if amount > balance or not self:addMoney(amount) then
		return false
	end

	self:setBankBalance(balance - amount)
	return true
end

function Player.depositMoney(self, amount)
	if not self:removeMoney(amount) then
		return false
	end

	self:setBankBalance(self:getBankBalance() + amount)
	return true
end

function Player.transferMoneyTo(self, target, amount)
	local balance = self:getBankBalance()
	if amount > balance then
		return false
	end

	local targetPlayer = Player(target)
	if targetPlayer then
		targetPlayer:setBankBalance(targetPlayer:getBankBalance() + amount)
	else
		if not playerExists(target) then
			return false
		end
		db.query("UPDATE `players` SET `balance` = `balance` + '" .. amount .. "' WHERE `name` = " .. db.escapeString(target))
	end

	self:setBankBalance(self:getBankBalance() - amount)
	return true
end

function playerExists(name)
	local resultId = db.storeQuery('SELECT `name` FROM `players` WHERE `name` = ' .. db.escapeString(name))
	if resultId then
		result.free(resultId)
		return true
	end
	return false
end

function isNumber(str)
	return tonumber(str) ~= nil
end

function isValidMoney(money)
	return isNumber(money) and money > 0 and money < 4294967296
end

function getMoneyCount(string)
	local b, e = string:find("%d+")
	local money = b and e and tonumber(string:sub(b, e)) or -1
	if isValidMoney(money) then
		return money
	end
	return -1
end

function getMoneyWeight(money)
	local gold = money
	local crystal = math.floor(gold / 10000)
	gold = gold - crystal * 10000
	local platinum = math.floor(gold / 100)
	gold = gold - platinum * 100
	return (ItemType(2160):getWeight() * crystal) + (ItemType(2152):getWeight() * platinum) + (ItemType(2148):getWeight() * gold)
end

function getRealTime()
	local hours = tonumber(os.date("%H", os.time()))
	local minutes = tonumber(os.date("%M", os.time()))

	if hours < 10 then
		hours = '0' .. hours
	end
	if minutes < 10 then
		minutes = '0' .. minutes
	end
	return hours .. ':' .. minutes
end

function getRealDate()
	local month = tonumber(os.date("%m", os.time()))
	local day = tonumber(os.date("%d", os.time()))

	if month < 10 then
		month = '0' .. month
	end
	if day < 10 then
		day = '0' .. day
	end
	return day .. '/' .. month
end

function getAccountNumberByPlayerName(name)
	local player = Player(name)
	if player ~= nil then
		return player:getAccountId()
	end

	local resultId = db.storeQuery("SELECT `account_id` FROM `players` WHERE `name` = " .. db.escapeString(name))
	if resultId ~= false then
		local accountId = result.getDataInt(resultId, "account_id")
		result.free(resultId)
		return accountId
	end
	return 0
end

function doCopyItem(item, attributes)
   local attributes = attributes or false

   local ret = doCreateItemEx(item.itemid, item.type)
   if(attributes) then
     if(item.actionid > 0) then
       doSetItemActionId(ret, item.actionid)
     end
   end

   if(isContainer(item.uid) == TRUE) then
     for i = (getContainerSize(item.uid) - 1), 0, -1 do
       local tmp = getContainerItem(item.uid, i)
       if(tmp.itemid > 0) then
         doAddContainerItemEx(ret, doCopyItem(tmp, true).uid)
       end
     end
   end

   return getThing(ret)
end

function doRemoveTaskMonster(fromPos, toPos)
    for _x = fromPos.x, toPos.x do
        for _y = fromPos.y, toPos.y do
            for _z = fromPos.z, toPos.z do
                creature = getTopCreature({x = _x, y = _y, z = _z})
                if (isMonster(creature.uid)) then
                    doRemoveCreature(creature.uid)
                end
            end
        end
    end
    return false
end

function isPlayerInArea(fromPos, toPos)
	for _x = fromPos.x, toPos.x do
		for _y = fromPos.y, toPos.y do
			for _z = fromPos.z, toPos.z do
				creature = getTopCreature({x = _x, y = _y, z = _z})
				if (creature.type == THING_TYPE_PLAYER) then
					return true
				end
			end
		end
	end
	return false
end

function isMonsterInArea(fromPos, toPos, showMonsters, disableSummons)
	for _x = fromPos.x, toPos.x do
		for _y = fromPos.y, toPos.y do
			for _z = fromPos.z, toPos.z do
				creature = getTopCreature({x = _x, y = _y, z = _z})
				if (creature.type == 2 and showMonsters and (not disableSummons or (disableSummons and getCreatureMaster(creature.uid) == (creature.uid)))) then
					return true
				end
			end
		end
	end
	return false
end


function doRemoveMonsterFromArea(fromPos, toPos)
    for _x = fromPos.x, toPos.x do
        for _y = fromPos.y, toPos.y do
            for _z = fromPos.z, toPos.z do
                creature = getTopCreature({x = _x, y = _y, z = _z})
                if (isMonster(creature.uid)) then
                    doRemoveCreature(creature.uid)
                end
            end
        end
    end
    return false
end

function isMonsterInRange(monsterName, fromPos, toPos)
	for _x = fromPos.x, toPos.x do
		for _y = fromPos.y, toPos.y do
			for _z = fromPos.z, toPos.z do
				creature = getTopCreature({x = _x, y = _y, z = _z})
				if creature.type == THING_TYPE_MONSTER and getCreatureName(creature.uid):lower() == monsterName:lower() then
					return true
				end
			end
		end
	end
	return false
end

function getCreaturesInRange(position, radiusx, radiusy, showMonsters, showPlayers, showSummons)
	local creaturesList = {}
	for x = -radiusx, radiusx do
		for y = -radiusy, radiusy do
			if not (x == 0 and y == 0) then
				local creature = getTopCreature({x = position.x + x, y = position.y + y, z = position.z})
				if (creature.type == 1 and showPlayers) or (creature.type == 2 and showMonsters and (not showSummons or (showSummons and getCreatureMaster(creature.uid) == (creature.uid)))) then
					table.insert(creaturesList, creature.uid)
				end
			end
		end
	end

	local creature = getTopCreature(position)
	if (creature.type == 1 and showPlayers) or (creature.type == 2 and showMonsters and not (showSummons or (showSummons and getCreatureMaster(creature.uid) == (creature.uid)))) then
		if not(table.find(creaturesList, creature.uid)) then
			table.insert(creaturesList, creature.uid)
		end
	end
	return creaturesList
end

function isInRange(pos, fromPos, toPos)
	return pos.x >= fromPos.x and pos.y >= fromPos.y and pos.z >= fromPos.z and pos.x <= toPos.x and pos.y <= toPos.y and pos.z <= toPos.z
end

string.explode = function (str, sep, limit)
	if(type(sep) ~= 'string' or isInArray({tostring(str):len(), sep:len()}, 0)) then
		return {}
	end

	local i, pos, tmp, t = 0, 1, "", {}
	for s, e in function() return string.find(str, sep, pos) end do
		tmp = str:sub(pos, s - 1):trim()
		table.insert(t, tmp)
		pos = e + 1

		i = i + 1
		if(limit ~= nil and i == limit) then
			break
		end
	end

	tmp = str:sub(pos):trim()
	table.insert(t, tmp)
	return t
end

function getCreatureStorage(cid, key)
	return getPlayerStorageValue(cid, key)
end
function doCreatureSetStorage(cid, key, value)
	return setPlayerStorageValue(cid, key, value)
end
function getStorage(key)
	return getGlobalStorageValue(key)
end
function doSetStorage(key, value)
	return setGlobalStorageValue(key, value)
end

function doCreatureSayWithRadius(cid, text, type, radiusx, radiusy, position)
	if not position then
		position = Creature(cid):getPosition()
	end

	local spectators, spectator = Game.getSpectators(position, false, true, radiusx, radiusx, radiusy, radiusy)
	for i = 1, #spectators do
		spectator = spectators[i]
		spectator:say(text, type, false, spectator, position)
	end
end

function getBlessingsCost(level)
	if level <= 30 then
		return 2000
	elseif level >= 120 then
		return 20000
	else
		return (level - 20) * 200
	end
end

function getPvpBlessingCost(level)
	if level <= 30 then
		return 2000
	elseif level >= 270 then
		return 50000
	else
		return (level - 20) * 200
	end
end

function Creature.getMonster(self)
	return self:isMonster() and self or nil
end

