local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid)         end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                          npcHandler:onThink()                        end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

	-----Arrows-----
	shopModule:addBuyableItem({'arrow'}, 2544, 3, 'arrow')
	shopModule:addBuyableItem({'crystalline arrow'}, 18304, 20, 'crystalline arrow')
	shopModule:addBuyableItem({'earth arrow'}, 7850, 5, 'earth arrow')
	shopModule:addBuyableItem({'envenomed arrow'}, 18437, 12, 'envenomed arrow')
	shopModule:addBuyableItem({'flaming arrow'}, 7840, 5, 'flaming arrow')
	shopModule:addBuyableItem({'flash arrow'}, 7838, 5, 'flash arrow')
	shopModule:addBuyableItem({'onyx arrow'}, 7365, 7, 'onyx arrow')
	shopModule:addBuyableItem({'poison arrow'}, 2545, 3, 'poison arrow')
	shopModule:addBuyableItem({'shiver arrow'}, 7839, 5, 'shiver arrow')
	shopModule:addBuyableItem({'sniper arrow'}, 7364, 5, 'sniper arrow')
	shopModule:addBuyableItem({'tarsal arrow'}, 15648, 6, 'tarsal arrow')
	
	-----Bolts-------
	shopModule:addBuyableItem({'bolt'}, 2543, 4, 'bolt')
	shopModule:addBuyableItem({'drill bolt'}, 18436, 12, 'drill bolt')
	shopModule:addBuyableItem({'piercing bolt'}, 7363, 5, 'piercing bolt')
	shopModule:addBuyableItem({'power bolt'}, 2547, 7, 'power bolt')
	shopModule:addBuyableItem({'prismatic bolt'}, 18435, 20, 'prismatic bolt')
	shopModule:addBuyableItem({'vortex bolt'}, 15649, 6, 'vortex bolt')

	-----Bow------
	shopModule:addBuyableItem({'bow'}, 2456, 400, 'bow')
	
	shopModule:addSellableItem({'bow'}, 2456, 100, 'bow')
	shopModule:addSellableItem({'composite hornbow'}, 8855, 25000, 'composite hornbow')
	shopModule:addSellableItem({'elvish bow'}, 7438, 2000, 'elvish bow')
	shopModule:addSellableItem({'hive bow'}, 15643, 28000, 'hive bow')
	shopModule:addSellableItem({'mycological bow'}, 18454, 35000, 'mycological bow')
	shopModule:addSellableItem({'silkweaver bow'}, 8857, 12000, 'silkweaver bow')

	-----CrossBow------
	shopModule:addBuyableItem({'crossbow'}, 2455, 500, 'crossbow')
	
	shopModule:addSellableItem({'crossbow'}, 2455, 120, 'crossbow')
	shopModule:addSellableItem({'ornate crossbow'}, 15644, 12000, 'ornate crossbow')
	shopModule:addSellableItem({'modified crossbow'}, 8849, 10000, 'modified crossbow')
	shopModule:addSellableItem({'chain bolter'}, 8850, 40000, 'chain bolter')
	shopModule:addSellableItem({'arbalest'}, 5803, 42000, 'arbalest')
	shopModule:addSellableItem({'crystal crossbow'}, 18453, 35000, 'crystal crossbow')
	shopModule:addSellableItem({'ironworker'}, 18453, 50000, 'ironworker')

	----Other---
	shopModule:addBuyableItem({'assassin star'}, 7368, 100, 'assassin star')
	shopModule:addBuyableItem({'spear'}, 2389, 9, 'spear')
	shopModule:addBuyableItem({'royal spear'}, 7378, 15, 'royal spear')
	shopModule:addBuyableItem({'throwing star'}, 2399, 42, 'throwing star')
	shopModule:addBuyableItem({'throwing knife'}, 2410, 25, 'throwing knife')
	
	shopModule:addSellableItem({'hunting spear'}, 3965, 25, 'hunting spear')
	shopModule:addSellableItem({'spear'}, 2389, 3, 'spear')
	shopModule:addSellableItem({'throwing star'}, 2399, 2, 'throwing star')
	shopModule:addSellableItem({'throwing knife'}, 2410, 2, 'throwing knife')


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Welcome to my legal shop.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye, hope you might come back anytime to my legal shop.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Uhm... Hope you liked my legal shop...")
npcHandler:addModule(FocusModule:new())