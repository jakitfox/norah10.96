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
----------------------START----------------------
if msgcontains(msg, 'enchanted chicken wing') or msgcontains(msg, 'enchanted chicken') or msgcontains(msg, 'wing') then
	npcHandler:say('Huumm... it\'s possible, just take me {boots of haste}, they have important part to make chicken wing. Did you have it with yourself?', cid)
	npcHandler.topic[cid] = 1
elseif msgcontains(msg, 'fighting spirit') or msgcontains(msg, 'spirit') then
	npcHandler:say('I have some {fighting spirits} in magazine. I can sell it by {two royal helmets}, I realy need it now. Trade?', cid)
	npcHandler.topic[cid] = 2
elseif msgcontains(msg, 'magic sulphur') or msgcontains(msg, 'sulphur')  then
	npcHandler:say('Did you have some fire items? To most I\'m needing {fire swords}, if you have {three} i can trade with you.', cid)
	npcHandler.topic[cid] = 3
elseif msgcontains(msg, 'warrior\'s sweat') or msgcontains(msg, 'flask') or msgcontains(msg, 'sweat') then
	npcHandler:say('It\'s rare item then prize is high. {Four warrior helmets}, are you accept it?', cid)
	npcHandler.topic[cid] = 4
	
------------------YES-------------------------------------	
elseif msgcontains(msg, 'yes') then
	if npcHandler.topic[cid] == 1 then
		if player:getItemCount(2195) >= 1 then
			npcHandler:say('I like business with you! Take this.', cid)
			player:removeItem(2195,1)
			player:addItem(5891,1)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say('Back when you have needing items!', cid)
		end
	elseif npcHandler.topic[cid] == 2 then
		if player:getItemCount(2498) >= 2 then
			npcHandler:say('I like business with you! Take this.', cid)
			player:removeItem(2498,2)
			player:addItem(5884,1)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say('Back when you have needing items!', cid)
		end
	elseif npcHandler.topic[cid] == 3 then
		if player:getItemCount(2392) >= 3 then
			npcHandler:say('I like business with you! Take this.', cid)
			player:removeItem(2392,3)
			player:addItem(5904,1)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say('Back when you have needing items!', cid)
		end
	elseif npcHandler.topic[cid] == 4 then
		if player:getItemCount(2475) >= 4 then
			npcHandler:say('I like business with you! Take this.', cid)
			player:removeItem(2475,4)
			player:addItem(5885,1)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say('Back when you have needing items!', cid)
		end
	end
elseif msgcontains(msg, 'no') or msgcontains(msg, 'nah') then
	npcHandler:say('Ohh... ok, maybe next time...', cid)
	npcHandler.topic[cid] = 0
end
----------------------END----------------------
return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
