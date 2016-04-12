local table = { 
	["champion"] = {name = "Champion", male = 633, female = 632, storage = 3900, outfit = 390, storage1 = 3901 }, 
	["conjurer"] = {name = "Conjurer", male = 634, female = 635, storage = 3902, outfit = 540, storage1 = 3903 },
	["beastmaster"] = {name = "Beastmaster", male = 637, female = 636, storage = 3904, outfit = 690, storage1 = 3905 },
	["chaos acolyte"] = {name = "Chaos Acolyte", male = 665, female = 664, storage = 3906, outfit = 720, storage1 = 3907 },
	["death herald"] = {name = "Death Herald", male = 667, female = 666, storage = 3908, outfit = 420, storage1 = 3909 },
	["ranger"] = {name = "Ranger", male = 684, female = 683, storage = 3910, outfit = 570, storage1 = 3911 },
	["ceremonial garb"] = {name = "Ceremonial Garb", male = 695, female = 694, storage = 3912, outfit = 570, storage1 = 3913 },
	["puppeteer"] = {name = "Puppeteer", male = 697, female = 696, storage = 3914, outfit = 690, storage1 = 3915 },
	["spirit caller"] = {name = "Spirit Caller", male = 699, female = 698, storage = 3916, outfit = 420, storage1 = 3917 }
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
	
	local v = table[msg]
    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	local player = Player(cid)
	
    if(not npcHandler:isFocused(cid)) then
        return false
    end
	
	if v then
		if player:getStorageValue(v.storage) == -1 then
			npcHandler:say('To get {'..v.name..'} outfit, you need {'..v.outfit..'} Event Tokens. Do you have it?', cid)
			npcHandler.topic[cid] = 1
			else
			npcHandler:say('So, {'..msg..'} outfit. Which addon, {first} or {second}?', cid)
			npcHandler.topic[cid] = 2
		zmsg = msg
	end
	zmsg = msg
	
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 1 then
	local v = table[zmsg]
		if player:getStorageValue(v.storage) == -1 then 
			if player:getItemCount(24115) >= v.outfit then
				player:addOutfitAddon(v.male)
				player:addOutfitAddon(v.female)
				player:removeItem(24115,v.outfit)
				player:setStorageValue(v.storage,1)
			else
				npcHandler:say('Good man, you don\'t have enough Event Tokens', cid)
			end
		else
			npcHandler:say('You already have this mount!', cid)
		end
	
	elseif npcHandler.topic[cid] == 2 and msgcontains(msg, "first") or msgcontains(msg, "second") then
	local v = table[zmsg]
        if msgcontains(msg, "first") then
           npcHandler:say('Would you like to exchange: {120 Event Tokens} for first {'..v.name..'} addon?', cid)
		   npcHandler.topic[cid] = 3
        elseif msgcontains(msg, "second") then
            npcHandler:say('Would you like to exchange: {120 Event Tokens} for second {'..v.name..'} addon?', cid)
			npcHandler.topic[cid] = 4
       end
	
	elseif npcHandler.topic[cid] == 3 then
	local v = table[zmsg]
		if player:getStorageValue(v.storage) == 1 then
			if player:getItemCount(24115) >= 120 then
				npcHandler:say('There you go!', cid)
				player:addOutfitAddon(v.male, 1)
				player:addOutfitAddon(v.female, 1)
				player:removeItem(24115,120)
				player:setStorageValue(v.storage,2)
			else 
				npcHandler:say('Good man, you don\'t have enough Event Tokens', cid)
				end
			else 
			npcHandler:say('You already have this addon.', cid)
	end	
	
	elseif npcHandler.topic[cid] == 4 then
	local v = table[zmsg]
		if player:getStorageValue(v.storage1) == -1 then
			if player:getItemCount(24115) >= 120 then
				npcHandler:say('There you go!', cid)
				player:addOutfitAddon(v.male, 2)
				player:addOutfitAddon(v.female, 2)
				player:removeItem(24115,120)
				player:setStorageValue(v.storage,1)
			else 
				npcHandler:say('Good man, you don\'t have enough Event Tokens', cid)
			end
			else 
			npcHandler:say('You already have this addon.', cid)
		end
end
return true 
end 

keywordHandler:addKeyword({'addon'}, StdModule.say, {npcHandler = npcHandler, text = 'You can choose from this list: {champion}, {conjurer}, {beastmaster}, {chaos acolyte}, {death herald}, {ranger}, {ceremonial garb}, {spirit caller}.'})

npcHandler:setMessage(MESSAGE_WALKAWAY, 'Um yeah, good day.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Farewell, I hope you were satisfied with our service.')
npcHandler:setMessage(MESSAGE_GREET, 'Hello, |PLAYERNAME|! Just say {addon} if you are intrested!')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)  
npcHandler:addModule(FocusModule:new())