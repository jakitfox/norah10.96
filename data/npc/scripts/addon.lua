local userCfg = {
    storageRange = 36100 -- reserved from 36100 to 36120
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local text = ""
local none = ""
local addon = 0
local check = 0
local value = 0

local cfg = {
    [1] = {"citizen", id = {128, 136}, [3] = {0, 5878, 100}, [4] = {0, 5890, 100, 5902, 50, 2480, 1}},	
    [2] = {"hunter", id = {129, 137},[3] = {0, 5947, 1, 5876, 100, 5948, 100, 5891, 5, 5887, 1, 5888, 1, 5889, 1}}, [4] = {0, 5875, 1},
	[3] = {"mage", id = {130, 141}, [3] = {0, 5958, 1}, [4] = {0, 5894, 70, 5911, 20, 5883, 40, 5922, 35, 5879, 100, 5881, 60, 5882, 40, 5904, 15, 5905, 30}},
    [4] = {"knight", id = {131, 139}, [3] = {0, 5892, 1, 5880, 100}, [4] = {0, 5893, 100, 5924, 1, 5885, 1, 5887, 1}},
	[5] = {"nobleman", id = {132, 140}, [3] = {150000}, [4] = {150000}},
    [6] = {"summoner", id = {130, 141}, [3] = {0, 2181, 1, 2182, 1, 2183, 1, 5904, 10, 2185, 1, 2186, 1, 2187, 1, 2188, 1, 2189, 1, 2190, 1, 2191, 1, 5809, 1, 2193, 10}, [4] = {0, 5903, 1}},
    [7] = {"warrior", id = {134, 142}, [3] = {0, 5925, 100, 5899, 100, 5884, 1, 5919, 1}, [4] = {0, 5887, 1, 5880, 100}},
    [8] = {"barbarian", id = {143, 147}, [3] = {0, 5884, 1, 5885, 1, 5911, 50, 5910, 50, 5879, 100}, [4] = {0, 5880, 100, 5892, 1, 5893, 50, 5876, 50}},
	[9] = {"druid", id = {144, 148}, [3] = {0, 5897, 50, 5896, 50}, [4] = {0, 4869, 1, 9109, 1, 5906, 100, 5942, 1, 5942, 1}},
	[10] = {"wizard", id = {145, 149}, [3] = {0, 2488, 1, 2123, 1, 2492, 1, 2536, 1}, [4] = {0, 5922, 50}},
    [11] = {"oriental", id = {146, 150}, [3] = {0, 5945, 1}, [4] = {0, 5883, 100, 5895, 100, 5891, 1, 5912, 100}},
	[12] = {"pirate", id = {151, 155}, [3] = {0, 6126, 100, 6097, 100, 6098, 100}, [4] = {0, 6099, 1, 6100, 1, 6101, 1, 6102, 1}},
	[13] = {"assassin", id = {152, 156}, [3] = {0, 5898, 30, 5882, 10, 5881, 30, 5895, 20, 5905, 20, 5906, 10, 5885, 1}, [4] = {0, 5909, 50, 5910, 50, 5911, 5912, 50, 5913, 50, 5914, 50, 5879, 100}},
	[14] = {"beggar", id = {153, 157}, [3] = {20000, 5883, 100}, [4] = {0, 6107, 1}},
	[15] = {"shaman", id = {154, 158}, [3] = {0, 3955, 5, 5015, 1}, [4] = {0, 3966, 5, 3967, 5}},
	[16] = {"norseman", id = {251, 252}, [3] = {0, 7290, 5}, [4] = {0, 7290, 10}},
    [17] = {"nightmare", id = {268, 269}, [3] = {0, 6500, 500}, [4] = {0, 6500, 1500}},
    [18] = {"jester", id = {273, 270}, [3] = {0, 5879, 1, 5878, 4}, [4] = {0, 5909, 5}},
    [19] = {"brotherhood", id = {128, 136}, [3] = {0, 6500, 500}, [4] = {0, 6500, 1000}},
	[20] = {"warmaster", id = {336, 355}, [3] = {0, 11334, 100, 11326, 70, 2160, 20}, [4] = {0, 2348, 1}},
	[21] = {"wayfarer", id = {366, 367}, [3] = {0, 5912, 20, 5910, 40, 5911, 20, 11115, 1}, [4] = {0, 10605, 100}},
	[22] = {"afflicted", id = {431, 430}, [3] = {0, 13926, 1}, [4] = {0, 13925, 1}},
	[23] = {"elementalist", id = {433, 432}, [3] = {0, 13756, 1}, [4] = {0, 13940, 1}}
	
}

function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
    if msgcontains(msg, "addon") or msgcontains(msg, "addons") or msgcontains(msg, "help") then
        text = "Tell me which outfit you want to upgrade: "
        for i = 1, #cfg do
            text = text.. "{" ..cfg[i][1].. "}"
            if i == #cfg then
                text = text.. "."
            else
                text = text.. ", "
            end
        end
        npcHandler:say(text, cid)
        talkState[talkUser] = 1
    end
    if talkState[talkUser] == 1 then
        for u = 1, #cfg do
            if msgcontains(msg, cfg[u][1]) then
                if getPlayerStorageValue(cid, (userCfg.storageRange + u)) == 3 then
                    npcHandler:say("You already have all " ..cfg[u][1].. "\'s addons.", cid)
                    npcHandler:resetNpc()
                else
                    npcHandler:say("So, " ..cfg[u][1].. " outfit. Which addon, {first} or {second}?", cid)
                    addon = u
                    talkState[talkUser] = 2
                end
            end
        end
    elseif talkState[talkUser] >= 2 and msgcontains(msg, "first") or msgcontains(msg, "second") then
        check = 0
        text = "Would you like to exchange: "
        if msgcontains(msg, "first") then
            value = 3
        elseif msgcontains(msg, "second") then
            value = 4
        end
        if getPlayerStorageValue(cid, (userCfg.storageRange + addon)) == (value - 2) then
            text = "You already have this addon."
            npcHandler:resetNpc()
        else
            local itemCheck = addon
            if getPlayerSex(cid) == 1 then
                if addon == 3 then
                    itemCheck = 6
                elseif addon == 6 then
                    itemCheck = 3
                end
            end
            if getPlayerMoney(cid) >= cfg[itemCheck][value][1] then
                if #cfg[itemCheck][value] > 1 then
                    for r = 2, #cfg[itemCheck][value] do
                        local new = r + 1
                        if math.ceil(r/2) == r/2 then
                            local itemName = getItemName(cfg[itemCheck][value][r])
                            if cfg[itemCheck][value][new] > 1 then
                                text = text.. "" ..cfg[itemCheck][value][new].. " " ..itemName.. "s"
                            else
                                text = text.. "" ..itemName
                            end
                            if cfg[itemCheck][value][1] > 0 then
                                text = text.. " and " ..cfg[itemCheck][value][1].. " gold"
                            end
                            if r == #cfg[itemCheck][value] - 1 then
                                text = text.. " for " ..msg.. " " ..cfg[itemCheck][1].. " addon?"
                            else
                                text = text.. ", "
                            end
                            if getPlayerItemCount(cid, cfg[itemCheck][value][r]) >= cfg[itemCheck][value][new] then
                                check = check + 1
                            else
                                check = -1000
                                none = "You don't have enough items. You still need "
                                local need = ""
                                if cfg[itemCheck][value][new] > 1 then
                                    none = none.. "" ..(cfg[itemCheck][value][new] - getPlayerItemCount(cid, cfg[itemCheck][value][r]))
                                    need = "s more."
                                else
                                    none = none.. "one "
                                    need = "."
                                end
                                none = none.. " " ..getItemName(cfg[itemCheck][value][r]).. "" ..need
                            end
                        end
                    end
                else
                    text = text.. "" ..cfg[itemCheck][value][1].. " gold for " ..msg.. " " ..cfg[itemCheck][1].. " addon?"
                    check = 1
                end
            else
                check = -1000
                none = "You haven't enough money. You need " ..cfg[itemCheck][value][1].. " gold."
                npcHandler:resetNpc()
            end
            talkState[talkUser] = 3
        end
        npcHandler:say(text, cid)
    elseif talkState[talkUser] == 3 and msgcontains(msg, "yes") then
        if msgcontains(msg, "yes") then
            local itemTake = addon
            if getPlayerSex(cid) == 1 then
                if addon == 3 then
                    itemTake = 6
                elseif addon == 6 then
                    itemTake = 3
                end
            end
            if check > 0 then
                for o = 2, #cfg[itemTake][value] do
                    local new = o + 1
                    if math.ceil(o/2) == o/2 then
                        doPlayerRemoveItem(cid, cfg[itemTake][value][o], cfg[itemTake][value][new])
                    end
                end
                doPlayerRemoveMoney(cid, cfg[itemTake][value][1])
                for p = 1, 2 do
                    doPlayerAddOutfit(cid, cfg[addon].id[p], (value - 2))
                end
                doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_BLUE)
                local quest = 0
                if value - 2 == 1 then
                    quest = 2
                elseif value - 2 == 2 then
                    quest = 1
                end
                if getPlayerStorageValue(cid, (userCfg.storageRange + addon)) == quest then
                    setPlayerStorageValue(cid, (userCfg.storageRange + addon), 3)
                else
                    setPlayerStorageValue(cid, (userCfg.storageRange + addon), value - 2)
                end
                npcHandler:say("Here you are.", cid)
            else
                npcHandler:say(none, cid)
            end  
        else
            npcHandler:say("Don't waste my time.", cid)
        end
        npcHandler:resetNpc()
    end
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())