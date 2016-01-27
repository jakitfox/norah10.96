local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
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
    
if msgcontains(msg, 'mission') or msgcontains(msg, 'quest') or msgcontains(msg, 'join')  then
	if getPlayerStorageValue(cid,Storage.Ruiny.Mission01) == -1 then
		npcHandler:say('I need to be sure that you\'re worthy , to join us , are you ready for a test?', cid)
		talk_state[cid] = 1
			
	elseif getPlayerStorageValue(cid,Storage.Ruiny.Mission01) == 1 then
		npcHandler:say('Did you get the Ardos blessing?', cid)
		talk_state[cid] = 2
			
	elseif getPlayerStorageValue(cid,Storage.Ruiny.Mission01) == 2 then
		npcHandler:say('Loot ruins in the west of nilfgaard , and maby you\'ll find some notes of this cursed fortress.', cid)
		setPlayerStorageValue(cid,Storage.Ruiny.Mission01,3)
		setPlayerStorageValue(cid, Storage.Ruiny.NotesDoor, 1)
			
	elseif getPlayerStorageValue(cid,Storage.Ruiny.Mission01) == 3 then
		npcHandler:say('Did you fould something usefull?', cid)
		talk_state[cid] = 3
			
	elseif getPlayerStorageValue(cid,Storage.Ruiny.Mission01) == 4 then
		npcHandler:say('We need to clean ruins from this cursed beasts , so find the team and go face this monsters in fortress', cid)
		setPlayerStorageValue(cid, Storage.Ruiny.Mission01, 5)
		setPlayerStorageValue(cid, Storage.Ruiny.RuinyDoor, 1)
		talk_state[cid] = 0
			
	elseif getPlayerStorageValue(cid,Storage.Ruiny.Mission01) == 5  then
		npcHandler:say('The expedition was successful?', cid)
		talk_state[cid] = 4
	end	
				
	elseif msgcontains(msg, 'reward') then
		if getPlayerStorageValue(cid,Storage.Ruiny.Mission01) == 6 then
			npcHandler:say('This sword was in our family from generation to generation , but i think that you are better than me. I\'ll give you this sword then.', cid)
			doPlayerAddItem(cid,8932,1)
			setPlayerStorageValue(cid, Storage.Ruiny.Mission01, 7)
		else
			npcHandler:say('You have already received your reward!', cid)			
	end
		
-------------------YES-----------------------		
	elseif msgcontains(msg, 'yes') then
		if talk_state[cid] == 1 then
			npcHandler:say('Great , go and visit four Ardoses chapels and pray to get blessing , that will save your soul from evil, that is behind the gate of this fortress.', cid)
			setPlayerStorageValue(cid, Storage.Ruiny.Mission01, 1)
			setPlayerStorageValue(cid, Storage.Ruiny.Questline, 1)
		
	elseif talk_state[cid] == 2 then
		if getPlayerStorageValue(cid,Storage.Ruiny.Kaplica01) == 1 and getPlayerStorageValue(cid,Storage.Ruiny.Kaplica02) == 1  and getPlayerStorageValue(cid,Storage.Ruiny.Kaplica03) == 1 and getPlayerStorageValue(cid,Storage.Ruiny.Kaplica04) == 1 then
				npcHandler:say('Now your sould is ready to go behind this gate , but your body isn\'t. I have a {mission} for you , thats makes that you will be ready. ', cid)
				setPlayerStorageValue(cid, Storage.Ruiny.Mission01, 2)			
			else
				npcHandler:say('I\'m not feeling blessing of the Ardos in you!', cid)			
		end
			
		elseif talk_state[cid] == 3 then
			if getPlayerItemCount(cid,12406) >= 1 then
				doPlayerRemoveItem(cid,12406,1)
				npcHandler:say('Thanks to this notes , we can go to this fortress, and I\'ve got another {mission} for you', cid)
				setPlayerStorageValue(cid, Storage.Ruiny.Mission01, 4)
			else
			npcHandler:say('Not found anything yet, hurry up and find some records!', cid)	
		end
		
			
		elseif talk_state[cid] == 4 then
		if getPlayerStorageValue(cid,Storage.Ruiny.Reward) == 1 then
			npcHandler:say('I knew that you\'ll make it , and i have a {reward} for you', cid)
			setPlayerStorageValue(cid, Storage.Ruiny.Mission01, 6)
			else
			npcHandler:say('Go and check this ruins. Quick!', cid)	
	end
	
	elseif msgcontains(msg, 'no') then
		npcHandler:say('Ok, then not.', cid)
		talk_state[cid] = 0
	end
end		
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  