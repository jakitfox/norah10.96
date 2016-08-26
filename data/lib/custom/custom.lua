SPELL_BOOK = 2175

function getDistanceBetween(firstPosition, secondPosition)
	local xDif = math.abs(firstPosition.x - secondPosition.x)
	local yDif = math.abs(firstPosition.y - secondPosition.y)
	local posDif = math.max(xDif, yDif)
	if firstPosition.z ~= secondPosition.z then
		posDif = posDif + 15
	end
	return posDif
end

function getFormattedWorldTime()
	local worldTime = getWorldTime()
	local hours = math.floor(worldTime / 60)

	local minutes = worldTime % 60
	if minutes < 10 then
		minutes = '0' .. minutes
	end
	return hours .. ':' .. minutes
end

function getItemAttribute(uid, key)
	local i = ItemType(Item(uid):getId())
	local string_attributes = {
		[ITEM_ATTRIBUTE_NAME] = i:getName(),
		[ITEM_ATTRIBUTE_ARTICLE] = i:getArticle(),
		[ITEM_ATTRIBUTE_PLURALNAME] = i:getPluralName(),
		["name"] = i:getName(),
		["article"] = i:getArticle(),
		["pluralname"] = i:getPluralName()
	}

	local numeric_attributes = {
		[ITEM_ATTRIBUTE_WEIGHT] = i:getWeight(),
		[ITEM_ATTRIBUTE_ATTACK] = i:getAttack(),
		[ITEM_ATTRIBUTE_DEFENSE] = i:getDefense(),
		[ITEM_ATTRIBUTE_EXTRADEFENSE] = i:getExtraDefense(),
		[ITEM_ATTRIBUTE_ARMOR] = i:getArmor(),
		[ITEM_ATTRIBUTE_HITCHANCE] = i:getHitChance(),
		[ITEM_ATTRIBUTE_SHOOTRANGE] = i:getShootRange(),
		["weight"] = i:getWeight(),
		["attack"] = i:getAttack(),
		["defense"] = i:getDefense(),
		["extradefense"] = i:getExtraDefense(),
		["armor"] = i:getArmor(),
		["hitchance"] = i:getHitChance(),
		["shootrange"] = i:getShootRange()
	}

	local attr = Item(uid):getAttribute(key)
	if tonumber(attr) then
		if numeric_attributes[key] then
			return attr ~= 0 and attr or numeric_attributes[key]
		end
	else
		if string_attributes[key] then
			if attr == "" then
				return string_attributes[key]
			end
		end
	end
	return attr
end

function doItemSetAttribute(uid, key, value)
	return Item(uid):setAttribute(key, value)
end

function doItemEraseAttribute(uid, key)
	return Item(uid):removeAttribute(key)
end

function iterateArea(func, from, to)
	for z = from.z, to.z do
		for y = from.y, to.y do
			for x = from.x, to.x do
				func(Position(x, y, z))
			end
		end
	end
end


function Tile.isPz(self)
	return self:hasFlag(TILESTATE_PROTECTIONZONE)
end

function Tile.isHouse(self)
	local house = self:getHouse()
	return not not house
end

function Position.getTile(self)
	return Tile(self)
end

function Player.isDruid(self)
	return isInArray({2, 6}, self:getVocation():getId())
end

function Player.isKnight(self)
	return isInArray({4, 8}, self:getVocation():getId())
end

function Player.isPaladin(self)
	return isInArray({3, 7}, self:getVocation():getId())
end

function Player.isMage(self)
	return isInArray({1, 2, 5, 6}, self:getVocation():getId())
end

function Player.isWarrior(self)
	return isInArray({3, 7, 4, 8}, self:getVocation():getId())
end

function Player.isSorcerer(self)
	return isInArray({1, 5}, self:getVocation():getId())
end

function Player.isPromoted(self)
	local vocation = self:getVocation()
	local promotedVocation = vocation:getPromotion()
	promotedVocation = promotedVocation and promotedVocation:getId() or 0

	return promotedVocation == 0 and vocation:getId() ~= promotedVocation
end


function Item.setDescription(self, description)
	if description ~= '' then
		self:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, description)
	else
		self:removeAttribute(ITEM_ATTRIBUTE_DESCRIPTION)
	end
end

function Item.setText(self, text)
	if text ~= '' then
		self:setAttribute(ITEM_ATTRIBUTE_TEXT, text)
	else
		self:removeAttribute(ITEM_ATTRIBUTE_TEXT)
	end
end

function Item.setUniqueId(self, uniqueId)
	if type(uniqueId) ~= 'number' or uniqueId < 0 or uniqueId > 65535 then
		return false
	end

	self:setAttribute(ITEM_ATTRIBUTE_UNIQUEID, uniqueId)
end

function Game.getHouseByPlayerGUID(playerGUID)
	local houses, house = Game.getHouses()
	for i = 1, #houses do
		house = houses[i]
		if house:getOwnerGuid() == playerGUID then
			return house
		end
	end
	return nil
end

function Game.getPlayersByAccountNumber(accountNumber)
	local result = {}
	local players, player = Game.getPlayers()
	for i = 1, #players do
		player = players[i]
		if player:getAccountId() == accountNumber then
			result[#result + 1] = player
		end
	end
	return result
end

function Game.getPlayersByIPAddress(ip, mask)
	if not mask then mask = 0xFFFFFFFF end
	local masked = bit.band(ip, mask)
	local result = {}
	local players, player = Game.getPlayers()
	for i = 1, #players do
		player = players[i]
		if bit.band(player:getIp(), mask) == masked then
			result[#result + 1] = player
		end
	end
	return result
end

function Vocation.getBase(self)
	local demotion = self:getDemotion()
	while demotion do
		local tmp = demotion:getDemotion()
		if not tmp then
			return demotion
		end
		demotion = tmp
	end
	return self
end

string.split = function(str, sep)
	local res = {}
	for v in str:gmatch("([^" .. sep .. "]+)") do
		res[#res + 1] = v
	end
	return res
end

string.trim = function(str)
	return str:match'^()%s*$' and '' or str:match'^%s*(.*%S)'
end

string.starts = function(str, substr)
	return string.sub(str, 1, #substr) == substr
end

string.titleCase = function(str)
	return str:gsub("(%a)([%w_']*)", function(first, rest) return first:upper() .. rest:lower() end)
end

table.append = table.insert
table.empty = function (t)
	return next(t) == nil
end

table.find = function (table, value)
	for i, v in pairs(table) do
		if(v == value) then
			return i
		end
	end

	return nil
end

table.contains = function (txt, str)
	for i, v in pairs(str) do
		if(txt:find(v) and not txt:find('(%w+)' .. v) and not txt:find(v .. '(%w+)')) then
			return true
		end
	end

	return false
end
table.isStrIn = table.contains

table.count = function (table, item)
	local count = 0
	for i, n in pairs(table) do
		if(item == n) then
			count = count + 1
		end
	end

	return count
end
table.countElements = table.count

table.getCombinations = function (table, num)
	local a, number, select, newlist = {}, #table, num, {}
	for i = 1, select do
		a[#a + 1] = i
	end

	local newthing = {}
	while(true) do
		local newrow = {}
		for i = 1, select do
			newrow[#newrow + 1] = table[a[i]]
		end

		newlist[#newlist + 1] = newrow
		i = select
		while(a[i] == (number - select + i)) do
			i = i - 1
		end

		if(i < 1) then
			break
		end

		a[i] = a[i] + 1
		for j = i, select do
			a[j] = a[i] + j - i
		end
	end

	return newlist
end

function table.serialize(x, recur)
	local t = type(x)
	recur = recur or {}

	if(t == nil) then
		return "nil"
	elseif(t == "string") then
		return string.format("%q", x)
	elseif(t == "number") then
		return tostring(x)
	elseif(t == "boolean") then
		return t and "true" or "false"
	elseif(getmetatable(x)) then
		error("Can not serialize a table that has a metatable associated with it.")
	elseif(t == "table") then
		if(table.find(recur, x)) then
			error("Can not serialize recursive tables.")
		end
		table.append(recur, x)

		local s = "{"
		for k, v in pairs(x) do
			s = s .. "[" .. table.serialize(k, recur) .. "]"
			s = s .. " = " .. table.serialize(v, recur) .. ","
		end
		s = s .. "}"
		return s
	else
		error("Can not serialize value of type '" .. t .. "'.")
	end
end

function table.unserialize(str)
	return loadstring("return " .. str)()
end

function Player.setExhaustion(self, value, time)
	return self:setStorageValue(value, time + os.time())
end

function Player.getExhaustion(self, value)
	local storage = self:getStorageValue(value)
	if storage <= 0 then
		return 0
	end

	return storage - os.time()
end

-- How to add items to the purse with lua:
--[[
	local purse = player:getSlotItem(CONST_SLOT_PURSE)
	if purse then
		local ret = purse:addItemEx(Game.createItem(7618, 100))
		if ret ~= RETURNVALUE_NOERROR then
			-- Item was not added, maybe because the purse was full, or maybe the player has no cap to hold the item, do something.
		end
	end
]]
