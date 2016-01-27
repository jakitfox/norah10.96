local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local lastSound = 0
function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 5)
		if math.random(100) < 25  then
			Npc():say("Selling all sorts of magic equipment. Come and have a look.", TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local shopItems = {
	-------RUNES------
	["blank rune"] = {id = 2260, buy = 10, desc = 'blank rune'},
	------Attack------
	["light magic missile rune"] = {id = 2287, buy = 4, desc = 'light magic missile rune'},
	["heavy magic missile rune"] = {id = 2311, buy = 12, desc = 'heavy magic missile rune'},
	["stalagmite rune"] = {id = 2292, buy = 12, desc = 'stalagmite rune'},
	["holy missile rune"] = {id = 2295, buy = 16, desc = 'holy missile rune'},
	["icicle rune"] = {id = 2271, buy = 30, desc = 'icicle rune'},
	["fireball rune"] = {id = 2302, buy = 30, desc = 'fireball rune'},
	["explosion rune"] = {id = 2313, buy = 31, desc = 'explosion rune'},
	["thunderstorm rune"] = {id = 2315, buy = 37, desc = 'thunderstorm rune'},
	["avalanche rune"] = {id = 2274, buy = 45, desc = 'avalanche rune'},
	["great fireball rune"] = {id = 2304, buy = 45, desc = 'great fireball rune'},
	["soulfire rune"] = {id = 2308, buy = 46, desc = 'soulfire rune'},
	["sudden death rune"] = {id = 2268, buy = 108, desc = 'sudden death rune'},
	["magic wall rune"] = {id = 2293, buy = 116, desc = 'magic wall rune'},
	------Healing------
	["cure poison rune"] = {id = 2266, buy = 65, desc = 'cure poison rune'},
	["intense healing rune"] = {id = 2265, buy = 95, desc = 'intense healing rune'},
	["ultimate healing rune"] = {id = 2273, buy = 175, desc = 'ultimate healing rune'},
	------Field------
	["poison field rune"] = {id = 2285, buy = 21, desc = 'poison field rune'},
	["fire field rune"] = {id = 2301, buy = 28, desc = 'fire field rune'},
	["energy field rune"] = {id = 2277, buy = 38, desc = 'energy field rune'},
	["poison wall rune"] = {id = 2289, buy = 52, desc = 'poison wall rune'},
	["fire wall rune"] = {id = 2303, buy = 61, desc = 'fire wall rune'},
	["energy wall rune"] = {id = 2279, buy = 85, desc = 'energy wall rune'},
	["poison bomb rune"] = {id = 2286, buy = 85, desc = 'poison bomb rune'},
	["fire bomb rune"] = {id = 2305, buy = 117, desc = 'fire bomb rune'},
	["energy bomb rune"] = {id = 2262, buy = 162, desc = 'energy bomb rune'},
	------Summon------
	["convince creature rune"] = {id = 2290, buy = 80, desc = 'convince creature rune'},
	["animate dead rune"] = {id = 2316, buy = 375, desc = 'animate dead rune'},
	------Support-----
	["chameleon rune"] = {id = 2291, buy = 210, desc = 'chameleon rune'},
	["destroy field rune"] = {id = 2261, buy = 15, desc = 'destroy field rune'},
	["paralyze rune"] = {id = 2278, buy = 700, desc = 'paralyze rune'},
	["wild growth rune"] = {id = 2269, buy = 160, desc = 'wild growth rune'}
}

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

if type(shopItems) == "table" then
    for name, v in pairs(shopItems) do
        shopModule:addBuyableItem({name}, shopItems[name].id, shopItems[name].buy, name)
        shopModule:addSellableItem({name, name}, shopItems[name].id, shopItems[name].sell, shopItems[name].desc)
    end
end

keywordHandler:addKeyword({'magic'}, StdModule.say, {npcHandler = npcHandler, text = "I'm selling runes. If you like to see my offers, ask me for a {trade}."})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Hi there |PLAYERNAME|, and welcome to the {magic} store.")
npcHandler:setMessage(MESSAGE_FAREWELL, "See you, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "See you, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Of course, just browse through my wares. Or do you want to look only at {runes}?")
npcHandler:addModule(FocusModule:new())