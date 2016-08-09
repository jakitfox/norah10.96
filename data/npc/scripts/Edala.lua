local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local config = {
	[1] = 'Ashari, |PLAYERNAME|. How... nice to see a human taking interest in a beautiful art such as music.',
	[2] = 'Ashari, |PLAYERNAME|... that sound was.. interesting.',
	[3] = 'Ashari, |PLAYERNAME|. You\'ve made some... progress playing the lyre, haven\'t you..? I want to believe you have.',
	[4] = '|PLAYERNAME|. My regular visitor. I certainly... appreciate your efforts to entertain me, but let me assure you, I\'m quite comfortable up here by myself. Alone. In silence.',
	[5] = 'Ashari, |PLAYERNAME|. I\'m starting to feel a little sorry... for your lyre. Being forced to produce such noise must be a tragic fate.',
	[6] = '|PLAYERNAME|! You\'re driving me insane! I beg you, take your lyre away from this sacred and peaceful place.',
	[7] = '|PLAYERNAME|! My ears! I\'d prefer listening to drunken dwarves rambling all day to the sound of your lyre! Please, at least get it tuned. Here, you can have this elvish diapason.'
}

local function greetCallback(cid)
	local player = Player(cid)
	local lyreProgress = player:getStorageValue(Storage.Diapason.Lyre)
	local greetMessage = config[lyreProgress]
	if greetMessage
			and player:getStorageValue(Storage.Diapason.Edala) == 1
			and player:getStorageValue(Storage.Diapason.EdalaTimer) < os.time() then
		player:setStorageValue(Storage.Diapason.Edala, 0)
		player:setStorageValue(Storage.Diapason.EdalaTimer, os.time() + 86400)
		if lyreProgress == 7 then
			player:setStorageValue(Storage.Diapason.Lyre, 8)
			player:addItem(13536, 1)
		end
		npcHandler:setMessage(MESSAGE_GREET, greetMessage)
	else
		npcHandler:setMessage(MESSAGE_GREET, 'Ashari, |PLAYERNAME|.')
	end
	return true
end

npcHandler:setMessage(MESSAGE_WALKAWAY, 'Asha Thrazi, |PLAYERNAME|!')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Asha Thrazi, |PLAYERNAME|!')

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())