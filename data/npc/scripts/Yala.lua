local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local talk_state = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)

    if(not npcHandler:isFocused(cid)) then
        return false
    end
----------------------START----------------------
if msgcontains(msg, 'quest') or msgcontains(msg, 'mission') or msgcontains(msg, 'missions') then
if getPlayerStorageValue(cid, Storage.Yala.Questline) == -1 then
	npcHandler:say('You want to go there!? I\'m sorry but I can\'t let you in like that. You need to do some {missions}. Are you ready for the first mission?', cid)
	talk_state[cid] = 1
	
elseif getPlayerStorageValue(cid, Storage.Yala.Questline) == 1 then
	npcHandler:say('And? Did you collected 30 {scythe leg}?', cid)
	talk_state[cid] = 2	
	
elseif getPlayerStorageValue(cid, Storage.Yala.Questline) == 2 then
	npcHandler:say('Are you ready for your next mission?', cid)
	talk_state[cid] = 3
	
elseif getPlayerStorageValue(cid, Storage.Yala.Questline) == 3 then
	npcHandler:say('And? Did you collect Phoenix eggs for me?', cid)
	talk_state[cid] = 4
	
elseif getPlayerStorageValue(cid, Storage.Yala.Questline) == 4 then
	npcHandler:say('This will be your last mission, if you succeed you will be able to enter. Do you want to start this mission?', cid)
	talk_state[cid] = 5
	
elseif getPlayerStorageValue(cid, Storage.Yala.Questline) == 5 or getPlayerStorageValue(cid, 3070) == 6 then
	npcHandler:say('How did you managed to defeat him?', cid)
	talk_state[cid] = 6
	
elseif getPlayerStorageValue(cid, Storage.Yala.Questline) == 7 then
	npcHandler:say('I dont have more missions for you', cid)
	talk_state[cid] = 6
end
	
---------------YES-----------------------------	
elseif msgcontains(msg, 'yes') then
if talk_state[cid] == 1 then
			npcHandler:say('Nice, go and bring me 30 {scythe leg}', cid)
			setPlayerStorageValue(cid, Storage.Yala.Questline, 1)
			setPlayerStorageValue(cid, Storage.Yala.Mission01, 1)
			
elseif talk_state[cid] == 2 then			
		if getPlayerItemCount(cid,11229) >= 30 then	
		if doPlayerRemoveItem(cid,11229,30) then
			setPlayerStorageValue(cid, Storage.Yala.Questline, 2)
			setPlayerStorageValue(cid, Storage.Yala.Mission01, 2)
			npcHandler:say('Good job, but it was a simple mission!', cid)
			end
		else
			npcHandler:say('You dont have this , or you can\'t caunt!', cid)
		end
	
elseif talk_state[cid] == 3 then			
			setPlayerStorageValue(cid, Storage.Yala.Questline, 3)
			setPlayerStorageValue(cid, Storage.Yala.Mission02, 1)
			npcHandler:say('This time your mission won\'t be so easy. You need to bring me {six phoenix eggs}!', cid)

elseif talk_state[cid] == 4 then
		if getPlayerItemCount(cid,11400) >= 6 then	
			npcHandler:say('I\'m impressed that you got it!. Now you can start next mission', cid)
			setPlayerStorageValue(cid, Storage.Yala.Questline, 4)	
			doPlayerRemoveItem(cid,11400,6)
			setPlayerStorageValue(cid, Storage.Yala.Mission02, 2)
			else
			npcHandler:say('You dont have this, or you can\'t caunt!', cid)
		end

elseif talk_state[cid] == 5 then
			npcHandler:say('You need to defeat one of the Amerus knights , and make sure not to die while this mission , you\'ll find him close to this gigantic gate.', cid)
			setPlayerStorageValue(cid, Storage.Yala.Questline, 5)
			setPlayerStorageValue(cid, Storage.Yala.Mission03, 1)

elseif talk_state[cid] == 6 then
		if getPlayerStorageValue(cid, Storage.Yala.Questline) == 6 then
			npcHandler:say('You made it! You\'ve got first Yalaharian addon for this mission. It\'s possible that you are chosen one , so go and kill Amerus', cid)
			doPlayerAddOutfit(cid, 324, 1) 
            doPlayerAddOutfit(cid, 325, 1) 
			setPlayerStorageValue(cid, Storage.Yala.Questline, 7)
			setPlayerStorageValue(cid, Storage.Yala.DoorPass, 1)
			setPlayerStorageValue(cid, Storage.Yala.Mission03, 3)
			else
			npcHandler:say('He\'s not defeated yet!', cid)
		end
			
elseif msgcontains(msg, 'no') then
	npcHandler:say('Ohh... ok , maby next time...', cid)
	talk_state[cid] = 0
end
end
----------------------END----------------------
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
