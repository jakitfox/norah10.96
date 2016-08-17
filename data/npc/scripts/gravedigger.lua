local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local talk_state = {}

function onCreatureAppear(cid)		npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()                    npcHandler:onThink()                    end
local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
    
local player = Player(cid)	
	
	if msgcontains(msg, 'mission') then
		if player:getStorageValue(Storage.Grave.Questline) == -1 then
			npcHandler:say('Are you interesting to make {Gravedigger\'s mission}?', cid)
			talk_state[cid] = 1
		elseif player:getStorageValue(Storage.Grave.Questline) == 1 then
			npcHandler:say('Do you find my precious amulet?', cid)
			talk_state[cid] = 2
		elseif player:getStorageValue(Storage.Grave.Mission01) == -1 then
			npcHandler:say('In one of the grave there are too many evill creation, you must defeat them. Are you ready to stand up to those {monsters}?', cid)
			talk_state[cid] = 3
		elseif player:getStorageValue(Storage.Grave.Mission01) == 1 then
			npcHandler:say('Go and kill enemy in grave!', cid)
			talk_state[cid] = 0
		elseif player:getStorageValue(Storage.Grave.Mission01) == 2 then
			npcHandler:say('I see you defeated monsters, so now you can do next mission. Go to Nilfgaard and ask Pharaoh for missions.', cid)
			player:setStorageValue(Storage.Grave.Mission01, 3)
			talk_state[cid] = 0
		elseif player:getStorageValue(Storage.Grave.Mission03) == 3 and player:getStorageValue(Storage.Grave.Mission04) == -1 then
			npcHandler:say('As you probably noticed, I\'m looking for my lost {jester doll}. I will be grateful when you {find} it and {fix} my favorite toy. Do you want help me?', cid)
			talk_state[cid] = 4
		elseif player:getStorageValue(Storage.Grave.Mission04) == 2 then
			npcHandler:say('Did you find my lost doll?', cid)
			talk_state[cid] = 5
		elseif player:getStorageValue(Storage.Grave.Mission05) == 4 and player:getStorageValue(Storage.Grave.Mission06) == -1 then
			npcHandler:say('In Pont Vanis somebody dispersed a plague, you must kill person who dispersed it and try to find as many information about this plague as you can!', cid)
			player:setStorageValue(Storage.Grave.Mission06, 1)
			player:setStorageValue(Storage.Grave.Plague, 1)
			talk_state[cid] = 0
		elseif player:getStorageValue(Storage.Grave.Mission06) == 1 then
			npcHandler:say('Do you bring secret documents?', cid)
			talk_state[cid] = 6
		elseif player:getStorageValue(Storage.Grave.Mission06) == 3 then
			npcHandler:say('Did you killed the evil creature who dispersed a plague?', cid)
			talk_state[cid] = 7
		elseif player:getStorageValue(Storage.Grave.Mission06) == 4 and player:getStorageValue(Storage.Grave.Mission07) == -1 then
			npcHandler:say('I give you my ball to fill it up with dead energy.', cid)
			setPlayerStorageValue(cid, Storage.Grave.Mission07, 1)
			setPlayerStorageValue(cid, Storage.Grave.Ball, 1)
			doPlayerAddItem(cid,2176,1)
			talk_state[cid] = 0
		elseif player:getStorageValue(Storage.Grave.Mission07) == 2 then
			npcHandler:say('Did you fill my ball?', cid)
			talk_state[cid] = 8
		elseif player:getStorageValue(Storage.Grave.Mission07) == 3 and player:getStorageValue(Storage.Grave.Mission08) == -1 then
			npcHandler:say('Are you ready to {final battle}?', cid)
			talk_state[cid] = 9
		elseif player:getStorageValue(Storage.Grave.Mission08) == 2 then
			npcHandler:say('Your mission is complete.', cid)
		end		
-------------------YES----------------------------------------		
	elseif msgcontains(msg, 'yes') and talk_state[cid] == 1 then
		npcHandler:say('On first you must find {four} elements of {Koshei\'s Ancient Amulet}, back to me when you find it.', cid)
		player:setStorageValue(Storage.Grave.Questline, 1)
	elseif talk_state[cid] == 2 then
		if player:getItemCount(8262) >= 1 and player:getItemCount(8263) >= 1 and player:getItemCount(8264) >= 1 and player:getItemCount(8265) >= 1 then
			player:removeItem(8262,1)
			player:removeItem(8263,1)
			player:removeItem(8264,1)
			player:removeItem(8265,1)
			key = doPlayerAddItem(cid,2087,1)
			npcHandler:say('That\'s great. Congratulations, you have done you {first mission}, good luck in others. I would like to give you my {key} as a gift.', cid)
			player:setStorageValue(Storage.Grave.Questline, 2)
			doPlayerAddItem(cid,8266,1)
			doSetItemActionId(key, 3031)
		else
			npcHandler:say('You don\'t have all piece of amulet!', cid)			
		end
	elseif talk_state[cid] == 3 then
		npcHandler:say('I\'m sure you come back.', cid)
		player:setStorageValue(Storage.Grave.Mission01, 1)
	elseif talk_state[cid] == 4 then
		npcHandler:say('{Scary creatures} have elements of this toy please find them!', cid)
		player:setStorageValue(Storage.Grave.Mission04, 1)
	elseif talk_state[cid] == 5 then
		if player:getItemCount(9693) >= 1 then
			player:removeItem(9693,1)
			npcHandler:say('Good job! Now you can fight with mystery monsters in the next mission.', cid)
			player:setStorageValue(Storage.Grave.Mission04, 3)
		else
			npcHandler:say('You don\'t have Jester Doll.', cid)
		end
	elseif talk_state[cid] == 6 then
		if player:getItemCount(7720) >= 1 and player:getItemCount(7844) >= 1 and player:getItemCount(7845) >= 1 and player:getItemCount(7846) >= 1 then
			player:removeItem(7720,1)
			player:removeItem(7844,1)
			player:removeItem(7845,1)
			player:removeItem(7846,1)
			npcHandler:say('Oh thanks, owing this I can cure people who didn\'t die. But somebody who dispersed a plague is still alive, you must kill him as fast as you can, before he made another plage!', cid)
			player:setStorageValue(Storage.Grave.Mission06, 2)
			player:setStorageValue(Storage.Grave.PlagueBoss, 1)
			player:setStorageValue(Storage.Grave.BossPass, 1)
		else
			npcHandler:say('You don\'t have four parts of document.', cid)
		end
	elseif talk_state[cid] == 7 then
		npcHandler:say('{Congratulations}, now you can do the next mission!', cid)
		player:setStorageValue(Storage.Grave.Mission06, 4)
	elseif talk_state[cid] == 8 then
		if player:getItemCount(2176) >= 1 then 
			player:removeItem(2176,1)
			npcHandler:say('That\'s great, now I can bring back to life my friends. Now you can do next mission.', cid)
			player:setStorageValue(Storage.Grave.Mission07, 3)
		else
			npcHandler:say('You don\'t have my ball.', cid)
		end
	elseif talk_state[cid] == 9 then
			npcHandler:say("So you must defeat the great master of hell, {Hades}! He is stronger than ever, you must gather the strongest team in the {B-Rox World}! Take care of you, I will wait with impatient for you, good luck!", cid) 
			player:setStorageValue(Storage.Grave.Mission08, 1)
			player:setStorageValue(Storage.Grave.HadesDoor, 1)
	elseif msgcontains(msg, 'no') then
		npcHandler:say('Ok, then not.', cid)
	elseif msgcontains(msg, 'magic longsword') then
		npcHandler:say('Let the mystery remain a mystery.', cid)
	elseif msgcontains(msg, 'the count') then
		npcHandler:say('That traitor, who in life had done much harm. You must kill him.', cid)
	elseif msgcontains(msg, 'ring of the count') and player:getStorageValue(Storage.Grave.Special) == -1 then
		if player:getItemCount(8752) >= 1 then 
			player:removeItem(8752,1)
			doPlayerAddItem(cid,2390,1)
			player:setStorageValue(Storage.Grave.Special, 1)
			npcHandler:say('GREAT! GREAT!! You have found very important item for me! Keep it sword for reward! GREAT!', cid)
		end
	elseif msgcontains(msg, 'key') and player:getStorageValue(Storage.Grave.Questline) == 2 then
		if player:getStorageValue(Storage.Grave.Key) == -1 then
		local key = doPlayerAddItem(cid,2087,1)
		npcHandler:say('You lost key? Egh...', cid)	
		doSetItemActionId(key, 3031)
		player:setStorageValue(Storage.Grave.Key, 1)
		else
		npcHandler:say('Sorry no have more key...', cid)
	end
end	
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 