local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local shopItems = {
	["pearl"] = {id = 2144, buy = 560, sell = 280, desc = 'pearl'},
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