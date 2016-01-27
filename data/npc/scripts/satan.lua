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
			npcHandler:say('Why do you ask about the satan?  Maybe you would to {kill} boss of hell?', cid)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(Storage.Satan.Mission01) == 1 then 
			npcHandler:say('I told you... Go and find {ceremonial ankh} in Mothrim!', cid)
		elseif player:getStorageValue(Storage.Satan.Mission01) == 3 then 
			npcHandler:say('If you kill satan I give you {reward}.', cid)
	end
			
	elseif msgcontains(msg, 'kill') and npcHandler.topic[cid] == 1 then
		if player:getStorageValue(Storage.Satan.Mission01) == -1 then
			npcHandler:say('You\'re hero? You\'re funny! But if you ask... I can talk you. On first you must get {ceremonial ankh} to entrance hell. Go and find it! I can talk you that is under {magical room} in Mothrim.', cid)
			player:setStorageValue(Storage.Satan.Questline, 1)
			player:setStorageValue(Storage.Satan.Mission01, 1)
		end
	
	elseif msgcontains(msg, 'ceremonial ankh') then
    		if player:getStorageValue(Storage.Satan.Mission01) == 1 then
			npcHandler:say('If you\'ll entrance to hell you must get it!', cid)
		elseif player:getStorageValue(Storage.Satan.Mission01) == 2 then
			npcHandler:say('Great! You have a ceremonial ankh! Now you can go to {hell}! Go to hell entrance and use it on {woman on ankh}. If you kill {satan} I give you reward.', cid)
			player:setStorageValue(Storage.Satan.Mission01, 3)
		elseif player:getStorageValue(Storage.Satan.Mission01) == 3 then
			npcHandler:say('Go to hell entrance and use {ceremonial ankh} on {woman on ankh}. If you kill satan I give you {reward}.', cid)
		end
		
	
	elseif msgcontains(msg, 'reward') then
		if player:getStorageValue(Storage.Satan.Zugurosh) == 2 and player:getStorageValue(Storage.Satan.Ushuriel) == 2 and player:getStorageValue(Storage.Satan.Golgordan) == 2 and player:getStorageValue(Storage.Satan.Annihilion) == 2 and player:getStorageValue(Storage.Satan.Madareth) == 2 and player:getStorageValue(Storage.Satan.Latrivan) == 2 and player:getStorageValue(Storage.Satan.Hellgorak) == 2 then
		if player:getStorageValue(Storage.Satan.RewardWEAPON) == 1 then
				npcHandler:say('Fanastic! You kill {satan}! Good job!', cid)
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