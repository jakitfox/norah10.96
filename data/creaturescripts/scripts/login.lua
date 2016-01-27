local function onMovementRemoveProtection(cid, oldPosition, time)
	local player = Player(cid)
	if not player then
		return true
	end

	local playerPosition = player:getPosition()
	if (playerPosition.x ~= oldPosition.x or playerPosition.y ~= oldPosition.y or playerPosition.z ~= oldPosition.z) or player:getTarget() then
		player:setStorageValue(Storage.combatProtectionStorage, 0)
		return true
	end

	addEvent(onMovementRemoveProtection, 1000, cid, oldPosition, time - 1)
end

function onLogin(player)
	local loginStr = "Welcome to " .. configManager.getString(configKeys.SERVER_NAME) .. "!"
	if player:getLastLoginSaved() <= 0 then
		loginStr = loginStr .. " Please choose your outfit."
		player:sendOutfitWindow()
	else
		if loginStr ~= "" then
			player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
		end

		loginStr = string.format("Your last visit was on %s.", os.date("%a %b %d %X %Y", player:getLastLoginSaved()))
	end
	player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
	player:openChannel(32)
	
	-- Stamina
	nextUseStaminaTime[player.uid] = 0
	
	-- Promotion
	local vocation = player:getVocation()
	local promotion = vocation:getPromotion()
	if player:isPremium() then
		local value = player:getStorageValue(STORAGEVALUE_PROMOTION)
		if not promotion and value ~= 1 then
			player:setStorageValue(STORAGEVALUE_PROMOTION, 1)
		elseif value == 1 then
			player:setVocation(promotion)
		end
	elseif not promotion then
		player:setVocation(vocation:getDemotion())
	end
	
	-- Rewards notice
 	local rewards = #player:getRewardList()
 	if(rewards > 0) then
 		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You have %d %s in your reward chest.", rewards, rewards > 1 and "rewards" or "reward"))
 	end
 
	-- Events
    player:registerEvent("PlayerDeath")
	player:registerEvent("DropLoot")
    player:registerEvent("FirstItem")
    player:registerEvent("MonsterCounter")
    player:registerEvent("KillingInTheNameOfKills")
    player:registerEvent("inServiceOfYalaharQuestsMorik")
	player:registerEvent("SvargrondArenaKill")
	player:registerEvent("AdvanceSave")
	player:registerEvent("ZE_Death")
    if player:getStorageValue(1000) == 1 then --write ze_join_storage number here
        player:setStorageValue(1000, 0) --write ze_join_storage number here
    end
	
	
	if player:getStorageValue(Storage.combatProtectionStorage) <= os.time() then
		player:setStorageValue(Storage.combatProtectionStorage, os.time() + 10)
		onMovementRemoveProtection(player.uid, player:getPosition(), 10)
	end
	
	  -- Free bless
    local freeBless = {
        level = 50,
        blesses = {1, 2, 3, 4, 5}
    }

    if player:getLevel() <= freeBless.level then
        for i=1, #freeBless.blesses do
            player:addBlessing(freeBless.blesses[i])
        end
    end
	
return true
end