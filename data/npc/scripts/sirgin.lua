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
		if math.random(100) < 15 then
			Npc():say("Selling all sorts of magic equipment. Come and have a look.", TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local shopItems = {
	-------MAGIC ARMOR------
	["ethno coat"] = {id = 8892, buy = 750, sell = 200, desc = 'ethno coat'},
	["spirit cloak"] = {id = 8870, buy = 1000, sell = 350, desc = 'spirit cloak'},
	["magician's robe"] = {id = 8819, buy = 450, desc = 'magician\'s robe'},
	["focus cape"] = {id = 8871, sell = 6000, desc = 'focus cape'},
	-------SPELL BOOK------
	["spellbook of enlightenment"] = {id = 8900, sell = 4000, desc = 'spellbook of enlightenment'},
	["spellbook of lost souls"] = {id = 8903, sell = 19000, desc = 'spellbook of lost souls'},
	["spellbook of mind control"] = {id = 8902, sell = 13000, desc = 'spellbook of mind control'},
	["spellbook of warding"] = {id = 8901, sell = 8000, desc = 'spellbook of warding'},
	["spellbook"] = {id = 2175, buy = 150, desc = 'spellbook'},
	-------WANDS AND RODS------
	["wand of vortex"] = {id = 2190, buy = 500, sell = 100, desc = 'wand of vortex'},
	["wand of dragonbreath"] = {id = 2191, buy = 1000, sell = 200, desc = 'wand of dragonbreath'},
	["wand of decay"] = {id = 2188, buy = 5000, sell = 1000, desc = 'wand of decay'},
	["wand of draconia"] = {id = 8921, buy = 7500, sell = 1500, desc = 'wand of draconia'},
	["wand of cosmic energy"] = {id = 2189, buy = 10000, sell = 2000, desc = 'wand of cosmic energy'},
	["wand of inferno"] = {id = 2187, buy = 15000, sell = 3000, desc = 'wand of inferno'},
	["wand of starstorm"] = {id = 8920, buy = 18000, sell = 3600, desc = 'wand of starstorm'},
	["wand of voodoo"] = {id = 8922, buy = 22000, sell = 4400, desc = 'wand of voodoo'},
	["wand of everblazing"] = {id = 18409, sell = 6000, desc = 'wand of everblazing'},
	["wand of defiance"] = {id = 18390, sell = 6500, desc = 'wand of defiance'},
	
	["snakebite rod"] = {id = 2182, buy = 500, sell = 100, desc = 'snakebite rod'},
	["moonlight rod"] = {id = 2186, buy = 1000, sell = 200, desc = 'moonlight rod'},
	["necrotic rod"] = {id = 2185, buy = 5000, sell = 1000, desc = 'necrotic rod'},
	["northwind rod"] = {id = 8911, buy = 7500, sell = 1500, desc = 'northwind rod'},
	["terra rod"] = {id = 2181, buy = 10000, sell = 2000, desc = 'terra rod'},
	["hailstorm rod"] = {id = 2183, buy = 15000, sell = 3000, desc = 'hailstorm rod'},
	["springsprout rod"] = {id = 8912, buy = 18000, sell = 3600, desc = 'springsprout rod'},
	["underworld rod"] = {id = 8910, buy = 22000, sell = 4400, desc = 'underworld rod'},
	["muck rod"] = {id = 18411, sell = 6000, desc = 'muck rod'},
	["glacial Rod"] = {id = 18412, sell = 6500, desc = 'glacial Rod'},
	-------POTIONS------
	["empty potion flask"] = {id = 7636, sell = 5, desc = 'empty potion flask'},
	["strong potion flask"] = {id = 7634, sell = 7, desc = 'empty potion flask'},
	["great potion flask"] = {id = 7635, sell = 10, desc = 'empty potion flask'},
	
	["antidote potion"] = {id = 8474, buy = 50, desc = 'antidote potion'},
	["health potion"] = {id = 7618, buy = 45, desc = 'health potion'},
	["mana potion"] = {id = 7620, buy = 50, desc = 'mana potion'},
	["strong health"] = {id = 7588, buy = 100, desc = 'strong health'},
	["strong mana"] = {id = 7589, buy = 80, desc = 'strong mana'},
	["great health"] = {id = 7591, buy = 190, desc = 'great health'},
	["great mana"] = {id = 7590, buy = 120, desc = 'great mana'},
	["great spirit"] = {id = 8472, buy = 190, desc = 'great spirit'},
	["ultimate health"] = {id = 8473, buy = 310, desc = 'ultimate health'},
	["supreme health potion"] = {id = 26031, buy = 500, desc = 'supreme health potion'},
	["ultimate mana potion"] = {id = 26029, buy = 350, desc = 'ultimate mana potion'},
	["ultimate spirit potion"] = {id = 26030, buy = 350, desc = 'ultimate spirit potion'},
	-------Magical Items------
	["crystal ball"] = {id = 2192, buy = 530, sell = 190, desc = 'crystal ball'},
	["life crystal"] = {id = 2177, sell = 85, desc = 'life crystal'},
	["mind stone"] = {id = 2178, sell = 170, desc = 'mind stone'},
	["orb"] = {id = 2176, sell = 750, desc = 'orb'},
	["talon"] = {id = 2151, sell = 320, desc = 'talon'},
	["demonic essence"] = {id = 6500, sell = 1000, desc = 'demonic essence'},
	["draken sulphur"] = {id = 12614, sell = 550, desc = 'draken sulphur'},
	["lizard essence"] = {id = 12636, sell = 300, desc = 'lizard essence'},
	["luminous orb"] = {id = 12410, sell = 1000, desc = 'luminous orb'},
	["mysterious voodoo skull"] = {id = 5669, sell = 4000, desc = 'mysterious voodoo skull'},
	["enigmatic voodoo skull"] = {id = 5670, sell = 4000, desc = 'enigmatic voodoo skull'},
	["mystical hourglass"] = {id = 10577, sell = 700, desc = 'mystical hourglass'},
	["ankh"] = {id = 2193, sell = 100, desc = 'ankh'}
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
	local items = {[1] = 2190, [2] = 2182}
	local itemId = items[player:getVocation():getBase():getId()]
	if msgcontains(msg, 'first rod') or msgcontains(msg, 'first wand') then
		if player:isMage() then
			if player:getStorageValue(Storage.firstMageWeapon) == -1 then
				npcHandler:say('So you ask me for a {' .. ItemType(itemId):getName() .. '} to begin your adventure?', cid)
				npcHandler.topic[cid] = 1
			else
				npcHandler:say('What? I have already gave you one {' .. ItemType(itemId):getName() .. '}!', cid)
			end
		else
			npcHandler:say('Sorry, you aren\'t a druid either a sorcerer.', cid)
		end
		
	elseif msgcontains(msg, 'help') then
		npcHandler:say('You can here change items {empty great potion flask}, {empty strong potion flask}, {empty potion flask}?', cid)
        
    elseif msgcontains(msg, 'vial')  or msgcontains(msg, 'flask') then
		if player:getItemCount(7635) >= 100 or player:getItemCount(7634) >= 100 or player:getItemCount(7636) >= 100 then
			npcHandler:say('Did you bring me the 100 empty potion flask?', cid)
			npcHandler.topic[cid] = 2
		else
			npcHandler:say('I need a 100 empty potion flask, to give you lottery ticket. Come back when you have them.', cid)
			npcHandler.topic[cid] = 0
	end	

	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then
			player:addItem(itemId, 1)
			npcHandler:say('Here you are young adept, take care yourself.', cid)
			player:setStorageValue(Storage.firstMageWeapon, 1)
		end
		npcHandler.topic[cid] = 0
		
	elseif npcHandler.topic[cid] == 2 then
        if player:addItem(7635) >= 100 or player:addItem(7634) >= 100 or player:addItem(7636) >= 100 then
			if player:removeItem(7635,100) or player:removeItem(7634,100) or player:removeItem(7636,100) then
				player:removeItem(5957,1)
				npcHandler:say('Here u are.', cid)
			else
				npcHandler:say('Sorry, you don\'t have these items.', cid)
		end	
		
	elseif msgcontains(msg, 'no') and npcHandler.topic[cid] == 1 then
		npcHandler:say('Ok then.', cid)
		npcHandler.topic[cid] = 0
		end
	end
	return true
end

keywordHandler:addKeyword({'magic'}, StdModule.say, {npcHandler = npcHandler, text = "I'm selling wands, rods and crystal balls. I also buy powerful spellbooks. If you like to see my offers, ask me for a {trade}."})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, "Hi there |PLAYERNAME|, and welcome to the {magic} store.")
npcHandler:setMessage(MESSAGE_FAREWELL, "See you, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "See you, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Of course, just browse through my wares. Or do you want to look only at {wands}?")
npcHandler:addModule(FocusModule:new())