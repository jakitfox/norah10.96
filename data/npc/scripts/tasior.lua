local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local shopItems = {
	["cigar"] = {id = 7499, buy = 50, desc = 'cigar'},
	["spellwand"] = {id = 8870, buy = 100, desc = 'spellwand'},
	["yellow pillow"] = {id = 8072, buy = 30, desc = 'yellow pillow'},
	["watering can"] = {id = 7734, sell = 50, desc = 'watering can'},
	["seeds"] = {id = 7732, sell = 10, desc = 'seeds'},
	["flower bouquet"] = {id = 7733, sell = 20, desc = 'flower bouquet'},
	["empty flower pot"] = {id = 7655, sell = 100, desc = 'empty flower pot'},
	["eternal flames"] = {id = 8304, sell = 1500, desc = 'eternal flames'}
	--["wedding ring"] = {id = 2121, sell = 999, desc = 'wedding ring'},
	--["wedding outfit box"] = {id = 10503, sell = 500, desc = 'wedding outfit box'},
	}
local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

if type(shopItems) == "table" then
    for name, v in pairs(shopItems) do
        shopModule:addBuyableItem({name}, shopItems[name].id, shopItems[name].buy, name)
        shopModule:addSellableItem({name, name}, shopItems[name].id, shopItems[name].sell, shopItems[name].desc)
    end
end	

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
local player = Player(cid)	
	
if msgcontains(msg, 'cutted flower') then
	if player:getItemCount(4838) >= 100 then
		npcHandler:say('Ohh, good I\'m needing this flower. For reward I give you one blood herb.', cid)
		player:removeItem(4838, 100)
		player:addItem(2798, 1)
	else
		npcHandler:say('You don\'t have this flowers, or don\'t have 100 count.', cid)
	end
end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Welcome to my legal shop.") ----- DO POPRAWY
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye, hope you might come back anytime to my legal shop.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Uhm... Hope you liked my legal shop...")
npcHandler:addModule(FocusModule:new())