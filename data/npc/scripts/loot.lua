local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()                        end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

--10.50--
shopModule:addSellableItem({'mino shield', 'mino shield'},  			  23546, 3000,       'mino shield')
shopModule:addSellableItem({'metal spats', 'metal spats'},  			  23540, 2000,       'metal spats')
shopModule:addSellableItem({'heat core', 'heat core'},  				  23538, 10000,       'heat core')
shopModule:addSellableItem({'glooth cape', 'glooth cape'},  			  23535, 7000,       'glooth cape')
shopModule:addSellableItem({'alloy legs', 'alloy legs'},  				  23539, 11000,       'alloy legs')
shopModule:addSellableItem({'rubber cap', 'rubber cap'},  				  23536, 11000,       'rubber cap')
shopModule:addSellableItem({'mooh\'tah plate', 'mooh\'tah plate'},  	  23537, 6000,       'mooh\'tah plate')
shopModule:addSellableItem({'buckle', 'buckle'},  						  20109, 7000,       'buckle')

--9.80--
shopModule:addSellableItem({'buckle', 'buckle'},  						  20109, 7000,       'buckle')
shopModule:addSellableItem({'helmet of the lost', 'helmet of the lost'},  20132, 2000,       'helmet of the lost')
shopModule:addSellableItem({'spike shield', 'spike shield'},              20090, 250,       'spike shield')

shopModule:addSellableItem({'swamplair armor', 'swamplair armor'},        8880, 16000,    'swamplair armor')
shopModule:addSellableItem({'belted cape', 'belted cape'},            	  8872, 500,    'belted cape')
shopModule:addSellableItem({'paladin armor', 'paladin armor'},            8891, 15000,    'paladin armor')
shopModule:addSellableItem({'crystalline armor', 'crystalline armor'},    8878, 16000,    'crystalline armor')
shopModule:addSellableItem({'zaoan armor', 'zaoan armor'},            	  11301, 14000,    'zaoan armor')
shopModule:addSellableItem({'zaoan robe', 'zaoan robe'},            	  11356, 12000,    'zaoan robe')
shopModule:addSellableItem({"spellweaver's robe", "spellweaver's robe"},  11355, 12000,    "spellweaver's robe")
shopModule:addSellableItem({'dragon scale boots', 'dragon scale boots'},  11118, 150000,    'dragon scale boots')
shopModule:addSellableItem({'guardian boots', 'guardian boots'},          11240, 60000,    'guardian boots')
shopModule:addSellableItem({'zaoan shoes', 'zaoan shoes'},          	  11303, 5000,    'zaoan shoes')
shopModule:addSellableItem({'zaoan helmet', 'zaoan helmet'},          	  11302, 45000,    'zaoan helmet')
shopModule:addSellableItem({'jade hat', 'jade hat'},          			  11368, 12000,    'jade hat')
shopModule:addSellableItem({'zaoan legs', 'zaoan legs'},         		  11304, 14000,    'zaoan legs')
shopModule:addSellableItem({'dragon scale mail', 'dsm'},                  2492, 40000,    'dragon scale mail')
shopModule:addSellableItem({'dwarven armor', 'dwarven armor'},            2503, 30000,    'dwarven armor')
shopModule:addSellableItem({'golden armor', 'golden armor'},              2466, 20000,    'golden armor')
shopModule:addSellableItem({'leopard armor', 'leopard armor'},            3968, 1000,     'leopard armor')
shopModule:addSellableItem({'mammoth fur cape', 'mfc'},                   7463, 6000,     'mammoth fur cape')
shopModule:addSellableItem({'plate armor', 'plate armor'},                2463, 400,      'plate armor')
shopModule:addSellableItem({'chain armor', 'chain armor'},                2464, 70,       'chain armor')
shopModule:addSellableItem({'brass armor', 'brass armor'},                2465, 150,       'brass armor')
shopModule:addSellableItem({'leather armor', 'leather armor'},            2467, 12,       'leather armor')
shopModule:addSellableItem({'magic plate armor', 'magic plate armor'},    2472, 90000,    'magic plate armor')
shopModule:addSellableItem({'knight armor', 'knight armor'},              2476, 5000,     'knight armor')
shopModule:addSellableItem({'scale armor', 'scale armor'},                2483, 75,       'scale armor')
shopModule:addSellableItem({'studded armor', 'studded armor'},            2484, 25,       'studded armor')
shopModule:addSellableItem({'doublet', 'doublet'},                        2485, 3,       'doublet')
shopModule:addSellableItem({'noble armor', 'noble armor'},                2486, 900,     'noble armor')
shopModule:addSellableItem({'crown armor', 'crown armor'},                2487, 12000,    'crown armor')
shopModule:addSellableItem({'pirate shirt', 'pirate shirt'},              6095, 500,      'pirate shirt')
shopModule:addSellableItem({'dark armor', 'dark armor'},                  2489, 400,      'dark armor')
shopModule:addSellableItem({'demon armor', 'demon armor'},                2494, 12000,   'demon armor')
shopModule:addSellableItem({'jacket', 'jacket'},                          2650, 1,        'jacket')
shopModule:addSellableItem({'blue robe', 'blue robe'},                    2656, 10000,    'blue robe')
shopModule:addSellableItem({'terra mantle', 'terra mantle'},              7884, 11000,    'terra mantle')
shopModule:addSellableItem({'glacier rope', 'glacier rope'},              7897, 11000,    'glacier rope')
shopModule:addSellableItem({'lighting robe', 'lighting robe'},            7898, 11000,    'lighting robe')
shopModule:addSellableItem({'magma coat', 'magma coat'},                  7899, 11000,    'magma coat')
shopModule:addSellableItem({'studded legs', 'studded legs'},              2468, 15,       'studded legs')
shopModule:addSellableItem({'golden legs', 'golden legs'},                2470, 30000,   'golden legs')
shopModule:addSellableItem({'knight legs', 'knight legs'},                2477, 5000,     'knight legs')
shopModule:addSellableItem({'brass legs', 'brass legs'},                  2478, 49,       'brass legs')
shopModule:addSellableItem({'crown legs', 'crown legs'},                  2488, 12000,    'crown legs')
shopModule:addSellableItem({'dwarven legs', 'dwarven legs'},              2504, 40000,     'dwarven legs')
shopModule:addSellableItem({'plate legs', 'plate legs'},                  2647, 115,      'plate legs')
shopModule:addSellableItem({'chain legs', 'chain legs'},                  2648, 25,       'chain legs')
shopModule:addSellableItem({'leather legs', 'leather legs'},              2649, 9,        'leather legs')
shopModule:addSellableItem({'mammoth fur shorts', 'mfs'},                 7464, 850,      'mammoth fur shorts')
shopModule:addSellableItem({'terra legs', 'terra legs'},                  7885, 11000,    'terra legs')
shopModule:addSellableItem({'magma legs', 'magma legs'},                  7894, 11000,    'magma legs')
shopModule:addSellableItem({'lighting legs', 'lighting legs'},            7895, 11000,    'lighting legs')
shopModule:addSellableItem({'glacier kilt', 'glacier kilt'},              7896, 11000,    'glacier kilt')
shopModule:addSellableItem({'bast skirt', 'bast skirt'},                  3983, 750,     'bast skirt')
shopModule:addSellableItem({'blue legs', 'blue legs'},                    7730, 12000,    'blue legs')
shopModule:addSellableItem({'pirate knee breeches', 'pkb'},               5918, 200,      'pirate knee breeches')
shopModule:addSellableItem({'steel shield', 'steel shield'},              2509, 80,       'steel shield')
shopModule:addSellableItem({'plate shield', 'plate shield'},              2510, 45,      'plate shield')
shopModule:addSellableItem({'brass shield', 'brass shield'},              2511, 25,       'brass shield')
shopModule:addSellableItem({'wooden shield', 'wooden shield'},            2512, 5,       'wooden shield')
shopModule:addSellableItem({'battle shield', 'battle shield'},            2513, 95,      'battle shield')
shopModule:addSellableItem({'mastermind shield', 'mastermind shield'},    2514, 50000,    'mastermind shield')
shopModule:addSellableItem({'dragon shield', 'dragon shield'},            2516, 4000,     'dragon shield')
shopModule:addSellableItem({'shield of honour', 'shield of honour'},      2517, 520,   'shield of honour')
shopModule:addSellableItem({'beholder shield', 'beholder shield'},        2518, 1200,     'beholder shield')
shopModule:addSellableItem({'crown shield', 'crown shield'},              2519, 8000,     'crown shield')
shopModule:addSellableItem({'demon shield', 'demon shield'},              2520, 30000,    'demon shield')
shopModule:addSellableItem({'dark shield', 'dark shield'},                2521, 400,      'dark shield')
shopModule:addSellableItem({'ornamented shield', 'ornamented shield'},    2524, 1500,     'ornamented shield')
shopModule:addSellableItem({'dwarven shield', 'dwarven shield'},          2525, 100,      'dwarven shield')
shopModule:addSellableItem({'studded shield', 'studded shield'},          2526, 16,       'studded shield')
shopModule:addSellableItem({'tower shield', 'tower shield'},              2528, 8000,     'tower shield')
shopModule:addSellableItem({'black shield', 'black shield'},              2529, 1000,     'black shield')
shopModule:addSellableItem({'copper shield', 'copper shield'},            2530, 50,       'copper shield')
shopModule:addSellableItem({'viking shield', 'viking shield'},            2531, 85,      'viking shield')
shopModule:addSellableItem({'ancient shield', 'ancient shield'},          2532, 900,     'ancient shield')
shopModule:addSellableItem({'vampire shield', 'vampire shield'},          2534, 15000,    'vampire shield')
shopModule:addSellableItem({'castle shield', 'castle shield'},            2535, 5000,    'castle shield')
shopModule:addSellableItem({'medusa shield', 'medusa shield'},            2536, 9000,     'medusa shield')
shopModule:addSellableItem({'phoenix shield', 'phoenix shield'},          2539, 16000,   'phoenix shield')
shopModule:addSellableItem({'scarab shield', 'scarab shield'},            2540, 2000,     'scarab shield')
shopModule:addSellableItem({'bone shield', 'bone shield'},                2541, 80,      'bone shield')
shopModule:addSellableItem({'tempest shield', 'tempest shield'},          2542, 35000,  'tempest shield')
shopModule:addSellableItem({'tusk shield', 'tusk shield'},                3973, 850,     'tusk shield')
shopModule:addSellableItem({'sentinel shield', 'sentinel shield'},        3974, 120,      'sentinel shield')
shopModule:addSellableItem({'salamander shield', 'salamander shield'},    3975, 280,      'salamander shield')
shopModule:addSellableItem({'tortoise shield', 'tortoise shield'},        6131, 150,      'tortoise shield')
shopModule:addSellableItem({'norse shield', 'norse shield'},              7460, 1500,     'norse shield')
shopModule:addSellableItem({'crown', 'crown'},                            2128, 10000,    'crown')
shopModule:addSellableItem({'steel helmet', 'steel helmet'},              2457, 293,      'steel helmet')
shopModule:addSellableItem({'chain helmet', 'chain helmet'},              2458, 17,       'chain helmet')
shopModule:addSellableItem({'iron helmet', 'iron helmet'},                2459, 150,      'iron helmet')
shopModule:addSellableItem({'brass helmet', 'brass helmet'},              2460, 30,       'brass helmet')
shopModule:addSellableItem({'leather helmet', 'leather helmet'},          2461, 4,        'leather helmet')
shopModule:addSellableItem({'devil helmet', 'devil helmet'},              2462, 1000,     'devil helmet')
shopModule:addSellableItem({'viking helmet', 'viking helmet'},            2473, 66,       'viking helmet')
shopModule:addSellableItem({'warrior helmet', 'warrior helmet'},          2475, 5000,     'warrior helmet')
shopModule:addSellableItem({'strange helmet', 'strange helmet'},          2479, 500,      'strange helmet')
shopModule:addSellableItem({'legion helmet', 'legion helmet'},            2480, 22,       'legion helmet')
shopModule:addSellableItem({'soldier helmet', 'soldier helmet'},          2481, 20,       'soldier helmet')
shopModule:addSellableItem({'studded helmet', 'studded helmet'},          2482, 16,        'studded helmet')
shopModule:addSellableItem({'dark helmet', 'dark helmet'},                2490, 250,      'dark helmet')
shopModule:addSellableItem({'crown helmet', 'crown helmet'},              2491, 2500,     'crown helmet')
shopModule:addSellableItem({'demon helmet', 'demon helmet'},              2493, 40000,   'demon helmet')
shopModule:addSellableItem({'crusader helmet', 'crusader helmet'},        2497, 6000,     'crusader helmet')
shopModule:addSellableItem({'royal helmet', 'royal helmet'},              2498, 30000,    'royal helmet')
shopModule:addSellableItem({'mystic turban', 'mystic turban'},            2663, 150,     'mystic turban')
shopModule:addSellableItem({'tribal mask', 'tribal mask'},                3967, 250,      'tribal mask')
shopModule:addSellableItem({'horseman helmet', 'horseman helmet'},        3969, 280,     'horseman helmet')
shopModule:addSellableItem({'feather headdress', 'feather head'},         3970, 850,     'feather headdress')
shopModule:addSellableItem({'charmer tiara', 'charmer tiara'},            3971, 900,    'charmer tiara')
shopModule:addSellableItem({'beholder helmet', 'beholder helmet'},        3972, 7500,    'beholder helmet')
shopModule:addSellableItem({'helmet of the deep', 'heotde'},              5461, 5000,  'helmet of the deep')
shopModule:addSellableItem({'skull helmet', 'skull helmet'},              5741, 40000,    'skull helmet')
shopModule:addSellableItem({'pirate hat', 'pirate hat'},                  6096, 1000,     'pirate hat')
shopModule:addSellableItem({'krimhorn helmet', 'krimhorn helmet'},        7461, 200,      'krimhorn helmet')
shopModule:addSellableItem({'ragnir helmet', 'ragnir helmet'},            7462, 400,      'ragnir helmet')
shopModule:addSellableItem({'earmuffs', 'earmuffs'},                      7459, 1500,     'earmuffs')
shopModule:addSellableItem({'terra hood', 'terra hood'},                  7903, 2500,     'terra hood')
shopModule:addSellableItem({'lighting headband', 'lighba'},               7901, 2500,     'lighting headband')
shopModule:addSellableItem({'glacier mask', 'glacier mask'},              7902, 2500,     'glacier mask')
shopModule:addSellableItem({'boots of haste', 'boots of haste'},          2195, 30000,    'boots of haste')
shopModule:addSellableItem({'leather boots', 'leather boots'},            2643, 2,       'leather boots')
shopModule:addSellableItem({'steel boots', 'steel boots'},                2645, 30000,    'steel boots')
shopModule:addSellableItem({'crocodile boots', 'crocodile boots'},        3982, 1000,     'crocodile boots')
shopModule:addSellableItem({'pirate boots', 'pirate boots'},              5462, 3000,     'pirate boots')
shopModule:addSellableItem({'fur boots', 'fur boots'},                    7457, 2000,     'fur boots')
shopModule:addSellableItem({'terra boots', 'terra boots'},                7886, 2500,     'terra boots')
shopModule:addSellableItem({'magma boots', 'magma boots'},                7891, 2500,     'magma boots')
shopModule:addSellableItem({'glacier shoes', 'glacier shoes'},            7892, 2500,     'glacier shoes')
shopModule:addSellableItem({'lighting boots', 'lighting boots'},          7893, 2500,     'lighting boots')
shopModule:addSellableItem({'grasshopper legs', 'grasshopper legs'},      15490, 15000,     'grasshopper legs')
shopModule:addSellableItem({'carapace shield', 'carapace shield'},        15491, 32000,     'carapace shield')
shopModule:addSellableItem({'calopteryx cape', 'calopteryx cape'},        15489, 15500,     'calopteryx cape')
shopModule:addSellableItem({'warriors shield', 'warriors shield'},        15453, 9000,     'warriors shield')
shopModule:addSellableItem({'necklace of the deep', 'necklace of the deep'},15403, 3000,     'necklace of the deep')
shopModule:addSellableItem({'cobra crown', 'cobra crown'},                12630, 50000,     'cobra crown')
shopModule:addSellableItem({'shield of corruption', 'shield of corruption'},                12644, 50000,     'shield of corruption')
shopModule:addSellableItem({'snake gods wristguard', 'snake gods wristguard'},                12647, 30000,     'snake gods wristguard')
shopModule:addSellableItem({'elite draken mail', 'elite draken mail'},                12607, 50000,     'elite draken mail')
shopModule:addSellableItem({'draken boots', 'draken boots'},        12646, 40000,     'draken boots')
npcHandler:addModule(FocusModule:new()) 