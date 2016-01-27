local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
local player = Player(cid)
    if(not npcHandler:isFocused(cid)) then
        return false
    end

if msgcontains(msg, 'spool of yarn') or msgcontains(msg, 'spool') or msgcontains(msg, 'yarn') then
	npcHandler:say('Good man, my wonderful hands can make high quality {spool of yarn}, just bring me ten {spider silk}. Do you have it with yourself?', cid)
	npcHandler.topic[cid] = 1
	
	
elseif msgcontains(msg, 'yes') then
	if npcHandler.topic[cid] == 1 then
		if player:getItemCount(5879) >= 10 then
			npcHandler:say('Just wait one minute... it\'s very painstaking work... oh, it\'s done. Take this and I invite you in future.', cid)
			player:removeItem(5879,10)
			player:addItem(5886,1)
		else
			npcHandler:say('Good man, you don\'t have all ten spider silks! I can\'t do whatever if you don\'t bring all items.', cid)
		end
	else
		npcHandler:say('Sorry, what? I didn\'t hear you.', cid)
	end
end

return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
