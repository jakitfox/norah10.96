local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local talk_state = {}

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)            npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                    npcHandler:onThink()                    end
function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
	
local player = Player(cid)	
    
	if msgcontains(msg, 'mission') then
		if player:getStorageValue(Storage.Grave.Mission01) == 3 and player:getStorageValue(Storage.Grave.Mission02) == -1 then
			npcHandler:say('In cemetery live dead pharaoh, who one day ago came back to life...  I beg you to kill him before he destroy all city. Are you ready to defeated him?', cid) 
			talk_state[cid] = 1
		elseif player:getStorageValue(Storage.Grave.Mission02) == 1 then
			npcHandler:say('Back when you kill Pharaoh.', cid)
		elseif player:getStorageValue(Storage.Grave.Mission02) == 2 then
			npcHandler:say('Did you kill Pharaoh?', cid)
			talk_state[cid] = 2
		elseif player:getStorageValue(Storage.Grave.Mission02) == 3 and player:getStorageValue(Storage.Grave.Mission03) == -1 then
			npcHandler:say('In cemetery live second pharaoh, go and kill him!', cid)
			player:setStorageValue(Storage.Grave.Mission03, 1)
			player:setStorageValue(Storage.Grave.Pharaoh02, 1)
		elseif player:getStorageValue(Storage.Grave.Mission03) == 1 then
			npcHandler:say('Back when you kill second Pharaoh.', cid)
		elseif player:getStorageValue(Storage.Grave.Mission03) == 2 then
			npcHandler:say('Did you kill second Pharaoh?', cid)
			talk_state[cid] = 3
		elseif player:getStorageValue(Storage.Grave.Mission05) == 1 then
			npcHandler:say('My stupid brother is hidden in cementary in Nilfgaard. I don\'t like when my family kidnap innocent people so rap him!', cid)
			player:setStorageValue(Storage.Grave.Mission05, 2)
			player:setStorageValue(Storage.Grave.Pharaoh03, 1)
		end
	elseif msgcontains(msg, 'yes') then
		if talk_state[cid] == 1 then
			npcHandler:say('So good luck!', cid)
			player:setStorageValue(Storage.Grave.Mission02, 1)
			player:setStorageValue(Storage.Grave.Pharaoh01, 1)
		elseif talk_state[cid] == 2 then
			npcHandler:say('Oh thanks, now you can do next mission!', cid)
			player:setStorageValue(Storage.Grave.Mission02, 3)
		elseif talk_state[cid] == 3 then
			npcHandler:say('Great! Back to Mower for next missions.', cid)
			player:setStorageValue(Storage.Grave.Mission03, 3)
		end
	elseif msgcontains(msg, 'no') then
		npcHandler:say('Ok, then not.', cid)
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  