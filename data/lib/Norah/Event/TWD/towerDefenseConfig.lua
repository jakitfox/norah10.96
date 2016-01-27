twdConfig = {
    loseHealth = 10, -- How much % should player lose, when the monster walk inside your base
    eventStartTime = 30, -- How long until the event starts, when player step in the teleport [seconds]
    startingCoins = 200, -- How much coins should the player start with!
    startNextWaveTime = 15, -- How long until next wave starts [seconds]
    resetEventTime = 10 -- How long until next player can enter, if someone already was in there [30 seconds] is recommended.
}

-- Write unused storage
playingGameStorage = Storage.TwD.Storage01
coinStorage = Storage.TwD.Storage02

-- Write unused global storage
waveLevelGlobalStorage = Storage.TwD.Storage03 -- Here write
totalMonsterCountGlobalStorage = Storage.TwD.Storage04
totalMonsterKillCountGlobalStorage = Storage.TwD.Storage05

-- Positions
eventRoomPosition = Position(643, 924, 9) -- Where should player get teleported in the event room?
eventCenterPosition = Position(645, 924, 9) -- Center of the event room
summonMonsterPosition = Position(649, 913, 9) -- Where should the monster be created?

turrets = {
    -- AttackTypes = target, aoe and targetAoe
    -- When you create new turret, make sure to write it's looktype in the [allTurretsId]

    allTurretsId = {129, 130},
    [129] = { -- This Example of a target/aoe and targetAoe Turrent [Define by lookType]
        combat = {
            [1] = {attackType = "target", combatType = COMBAT_PHYSICALDAMAGE, combatArea = 0, dmgValues = {10, 25}, magicEffect = CONST_ME_NONE, shootEffect = CONST_ANI_ARROW},
            [2] = {attackType = "targetAoe", combatType = COMBAT_PHYSICALDAMAGE, combatArea = burstArrowArea, dmgValues = {25, 40}, magicEffect = CONST_ME_FIREAREA, shootEffect = CONST_ANI_BURSTARROW},
            [3] = {attackType = "aoe", combatType = COMBAT_PHYSICALDAMAGE, combatArea = AREA_CIRCLE2X2, dmgValues = {40, 55}, magicEffect = CONST_ME_GROUNDSHAKER, shootEffect = CONST_ANI_NONE}
        },
        cfg = {
            turretName = "Archer Tower",
            [1] = {buildPrice = 60, sellPrice = 30, upgradePrice = 200, rangeX = 3, rangeY = 3, colorId = 64, attackSpeed = 2000},
            [2] = {sellPrice = 140, upgradePrice = 300, rangeX = 4, rangeY = 4, colorId = 64, attackSpeed = 1500},
            [3] = {sellPrice = 200, upgradePrice = 0, rangeX = 6, rangeY = 6, colorId = 64, attackSpeed = 1000}
        }
    },
    [130] = { -- This Example of a target/aoe and targetAoe Turrent [Define by lookType]
        combat = {
            [1] = {attackType = "target", combatType = COMBAT_PHYSICALDAMAGE, combatArea = 0, dmgValues = {30, 60}, magicEffect = CONST_ME_FIREAREA, shootEffect = CONST_ANI_FIRE},
            [2] = {attackType = "targetAoe", combatType = COMBAT_PHYSICALDAMAGE, combatArea = burstArrowArea, dmgValues = {60, 80}, magicEffect = CONST_ME_HOLYAREA, shootEffect = CONST_ANI_ENERGY},
            [3] = {attackType = "aoe", combatType = COMBAT_PHYSICALDAMAGE, combatArea = 0, dmgValues = {80, 90}, magicEffect = CONST_ME_MORTAREA, shootEffect = CONST_ANI_SUDDENDEATH}
        },
        cfg = {
            turretName = "Mage Tower",
            [1] = {buildPrice = 120, sellPrice = 60, upgradePrice = 400, rangeX = 6, rangeY = 6, colorId = 65, attackSpeed = 2000},
            [2] = {sellPrice = 280, upgradePrice = 600, rangeX = 6, rangeY = 6, colorId = 65, attackSpeed = 1500},
            [3] = {sellPrice = 400, upgradePrice = 0, rangeX = 6, rangeY = 6, colorId = 65, attackSpeed = 1000}
        }
    }
}

monsters = {-- monsterName, "drop" coins, current Health + extraHealth, speed
    ["Rat"] = {
        coins = 5,
        extraHealth = 0,
        speed = 400
    },
    ["Cave Rat"] = {
        coins = 5,
        extraHealth = 10,
        speed = 100
    },
	["Salamander"] = {
        coins = 7,
        extraHealth = 15,
        speed = 150
    },
	["Dwarf"] = {
        coins = 7,
        extraHealth = 15,
        speed = 150
    },
		["Dwarf"] = {
        coins = 5,
        extraHealth = 10,
        speed = 100
    },
		["Dwarf Soldier"] = {
        coins = 7,
        extraHealth = 15,
        speed = 150
    },
		["Dwarf Guard"] = {
        coins = 10,
        extraHealth = 15,
        speed = 170
    }	
	
}


waves = {
    maxWaveLevel = 8,
    [1] = {
            interval = 1000,
        goldBonus = 100,
        expBonus = 200,
        monsters = {
                        {name = "Rat", count = 10, interval = 500}
            }
    },
    [2] = {
            interval = 1000,
        goldBonus = 150,
        expBonus = 300,
        monsters = {
                        {name = "Cave Rat", count = 10, interval = 500}
            }
    },
    [3] = {
            interval = 1000,
        goldBonus = 200,
        expBonus = 400,
        monsters = {
                {name = "Rat", count = 10, interval = 500},
				{name = "Cave Rat", count = 10, interval = 500},
				{name = "Salamander", count = 5, interval = 500}
            }
    },
	[4] = {
            interval = 1000,
        goldBonus = 250,
        expBonus = 500,
        monsters = {
                        {name = "Cave Rat", count = 10, interval = 500},
						{name = "Salamander", count = 15, interval = 500},
						{name = "Rat", count = 5, interval = 500}
            }
    },
	[5] = {
            interval = 1000,
        goldBonus = 350,
        expBonus = 600,
        monsters = {
                        {name = "Dwarf", count = 15, interval = 500},
						{name = "Dwarf Soldier", count = 5, interval = 500}
            }
    },
	[6] = {
            interval = 1000,
        goldBonus = 400,
        expBonus = 700,
        monsters = {
                        {name = "Dwarf", count = 10, interval = 500},
						{name = "Dwarf Soldier", count = 10, interval = 500},
						{name = "Dwarf Guard", count = 1, interval = 500}
            }
    },
	[7] = {
            interval = 1000,
        goldBonus = 450,
        expBonus = 800,
        monsters = {
                        {name = "Dwarf", count = 5, interval = 500},
						{name = "Dwarf Soldier", count = 10, interval = 500},
						{name = "Dwarf Guard", count = 5 , interval = 500}
            }
    },
	[8] = {
            interval = 1000,
        goldBonus = 500,
        expBonus = 900,
        monsters = {
						{name = "Dwarf Soldier", count = 10, interval = 500},
						{name = "Dwarf Guard", count = 10 , interval = 500},
						{name = "Dwarf", count = 10, interval = 500},
            }
    }		
}