--[[
	TODO
		Unite all related variables / functions in a table
		rewrite functions like "getTasksByPlayer" to "Player.getTasks"
]]

RANK_NONE = 0
RANK_JOIN = 1
RANK_HUNTSMAN = 2
RANK_RANGER = 3
RANK_BIGGAMEHUNTER = 4
RANK_TROPHYHUNTER = 5
RANK_ELITEHUNTER = 6

REWARD_MONEY = 1
REWARD_EXP = 2
REWARD_ACHIEVEMENT = 3
REWARD_STORAGE = 4
REWARD_POINT = 5
REWARD_ITEM = 6

JOIN_STOR = 3220
QUESTSTORAGE_BASE = 3221
KILLSSTORAGE_BASE = 3301
REPEATSTORAGE_BASE = 3401
POINTSSTORAGE = 3601
tasks =
{
	[1] = {killsRequired = 100, raceName = "Trolls", level = {6, 19}, premium = true, creatures = {"troll", "troll champion", "island troll", "swamp troll"}, rewards = {{type = "exp", value = {200}},{type = "money", value = {200}}}},
	[2] = {killsRequired = 150, raceName = "Goblins", level = {6, 19}, premium = true, creatures = {"goblin", "goblin assassin", "goblin leader"}, rewards = {{type = "exp", value = {300}},{type = "money", value = {250}}}},
	[3] = {killsRequired = 300, raceName = "Crocodiles", level = {6, 49}, premium = true, creatures = {"crocodile"}, rewards = {{type = "exp", value = {800}},{type = "storage", value = {3501, 1}},{type = "points", value = {1}}}},
	[4] = {killsRequired = 300, raceName = "Badgers", level = {6, 49}, premium = true, creatures = {"badger"}, rewards = {{type = "exp", value = {500}},{type = "points", value = {1}}}},
	[5] = {killsRequired = 300, raceName = "Tarantulas", level = {6, 49}, premium = true, creatures = {"tarantula"}, rewards = {{type = "exp", value = {1500}},{type = "storage", value = {3502, 1}},{type = "points", value = {2}}}},
	[6] = {killsRequired = 150, raceName = "Carniphilas", level = {6, 49}, premium = true, creatures = {"carniphila"}, rewards = {{type = "exp", value = {2500}},{type = "storage", value = {3503, 1}},{type = "points", value = {3}}}},
	[7] = {killsRequired = 200, raceName = "Stone Golems", level = {6, 49}, premium = true, creatures = {"stone golem"}, rewards = {{type = "exp", value = {2000}},{type = "points", value = {3}}}},
	[8] = {killsRequired = 300, raceName = "Mammoths", level = {6, 49}, premium = true, creatures = {"mammoth"}, rewards = {{type = "exp", value = {4000}},{type = "storage", value = {3504, 1}},{type = "points", value = {3}}}},
	[9] = {killsRequired = 300, raceName = "Gnarlhounds", level = {6, 49}, premium = true, creatures = {"gnarlhound"}, rewards = {{type = "exp", value = {1000}},{type = "points", value = {2}}}},
	[10] = {killsRequired = 300, raceName = "Terramites", level = {6, 49}, premium = true, creatures = {"terramite"}, rewards = {{type = "exp", value = {1000}},{type = "points", value = {2}}}},
	[11] = {killsRequired = 300, raceName = "Apes", level = {6, 49}, premium = true, creatures = {"kongra", "sibang", "merklin"}, rewards = {{type = "exp", value = {1000}},{type = "points", value = {2}}}},
	[12] = {killsRequired = 300, raceName = "Thornback Tortoises", level = {6, 49}, premium = true, creatures = {"thornback tortoise"}, rewards = {{type = "exp", value = {1500}},{type = "points", value = {2}}}},
	[13] = {killsRequired = 300, raceName = "Gargoyles", level = {6, 49}, premium = true, creatures = {"gargoyle"}, rewards = {{type = "exp", value = {1500}}}},
	[14] = {killsRequired = 300, raceName = "Ice Golems", level = {50, 79}, premium = true, creatures = {"ice golem"}, rewards = {{type = "exp", value = {12000}},{type = "storage", value = {3505, 1}},{type = "points", value = {2}}}},
	[15] = {killsRequired = 400, raceName = "Quara Scouts", level = {50, 79}, premium = true, creatures = {"quara pincher scout", "quara predator scout", "quara hydromancer scout", "quara constrictor scout", "quara mantassin scout"}, rewards = {{type = "exp", value = {10000}},{type = "points", value = {2}}}},
	[16] = {killsRequired = 400, raceName = "Mutated Rats", level = {50, 79}, premium = true, creatures = {"mutated rat"}, rewards = {{type = "exp", value = {10000}},{type = "storage", value = {3506, 1}},{type = "points", value = {2}}}},
	[17] = {killsRequired = 250, raceName = "Ancient Scarabs", level = {50, 79}, premium = true, creatures = {"ancient scarab"}, rewards = {{type = "exp", value = {15000}},{type = "storage", value = {3507, 1}},{type = "points", value = {2}}}},
	[18] = {killsRequired = 300, raceName = "Wyverns", level = {50, 79}, premium = true, creatures = {"wyvern"}, rewards = {{type = "exp", value = {12000}},{type = "points", value = {2}}}},
	[19] = {killsRequired = 300, raceName = "Lancer Beetles", level = {50, 79}, premium = true, creatures = {"lancer beetle"}, rewards = {{type = "exp", value = {8000}},{type = "points", value = {2}}}},
	[20] = {killsRequired = 400, raceName = "Wailing Widows", level = {50, 79}, premium = true, creatures = {"wailing widow"}, rewards = {{type = "exp", value = {12000}},{type = "points", value = {3}}}},
	[21] = {killsRequired = 250, raceName = "Killer Caimans", level = {50, 79}, premium = true, creatures = {"killer caiman"}, rewards = {{type = "exp", value = {10000}},{type = "points", value = {2}}}},
	[22] = {killsRequired = 300, raceName = "Bonebeasts", level = {50, 79}, premium = true, creatures = {"bonebeast"}, rewards = {{type = "exp", value = {12000}},{type = "storage", value = {3508, 1}},{type = "points", value = {2}}}},
	[23] = {killsRequired = 300, raceName = "Crystal Spiders", level = {50, 79}, creatures = {"crystal spider"}, premium = true, rewards = {{type = "exp", value = {15000}},{type = "storage", value = {3509, 1}},{type = "points", value = {3}}}},
	[24] = {killsRequired = 300, raceName = "Mutated Tigers", level = {50, 79}, premium = true, creatures = {"mutated tiger"}, rewards = {{type = "exp", value = {12000}},{type = "points", value = {2}}}},
	[25] = {killsRequired = 600, raceName = "Underwater Quara", level = {80, 129}, premium = true, creatures = {"quara hydromancer", "quara predator", "quara constrictor", "quara mantassin", "quara pincher"}, rewards = {{type = "exp", value = {15000}},{type = "storage", value = {3510, 1}},{type = "points", value = {3}}}},
	[26] = {killsRequired = 500, raceName = "Giant Spiders", level = {80, 129}, premium = true, creatures = {"giant spider"}, rewards = {{type = "exp", value = {20000}},{type = "storage", value = {3511, 1}},{type = "points", value = {3}}}},
	[27] = {killsRequired = 300, raceName = "Werewolves", level = {80, 129}, premium = true, creatures = {"werewolf"}, rewards = {{type = "exp", value = {30000}},{type = "storage", value = {3512, 1}},{type = "points", value = {4}}}},
	[28] = {killsRequired = 400, raceName = "Nightmares", level = {80, 129}, premium = true, creatures = {"nightmare", "nightmare scion"}, rewards = {{type = "exp", value = {25000}},{type = "storage", value = {3513, 1}},{type = "points", value = {3}}}},
	[29] = {killsRequired = 600, raceName = "Hellspawns", level = {80, 129}, premium = true, creatures = {"hellspawn"}, rewards = {{type = "exp", value = {25000}},{type = "storage", value = {3514, 1}}}},
	[30] = {killsRequired = 800, raceName = "High Class Lizards", level = {80, 129}, premium = true, creatures = {"lizard chosen", "lizard dragon priest", "lizard high guard", "lizard legionnaire"}, rewards = {{type = "exp", value = {30000}},{type = "storage", value = {3515, 1}},{type = "points", value = {3}}}},
	[31] = {killsRequired = 600, raceName = "Stampors", level = {80, 129}, premium = true, creatures = {"stampor"}, rewards = {{type = "exp", value = {20000}},{type = "storage", value = {3516, 1}},{type = "points", value = {3}}}},
	[32] = {killsRequired = 500, raceName = "Brimstone Bugs", level = {80, 129}, premium = true, creatures = {"brimstone bug"}, rewards = {{type = "exp", value = {15000}},{type = "storage", value = {3517, 1}},{type = "points", value = {3}}}},
	[33] = {killsRequired = 400, raceName = "Mutated Bats", level = {80, 129}, premium = true, creatures = {"mutated bat"}, rewards = {{type = "exp", value = {20000}},{type = "storage", value = {3518, 1}},{type = "points", value = {2}}}},
	[34] = {killsRequired = 650, raceName = "Hydras", level = {130, 9999}, premium = true, creatures = {"hydra"}, rewards = {{type = "exp", value = {30000}},{type = "storage", value = {3519, 1}},{type = "points", value = {3}}}},
	[35] = {killsRequired = 800, raceName = "Serpent Spawns", level = {130, 9999}, premium = true, creatures = {"serpent spawn"}, rewards = {{type = "exp", value = {30000}},{type = "storage", value = {3520, 1}},{type = "points", value = {4}}}},
	[36] = {killsRequired = 500, raceName = "Medusae", level = {130, 9999}, premium = true, creatures = {"medusa"}, rewards = {{type = "exp", value = {40000}},{type = "storage", value = {3521, 1}},{type = "points", value = {5}}}},
	[37] = {killsRequired = 700, raceName = "Behemoths", level = {130, 9999}, premium = true, creatures = {"behemoth"}, rewards = {{type = "exp", value = {30000}},{type = "storage", value = {3522, 1}},{type = "points", value = {4}}}},
	[38] = {killsRequired = 900, raceName = "Sea Serpents and Young Sea Serpents", level = {130, 9999}, premium = true, creatures = {"sea serpent", "young sea serpent"}, rewards = {{type = "exp", value = {30000}},{type = "storage", value = {3523, 1}},{type = "points", value = {4}}}},
	[39] = {killsRequired = 250, raceName = "Hellhounds", level = {130, 9999}, premium = true, creatures = {"hellhound"}, rewards = {{type = "exp", value = {40000}},{type = "storage", value = {3524, 1}},{type = "points", value = {5}}}},
	[40] = {killsRequired = 500, raceName = "Ghastly Dragons", level = {130, 9999}, premium = true, creatures = {"ghastly dragon"}, rewards = {{type = "exp", value = {30000}},{type = "storage", value = {3525, 1}},{type = "points", value = {5}}}},
	[41] = {killsRequired = 900, raceName = "Drakens", level = {130, 9999}, premium = true, creatures = {"draken spellweaver", "draken warmaster", "draken abomination", "draken elite"} , rewards = {{type = "exp", value = {30000}},{type = "storage", value = {3526, 1}},{type = "points", value = {3}}}},
	[42] = {killsRequired = 650, raceName = "Destroyers", level = {130, 9999}, premium = true, creatures = {"destroyer"}, rewards = {{type = "exp", value = {30000}},{type = "storage", value = {3527, 1}},{type = "points", value = {4}}}},
	[43] = {killsRequired = 400, raceName = "Undead Dragons", level = {130, 9999}, premium = true, creatures = {"undead dragon"}, rewards = {{type = "exp", value = {50000}},{type = "storage", value = {3528, 1}},{type = "points", value = {6}}}},
	[44] = {killsRequired = 6666, raceName = "Demons", level = {130, 9999}, rank = RANK_ELITEHUNTER, premium = true, creatures = {"demon", "demonic"}, rewards = {{type = "storage", value = {Storage.DemonOak.Done, 1}}}},
	[45] = {killsRequired = 500, raceName = "Green Djinns or Efreets", level = {1, 9999}, storage = {12500, 1}, premium = true, creatures = {"green djinn", "efreet"}, rewards = {{type = "exp", value = {10000}},{type = "money", value = {5000}},{type = "storage", value = {3529, 1}}}},
	[46] = {killsRequired = 500, raceName = "Blue Djinns or Marids", level = {1, 9999}, storage = {12501, 1}, premium = true, creatures = {"blue djinn", "marid"}, rewards = {{type = "exp", value = {10000}},{type = "money", value = {5000}},{type = "storage", value = {3530, 1}}}},
	[47] = {killsRequired = 3000, raceName = "Pirates", level = {1, 9999}, storage = {12600, 1}, premium = true, creatures = {"pirate ghost", "pirate marauder", "pirate cutthroad", "pirate buccaneer", "pirate corsair", "pirate skeleton"}, rewards = {{type = "exp", value = {10000}},{type = "money", value = {5000}},{type = "storage", value = {3531, 1}}}},
	[48] = {killsRequired = 3000, raceName = "Pirates second task", level = {1, 9999}, storage = {REPEATSTORAGE_BASE + 47, 3}, norepeatable = true, premium = true, creatures = {"pirate ghost", "pirate marauder", "pirate cutthroad", "pirate buccaneer", "pirate corsair", "pirate skeleton"}, rewards = {{type = "exp", value = {10000}},{type = "money", value = {5000}},{type = "storage", value = {3532, 1}}}},
	[49] = {killsRequired = 5000, raceName = "Minotaurs", level = {1, 40}, storage = {12700, 1}, norepeatable = true, premium = false, creatures = {"minotaur", "minotaur mage", "minotaur archer"}, rewards = {{type = "storage", value = {3533, 1}}}},
	[50] = {killsRequired = 4000, raceName = "Necromancers and Priestess", level = {60, 9999}, norepeatable = true, premium = true, creatures = {"necromancer", "priestess"}, rewards = {{type = "storage", value = {35033, 1}},{type = "storage", value = {12800, 1}}}},  --- Poprawka
	[49] = {killsRequired = 1000, name = "Necromancers and Priestess second task", raceName = "Necromancers and Priestess", level = {60, 9999}, storage = {12800, 1}, norepeatable = true, premium = true, creatures = {"necromancer", "priestess"}, rewards = {{type = "exp", value = {40000}},{type = "storage", value = {3534, 1}}}},
}

tasksByPlayer = 3
repeatTimes = 3

function Player.getPawAndFurRank(self)
	return (self:getStorageValue(POINTSSTORAGE) >= 100 and RANK_ELITEHUNTER or self:getStorageValue(POINTSSTORAGE) >= 70 and RANK_TROPHYHUNTER or self:getStorageValue(POINTSSTORAGE) >= 40 and RANK_BIGGAMEHUNTER or self:getStorageValue(POINTSSTORAGE) >= 20 and RANK_RANGER or self:getStorageValue(POINTSSTORAGE) >= 10 and RANK_HUNTSMAN or self:getStorageValue(JOIN_STOR) == 1 and RANK_JOIN or RANK_NONE)
end

function Player.getPawAndFurPoints(self)
	return math.max(self:getStorageValue(POINTSSTORAGE), 0)
end

function getTaskByName(name, table)
	local t = (table and table or tasks)
	for k, v in pairs(t) do
		if v.name then
			if v.name:lower() == name:lower() then
				return k
			end
		else
			if v.raceName:lower() == name:lower() then
				return k
			end
		end
	end
	return false
end

function Player.getTasks(self)
	local canmake = {}
	local able = {}
	for k, v in pairs(tasks) do
		if self:getStorageValue(QUESTSTORAGE_BASE + k) < 1 and self:getStorageValue(REPEATSTORAGE_BASE + k) < repeatTimes then
			able[k] = true
			if self:getLevel() < v.level[1] or self:getLevel() > v.level[2] then
				able[k] = false
			end
			if v.storage and self:getStorageValue(v.storage[1]) < v.storage[2] then
				able[k] = false
			end

			if v.rank then
				if self:getPawAndFurRank() < v.rank then
					able[k] = false
				end
			end

			if v.premium then
				if not self:isPremium() then
					able[k] = false
				end
			end

			if able[k] then
				canmake[#canmake + 1] = k
			end
		end
	end
	return canmake
end

function Player.canStartTask(self, name, table)
	local v = ""
	local id = 0
	local t = (table and table or tasks)
	for k, i in pairs(t) do
		if i.name then
			if i.name:lower() == name:lower() then
				v = i
				id = k
				break
			end
		else
			if i.raceName:lower() == name:lower() then
				v = i
				id = k
				break
			end
		end
	end
	if v == "" then
		return false
	end
	if self:getStorageValue(QUESTSTORAGE_BASE + id) > 0 then
		return false
	end
	if self:getStorageValue(REPEATSTORAGE_BASE +  id) >= repeatTimes or v.norepeatable and self:getStorageValue(REPEATSTORAGE_BASE +  id) > 0 then
		return false
	end
	if v.level and self:getLevel() >= v.level[1] and self:getLevel() <= v.level[2] then
		if v.premium then
			if self:isPremium() then
				if v.rank then
					if self:getPawAndFurRank() >= v.rank then
						if v.storage then
							if self:getStorageValue(v.storage[1]) >= v.storage then
								return true
							end
						else
							return true
						end
					end
				else
					return true
				end
			else
				return true
			end
		else
			return true
		end
	end
	return false
end

function Player.getStartedTasks(self)
	local tmp = {}
	for k, v in pairs(tasks) do
		if self:getStorageValue(QUESTSTORAGE_BASE + k) > 0 and self:getStorageValue(QUESTSTORAGE_BASE + k) < 2 then
			tmp[#tmp + 1] = k
		end
	end
	return tmp
end

--in case other scripts are using these functions, i'll let them here
function getPlayerRank(cid) local p = Player(cid) return p and p:getPawAndFurRank() end
function getPlayerTasksPoints(cid) local p = Player(cid) return p and p:getPawAndFurPoints() end
function getTasksByPlayer(cid) local p = Player(cid) return p and p:getTasks() end
function canStartTask(cid, name, table) local p = Player(cid) return p and p:canStartTask(name, table) end
function getPlayerStartedTasks(cid) local p = Player(cid) return p and p:getStartedTasks() end