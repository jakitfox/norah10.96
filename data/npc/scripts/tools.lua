local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()                        end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)
	--BUY--
	shopModule:addBuyableItem({'fire bug'}, 				5468, 500,		'fire bug')
	shopModule:addBuyableItem({'helmet of the deep'}, 		5461, 5000,		'helmet of the deep')
	shopModule:addBuyableItem({'flask of rust remover'}, 	9930, 50,		'flask of rust remover')
	shopModule:addBuyableItem({'closed trap'}, 				2578, 260,		'closed trap')
	shopModule:addBuyableItem({'crowbar'}, 					2416, 260,		'crowbar')
	shopModule:addBuyableItem({'fishing rod'}, 				2580, 150,		'fishing rod')
	shopModule:addBuyableItem({'hammer'}, 					2557, 80,		'hammer')
	shopModule:addBuyableItem({'hoe'}, 						2552, 15,		'hoe')
	shopModule:addBuyableItem({'machete'}, 					2420, 35,		'machete')
	shopModule:addBuyableItem({'pick'}, 					2553, 50,		'pick')
	shopModule:addBuyableItem({'rope'}, 					2120, 50,		'rope')
	shopModule:addBuyableItem({'saw'}, 						2558, 95,		'saw')
	shopModule:addBuyableItem({'scythe'}, 					2550, 50,		'scythe')
	shopModule:addBuyableItem({'shovel'}, 					2554, 50,		'shovel')
	shopModule:addBuyableItem({'sickle'}, 					2405, 7,		'sickle')
	shopModule:addBuyableItem({'watch'}, 					2036, 20,		'watch')
	shopModule:addBuyableItem({'worm'}, 					3976, 1,		'worm')
	
	
	--SELL--
	shopModule:addSellableItem({'fire bug'}, 			5468, 200,		'fire bug')
	shopModule:addSellableItem({'helmet of the deep'}, 	5461, 1500,		'helmet of the deep')
	shopModule:addSellableItem({'closed trap'}, 		2578, 50,		'closed trap')
	shopModule:addSellableItem({'crowbar'}, 			2416, 50,		'crowbar')
	shopModule:addSellableItem({'fishing rod'}, 		2580, 40,		'fishing rod')
	shopModule:addSellableItem({'wooden hammer'}, 		2556, 15,		'wooden hammer')
	shopModule:addSellableItem({'heavy machete'}, 		2442, 90,		'heavy machete')
	shopModule:addSellableItem({'light shovel'}, 		5710, 300,		'light shovel')
	shopModule:addSellableItem({'machete'}, 			2420, 6,		'machete')
	shopModule:addSellableItem({'pick'}, 				2553, 15,		'pick')
	shopModule:addSellableItem({'rope'}, 				2120, 15,		'rope')
	shopModule:addSellableItem({'scythe'}, 				2550, 10,		'scythe')
	shopModule:addSellableItem({'shovel'}, 				2554, 8,		'shovel')
	shopModule:addSellableItem({'sickle'}, 				2405, 3,		'sickle')
	shopModule:addSellableItem({'watch'}, 				2036, 6,		'watch')


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Welcome to my legal shop.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye, hope you might come back anytime to my legal shop.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Uhm... Hope you liked my legal shop...")
npcHandler:addModule(FocusModule:new())