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
local storage = {Storage.Doll.Tropy01, Storage.Doll.Tropy02,Storage.Doll.Tropy03, Storage.Doll.Tropy04, Storage.Doll.Tropy05, Storage.Doll.Tropy06, Storage.Doll.Tropy07, Storage.Doll.Tropy08}
local trophy = {10125,10126,10127,10128,10129,10130,10131,10132}
local doll = {9694,9695,9696,9697,9698,9699}	
	
if msgcontains(msg, 'trophys') or msgcontains(msg, 'trophy') or msgcontains(msg, 'mission') then
if player:getStorageValue(Storage.Doll.Mission01) == -1 then 
	if getPlayerLevel(cid) >= 25 then
		npcHandler:say('Why do you ask about the {trophy}? Would you want to {help} me in a case?', cid)
		talk_state[cid] = 1
	else
		npcHandler:say('You are too weak to do this mission', cid)	
	end
elseif player:getStorageValue(Storage.Doll.Mission01) == 1 then
	npcHandler:say('Have you found all the trophies?', cid)
	talk_state[cid] = 2		
elseif player:getStorageValue(Storage.Doll.Mission01) == 2 then
	npcHandler:say('Your mission is complete. Now you can claim your {prize}!', cid)
elseif player:getStorageValue(Storage.Doll.Mission01) == 3 then
	npcHandler:say('Your mission is complete.', cid)
end		
	
elseif msgcontains(msg, 'reward') or msgcontains(msg, 'prize') then
if player:getStorageValue(Storage.Doll.Mission01) == 2 then
	if player:getStorageValue(Storage.Doll.Tropy01) == 3 and player:getStorageValue(Storage.Doll.Tropy02) == 3 and player:getStorageValue(Storage.Doll.Tropy03) == 3 and player:getStorageValue(Storage.Doll.Tropy04) == 3 and player:getStorageValue(Storage.Doll.Tropy05) == 3 and player:getStorageValue(Storage.Doll.Tropy06) == 3 and player:getStorageValue(Storage.Doll.Tropy07) == 3 and player:getStorageValue(Storage.Doll.Tropy08) == 3 then
		npcHandler:say('You have give me all trophys. For {reward} I can give you blue robe, boots of haste and one 200000 expirence. Do you\'ll get it?', cid)	
		talk_state[cid] = 3
	else
		npcHandler:say('You don\'t give me all trophys!', cid)
	end		
elseif player:getStorageValue(Storage.Doll.Mission01) == 3 then	
	npcHandler:say('I gived you reward!', cid)	
end
------------------Gravedigger Quest----------------
elseif msgcontains(msg, 'fix jester doll') or msgcontains(msg, 'jester doll') or msgcontains(msg, 'fix doll') or msgcontains(msg, 'doll') then
    if player:getStorageValue(Storage.Grave.Mission04) == 1 then
		npcHandler:say('If you have all parts of doll I can repair it for you for free. Do it?', cid)
		talk_state[cid] = 4
end	
------------------------YES-------------------------		
elseif msgcontains(msg, 'help') or msgcontains(msg, 'yes') and talk_state[cid] == 1 then
	if player:getStorageValue(Storage.Doll.Mission01) == -1 then
		for i = 1, #storage do
			player:setStorageValue(storage[i],1)
		end
		npcHandler:say('Once time I created eight unique trophys. Trophys have been worth very much, so the trophys have become lickerish for a thief. All of my collection was stolen, and later for fear of being royal guard, hidden in {each of the cities}. Find it!', cid)
		player:setStorageValue(Storage.Doll.Mission01, 1)
	end
	
elseif msgcontains(msg, 'yes') and talk_state[cid] == 2 then
	if player:getItemCount(10125) >= 1 and player:getItemCount(10126) >= 1 and player:getItemCount(10127) >= 1 and player:getItemCount(10128) >= 1 and player:getItemCount(10129) >= 1 and player:getItemCount(10130) >= 1 and player:getItemCount(10131) >= 1 and player:getItemCount(10132) >= 1 then
			for a = 1, #trophy do
				player:removeItem(trophy[a], 1)
			end
			for i = 1, #storage do
			player:setStorageValue(storage[i],3)
			end
				player:setStorageValue(Storage.Doll.Mission01, 2)
				npcHandler:say('You have given me all trophies. I give you {reward}!', cid)
			else
				npcHandler:say('Sorry, You don\'t have all trophy.', cid)
	end
elseif talk_state[cid] == 3 and player:getStorageValue(Storage.Doll.Mission01) == 2 then
	if player:getStorageValue(Storage.Doll.Tropy01) == 3 and player:getStorageValue(Storage.Doll.Tropy02) == 3 and player:getStorageValue(Storage.Doll.Tropy03) == 3 and player:getStorageValue(Storage.Doll.Tropy04) == 3 and player:getStorageValue(Storage.Doll.Tropy05) == 3 and player:getStorageValue(Storage.Doll.Tropy06) == 3 and player:getStorageValue(Storage.Doll.Tropy07) == 3 and player:getStorageValue(Storage.Doll.Tropy08) == 3 then
					npcHandler:say('Thank for all! Good Luck!', cid)
					doPlayerAddItem(cid,2656,1)
					doPlayerAddItem(cid,2195,1)
					Player(cid):addExperience(200000, true)
					player:setStorageValue(Storage.Doll.Mission01, 3)
				end
elseif talk_state[cid] == 4 then
		if player:getItemCount(9694) >= 1 and player:getItemCount(9695) >= 1 and player:getItemCount(9696) >= 1 and player:getItemCount(9697) >= 1 and player:getItemCount(9698) >= 1 and player:getItemCount(9699) >= 1 then
			for b = 1, #doll do
				player:removeItem(doll[b], 1)
			end			
			player:setStorageValue(Storage.Grave.Mission04, 2)
			doPlayerAddItem(cid,9693,1)
			npcHandler:say('Now it\'s fine!', cid)
		else
			npcHandler:say('You don\'t give me all parts of doll.', cid)
		end	
elseif msgcontains(msg, 'no') then
		npcHandler:say('Ok, then not.', cid)	
end	
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  