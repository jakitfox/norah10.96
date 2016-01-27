local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local shopItems = {
	["fire bug"] = {id = 5468, buy = 500, sell = 200, desc = 'fire bug'},
	["helmet of the deep"] = {id = 5461, buy = 5000, sell = 1500, desc = 'helmet of the deep'},
	["flask of rust remover"] = {id = 9930, buy = 50, desc = 'flask of rust remover'},
	["closed trap"] = {id = 2578, buy = 280, sell = 75, desc = 'closed trap'},
	["crowbar"] = {id = 2416, buy = 260, sell = 50, desc = 'crowbar'},
	["fishing rod"] = {id = 2580, buy = 150, sell = 40, desc = 'fishing rod'},
	["hammer"] = {id = 2557, buy = 80, desc = 'hammer'},
	["wooden hammer"] = {id = 2556, sell = 15, desc = 'wooden hammer'},
	["heavy machete"] = {id = 2442, sell = 90, desc = 'heavy machete'},
	["hoe"] = {id = 2552, buy = 15, desc = 'hoe'},
	["light shovel"] = {id = 5710, sell = 300, desc = 'light shovel'},
	["machete"] = {id = 2420, buy = 35, sell = 6, desc = 'machete'},
	["pick"] = {id = 2553, buy = 50, sell = 15, desc = 'pick'},
	["rope"] = {id = 2120, buy = 50, sell = 15, desc = 'rope'},
	["saw"] = {id = 2558, buy = 95, desc = 'saw'},
	["scythe"] = {id = 2550, buy = 50, sell = 10, desc = 'scythe'},
	["shovel"] = {id = 2554, buy = 50, sell = 8, desc = 'shovel'},
	["sickle"] = {id = 2405, buy = 7, sell = 3, desc = 'sickle'},
	["watch"] = {id = 2036, buy = 20, sell = 6, desc = 'watch'},
	["worm"] = {id = 3976, buy = 1, desc = 'worm'}
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