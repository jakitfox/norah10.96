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

if msgcontains(msg, 'adventures') then
	if getPlayerStorageValue(cid, 9100) == -1 then
		npcHandler:say('Jęsli chcesz przezyc przygode {dołacz} do nas.', cid)
		talk_state[cid] = 1
elseif getPlayerStorageValue(cid, 9100) == 1 then
		npcHandler:say('Pospiesz sie moi bracia czekaja.', cid)
	end		
		
elseif msgcontains(msg, 'join') and talk_state[cid] == 1 then
		npcHandler:say('Doskonale udaj sie przez ten teleport do moich braci. Przyda im sie pomoc przy wykopaliskach.', cid)
		setPlayerStorageValue(cid,9100, 1)
		setPlayerStorageValue(cid,9101, 1)
		doPlayerAddItem(cid,18457,4)
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  