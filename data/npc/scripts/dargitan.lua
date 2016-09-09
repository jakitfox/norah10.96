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
		npcHandler:say('If you insist, very well. You dont look like much. First i will put you to the test. Are you fine with that?', cid)
		talk_state[cid] = 1
			
	elseif getPlayerStorageValue(cid,Storage.Ruiny.Mission01) == 1 then
		npcHandler:say('Have you been blessed by Ardos?', cid)
		talk_state[cid] = 2
			
	elseif getPlayerStorageValue(cid,Storage.Ruiny.Mission01) == 2 then
		npcHandler:say('Many years ago there was an archive on an peninsula east of Nilfgaard. Today the only thing you will find there, are crumbling ruins. The point is, the place we need to raid is not mapped. Even my best scouts did not return. Loot those dusty archives and bring me some information about this damned place we are in.', cid)
		setPlayerStorageValue(cid,Storage.Ruiny.Mission01,3)
		setPlayerStorageValue(cid, Storage.Ruiny.Mission02_QuestLog, 1)
		setPlayerStorageValue(cid, Storage.Ruiny.NotesDoor, 1)
			
	elseif getPlayerStorageValue(cid,Storage.Ruiny.Mission01) == 3 then
		npcHandler:say('Have you found something useful?', cid)
		talk_state[cid] = 3
			
	elseif getPlayerStorageValue(cid,Storage.Ruiny.Mission01) == 4 then
		npcHandler:say('My men and i are not enough to face the enemy. We need more people to help with our quest. Find some worthy adventurers that will lend us their hands to smite evil from this place. I trust you, because where others failed you were victorious. From now on you are in charge. Gates are now open for you, good luck!', cid)
		setPlayerStorageValue(cid, Storage.Ruiny.Mission03_QuestLog, 1)
		setPlayerStorageValue(cid, Storage.Ruiny.Mission01, 5)
		setPlayerStorageValue(cid, Storage.Ruiny.RuinyDoor, 1)
		talk_state[cid] = 0
			
	elseif getPlayerStorageValue(cid,Storage.Ruiny.Mission01) == 5  then
		npcHandler:say('Was the expedition successful?', cid)
		talk_state[cid] = 4
	end	
				
	elseif msgcontains(msg, 'reward') then
		if getPlayerStorageValue(cid,Storage.Ruiny.Mission01) == 6 then
			npcHandler:say('This sword was in my family for generations. Now it belongs to you. Wield it in the name of light with your face up. Farewell, hero!', cid)
			doPlayerAddItem(cid,8932,1)
			setPlayerStorageValue(cid, Storage.Ruiny.Mission04_QuestLog, 2)
			setPlayerStorageValue(cid, Storage.Ruiny.Mission01, 7)
		else
			npcHandler:say('You have already received your reward!', cid)			
	end
		
-------------------YES-----------------------		
	elseif msgcontains(msg, 'yes') then
		if talk_state[cid] == 1 then
			npcHandler:say('Hmm, show me you are pure of heart and faith. Find four chapels of Ardos - god of courage and light - and pray at them for his blessing. You will need it to remain unshaken from evil shadows that lurk inside the walls of this forsaken stronghold.', cid)
			setPlayerStorageValue(cid, Storage.Ruiny.Mission01, 1)
			setPlayerStorageValue(cid, Storage.Ruiny.Questline, 1)
			setPlayerStorageValue(cid, Storage.Ruiny.Mission01_QuestLog, 1)
		
	elseif talk_state[cid] == 2 then
		if getPlayerStorageValue(cid,Storage.Ruiny.Kaplica01) == 1 and getPlayerStorageValue(cid,Storage.Ruiny.Kaplica02) == 1  and getPlayerStorageValue(cid,Storage.Ruiny.Kaplica03) == 1 and getPlayerStorageValue(cid,Storage.Ruiny.Kaplica04) == 1 then
				npcHandler:say('Yes i can see the aura you give off. Maybe i was wrong judging you, maybe you are not just another cutthroat. Maybe you will be able to help us. I have assigned another task for you. Are you interested in this {mission}?', cid)
				setPlayerStorageValue(cid, Storage.Ruiny.Mission01, 2)
				setPlayerStorageValue(cid, Storage.Ruiny.Mission01_QuestLog, 2)
			else
				npcHandler:say('I\'m not feeling blessing of the Ardos in you!', cid)			
		end
			
		elseif talk_state[cid] == 3 then
			if getPlayerItemCount(cid,12406) >= 1 then
				doPlayerRemoveItem(cid,12406,1)
				npcHandler:say('Thanks to these notes, we can finally venture inside, also i\'ve got another {mission} for you.', cid)
				setPlayerStorageValue(cid, Storage.Ruiny.Mission02_QuestLog, 2)
				setPlayerStorageValue(cid, Storage.Ruiny.Mission01, 4)
			else
			npcHandler:say('You not found anything yet, hurry up and find some records!', cid)	
		end
		
			
		elseif talk_state[cid] == 4 then
		if getPlayerStorageValue(cid,Storage.Ruiny.Reward) == 1 then
			npcHandler:say('What did you say!? Demons? But it\'s safe now isn\'t it? I fear without you our cause would be lost. You are the most honorable and courageous fighter i\'ve meet in my life. Me and my men bow to you fighter. Our world needs people like you! Here, take this as a {reward}. You deserve this more than me.', cid)
			setPlayerStorageValue(cid, Storage.Ruiny.Mission03_QuestLog, 2)
			setPlayerStorageValue(cid, Storage.Ruiny.Mission04_QuestLog, 1)
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