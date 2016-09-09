local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)            npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                    npcHandler:onThink()                    end
function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
	
local player = Player(cid)

	if msgcontains(msg, 'satan') then
		if player:getStorageValue(Storage.Satan.Mission01) == -1 then
			npcHandler:say('You\'re asking about him because you want to help right?  Maybe you would be able to {kill} him?', cid)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(Storage.Satan.Mission01) == 1 then 
			npcHandler:say('I told you, we need the {ceremonial ankh}. Without it we are powerless, go recover it quickly!', cid)
		elseif player:getStorageValue(Storage.Satan.Mission01) == 3 then 
			npcHandler:say('Yes, yes my knowledge will be your {reward}.', cid)
	end
			
	elseif msgcontains(msg, 'kill') and npcHandler.topic[cid] == 1 then
		if player:getStorageValue(Storage.Satan.Mission01) == -1 then
			npcHandler:say('Are you a hero? I can\'t belive it! With you i finally see a glimpse of hope. If you want to face Satan you\'ll need {ceremonial ankh} so you can enter the gates of hell. Its in a magical room behind temple of Mothrim.', cid)
			npcHandler:say('You can enter it by going through the swamps east from temple. Make haste!', cid)
			player:setStorageValue(Storage.Satan.Questline, 1)
			player:setStorageValue(Storage.Satan.Mission01, 1)
		end
	
	elseif msgcontains(msg, 'ceremonial ankh') then
    		if player:getStorageValue(Storage.Satan.Mission01) == 1 then
			npcHandler:say('Its the key that will allow you to enter gates of hell!', cid)
		elseif player:getStorageValue(Storage.Satan.Mission01) == 2 then
			npcHandler:say('Great! You\'ve got it and in one piece! Now you need to gain entrance to {hell}! It is sealed under the fiery tower guarded by mages. A statue called {woman on ankh} will let you enter hell. If you somehow defeat {satan} i\'ll share with you some of my knowledge.', cid)
			player:setStorageValue(Storage.Satan.Mission01, 3)
		elseif player:getStorageValue(Storage.Satan.Mission01) == 3 then
			npcHandler:say('Have you already forgot? Go to the fiery tower and use {ceremonial ankh} on statue called {woman on ankh}. If you kill satan i\'ll give you my knowledge as a {reward}.', cid)
		end
		
	
	elseif msgcontains(msg, 'reward') then
		if player:getStorageValue(Storage.Satan.Zugurosh) == 2 and player:getStorageValue(Storage.Satan.Ushuriel) == 2 and player:getStorageValue(Storage.Satan.Golgordan) == 2 and player:getStorageValue(Storage.Satan.Annihilion) == 2 and player:getStorageValue(Storage.Satan.Madareth) == 2 and player:getStorageValue(Storage.Satan.Latrivan) == 2 and player:getStorageValue(Storage.Satan.Hellgorak) == 2 then
		if player:getStorageValue(Storage.Satan.RewardWEAPON) == 1 then
				npcHandler:say('Is it true!? It\'s impossible! Actually, it\'s amazing! {Satan} removed from our world? You are the greatest champion that ever lived, hail to you!', cid)
				player:addExperience(1000000, true)
				player:setStorageValue(Storage.Satan.RewardWEAPON, 2)
			elseif player:getStorageValue(Storage.Satan.RewardWEAPON) == 2 then
				npcHandler:say('I gived you reward!', cid)
			end
		else
			npcHandler:say('You did\'t kill {satan}!', cid)	
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  