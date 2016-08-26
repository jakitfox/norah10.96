local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
   
    local player = Player(cid)
	local BlessPriceAll = getBlessingsCost(player:getLevel()) * 5
	local BlessPriceEach = getBlessingsCost(player:getLevel())
	local BlessPricePvp = getPvpBlessingCost(player:getLevel())
    local blessings = 0
    for i = 1, 5 do
        if(player:hasBlessing(i)) then
            blessings = blessings + 1
        end
    end
   
    if(msgcontains(msg, 'bless') or msgcontains(msg, 'blessing')) then
        npcHandler:say("There are five different blessings. These blessings are: {first}, {second}, {third}, {fourth}, {fifth}. You have " .. blessings .. " out of 5 blessings. I can also provide you with {all} blessings at once. Additionally, you can receive the {twist of fate} here.", cid)
        talkState[talkUser] = 0
		
    elseif(msgcontains(msg, 'all')) then
        if(player:hasBlessing(5)) then
            npcHandler:say("You already possess all blessings.", cid)
            talkState[talkUser] = 0
        else
            npcHandler:say("For "..BlessPriceAll.." gold, I will bless you with all the blessings you don't already have. Is that okay?", cid)
            talkState[talkUser] = 1
        end
    elseif(msgcontains(msg, 'first')) then
        if(player:hasBlessing(1)) then
            npcHandler:say("So receive the first blessing.", cid)
            talkState[talkUser] = 0
        else
            npcHandler:say("Do you want to buy the first blessing for {"..BlessPriceEach.."} gold?", cid)
            talkState[talkUser] = 2
        end
    elseif(msgcontains(msg, 'second')) then
        if(player:hasBlessing(2)) then
            npcHandler:say("So receive the second blessing.", cid)
            talkState[talkUser] = 0
        else
            npcHandler:say("Do you want to buy the second blessing for {"..BlessPriceEach.."} gold?", cid)
            talkState[talkUser] = 3
        end
    elseif(msgcontains(msg, 'third')) then
        if(player:hasBlessing(3)) then
            npcHandler:say("So receive the third blessing.", cid)
            talkState[talkUser] = 0
        else
            npcHandler:say("Do you want to buy the third blessing for {"..BlessPriceEach.."} gold?", cid)
            talkState[talkUser] = 4
        end
    elseif(msgcontains(msg, 'fourth')) then
        if(player:hasBlessing(4)) then
            npcHandler:say("So receive the fourth blessing.", cid)
            talkState[talkUser] = 0
        else
            npcHandler:say("Do you want to buy the fourt blessing for {"..BlessPriceEach.."} gold?", cid)
            talkState[talkUser] = 5
        end
    elseif(msgcontains(msg, 'fifth')) then
        if(player:hasBlessing(5)) then
            npcHandler:say("So receive the fifth blessing.", cid)
            talkState[talkUser] = 0
        else
            npcHandler:say("Do you want to buy the fifth blessing for {"..BlessPriceEach.."} gold?", cid)
            talkState[talkUser] = 6
        end
    elseif(msgcontains(msg, 'twist') or msgcontains(msg, 'twist of fate')) then
			if(player:hasBlessing(6)) then
				npcHandler:say("You already possess this blessing.", cid)
				talkState[talkUser] = 0
			else
			npcHandler:say(
					{"This is a special blessing I can bestow upon you once you have obtained at least one of the other blessings and which functions a bit differently. ...",
					"It only works when you're killed by other adventurers, which means that the last damage that is the cause of your death was caused by others, not by monsters or the environment. ...",
					"The twist of fate will not reduce the death penalty like the other blessings, but instead prevent you from losing your other blessings as well as the amulet of loss, should you wear one. It costs the same as the other blessings. ...",
					"Would you like to receive that protection for a sacrifice of "..BlessPricePvp.." gold, child?"}, cid)
			talkState[talkUser] = 7	
		end
    elseif(msgcontains(msg, 'yes')) then
        if(talkState[talkUser] == 1) then
            if(player:removeMoney(getBlessingsCost(player:getLevel()) *5)) then
                for i = 1, 5 do
                    player:addBlessing(i)
                end
                npcHandler:say("You received all five blessings for "..BlessPriceAll.." gold!", cid)
            else
                npcHandler:say("You can not afford this blessing!", cid)
            end
            talkState[talkUser] = 0
        elseif(talkState[talkUser] == 2) then
            if(player:removeMoney(getBlessingsCost(player:getLevel()))) then
                npcHandler:say("You received the spiritual shielding blessing!", cid)
                player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
                player:addBlessing(1)
            else
                npcHandler:say("You can not afford this blessing!", cid)
            end
            talkState[talkUser] = 0
        elseif(talkState[talkUser] == 3) then
            if(player:removeMoney(getBlessingsCost(player:getLevel()))) then
                npcHandler:say("You received the spark of the phoenix blessing!", cid)
                player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
                player:addBlessing(2)
            else
                npcHandler:say("You can not afford this blessing!", cid)
            end
            talkState[talkUser] = 0
        elseif(talkState[talkUser] == 4) then
            if(player:removeMoney(getBlessingsCost(player:getLevel()))) then
                npcHandler:say("You received the embrace of tibia blessing!", cid)
                player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
                player:addBlessing(3)
            else
                npcHandler:say("You can not afford this blessing!", cid)
            end
            talkState[talkUser] = 0
        elseif(talkState[talkUser] == 5) then
            if(player:removeMoney(getBlessingsCost(player:getLevel()))) then
                npcHandler:say("You received the fire of the suns blessing!", cid)
                player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
                player:addBlessing(4)
            else
                npcHandler:say("You can not afford this blessing!", cid)
            end
            talkState[talkUser] = 0
        elseif(talkState[talkUser] == 6) then
            if(player:removeMoney(getBlessingsCost(player:getLevel()))) then
                npcHandler:say("You received the wisdom of solitude blessing!", cid)
                player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
                player:addBlessing(5)
            else
                npcHandler:say("You can not afford this blessing!", cid)
            end
            talkState[talkUser] = 0
		elseif(talkState[talkUser] == 7) then
            if(player:getMoney() >= getPvpBlessingCost(player:getLevel())) then
                npcHandler:say("You received the twist of fate blessing!", cid)
                player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
                player:addBlessing(6)
            else
                npcHandler:say("You can not afford this blessing!", cid)
            end
            talkState[talkUser] = 0
			end
    elseif(msgcontains(msg, 'no')) then
        npcHandler:say("Okay then.", cid)
        talkState[talkUser] = 0
    end
return true
end

npcHandler:setMessage(MESSAGE_GREET, "Hello |PLAYERNAME|. Do you want my {blessings}?")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Please visit again. You never know when you may need my blessings!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Please visit again |PLAYERNAME|")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())