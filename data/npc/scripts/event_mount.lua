local table = { 
	["armoured war horse"] = {price = 700, id = 23}, 
	["desert king"] = {price = 450, id = 41}, 
	["jade lion"] = {price = 450, id = 48}, 
	["winter king"] = {price = 450, id = 52}, 
	["jade pincer"] = {price = 550, id = 49}, 
	["death crawler"] = {price = 550, id = 46}, 
	["tombstinger"] = {price = 550, id = 36}, 
	["copper fly"] = {price = 600, id = 61}, 
	["golden dragonfly"] = {price = 600, id = 59}, 
	["steel bee"] = {price = 600, id = 60}, 
	["black stag"] = {price = 660, id = 73}, 
	["emperor deer"] = {price = 660, id = 74},
	["shadow hart"] = {price = 660, id = 72},
	["blackpelt"] = {price = 690, id = 58},
	["poisonbane"] = {price = 690, id = 57},
	["siegebreaker"] = {price = 690, id = 56},
	["emerald waccoon"] = {price = 750, id = 70},
	["night waccoon"] = {price = 750, id = 69},
	["ringtail waccoon"] = {price = 750, id = 68},
	["glacier vagabond"] = {price = 750, id = 64},
	["highland yak"] = {price = 750, id = 63},
	["tundra rambler"] = {price = 750, id = 62},
	["doombringer"] = {price = 800, id = 53},
	["hailtorm fury"] = {price = 800, id = 55},
	["woodland prince"] = {price = 800, id = 54},
	["flamesteed"] = {price = 900, id = 47},
	["nethersteed"] = {price = 900, id = 50},
	["tempest"] = {price = 900, id = 51},
	["floating kashmir"] = {price = 900, id = 67},
	["flying divan"] = {price = 900, id = 65},
	["magic carpet"] = {price = 900, id = 66},
	["ladybug"] = {price = 1000, id = 27}
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
		npcHandler:say('To get {'..msg..'}, you need {'..v.price..'} Event Tokens. Do you have it?', cid)
		npcHandler.topic[cid] = 1
		xmsg = msg
		
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 1 then
	local v = table[xmsg]
	if not player:hasMount(v.id) then 
		if player:getItemCount(24115) >= v.price then
			npcHandler:say('There you go!', cid)
			player:removeItem(24115,v.price)
			player:addMount(v.id)
		else
			npcHandler:say('Good man, you don\'t have enough Event Tokens', cid)
		end
	else
			npcHandler:say('You already have this mount!', cid)
	end
end
return true 
end 

keywordHandler:addKeyword({'mount'}, StdModule.say, {npcHandler = npcHandler, text = 'In my offer you will find {common}, {average} and {rare} mounts.'})
keywordHandler:addKeyword({'common'}, StdModule.say, {npcHandler = npcHandler, text = 'You can choose from this list: {desert king}, {jade lion}, {winter king}, {jade pincer}, {death crawler}, {tombstinger}, {copper fly}, {golden dragonfly}, {steel bee}.'})
keywordHandler:addKeyword({'average'}, StdModule.say, {npcHandler = npcHandler, text = 'You can choose from this list: {armoured war horse}, {black stag}, {emperor deer}, {shadow hart}, {blackpelt}, {poisonbane}, {siegebreaker}, {emerald waccoon}, {night waccoon}, {ringtail waccoon}, {glacier} {vagabond}, {highland yak}, {tundra rambler}.'})
keywordHandler:addKeyword({'rare'}, StdModule.say, {npcHandler = npcHandler, text = 'You can choose from this list: {doombringer}, {hailtorm fury}, {woodland prince}, {flamesteed}, {nethersteed}, {tempest}, {floating kashmir}, {flying divan}, {magic carpet}, {ladybug}.'})

npcHandler:setMessage(MESSAGE_WALKAWAY, 'Um yeah, good day.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Farewell, I hope you were satisfied with our service.')
npcHandler:setMessage(MESSAGE_GREET, 'Hello, |PLAYERNAME|! Just say {mount} if you are intrested!')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)  
npcHandler:addModule(FocusModule:new())