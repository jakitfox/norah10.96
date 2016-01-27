local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local shopItems = {
	["ape fur"] = {id = 5883, sell = 120, desc = 'ape fur'},
	["bat wing"] = {id = 5894, sell = 50, desc = 'bat wing'},
	["bear paw"] = {id = 5896, sell = 100, desc = 'bear paw'},
	["behemoth claw"] = {id = 5930, sell = 2000, desc = 'behemoth claw'},
	["bonelord eye"] = {id = 5898, sell = 80, desc = 'bonelord eye'},
	["chicken feather"] = {id = 5890, sell = 30, desc = 'chicken feather'},
	["demon dust"] = {id = 5906, sell = 300, desc = 'demon dust'},
	["dragon claw"] = {id = 10020, sell = 8000, desc = 'dragon claw'},
	["fish fin"] = {id = 5895, sell = 150, desc = 'fish fin'},
	["spider silk"] = {id = 5879, sell = 100, desc = 'spider silk'},
	["hardened bone"] = {id = 5925, sell = 70, desc = 'hardened bone'},
	["heaven blossom"] = {id = 5921, sell = 50, desc = 'heaven blossom'},
	["holy orchid"] = {id = 5922, sell = 90, desc = 'holy orchid'},
	["honeycomb"] = {id = 5902, sell = 40, desc = 'honeycomb'},
	["huge chunk of crude iron"] = {id = 5892, sell = 15000, desc = 'huge chunk of crude iron'},
	["iron ore"] = {id = 5880, sell = 500, desc = 'iron ore'},
	["lizard leather"] = {id = 5876, sell = 150, desc = 'lizard leather'},
	["lizard scale"] = {id = 5881, sell = 120, desc = 'lizard scale'},
	["minotaur leather"] = {id = 5878, sell = 80, desc = 'minotaur leather'},
	["nose ring"] = {id = 5804, sell = 2000, desc = 'nose ring'},
	["perfect behemoth fang"] = {id = 5893, sell = 250, desc = 'perfect behemoth fang'},
	["red dragon leather"] = {id = 5948, sell = 200, desc = 'red dragon leather'},
	["red dragon scale"] = {id = 5882, sell = 200, desc = 'red dragon scale'},
	["spool of yarn"] = {id = 5886, sell = 1000, desc = 'spool of yarn'},
	["turtle shell"] = {id = 5899, sell = 90, desc = 'turtle shell'},
	["vampire dust"] = {id = 5905, sell = 100, desc = 'vampire dust'},
	["wolf paw"] = {id = 5897, sell = 70, desc = 'wolf paw'},
	["blue piece of cloth"] = {id = 5912, sell = 200, desc = 'blue piece of cloth'},
	["brown piece of cloth"] = {id = 5913, sell = 100, desc = 'brown piece of cloth'},
	["green piece of cloth"] = {id = 5910, sell = 200, desc = 'green piece of cloth'},
	["red piece of cloth"] = {id = 5911, sell = 300, desc = 'red piece of cloth'},
	["white piece of cloth"] = {id = 5909, sell = 100, desc = 'white piece of cloth'},
	["yellow piece of cloth"] = {id = 5914, sell = 150, desc = 'yellow piece of cloth'},
	["enchanted chicken wing"] = {id = 5891, sell = 20000, desc = 'enchanted chicken wing'},
	["spirit container"] = {id = 5884, sell = 40000, desc = 'spirit container'},
	["magic sulphur"] = {id = 5904, sell = 8000, desc = 'magic sulphur'},
	["piece of draconian steel"] = {id = 5889, sell = 3000, desc = 'piece of draconian steel'},
	["piece of hell steel"] = {id = 5888, sell = 500, desc = 'piece of hell steel'},
	["piece of royal steel"] = {id = 5887, sell = 10000, desc = 'piece of royal steel'},
	["sniper gloves"] = {id = 5875, sell = 2000, desc = 'sniper gloves'},
	["soul stone"] = {id = 5809, sell = 6000, desc = 'soul stone'},
	["flask of warrior's sweat"] = {id = 5885, sell = 10000, desc = 'flask of warrior's sweat'},
	["royal tapestry"] = {id = 9958, buy = 560, sell = 1000, desc = 'royal tapestry'}
	}
	
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

if type(shopItems) == "table" then
    for name, v in pairs(shopItems) do
        shopModule:addBuyableItem({name}, shopItems[name].id, shopItems[name].buy, name)
        shopModule:addSellableItem({name, name}, shopItems[name].id, shopItems[name].sell, shopItems[name].desc)
    end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Welcome to my legal shop.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye, hope you might come back anytime to my legal shop.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Uhm... Hope you liked my legal shop...")
npcHandler:addModule(FocusModule:new())