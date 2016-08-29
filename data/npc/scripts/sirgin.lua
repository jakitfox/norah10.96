local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()                        end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

	-------BUY---------
	--magic armor--
	shopModule:addBuyableItem({'spirit cloak'}, 			8870, 1000,		'spirit cloak')
	shopModule:addBuyableItem({'ethno coat'}, 				8892, 750,		'ethno coat')
	shopModule:addBuyableItem({'magician\'s robe'}, 		8819, 450,		'magician\'s robe')
	--spell book--
	shopModule:addBuyableItem({'spellbook'}, 				2175, 150,		'spellbook')
	--wands and rods--
	shopModule:addBuyableItem({'wand of vortex'}, 			2190, 500,		'wand of vortex')
	shopModule:addBuyableItem({'wand of dragonbreath'}, 	2191, 1000,		'wand of dragonbreath')
	shopModule:addBuyableItem({'wand of decay'}, 			2188, 5000,		'wand of decay')
	shopModule:addBuyableItem({'wand of draconia'}, 		8921, 7500,		'wand of draconia')
	shopModule:addBuyableItem({'wand of cosmic energy'}, 	2189, 10000,	'wand of cosmic energy')
	shopModule:addBuyableItem({'wand of inferno'}, 			2187, 15000,	'wand of inferno')
	shopModule:addBuyableItem({'wand of starstorm'}, 		8920, 18000,	'wand of starstorm')
	shopModule:addBuyableItem({'wand of voodoo'}, 			8922, 22000,	'wand of voodoo')
	--rods--
	shopModule:addBuyableItem({'snakebite rod'}, 			2182, 500,		'snakebite rod')
	shopModule:addBuyableItem({'moonlight rod'}, 			2186, 1000,		'moonlight rod')
	shopModule:addBuyableItem({'necrotic rod'}, 			2185, 5000,		'necrotic rod')
	shopModule:addBuyableItem({'northwind rod'}, 			8911, 7500,		'northwind rod')
	shopModule:addBuyableItem({'terra rod'}, 				2181, 10000,	'terra rod')
	shopModule:addBuyableItem({'hailstorm rod'}, 			2183, 15000,	'hailstorm rod')
	shopModule:addBuyableItem({'springsprout rod'}, 		8912, 18000,	'springsprout rod')
	shopModule:addBuyableItem({'underworld rod'}, 			8910, 22000,	'underworld rod')
	--potions--
	shopModule:addBuyableItem({'antidote potion'}, 			8474, 50,		'antidote potion')
	shopModule:addBuyableItem({'health potion'}, 			7618, 45,		'health potion')
	shopModule:addBuyableItem({'mana potion'}, 				7620, 50,		'mana potion')
	shopModule:addBuyableItem({'strong health potion'}, 	7588, 100,		'strong health potion')
	shopModule:addBuyableItem({'strong mana potion'}, 		7589, 80,		'strong mana potion')
	shopModule:addBuyableItem({'great health potion'}, 		7591, 190,		'great health potion')
	shopModule:addBuyableItem({'great mana potion'}, 		7590, 120,		'great mana potion')
	shopModule:addBuyableItem({'great spirit potion'}, 		8472, 190,		'great spirit potion')
	shopModule:addBuyableItem({'ultimate health potion'}, 	8473, 310,		'ultimate health potion')
	shopModule:addBuyableItem({'supreme health potion'}, 	26031, 500,		'supreme health potion')
	shopModule:addBuyableItem({'ultimate mana potion'}, 	26029, 350,		'ultimate mana potion')
	shopModule:addBuyableItem({'ultimate spirit potion'}, 	26030, 350,		'ultimate spirit potion')
	--others--
	shopModule:addBuyableItem({'crystal ball'}, 			2192, 530,		'crystal ball')
	
	----SELL----
	--magic armor--
	shopModule:addSellableItem({'spirit cloak'}, 			8870, 350,		'spirit cloak')
	shopModule:addSellableItem({'ethno coat'}, 				8892, 200,		'ethno coat')
	shopModule:addSellableItem({'focus cape'}, 				8871, 6000,		'focus cape')
	--spell book--
	shopModule:addSellableItem({'spellbook of enlightenment'}, 	8900, 4000,		'spellbook of enlightenment')
	shopModule:addSellableItem({'spellbook of lost souls'}, 	8903, 19000,	'spellbook of lost souls')
	shopModule:addSellableItem({'spellbook of mind control'}, 	8902, 13000,	'spellbook of mind control')
	shopModule:addSellableItem({'spellbook of warding'}, 		8901, 8000,		'spellbook of warding')
	--wands--
	shopModule:addSellableItem({'wand of vortex'}, 			2190, 100,		'wand of vortex')
	shopModule:addSellableItem({'wand of dragonbreath'}, 	2191, 200,		'wand of dragonbreath')
	shopModule:addSellableItem({'wand of decay'}, 			2188, 1000,		'wand of decay')
	shopModule:addSellableItem({'wand of draconia'}, 		8921, 1500,		'wand of draconia')
	shopModule:addSellableItem({'wand of cosmic energy'}, 	2189, 2000,		'wand of cosmic energy')
	shopModule:addSellableItem({'wand of inferno'}, 		2187, 3000,		'wand of inferno')
	shopModule:addSellableItem({'wand of starstorm'}, 		8920, 3600,		'wand of starstorm')
	shopModule:addSellableItem({'wand of voodoo'}, 			8922, 4400,		'wand of voodoo')
	shopModule:addSellableItem({'wand of everblazing'}, 	18409, 6000,	'wand of everblazing')
	shopModule:addSellableItem({'wand of defiance'}, 		18390, 6500,	'wand of defiance')
	--rods--
	shopModule:addSellableItem({'snakebite rod'}, 			2182, 100,		'snakebite rod')
	shopModule:addSellableItem({'moonlight rod'}, 			2186, 200,		'moonlight rod')
	shopModule:addSellableItem({'necrotic rod'}, 			2185, 1000,		'necrotic rod')
	shopModule:addSellableItem({'northwind rod'}, 			8911, 1500,		'northwind rod')
	shopModule:addSellableItem({'terra rod'}, 				2181, 2000,		'terra rod')
	shopModule:addSellableItem({'hailstorm rod'}, 			2183, 3000,		'hailstorm rod')
	shopModule:addSellableItem({'springsprout rod'}, 		8912, 3600,		'springsprout rod')
	shopModule:addSellableItem({'underworld rod'}, 			8910, 4400,		'underworld rod')
	shopModule:addSellableItem({'muck rod'}, 				18411, 6000,	'muck rod')
	shopModule:addSellableItem({'glacial rod'}, 			18412, 6500,	'glacial rod')
	--potions--
	shopModule:addSellableItem({'empty potion flask'}, 		7636, 5,		'empty potion flask')
	shopModule:addSellableItem({'strong potion flask'}, 	7634, 7,		'strong potion flask')
	shopModule:addSellableItem({'great potion flask'}, 		7635, 10,		'great potion flask')
	--others--
	shopModule:addSellableItem({'crystal ball'}, 			2192, 190,		'crystal ball')
	shopModule:addSellableItem({'life crystal'}, 			2177, 85,		'life crystal')
	shopModule:addSellableItem({'mind stone'}, 				2178, 170,		'mind stone')
	shopModule:addSellableItem({'orb'}, 					2176, 750,		'orb')
	shopModule:addSellableItem({'talon'}, 					2151, 320,		'talon')
	shopModule:addSellableItem({'demonic essence'}, 		6500, 1000,		'demonic essence')
	shopModule:addSellableItem({'draken sulphur'}, 			12614, 550,		'draken sulphur')
	shopModule:addSellableItem({'lizard essence'}, 			12636, 300,		'lizard essence')
	shopModule:addSellableItem({'luminous orb'}, 			12410, 1000,	'luminous orb')
	shopModule:addSellableItem({'mysterious voodoo skull'}, 5669, 4000,		'mysterious voodoo skull')
	shopModule:addSellableItem({'enigmatic voodoo skull'}, 	5670, 4000,		'enigmatic voodoo skull')
	shopModule:addSellableItem({'mystical hourglass'}, 		10577, 700,		'mystical hourglass')
	shopModule:addSellableItem({'ankh'}, 					2193, 100,		'ankh')

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	local vocationId = player:getVocation():getId()
	local items = {
		[1] = 2190,
		[2] = 2182,
		[5] = 2190,
		[6] = 2182
	}

	if msgcontains(msg, 'first rod') or msgcontains(msg, 'first wand') then
		if isInArray({1, 2, 5, 6}, vocationId) then
			if player:getStorageValue(Storage.firstMageWeapon) == -1 then
				selfSay('So you ask me for a {' .. ItemType(items[vocationId]):getName() .. '} to begin your advanture?', cid)
				npcHandler.topic[cid] = 1
			else
				selfSay('What? I have already gave you one {' .. ItemType(items[vocationId]):getName() .. '}!', cid)
			end
		else
			selfSay('Sorry, you aren\'t a druid either a sorcerer.', cid)
		end
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 1 then
			player:addItem(items[vocationId], 1)
			player:setStorageValue(Storage.firstMageWeapon, 1)
			selfSay('Here you are young adept, take care yourself.', cid)
		end
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'no') and npcHandler.topic[cid] == 1 then
		selfSay('Ok then.', cid)
		npcHandler.topic[cid] = 0
	elseif isInArray({"vial", "ticket", "bonus"}, msg) then
		if player:removeItem(7634, 100) or player:removeItem(7635, 100) or player:removeItem(7636, 100) then
			player:addItem(5957, 1)
			npcHandler:say("Alright, thank you very much! Here is your lottery ticket, good luck. Would you like to deposit more vials that way?", cid)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("Sorry, but you don't have 100 empty flasks or vials of the SAME kind and thus don't qualify for the lottery. Would you like to deposit the vials you have as usual and receive 5 gold per vial?", cid)
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