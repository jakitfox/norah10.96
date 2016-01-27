local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local shopItems = {
	["black pearl"] = {id = 2144, buy = 560, sell = 280, desc = 'black pearl'},
	["blue crystal shard"] = {id = 18413, sell = 1500, desc = 'blue crystal shard'},
	["blue crystal splinter"] = {id = 18418, sell = 400, desc = 'blue crystal splinter'},
	["blue gem"] = {id = 2158, sell = 5000, desc = 'blue gem'},
	["brown crystal splinter"] = {id = 18417, sell = 400, desc = 'brown crystal splinter'},
	["Countess Sorrow's frozen tear"] = {id = 6536, sell = 50000, desc = 'Countess Sorrow\'s frozen tear'},
	["crystal wand"] = {id = 2184, sell = 1000, desc = 'crystal wand'},
	["crystal of balance"] = {id = 9942, sell = 1000, desc = 'crystal of balance'},
	["crystal of focus"] = {id = 9941, sell = 2000, desc = 'crystal of focus'},
	["crystal of power"] = {id = 9980, sell = 3000, desc = 'crystal of power'},
	["cyan crystal fragment"] = {id = 18419, sell = 800, desc = 'cyan crystal fragment'},
	["emerald bangle"] = {id = 2127, sell = 800, desc = 'emerald bangle'},
	["giant shimmering pearl"] = {id = 7632, sell = 3000, desc = 'giant shimmering pearl'},
	["giant shimmering pearl2"] = {id = 7633, sell = 3000, desc = 'giant shimmering pearl'},
	["green crystal fragment"] = {id = 18421, sell = 800, desc = 'green crystal fragment'},
	["green crystal shard"] = {id = 18415, sell = 1500, desc = 'green crystal shard'},
	["green crystal splinter"] = {id = 18416, sell = 400, desc = 'green crystal splinter'},
	["green gem"] = {id = 2155, sell = 5000, desc = 'green gem'},
	["orichalcum pearl"] = {id = 5022, buy = 80, desc = 'orichalcum pearl'},
	["red crystal fragment"] = {id = 18420, sell = 800, desc = 'red crystal fragment'},
	["red gem"] = {id = 2156, sell = 1000, desc = 'red gem'},
	["scarab coin"] = {id = 2159, sell = 100, desc = 'scarab coin'},
	["silver brooch"] = {id = 2134, sell = 150, desc = 'silver brooch'},
	["small amethyst"] = {id = 2150, buy = 400, sell = 200, desc = 'small amethyst'},
	["small diamond"] = {id = 2145, buy = 600, sell = 300, desc = 'small diamond'},
	["small emerald"] = {id = 2149, buy = 500, sell = 250, desc = 'small emerald'},
	["small ruby"] = {id = 2147, buy = 500, sell = 250, desc = 'small ruby'},
	["small sapphire"] = {id = 2146, buy = 500, sell = 250, desc = 'small sapphire'},
	["small topaz"] = {id = 9970, sell = 200, desc = 'small topaz'},
	["gold ingot"] = {id = 9971, sell = 5000, desc = 'gold ingot'},
	["vampire's cape chain"] = {id = 21244, sell = 150, desc = 'vampire\'s cape chain'},
	["violet crystal shard"] = {id = 18414, sell = 1500, desc = 'violet crystal shard'},
	["violet gem"] = {id = 2153, sell = 10000, desc = 'violet gem'},
	["white pearl"] = {id = 2143, buy = 320, sell = 160, desc = 'white pearl'},
	["yellow gem"] = {id = 2154, sell = 1000, desc = 'yellow gem'}
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