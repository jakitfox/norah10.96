local array = {
    ["widow queen"] = {item = 13307, id = 1}, 
    ["racing bird"] = {item = 13298, id = 2}, 
    ["war bear"] = {item = 5907, id = 3}, 
    ["black sheep"] = {item = 13295, id = 4}, 
    ["midnight panther"] = {item = 13293, id = 5}, 
    ["draptor"] = {item = 13294, id = 6}, 
    ["titanica"] = {item = 13305, id = 7}, 
    ["tin lizzard"] = {item = 13292, id = 8}, 
    ["blazebringer"] = {item = 8301, id = 9},  -- dodać do loota 
    ["rapid boar"] = {item = 13247, id = 10}, -- dodać do loota 
    ["undead cavebear"] = {item = 13291, id = 12},
    ["mule"] = {item = 13537, id = 13},
    ["tiger slug"] = {item = 13508, id = 14}, 
    ["uniwheel"] = {item = 13938, id = 15}, 
    ["crystal wolf"] = {item = 13536, id = 16}, --dodać do loota
    ["kingly deer"] = {item = 13539, id = 18},
    ["tamed panda"] = {item = 13538, id = 19}, 
    ["dramedary"] = {item = 13535, id = 20}, 
    ["sandstone scorion"] = {item =13498, id = 21}, 
	["ladybug"] = {item = 15546, id = 27}, 
	["manta"] = {item = 15545, id = 28}, 
	["ironblight"] = {item = 18447, id = 29}, --dodać do loota
	["magma crawler"] = {item = 18448, id = 30}, --dodać do loota
	["dragonling"] = {item = 18449, id = 31}, --dodać do loota
	["shadow draptor"] = {item = 18215, id = 24} --dodać do loota
	
}	


local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local talk_state = {}

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)            npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                    npcHandler:onThink()                    end
function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
	
	local t = array[msg]
	
	if array[msg] then
		if not getPlayerMount(cid, t.id) then 
			npcHandler:say('Do you have for me {' .. getItemName(t.item) ..'}?', cid)
			talk_state[cid] = 1
			talkState[cid] = msg:lower()
		else 
			npcHandler:say('You already have this mount!', cid) 
			talkState[cid] = nil
		end
		
	elseif msgcontains(msg, 'yes') and talk_state[cid] == 1 then 
		local t = array[talkState[cid]]
		if talkState[cid] == nil then
			return true
		end
		if getPlayerItemCount(cid, t.item) >= 1 then
			doPlayerRemoveItem(cid, t.item, 1)
			doPlayerAddMount(cid, t.id) 
			npcHandler:say("Here you are. Here's your mount", cid)
			talkState[cid] = nil
		else 
			npcHandler:say("You do not have required items.", cid) 
			talkState[cid] = nil
		end
	end
return true 
end 

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())