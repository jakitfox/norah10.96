local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 		npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Oldrak."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I can't help you, sorry!"})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A weapon of myth and legend. It was lost in ancient times ... perhaps lost forever."})
 
local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, 'mission') or msgcontains(msg, 'demon oak') then
		if player:getStorageValue(Storage.DemonOak.Done) == 1 then
			npcHandler:say("How do you know? Did you go into the infested area?", cid)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(Storage.DemonOak.Done) == 2 then
			npcHandler:say("You better don't return here until you've defeated the Demon Oak.", cid)
		elseif player:getStorageValue(Storage.DemonOak.Done) == 3 then
			-- Do Poprawki
			npcHandler:say({
				"You chopped down the demon oak?!? Unbelievable!! Let's hope it doesn't come back. As long as evil is still existent in the soil of the plains, it won't be over. Still, the demons suffered a setback, that's for sure. ...",
				"For your brave action, I tell you a secret which has been kept for many many years. There is an old house south of the location where you found the demon oak. There should be a grave with the name 'Yesim Adeit' somewhere close by. ...",
				"It belongs to a Daramian nobleman named 'Teme Saiyid'. I knew him well and he told me -almost augured- that someone will come who is worthy to obtain his treasure. I'm sure this 'someone' is you. Good luck in finding it!"
			}, cid)
			player:setStorageValue(Storage.DemonOak.Done, 4)
		end
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 1 then
		if player:getStorageValue(Storage.DemonOak.Done) == 1 then
			npcHandler:say("A demon oak?!? <mumbles some blessings> May the gods be on our side. You'll need a {hallowed axe} to harm that tree. Bring me a simple {axe} and I'll prepare it for you.",cid)
			player:setStorageValue(Storage.DemonOak.Done, 2)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("I don't believe a word of it! How rude to lie to a monk!",cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'axe') then
		if player:getStorageValue(Storage.DemonOak.Done) == 2 then
			npcHandler:say("Ahh, you've got an axe. Very good. I can make a hallowed axe out of it. It will cost you... er... a donation of 1,000 gold. Alright?",cid)
			npcHandler.topic[cid] = 2
		else
			npcHandler:say("You have to first talk about {demon oak} or the {mission} before we continue.",cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 2 then
		if player:getStorageValue(Storage.DemonOak.Done) == 2 then
			if player:getMoney() >= 1000 then
				if player:removeItem(2386, 1) and player:removeMoney(1000) then
					npcHandler:say("Let's see....<mumbles a prayer>....here we go. The blessing on this axe will be absorbed by all the demonic energy around here. I presume it will not last very long, so better hurry. Actually, I can refresh the blessing as often as you like.",cid)
					player:addItem(8293, 1)
					Npc():getPosition():sendMagicEffect(CONST_ME_YELLOWENERGY)
					npcHandler.topic[cid] = 0
				else
					npcHandler:say("There is no axe with you.",cid)
					npcHandler.topic[cid] = 0
				end
			else
				npcHandler:say("There is not enough of money with you.",cid)
				npcHandler.topic[cid] = 0
			end
		end
	elseif msgcontains(msg, 'no') and npcHandler.topic[cid] == 1 then
		npcHandler:say("What a pity! Let me know when you managed to get in there. Maybe I can help you when we know what we are dealing with.",cid)
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'no') and npcHandler.topic[cid] == 2 then
		npcHandler:say("No then.",cid)
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())