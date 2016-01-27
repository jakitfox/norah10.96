local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()                        end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)


shopModule:addSellableItem({'templar scytheblade', 'templar scytheblade'},                 	     3963, 200,     'templar scytheblade')

shopModule:addSellableItem({'drachaku', 'drachaku'},                 	     11308, 10000,     'drachaku')
shopModule:addSellableItem({'sais', 'sais'},                  				 11306, 16500,     'sais')
shopModule:addSellableItem({'zaoan sword', 'zaoan sword'},                   11307, 30000,     'zaoan sword')
shopModule:addSellableItem({'twin hooks', 'twin hooks'},                  	 11309, 1100,      'twin hooks')
shopModule:addSellableItem({'drakinata', 'drakinata'},               	     11305, 12000,     'drakinata')
shopModule:addSellableItem({'zaoan halberd', 'zaoan halberd'},               11323, 1200,      'zaoan halberd')

shopModule:addSellableItem({'noble axe', 'noble axe'},                       7456, 10000,        'noble axe')
shopModule:addSellableItem({'sword', 'sword'},                               2376, 25,        'sword')
shopModule:addSellableItem({'nightmare blade', 'nightmare blade'},           7418, 35000,    'nightmare blade')
shopModule:addSellableItem({'two handed sword', 'two handed sword'},         2377, 450,       'two handed sword')
shopModule:addSellableItem({'dagger', 'dagger'},                             2379, 20,        'dagger')
shopModule:addSellableItem({'spike sword', 'spike sword'},                   2383, 1000,      'spike sword')
shopModule:addSellableItem({'rapier', 'rapier'},                             2384, 30,        'rapier')
shopModule:addSellableItem({'sabre', 'sabre'},                               2385, 35,        'sabre')
shopModule:addSellableItem({'magic longsword', 'magic longsword'},           2390, 100000,    'magic longsword')
shopModule:addSellableItem({'fire sword', 'fire sword'},                     2392, 4000,      'fire sword')
shopModule:addSellableItem({'giant sword', 'giant sword'},                   2393, 17000,     'giant sword')
shopModule:addSellableItem({'carlin sword', 'carlin sword'},                 2395, 118,      'carlin sword')
shopModule:addSellableItem({'ice rapier', 'ice rapier'},                     2396, 1000,      'ice rapier')
shopModule:addSellableItem({'longsword', 'longsword'},                       2397, 80,        'longsword')
shopModule:addSellableItem({'magic sword', 'magic sword'},                   2400, 80000,    'magic sword')
shopModule:addSellableItem({'silver dagger', 'silver dagger'},               2402, 500,       'silver dagger')
shopModule:addSellableItem({'knife', 'knife'},                               2403, 1,        'knife')
shopModule:addSellableItem({'combat knife', 'combat knife'},                 2404, 1,        'combat knife')
shopModule:addSellableItem({'sickle', 'sickle'},                             2405, 5,         'sickle')
shopModule:addSellableItem({'short sword', 'short sword'},                   2406, 10,       'short sword')
shopModule:addSellableItem({'bright sword', 'bright sword'},                 2407, 2000,      'bright sword')
shopModule:addSellableItem({'warlord sword', 'warlord sword'},               2408, 700000,    'warlord sword')
shopModule:addSellableItem({'serpent sword', 'serpent sword'},               2409, 900,      'serpent sword')
shopModule:addSellableItem({'poison dagger', 'poison dagger'},               2411, 50,        'poison dagger')
shopModule:addSellableItem({'katana', 'katana'},                             2412, 35,        'katana')
shopModule:addSellableItem({'broad sword', 'broad sword'},                   2413, 500,       'broad sword')
shopModule:addSellableItem({'golden sickle', 'golden sickle'},               2418, 1000,       'golden sickle')
shopModule:addSellableItem({'scimitar', 'scimitar'},                         2419, 150,       'scimitar')
shopModule:addSellableItem({'machete', 'machete'},                           2420, 6,        'machete')
shopModule:addSellableItem({'heavy machete', 'heavy machete'},               2442, 90,        'heavy machete')
shopModule:addSellableItem({'epee', 'epee'},                                 2438, 8000,     'epee')
shopModule:addSellableItem({'pharaoh sword', 'pharaoh sword'},               2446, 23000,    'pharaoh sword')
shopModule:addSellableItem({'bone sword', 'bone sword'},                     2450, 20,      'bone sword')
shopModule:addSellableItem({'djinn blade', 'djinn blade'},                   2451, 15000,     'djinn blade')
shopModule:addSellableItem({'avenger', 'avenger'},                           6528, 42000,     'avenger')
shopModule:addSellableItem({'demonrage sword', 'demonrage sword'},           7382, 36000,     'demonrage sword')
shopModule:addSellableItem({'relic sword', 'relic sword'},                   7383, 25000,     'relic sword')
shopModule:addSellableItem({'mystic blade', 'mystic blade'},                 7384, 30000,     'mystic blade')
shopModule:addSellableItem({'crimson sword', 'crimson sword'},               7385, 500,       'crimson sword')
shopModule:addSellableItem({'marcenary sword', 'marcenary sword'},           7386, 12000,     'mercenary sword')
shopModule:addSellableItem({'justice seeker', 'justice seeker'},             7390, 40000,       'justice seeker')
shopModule:addSellableItem({'thaian sword ', 'thaian sword '},             7391, 16000,      'thaian sword ')
shopModule:addSellableItem({'dragon slayer', 'dragon slayer'},               7402, 15000,     'dragon slayer')
shopModule:addSellableItem({'berserker', 'berserker'},       7403, 40000,     'berserker')
shopModule:addSellableItem({'assassin dagger', 'assassin dagger'},           7404, 20000,     'assassin dagger')
shopModule:addSellableItem({'blacksteel sword', 'blacksteel sword'},         7406, 6000,      'blacksteel sword')
shopModule:addSellableItem({'haunted blade', 'haunted blade'},               7407, 8000,     'haunted blade')
shopModule:addSellableItem({'wyvern fang', 'wyvern fang'},                   7408, 1500,      'wyvern fang')
shopModule:addSellableItem({'bloody edge', 'bloody edge'},                   7416, 30000,    'bloody edge')
shopModule:addSellableItem({'square sword', 'square sword'},                 7417, 45000,     'square sword')
shopModule:addSellableItem({'nightmare blade', 'nightmare blade'},               7418, 35000,     'nightmare blade')
shopModule:addSellableItem({'dreaded cleaver', 'dreaded cleaver'},           7419, 15000,     'dreaded cleaver')
shopModule:addSellableItem({'crystal sword', 'crystal sword'},               7449, 600,       'crystal sword')
shopModule:addSellableItem({'club', 'club'},                                 2382, 1,         'club')
shopModule:addSellableItem({'war hammer', 'war hammer'},                     2391, 1200,      'war hammer')
shopModule:addSellableItem({'morning star', 'morning star'},                 2394, 100,       'morning star')
shopModule:addSellableItem({'mace', 'mace'},                                 2398, 30,        'mace')
shopModule:addSellableItem({'crowbar', 'crowbar'},                           2416, 50,       'crowbar')
shopModule:addSellableItem({'battle hammer', 'battle hammer'},               2417, 120,       'battle hammer')
shopModule:addSellableItem({'iron hammer', 'iron hammer'},                   2422, 9,       'iron hammer')
shopModule:addSellableItem({'clerical mace', 'clerical mace'},               2423, 170,       'clerical mace')
shopModule:addSellableItem({'silver mace', 'silver mace'},                   2424, 40000,     'silver mace')
shopModule:addSellableItem({'dragon hammer', 'dragon hammer'},               2434, 2000,      'dragon hammer')
shopModule:addSellableItem({'skull staff', 'skull staff'},                   2436, 6000,      'skull staff')
shopModule:addSellableItem({'hammer of wrath', 'hammer of wrath'},           2444, 30000,    'hammer of wrath')
shopModule:addSellableItem({'crystal mace', 'crystal mace'},                 2445, 12000,    'crystal mace')
shopModule:addSellableItem({'studded club', 'studded club'},                 2448, 10,        'studded club')
shopModule:addSellableItem({'bone club', 'bone club'},                       2449, 5,        'bone club')
shopModule:addSellableItem({'heavy mace', 'heavy mace'},                     2452, 50000,     'heavy mace')
shopModule:addSellableItem({'arcane staff', 'arcane staff'},                 2453, 42000,     'arcane staff')
shopModule:addSellableItem({'banana staff', 'banana staff'},                 3966, 1000,      'banana staff')
shopModule:addSellableItem({'brutetamers staff', 'brutetamers staff'},       7379, 1500,      'brutetamers staff')
shopModule:addSellableItem({'mammoth whopper', 'mammoth whopper'},           7381, 300,       'mammoth whopper')
shopModule:addSellableItem({'diamond sceptre', 'diamond sceptre'},           7387, 3000,      'diamond sceptre')
shopModule:addSellableItem({'orcish maul', 'orcish maul'},                   7392, 6000,      'orcish maul')
shopModule:addSellableItem({'sapphire hammer', 'sapphire hammer'},           7437, 7000,      'sapphire hammer')
shopModule:addSellableItem({'shadow sceptre', 'shadow sceptre'},             7451, 10000,    'shadow sceptre')
shopModule:addSellableItem({'spiked squelcher', 'spiked squelcher'},         7452, 5000,      'spiked squelcher')
shopModule:addSellableItem({'queens sceptre', 'queens sceptre'},             7410, 20000,     'queens sceptre')
shopModule:addSellableItem({'abyss hammer', 'abyss hammer'},                 7414, 20000,    'abyss hammer')
shopModule:addSellableItem({'cranial basher', 'cranial basher'},             7415, 30000,     'cranial basher')
shopModule:addSellableItem({'onyx flail ', 'onyx flail '},                   7421, 22000,    'onyx flail ')
shopModule:addSellableItem({'jade hammer', 'jade hammer'},       7422, 25000,     'jade hammer')
shopModule:addSellableItem({'lunar staff', 'lunar staff'},                   7424, 5000,      'lunar staff')
shopModule:addSellableItem({'taurus mace', 'taurus mace'},                   7425, 500,       'taurus mace')
shopModule:addSellableItem({'amber staff', 'amber staff'},                   7426, 8000,      'amber staff')
shopModule:addSellableItem({'chaos mace', 'chaos mace'},                     7427, 9000,     'chaos mace')
shopModule:addSellableItem({'bonebreaker', 'bonebreaker'},                         7428, 10000,     'bonebreaker')
shopModule:addSellableItem({'blessed sceptre', 'blessed sceptre'},           7429, 40000,    'blessed sceptre')
shopModule:addSellableItem({'dragonbone staff', 'dragonbone staff'},         7430, 3000,      'dragonbone staff')
shopModule:addSellableItem({'demonbone', 'demonbone'},                       7431, 20000,     'demonbone')
shopModule:addSellableItem({'furry club', 'furry club'},                     7432, 1000,      'furry club')
shopModule:addSellableItem({'battle axe', 'battle axe'},                     2378, 80,       'battle axe')
shopModule:addSellableItem({'hand axe', 'hand axe'},                         2380, 5,        'hand axe')
shopModule:addSellableItem({'halberd', 'halberd'},                           2381, 400,       'halberd')
shopModule:addSellableItem({'axe', 'axe'},                                   2386, 7,         'axe')
shopModule:addSellableItem({'double axe', 'double axe'},                     2387, 260,       'double axe')
shopModule:addSellableItem({'hatchet', 'hatchet'},                           2388, 25,        'hatchet')
shopModule:addSellableItem({'dragon lance', 'dragon lance'},                 2414, 9000,      'dragon lance')
shopModule:addSellableItem({'obsidian lance', 'obsidian lance'},             2425, 500,       'obsidian lance')
shopModule:addSellableItem({'naginata', 'naginata'},                         2426, 2000,      'naginata')
shopModule:addSellableItem({'guardian halberd', 'guardian halberd'},         2427, 11000,      'guardian halberd')
shopModule:addSellableItem({'orcish axe', 'orcish axe'},                     2428, 350,       'orcish axe')
shopModule:addSellableItem({'barbarian axe', 'barbarian axe'},               2429, 185,       'barbarian axe')
shopModule:addSellableItem({'knight axe', 'knight axe'},                     2430, 2000,      'knight axe')
shopModule:addSellableItem({'fire axe', 'fire axe'},                         2432, 8000,      'fire axe')
shopModule:addSellableItem({'dwarven axe', 'dwarven axe'},                   2435, 1500,      'dwarven axe')
shopModule:addSellableItem({'daramanian waraxe', 'daramanian waraxe'},       2440, 1000,       'daramanian waraxe')
shopModule:addSellableItem({'war axe', 'war axe'},                           2454, 12000,     'war axe')
shopModule:addSellableItem({'beastslayer axe', 'beastslayer axe'},           3962, 1500,      'beastslayer axe')
shopModule:addSellableItem({'ruthless axe', 'ruthless axe'},                 6553, 45000,     'ruthless axe')
shopModule:addSellableItem({'headchopper', 'headchopper'},                   7380, 6000,      'headchopper')
shopModule:addSellableItem({'vile axe', 'vile axe'},                         7388, 30000,     'vile axe')
shopModule:addSellableItem({'heroic axe', 'heroic axe'},                     7389, 30000,     'heroic axe')
shopModule:addSellableItem({'ornamented axe', 'ornamented axe'},                       7411, 20000,     'ornamented axe')
shopModule:addSellableItem({'butchers axe', 'butchers axe'},                 7412, 18000,     'butchers axe')
shopModule:addSellableItem({'titan axe', 'titan axe'},                       7413, 4000,     'titan axe')
shopModule:addSellableItem({'executioner', 'executioner'},           7453, 55000,     'executioner')
shopModule:addSellableItem({'glorious axe', 'glorious axe'},             7454, 3000,     'glorious axe')
shopModule:addSellableItem({'royal axe', 'royal axe'},                       7434, 40000,    'royal axe')
shopModule:addSellableItem({'angelic axe', 'angelic axe'},               7436, 5000,    'angelic axe')
shopModule:addSellableItem({'hive scythe', 'hive scythe'},                	 15492, 17000,     'hive scythe')
shopModule:addSellableItem({'heavy trident', 'heavy trindent'},              13838, 2000,    'heavy trindent')
shopModule:addSellableItem({'warriors axe', 'warriors axe'},                 15451, 11000,    'warriors axe')
shopModule:addSellableItem({'ornate crossbow', 'ornate crossbow'},           15644, 12000,    'ornate crossbow')
shopModule:addSellableItem({'deepling squelcher', 'deepling squelcher'},      15647, 7000,    'deepling squelcher')
shopModule:addSellableItem({'deepling staff', 'deepling staff'},             15400, 4000,    'deepling staff')
shopModule:addSellableItem({'blade of corruption', 'blade of corruption'},                12649, 60000,     'blade of corruption')

npcHandler:addModule(FocusModule:new())  