local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local talk_state = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg) 		npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink() 							npcHandler:onThink() 						end


function creatureSayCallback(cid, type, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

local function GhazFinal()
setGlobalStorageValue(Storage.Ruiny.Final,-1)
end	
	
	-- GREET
	if (msg == "hi" or msg == "hello") and (not npcHandler:isFocused(cid)) then
		if getGlobalStorageValue(Storage.Ruiny.Final) == -1 then
		npcHandler:say("Maybe you managed to get here but it will be your end!", cid)
		Game.createMonster("Gaz'haragoth", Position(118,380,14))
		setGlobalStorageValue(Storage.Ruiny.Final,1)
		addEvent(GhazFinal, 2*60*60*1000) -- 2h
		else
			npcHandler:say("Harrrrk! You think you are strong now? You shall never escape my wrath! I am immortal!", cid)
			npcHandler:addFocus(cid)
		end
	end
	-- GREET

	if(not npcHandler:isFocused(cid)) then
		return false
	end
	
	if (msgcontains(msg, "bye") or msgcontains(msg, "farewell")) then
		npcHandler:say("We will meet again.", cid)
		talkState[talkUser] = 0
		npcHandler:releaseFocus(cid)
	end
	return true
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)