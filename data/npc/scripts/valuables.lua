local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()                        end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

	
---BUY---
shopModule:addBuyableItem({'black pearl'}, 				2144, 560,		'black pearl')
shopModule:addBuyableItem({'white pearl'}, 				2143, 320,		'white pearl')
shopModule:addBuyableItem({'orichalcum pearl'}, 		5022, 80,		'orichalcum pearl')
shopModule:addBuyableItem({'small amethyst'}, 			2150, 400,		'small amethyst')
shopModule:addBuyableItem({'small diamond'}, 			2145, 600,		'small diamond')
shopModule:addBuyableItem({'small emerald'}, 			2149, 500,		'small emerald')
shopModule:addBuyableItem({'small ruby'}, 				2147, 500,		'small ruby')
shopModule:addBuyableItem({'small sapphire'}, 			2146, 500,		'small sapphire')

---SELL---
shopModule:addSellableItem({'black pearl'},      		2144, 280, 		'black pearl')
shopModule:addSellableItem({'blue crystal shard'}, 		18413, 1500,	'blue crystal shard')
shopModule:addSellableItem({'blue crystal splinter'}, 	18418, 400, 	'blue crystal splinter')
shopModule:addSellableItem({'blue gem'},      			2158, 5000, 	'blue gem')
shopModule:addSellableItem({'brown crystal splinter'}, 	18417, 400, 	'brown crystal splinter')
shopModule:addSellableItem({'crystal wand'},      		2184, 1000, 	'crystal wand')
shopModule:addSellableItem({'crystal of balance'},    	9942, 1000, 	'crystal of balance')
shopModule:addSellableItem({'crystal of focus'},      	9941, 2000, 	'crystal of focus')
shopModule:addSellableItem({'crystal of power'},      	9980, 3000, 	'crystal of power')
shopModule:addSellableItem({'cyan crystal fragment'},  	18419, 800, 	'cyan crystal fragment')
shopModule:addSellableItem({'emerald bangle'},     		2127, 800, 		'emerald bangle')
shopModule:addSellableItem({'giant shimmering pearl'}, 	7632, 3000, 	'giant shimmering pearl')
shopModule:addSellableItem({'giant shimmering pearl2'},	7633, 3000, 	'giant shimmering pearl')
shopModule:addSellableItem({'green crystal fragment'},	18421, 800, 	'green crystal fragment')
shopModule:addSellableItem({'green crystal shard'}, 	18415, 1500, 	'green crystal shard')
shopModule:addSellableItem({'green crystal splinter'}, 	18416, 400, 	'green crystal splinter')
shopModule:addSellableItem({'green gem'},      			2155, 5000, 	'green gem')
shopModule:addSellableItem({'red crystal fragment'},  	18420, 800, 	'red crystal fragment')
shopModule:addSellableItem({'red gem'},      			2156, 1000, 	'red gem')
shopModule:addSellableItem({'scarab coin'},      		2159, 100, 		'scarab coin')
shopModule:addSellableItem({'silver brooch'},     		2134, 150, 		'silver brooch')
shopModule:addSellableItem({'small amethyst'},     		2150, 200, 		'small amethyst')
shopModule:addSellableItem({'small diamond'},      		2145, 300,		'small diamond')
shopModule:addSellableItem({'small emerald'},      		2149, 250,		'small emerald')
shopModule:addSellableItem({'small ruby'},      		2147, 250, 		'small ruby')
shopModule:addSellableItem({'small sapphire'},      	2146, 250,		'small sapphire')
shopModule:addSellableItem({'small topaz'},      		9970, 200,		'small topaz')
shopModule:addSellableItem({'gold ingot'},      		9971, 5000, 	'gold ingot')
shopModule:addSellableItem({'vampire\'s cape chain'},	21244, 150, 	'vampire\'s cape chain')
shopModule:addSellableItem({'violet crystal shard'},  	18414, 1500, 	'violet crystal shard')
shopModule:addSellableItem({'violet gem'},   			2153, 10000, 	'violet gem')
shopModule:addSellableItem({'white pearl'},     		2143, 160, 		'white pearl')
shopModule:addSellableItem({'yellow gem'},      		2154, 1000, 	'yellow gem')
shopModule:addSellableItem({'seacrest pearl'},      	24116, 400, 	'seacrest pearl')

shopModule:addSellableItem({'countess sorrow\'s frozen tear'},  	6536, 50000, 	'countess sorrow\'s frozen tear')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Welcome to my legal shop.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye, hope you might come back anytime to my legal shop.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Uhm... Hope you liked my legal shop...")
npcHandler:addModule(FocusModule:new())  