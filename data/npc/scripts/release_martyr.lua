local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
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
	
	if msgcontains(msg, "mission") then
		if player:getStorageValue(Storage.Grave.Mission04) == 3 and player:getStorageValue(Storage.Grave.Mission05) == -1 then
			npcHandler:say("In morning, last night my husband was kidnap by one of the mistic Pharaoh. Do you help me to save him?", cid)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(Storage.Grave.Mission05) == 3 then
			npcHandler:say("Is my husband all right?.", cid)
			npcHandler.topic[cid] = 2
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say("I'm waiting, please come back with him. Ask Pharaoh for more information, maybe he know more than me.", cid)
			player:setStorageValue(Storage.Grave.Mission05, 1)
		end
	elseif msgcontains(msg, "no") then
		if npcHandler.topic[cid] == 2 then
			npcHandler:say("No, no! I hate this evil creature, I will get one\'s revenge on him! But you did your mission, so you can do next.", cid)
			player:setStorageValue(Storage.Grave.Mission05, 4)
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  