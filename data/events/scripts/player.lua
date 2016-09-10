function Player:onBrowseField(position)

local runes = Game.getSpectators(Position(639,520,9), false, true, 3, 4)
	for k = 1, #runes do
		if runes[k] then
			return runes[k]:sendCancelMessage('Sorry, not possible.') and false;
		end
	end	

	return true
end

function Player:onLook(thing, position, distance)
	if thing:isItem() and (thing.actionid == 31337) then
    local pid = self:getId()
    if MATCH.SCORE[pid] == nil then
        return false
    end

    if thing:getId() ~= MATCH.HIDDEN then
        return false
    end

    if getValue(MATCH.EXHAUST[pid]) >= os.time(t) then
        self:say("Wait...", TALKTYPE_MONSTER_SAY, false, self)
        return false
    end

    local a = MATCH.COUNT[pid]
    if a == 2 then
        return false
    end

    MATCH.EXHAUST[pid] = os.time(t) + 1
    MATCH.COUNT[pid] = a + 1
    self:getPosition():sendDistanceEffect(position, 31)
    local v, p = showRune(pid, thing), MATCH.POS[pid]
    enableSleep(function()
        if v ~= nil then
            pause(500)
            MATCH.POS[pid] = 0
            MATCH.LAST[pid] = 0
            MATCH.COUNT[pid] = 0    
            if v then
                for _, pos in ipairs({p, position}) do
                    local b = Tile(pos):getTopVisibleThing(false)
                    if isMatchRune(b:getId()) then
                        b:remove()
                        pos:sendMagicEffect(10)
                    end
                end
                self:say("MATCH!", TALKTYPE_MONSTER_SAY, false, nil, p)
                self:say("MATCH!", TALKTYPE_MONSTER_SAY, false, nil, position)
                p:sendDistanceEffect(self:getPosition(), 36)
                position:sendDistanceEffect(self:getPosition(), 36)
                local u = getValue(MATCH.SCORE[pid])
                MATCH.SCORE[pid] = u + 2
                local k = (getValue(MATCH.SCORE[pid])/(MATCH.SIZE[1]*MATCH.SIZE[2]))*100
				self:say(math.floor(k) .. "%", TALKTYPE_MONSTER_SAY)
                self:sendCancelMessage(getValue(MATCH.SCORE[pid])/2 .. "/".. (MATCH.SIZE[1]*MATCH.SIZE[2])/2 .." runes unlocked")

                if isBoardEmpty() then
                    local h = {}
                    for _, pos in ipairs(MATCH.PLAYERS.to) do
                        local player = Tile(pos):getTopCreature()
                        if player ~= nil then
                            local cid = player:getId()
                            table.insert(h, {player:getName(), getValue(MATCH.SCORE[cid])})                    
                            MATCH.SCORE[cid] = nil
                            player:teleportTo(MATCH.EXIT)
                        end            
                    end
                    table.sort(h, function(a, b) return a[2] > b[2] end)
                    local str = "Rune Match event finished!"
                    for _, highscore in ipairs(h) do
                        str = str .. "\n" .. highscore[1] .. " scored " .. math.floor((highscore[2]/(MATCH.SIZE[1]*MATCH.SIZE[2]))*100) .. "%"
                    end 
					if h[1][2] > h[2][2] then
					local topPlayer = Player(h[1][1])
					topPlayer:setCoinsBalance(topPlayer:getCoinsBalance() + 15)	
					topPlayer:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You won!")
					end		
                    Game.broadcastMessage(str, MESSAGE_EVENT_ADVANCE)
                    cleanBoard()
                end
            else
                hideRune(p)
                hideRune(position)
                self:say("FAIL!", TALKTYPE_MONSTER_SAY, false, nil, p)
                self:say("FAIL!", TALKTYPE_MONSTER_SAY, false, nil, position)
                stopEvent(MATCH.EVENT[pid])
            end
        end
    end)
    return false
end
	local description = "You see " .. thing:getDescription(distance)
	if self:getGroup():getAccess() then
		if thing:isItem() then
			description = string.format("%s\nItem ID: %d", description, thing:getId())

			local actionId = thing:getActionId()
			if actionId ~= 0 then
				description = string.format("%s, Action ID: %d", description, actionId)
			end

			local uniqueId = thing:getAttribute(ITEM_ATTRIBUTE_UNIQUEID)
			if uniqueId > 0 and uniqueId < 65536 then
				description = string.format("%s, Unique ID: %d", description, uniqueId)
			end

			local itemType = thing:getType()

			local transformEquipId = itemType:getTransformEquipId()
			local transformDeEquipId = itemType:getTransformDeEquipId()
			if transformEquipId ~= 0 then
				description = string.format("%s\nTransforms to: %d (onEquip)", description, transformEquipId)
			elseif transformDeEquipId ~= 0 then
				description = string.format("%s\nTransforms to: %d (onDeEquip)", description, transformDeEquipId)
			end

			local decayId = itemType:getDecayId()
			if decayId ~= -1 then
				description = string.format("%s\nDecays to: %d", description, decayId)
			end
		elseif thing:isCreature() then
			local str = "%s\nHealth: %d / %d"
			if thing:getMaxMana() > 0 then
				str = string.format("%s, Mana: %d / %d", str, thing:getMana(), thing:getMaxMana())
			end
			description = string.format(str, description, thing:getHealth(), thing:getMaxHealth()) .. "."
		end

		local position = thing:getPosition()
		description = string.format(
			"%s\nPosition: %d, %d, %d",
			description, position.x, position.y, position.z
		)

		if thing:isCreature() then
			if thing:isPlayer() then
				description = string.format("%s\nIP: %s.", description, Game.convertIpToString(thing:getIp()))
			end
		end
	end
	self:sendTextMessage(MESSAGE_INFO_DESCR, description)
end

function Player:onLookInBattleList(creature, distance)
	local description = "You see " .. creature:getDescription(distance)
	if self:getGroup():getAccess() then
		local str = "%s\nHealth: %d / %d"
		if creature:getMaxMana() > 0 then
			str = string.format("%s, Mana: %d / %d", str, creature:getMana(), creature:getMaxMana())
		end
		description = string.format(str, description, creature:getHealth(), creature:getMaxHealth()) .. "."

		local position = creature:getPosition()
		description = string.format(
			"%s\nPosition: %d, %d, %d",
			description, position.x, position.y, position.z
		)

		if creature:isPlayer() then
			description = string.format("%s\nIP: %s", description, Game.convertIpToString(creature:getIp()))
		end
	end
	self:sendTextMessage(MESSAGE_INFO_DESCR, description)
end

function Player:onLookInTrade(partner, item, distance)
	self:sendTextMessage(MESSAGE_INFO_DESCR, "You see " .. item:getDescription(distance))
end

function Player:onLookInShop(itemType, count)
	return true
end

function Player:onMoveItem(item, count, fromPosition, toPosition, fromCylinder, toCylinder)
	if fromPosition:isInRange(MATCH.BOARD.from, MATCH.BOARD.to) then
    self:sendCancelMessage('Sorry, not possible.')
    return false
	end

	if toPosition:isInRange(MATCH.BOARD.from, MATCH.BOARD.to) then
    self:sendCancelMessage('Sorry, not possible.')
    return false
	end
	if item:getActionId() == NOT_MOVEABLE_ACTION then
		self:sendCancelMessage('Sorry, not possible.')
		return false
	end
	
    if toPosition.x == CONTAINER_POSITION and toCylinder and toCylinder:getId() == 26052 then
        self:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        return false
    end

	if toPosition.x ~= CONTAINER_POSITION then
		return true
	end

	if item:getTopParent() == self and bit.band(toPosition.y, 0x40) == 0 then	
		local itemType, moveItem = ItemType(item:getId())
		if bit.band(itemType:getSlotPosition(), SLOTP_TWO_HAND) ~= 0 and toPosition.y == CONST_SLOT_LEFT then
			moveItem = self:getSlotItem(CONST_SLOT_RIGHT)	
		elseif itemType:getWeaponType() == WEAPON_SHIELD and toPosition.y == CONST_SLOT_RIGHT then
			moveItem = self:getSlotItem(CONST_SLOT_LEFT)
			if moveItem and bit.band(ItemType(moveItem:getId()):getSlotPosition(), SLOTP_TWO_HAND) == 0 then
				return true
			end
		end

		if moveItem then
			local parent = item:getParent()
			if parent:getSize() == parent:getCapacity() then
				self:sendTextMessage(MESSAGE_STATUS_SMALL, Game.getReturnMessage(RETURNVALUE_CONTAINERNOTENOUGHROOM))
				return false
			else
				return moveItem:moveTo(parent)
			end
		end
	end
	
	if toPosition.x == CONTAINER_POSITION then
		local containerId = toPosition.y - 64
		local container = self:getContainerById(containerId)		
		if not container then
			return true 
		end

		-- Do not let the player insert items into either the Reward Container or the Reward Chest
		local itemId = container:getId()		
		if itemId == ITEM_REWARD_CONTAINER or itemId == ITEM_REWARD_CHEST then
			self:sendCancelMessage('Sorry, not possible.')
			return false
		end

		-- The player also shouldn't be able to insert items into the boss corpse		
		local tile = Tile(container:getPosition())
		for _, item in ipairs(tile:getItems()) do
			if item:getAttribute(ITEM_ATTRIBUTE_CORPSEOWNER) == 2^31 - 1 and item:getName() == container:getName() then
				self:sendCancelMessage('Sorry, not possible.')
				return false
			end
		end
	end

	-- Do not let the player move the boss corpse.
	if item:getAttribute(ITEM_ATTRIBUTE_CORPSEOWNER) == 2^31 - 1 then
		self:sendCancelMessage('Sorry, not possible.')
		return false
	end

    return true
end

function Player:onMoveCreature(creature, fromPosition, toPosition)
	return true
end

function Player:onTurn(direction)
	return true
end

function Player:onTradeRequest(target, item)
	return true
end

function Player:onTradeAccept(target, item, targetItem)
	return true
end

local soulCondition = Condition(CONDITION_SOUL, CONDITIONID_DEFAULT)
soulCondition:setTicks(4 * 60 * 1000)
soulCondition:setParameter(CONDITION_PARAM_SOULGAIN, 1)

local function useStamina(player)
	local staminaMinutes = player:getStamina()
	if staminaMinutes == 0 then
		return
	end

	local playerId = player:getId()
	local currentTime = os.time()
	local timePassed = currentTime - nextUseStaminaTime[playerId]
	if timePassed <= 0 then
		return
	end

	if timePassed > 60 then
		if staminaMinutes > 2 then
			staminaMinutes = staminaMinutes - 2
		else
			staminaMinutes = 0
		end
		nextUseStaminaTime[playerId] = currentTime + 120
	else
		staminaMinutes = staminaMinutes - 1
		nextUseStaminaTime[playerId] = currentTime + 60
	end
	player:setStamina(staminaMinutes)
end

function Player:onGainExperience(source, exp, rawExp)
	if not source or source:isPlayer() then
		return exp
	end

	-- Soul regeneration
	local vocation = self:getVocation()
	if self:getSoul() < vocation:getMaxSoul() and exp >= self:getLevel() then
		soulCondition:setParameter(CONDITION_PARAM_SOULTICKS, vocation:getSoulGainTicks() * 1000)
		self:addCondition(soulCondition)
	end

	-- Apply experience stage multiplier
	exp = exp * Game.getExperienceStage(self:getLevel())

	-- Stamina modifier
	if configManager.getBoolean(configKeys.STAMINA_SYSTEM) then
		useStamina(self)

		local staminaMinutes = self:getStamina()
		if staminaMinutes > 2400 and self:isPremium() then
			exp = exp * 1.5
		elseif staminaMinutes <= 840 then
			exp = exp * 0.5
		end
	end

	if getGlobalStorageValue(Storage.EXP_Event) == 1 then
		exp = exp * 2.0
	end
return exp
end

function Player:onLoseExperience(exp)
	return exp
end

function Player:onGainSkillTries(skill, tries)
	if APPLY_SKILL_MULTIPLIER == false then
		return tries
	end

	if skill == SKILL_MAGLEVEL then
		return tries * configManager.getNumber(configKeys.RATE_MAGIC)
	end
	return tries * configManager.getNumber(configKeys.RATE_SKILL)
end
