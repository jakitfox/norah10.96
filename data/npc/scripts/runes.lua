local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()                        end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

	-------RUNES------
	shopModule:addBuyableItem({'blank rune'}, 				2260, 10,		'blank rune')
	------Attack------
	shopModule:addBuyableItem({'light magic missile rune'}, 2287, 4,		'light magic missile rune')
	shopModule:addBuyableItem({'heavy magic missile rune'}, 2311, 12,		'heavy magic missile rune')
	shopModule:addBuyableItem({'stalagmite rune'}, 			2292, 12,		'stalagmite rune')
	shopModule:addBuyableItem({'holy missile rune'}, 		2295, 16,		'holy missile rune')
	shopModule:addBuyableItem({'icicle rune'}, 				2271, 30,		'icicle rune')
	shopModule:addBuyableItem({'fireball rune'}, 			2302, 30,		'fireball rune')
	shopModule:addBuyableItem({'explosion rune'}, 			2313, 31,		'explosion rune')
	shopModule:addBuyableItem({'thunderstorm rune'}, 		2315, 37,		'thunderstorm rune')
	shopModule:addBuyableItem({'avalanche rune'}, 			2274, 45,		'avalanche rune')
	shopModule:addBuyableItem({'great fireball rune'}, 		2304, 45,		'great fireball rune')
	shopModule:addBuyableItem({'soulfire rune'}, 			2308, 46,		'soulfire rune')
	shopModule:addBuyableItem({'sudden death rune'}, 		2268, 108,		'sudden death rune')
	shopModule:addBuyableItem({'magic wall rune'}, 			2293, 116,		'magic wall rune')
	------Healing------
	shopModule:addBuyableItem({'cure poison rune'}, 		2266, 65,		'cure poison rune')
	shopModule:addBuyableItem({'intense healing rune'}, 	2265, 95,		'intense healing rune')
	shopModule:addBuyableItem({'ultimate healing rune'}, 	2273, 175,		'ultimate healing rune')
	------Field------
	shopModule:addBuyableItem({'poison field rune'}, 		2285, 21,		'poison field rune')
	shopModule:addBuyableItem({'fire field rune'}, 			2301, 28,		'fire field rune')
	shopModule:addBuyableItem({'energy field rune'}, 		2277, 38,		'energy field rune')
	shopModule:addBuyableItem({'poison wall rune'}, 		2289, 52,		'poison wall rune')
	shopModule:addBuyableItem({'fire wall rune'}, 			2303, 61,		'fire wall rune')
	shopModule:addBuyableItem({'energy wall rune'}, 		2279, 85,		'energy wall rune')
	shopModule:addBuyableItem({'poison bomb rune'}, 		2286, 85,		'poison bomb rune')
	shopModule:addBuyableItem({'fire bomb rune'}, 			2305, 117,		'fire bomb rune')
	shopModule:addBuyableItem({'energy bomb rune'}, 		2262, 162,		'energy bomb rune')
	------Summon------
	shopModule:addBuyableItem({'convince creature rune'}, 	2290, 80,		'convince creature rune')
	shopModule:addBuyableItem({'animate dead rune'}, 		2316, 375,		'animate dead rune')
	------Support-----
	shopModule:addBuyableItem({'chameleon rune'}, 			2291, 210,		'chameleon rune')
	shopModule:addBuyableItem({'destroy field rune'}, 		2261, 15,		'destroy field rune')
	shopModule:addBuyableItem({'paralyze rune'}, 			2278, 700,		'paralyze rune')
	shopModule:addBuyableItem({'wild growth rune'}, 		2269, 160,		'wild growth rune')


keywordHandler:addKeyword({'magic'}, StdModule.say, {npcHandler = npcHandler, text = "I'm selling runes. If you like to see my offers, ask me for a {trade}."})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Hi there |PLAYERNAME|, and welcome to the {magic} store.")
npcHandler:setMessage(MESSAGE_FAREWELL, "See you, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "See you, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Of course, just browse through my wares. Or do you want to look only at {runes}?")
npcHandler:addModule(FocusModule:new())