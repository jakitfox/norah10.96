local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
local player = Player(cid)	
    		
	if msgcontains(msg, 'job') and player:getStorageValue(Storage.Club.QuestLine) == -1 then
		npcHandler:say('Why do you ask about my job? I am the head of the {club seekers and travelers}. Our club sponsors {B-Rox King}. Would you like to join us?', cid)
		npcHandler.topic[cid] = 0
	
	elseif msgcontains(msg, 'join') and player:getStorageValue(Storage.Club.QuestLine) == -1 then
		npcHandler:say('Do you want to join our club prospectors and travelers?', cid)
		npcHandler.topic[cid] = 1
	
	elseif msgcontains(msg, 'roc feather') and player:getStorageValue(Storage.Club.QuestLine) == 1 and player:getStorageValue(cid,Storage.Club.Reward01) == -1 then
		npcHandler:say('This pen, which was stolen from the royal treasury for many years. If you\'ve ever hit it necessary to return the pen with him to me, and the king will surely find you a prize. Or maybe you\'ve it already, since you ask?', cid)
		npcHandler.topic[cid] = 2
		
	elseif msgcontains(msg, 'elane\'s crossbow') and player:getStorageValue(Storage.Club.QuestLine) == 1 then
		if player:getPlayerStorageValue(Storage.Club.Reward02) == -1 then
			npcHandler:say('Hmm ... Are you interested in {Elane\'s Crossbow}? You can arrange this, but you have to bring me, {five other distance weapons}.', cid)
			player:setStorageValue(Storage.Club.Reward02,1)
			
	elseif player:getStorageValue(Storage.Club.Reward02) == 1 then
			npcHandler:say('Do you have all items?', cid)
			npcHandler.topic[cid] = 3
	end
		
	elseif msgcontains(msg, 'ester') or msgcontains(msg, 'coloured egss') and player:getStorageValue(Storage.Club.QuestLine) == 1 then
		npcHandler:say('If you bring me {100 coloured egss} of all types I give you special reward! Are you have eggs with yourself?', cid)
		npcHandler.topic[cid] = 4
		
	elseif msgcontains(msg, 'dark lords cape') and player:getStorageValue(Storage.Club.QuestLine) == 1 then
		if player:getPlayerStorageValue(Storage.Club.Reward03) == -1 then
			npcHandler:say('If you wan\'t to get {Dark Lord\'s Cape} bring me {200 black hoods}, {50 badger fur} and {350 dark rosary}.', cid)
			player:setStorageValue(Storage.Club.Reward03,1)
			
		elseif player:getStorageValue(Storage.Club.Reward03) == 1 then
			npcHandler:say('Do you have all items?', cid)
			npcHandler.topic[cid] = 5
	end
		
	elseif msgcontains(msg, 'molten plate') and player:getStorageValue(Storage.Club.QuestLine) == 1 then
		if player:getStorageValue(Storage.Club.Reward04) == -1 then
			npcHandler:say('If you wan\'t to get {Molten Plate} bring me {300 high guard flag}, {300 legionnaire flag} and {100 Petrified Scream}.', cid)
			player:setStorageValue(Storage.Club.Reward04,1)
			
		elseif player:getStorageValue(Storage.Club.Reward04) == 1 then
			npcHandler:say('Do you have all items?', cid)
			npcHandler.topic[cid] = 6
	end
		
	elseif msgcontains(msg, 'robe of the underworld') and player:getStorageValue(Storage.Club.QuestLine) == 1 then
		if player:getStorageValue(Storage.Club.Reward05) == -1 then
			npcHandler:say('If you wan\'t to get {Robe of the Underworld} bring me {100 Book of Necromantic Rituals} and {400 Spiked Iron Ball}.', cid)
			player:setStorageValue(Storage.Club.Reward05,1)
			
		elseif player:getStorageValue(Storage.Club.Reward05) == 1 then
			npcHandler:say('Do you have all items?', cid)
			npcHandler.topic[cid] = 7
	end
		
	elseif msgcontains(msg, 'velvet mantle') and player:getStorageValue(Storage.Club.QuestLine) == 1 then
		if player:getStorageValue(Storage.Club.Reward06) == -1 then
			npcHandler:say('If you wan\'t to get {Velvet Mantle} bring me {450 winged tail}, {450 snake skin} and {400 boggy dreads}.', cid)
			player:setStorageValue(Storage.Club.Reward06,1)
			
		elseif player:getStorageValue(Storage.Club.Reward06) == 1 then
			npcHandler:say('Do you have all items?', cid)
			npcHandler.topic[cid] = 8
	end
		
	elseif msgcontains(msg, 'final') or msgcontains(msg, 'reward') then
		if  player:getStorageValue(Storage.Club.Final) == -1 and  player:getStorageValue(Storage.Club.Reward01) == 1  and  player:getStorageValue(Storage.Club.Reward02) == 2 and  player:getStorageValue(Storage.Club.Reward03) == 2 and  player:getStorageValue(Storage.Club.Reward04) == 2 and  player:getStorageValue(Storage.Club.Reward05) == 2 and  player:getStorageValue(Storage.Club.Reward06) == 2 then
			npcHandler:say('Yes, it\'s final, I don\'t have more mission for you, now we can say myself good bye. Take this reward for good future!', cid)
			player:addItem(9971,50)
			player:addItem(2408,1)
			player:setStorageValue(Storage.Club.Final,1)
		end	
		
---------------------YES---------------------------------------------------
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then
			npcHandler:say('So welcome in the team! I hope that together we will {discover many interesting places and objects}. If you find something back to me, and I\'ll see what it can be more work.', cid)
			player:setStorageValue(Storage.Club.QuestLine)
			npcHandler.topic[cid] = 0
			
	elseif npcHandler.topic[cid] == 2 then
		if player:getItemCount(2366) >= 1 then
			player:removeItem(2366,1) 
			npcHandler:say('{Fantastic}! The king will be proud of your making! As a reward I can offer {Master Archer\'s Armor}.', cid)
			player:addItem(8888,1) 
			player:setStorageValue(Storage.Club.Reward01, 1)
			else
		npcHandler:say('Sorry but you don\'t have all items!', cid)
	end
			
	elseif npcHandler.topic[cid] == 3 then
		if player:getItemCount(8854) >= 1 and player:getItemCount(8857) >= 1 and player:getItemCount(8851) >= 1 and player:getItemCount(8853) >= 1 and player:getItemCount(8855) >= 1 then
			player:removeItem(8854,1)
			player:removeItem(8857,1) 
			player:removeItem(8851,1) 
			player:removeItem(8853,1) 
			player:removeItem(8855,1)
			npcHandler:say('Great! Transactions with you is a pure pleasure.', cid)
			player:addItem(5947,1) 
			player:setStorageValue(Storage.Club.Reward02, 2)
		else
			npcHandler:say('Sorry but you don\'t have all items!', cid)
	end
			
	elseif npcHandler.topic[cid] == 4 then
		if player:getItemCount(6541) >= 100 and player:getItemCount(6542) >= 100 and player:getItemCount(6543) >= 100 and player:getItemCount(6544) >= 100 and player:getItemCount(6545) >= 100 then
			player:removeItem(6541,100)
			player:removeItem(6542,100)
			player:removeItem(6543,100)
			player:removeItem(6544,100)
			player:removeItem(6545,100)
			player:addItem(10523,1)
			npcHandler:say('Take this!', cid)
		else
			npcHandler:say('Sorry but you don\'t have all types of eggs!', cid)
	end
			
	elseif npcHandler.topic[cid] == 5 then
		if player:getItemCount(10562) >= 200 and player:getItemCount(11216) >= 50 and player:getItemCount(11220) >= 350 then
			player:removeItem(10562,200)
			player:removeItem(11216,50)
			player:removeItem(11220,350)
			player:setStorageValue(Storage.Club.Reward03,2)
			player:addItem(8865,1)
			npcHadler:say('You have done well! Take this reward.', cid)
		else
			npcHandler:say('Sorry but you don\'t have all items!', cid)
	end
			
	elseif npcHandler.topic[cid] == 6 then
		if player:getItemCount(11332) >= 300 and player:getItemCount(11334) >= 300 and player:getItemCount(11337) >= 150 then
			player:removeItem(11332,300)
			player:removeItem(11334,300)
			player:removeItem(11337,150)
			player:setStorageValue(Storage.Club.Reward04,2)
			player:addItem(8886,1)
			npcHadler:say('You have done well! Take this reward.', cid)
		else
			npcHandler:say('Sorry but you don\'t have all items!', cid)
	end
			
	elseif npcHandler.topic[cid] == 7 then
		if player:getItemCount(11237) >= 100 and player:getItemCount(11325) >= 400 then
			player:removeItem(11237,100)
			player:removeItem(11325,400)
			player:setStorageValue(Storage.Club.Reward05,2)
			player:addItem(8890,1)
			npcHadler:say('You have done well! Take this reward.', cid)
		else
			npcHandler:say('Sorry but you don\'t have all items!', cid)
	end
			
	elseif npcHandler.topic[cid] == 8 then
		if player:getItemCount(10584) >= 400 and player:getItemCount(11230) >= 450 and player:getItemCount(10611) >= 450 then
			player:removeItem(10584,400)
			player:removeItem(11230,450)
			player:removeItem(10611,450)
			player:setStorageValue(Storage.Club.Reward06,2)
			player:addItem(8868,1)
			npcHadler:say('You have done well! Take this reward.', cid)
		else
			npcHandler:say('Sorry but you don\'t have all items!', cid)
	end
	end
		
	elseif msgcontains(msg, 'no') then
		npcHandler:say('Ok, then not.', cid)
		npcHandler.topic[cid] = 0
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())