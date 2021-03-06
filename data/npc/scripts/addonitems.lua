local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)


	shopModule:addSellableItem({'shard'}, 7290, 2000, 'shard')
	shopModule:addSellableItem({'red dragon scale'}, 5882, 200, 'red dragon scale')
	shopModule:addSellableItem({'red dragon leather'}, 5948, 200, 'red dragon leather')
	shopModule:addSellableItem({'lizard scale'}, 5881, 120, 'lizard scale')
	shopModule:addSellableItem({'lizard leather'}, 5876, 150, 'lizard leather')
	shopModule:addSellableItem({'green dragon scale'}, 5920, 100, 'green dragon scale')
	shopModule:addSellableItem({'green dragon leather'}, 5877, 100, 'green dragon leather')
	shopModule:addSellableItem({'ape fur'}, 5883, 120, 'ape fur')
	shopModule:addSellableItem({'bat wing'}, 5894, 50, 'bat wing')
	shopModule:addSellableItem({'bear paw'}, 5896, 100, 'bear paw')
	shopModule:addSellableItem({'behemoth claw'}, 5930, 2000, 'behemoth claw')
	shopModule:addSellableItem({'bonelord eye'}, 5898, 80, 'bonelord eye')
	shopModule:addSellableItem({'chicken feather'}, 5890, 30, 'chicken feather')
	shopModule:addSellableItem({'demon dust'}, 5906, 300, 'demon dust')
	shopModule:addSellableItem({'dragon claw'}, 10020, 8000, 'dragon claw')
	shopModule:addSellableItem({'fish fin'}, 5895, 150, 'fish fin')
	shopModule:addSellableItem({'spider silk'}, 5879, 100, 'spider silk')
	shopModule:addSellableItem({'hardened bone'}, 5925, 70, 'hardened bone')
	shopModule:addSellableItem({'heaven blossom'}, 5921, 50, 'heaven blossom')
	shopModule:addSellableItem({'holy orchid'}, 5922, 90, 'holy orchid')
	shopModule:addSellableItem({'honeycomb'}, 5902, 40, 'honeycomb')
	shopModule:addSellableItem({'huge chunk of crude iron'}, 5892, 15000, 'huge chunk of crude iron')
	shopModule:addSellableItem({'iron ore'}, 5880, 500, 'iron ore')
	shopModule:addSellableItem({'lizard leather'}, 5876, 150, 'lizard leather')
	shopModule:addSellableItem({'lizard scale'}, 5881, 120, 'lizard scale')
	shopModule:addSellableItem({'minotaur leather'}, 5878, 80, '"minotaur leather')
	shopModule:addSellableItem({'nose ring'}, 5804, 2000, 'nose ring')
	shopModule:addSellableItem({'perfect behemoth fang'}, 5893, 250, 'perfect behemoth fang')
	shopModule:addSellableItem({'red dragon leather'}, 5948, 200, 'red dragon leather')
	shopModule:addSellableItem({'red dragon scale'}, 5882, 200, 'red dragon scale')
	shopModule:addSellableItem({'spool of yarn'}, 5886, 1000, 'spool of yarn')
	shopModule:addSellableItem({'turtle shell'}, 5899, 90, 'turtle shell')
	shopModule:addSellableItem({'vampire dust'}, 5905, 90, 'vampire dust')
	shopModule:addSellableItem({'wolf paw'}, 5899, 90, 'wolf paw')
	shopModule:addSellableItem({'blue piece of cloth'}, 5912, 200, 'blue piece of cloth')
	shopModule:addSellableItem({'brown piece of cloth'}, 5913, 100, 'brown piece of cloth')
	shopModule:addSellableItem({'green piece of cloth'}, 5910, 200, 'green piece of cloth')
	shopModule:addSellableItem({'red piece of cloth'}, 5911, 300, 'red piece of cloth')
	shopModule:addSellableItem({'white piece of cloth'}, 5909, 100, 'white piece of cloth')
	shopModule:addSellableItem({'yellow piece of cloth'}, 5914, 150, 'yellow piece of cloth')
	shopModule:addSellableItem({'enchanted chicken wing'}, 5891, 20000, 'enchanted chicken wing')
	shopModule:addSellableItem({'spirit container'}, 5884, 40000, 'spirit container')
	shopModule:addSellableItem({'magic sulphur'}, 5904, 8000, 'magic sulphur')
	shopModule:addSellableItem({'piece of draconian steel'}, 5889, 3000, 'piece of draconian steel')
	shopModule:addSellableItem({'piece of hell steel'}, 5888, 500, 'piece of hell steel')
	shopModule:addSellableItem({'piece of royal steel'}, 5887, 10000, 'piece of royal steel')
	shopModule:addSellableItem({'sniper gloves'}, 5875, 2000, 'sniper gloves')
	shopModule:addSellableItem({'soul stone'}, 5809, 6000, 'soul stone')
	shopModule:addSellableItem({'flask of warrior\'s sweat'}, 5885, 10000, 'flask of warrior\'s sweat')
	shopModule:addSellableItem({'royal tapestry'}, 9958, 1000, 'royal tapestry')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Welcome to my legal shop.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye, hope you might come back anytime to my legal shop.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Uhm... Hope you liked my legal shop...")
npcHandler:addModule(FocusModule:new())