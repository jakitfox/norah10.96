local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local shopItems = {
	-----AMMO-----
	-----Arrows-----
	["arrow"] = {id = 2544, buy = 3, desc = 'arrow'},
	["crystalline arrow"] = {id = 18304, buy = 20, desc = 'crystalline arrow'},
	["earth arrow"] = {id = 7850, buy = 5, desc = 'earth arrow'},
	["envenomed arrow"] = {id = 18437, buy = 12, desc = 'envenomed arrow'},
	["flaming arrow"] = {id = 7840, buy = 5, desc = 'flaming arrow'},
	["flash arrow"] = {id = 7838, buy = 5, desc = 'flash arrow'},
	["onyx arrow"] = {id = 7365, buy = 7, desc = 'onyx arrow'},
	["poison arrow"] = {id = 2545, buy = 3, desc = 'poison arrow'},
	["shiver arrow"] = {id = 7839, buy = 5, desc = 'shiver arrow'},
	["sniper arrow"] = {id = 7364, buy = 5, desc = 'sniper arrow'},
	["tarsal arrow"] = {id = 15648, buy = 6, desc = 'tarsal arrow'},
	-----Bolts-------
	["bolt"] = {id = 2543, buy = 4, desc = 'bolt'},
	["drill bolt"] = {id = 18436, buy = 12, desc = 'drill bolt'},
	["piercing bolt"] = {id = 7363, buy = 5, desc = 'piercing bolt'},
	["power bolt"] = {id = 2547, buy = 7, desc = 'power bolt'},
	["prismatic bolt"] = {id = 18435, buy = 20, desc = 'prismatic bolt'},
	["vortex bolt"] = {id = 15649, buy = 6, desc = 'vortex bolt'},
	-----Bow------
	["bow"] = {id = 2456, buy = 400, sell = 100, desc = 'bow'},
	["composite hornbow"] = {id = 8855, sell = 25000, desc = 'composite hornbow'},
	["elvish bow"] = {id = 7438, sell = 2000, desc = 'elvish bow'},
	["hive bow"] = {id = 15643, sell = 28000, desc = 'hive bow'},
	["mycological bow"] = {id = 18454, sell = 35000, desc = 'mycological bow'},
	["silkweaver bow"] = {id = 8857, sell = 12000, desc = 'silkweaver bow'},
	-----CrossBow------
	["ornate crossbow"] = {id = 15644, sell = 12000, desc = 'ornate crossbow'},
	["modified crossbow"] = {id = 8849, sell = 10000, desc = 'modified crossbow'},
	["chain bolter"] = {id = 8850, sell = 40000, desc = 'chain bolter'},
	["arbalest"] = {id = 5803, sell = 42000, desc = 'arbalest'},
	["crossbow"] = {id = 2455, buy = 500, sell = 120, desc = 'crossbow'},
	["crystal crossbow"] = {id = 18453, sell = 35000, desc = 'crystal crossbow'},
	["ironworker"] = {id = 8853, sell = 50000, desc = 'ironworker'},
	----Other---
	["hunting spear"] = {id = 3965, sell = 25, desc = 'hunting spear'},
	["assassin star"] = {id = 7368, buy = 100, desc = 'assassin star'},
	["spear"] = {id = 2389, buy = 9, sell = 3, desc = 'spear'},
	["royal spear"] = {id = 7378, buy = 15, desc = 'royal spear'},
	["throwing star"] = {id = 2399, buy = 42, sell = 2, desc = 'throwing star'},
	["throwing knife"] = {id = 2410, buy = 25, sell = 2, desc = 'throwing knife'}
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