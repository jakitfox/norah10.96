-- nie edytuj w zwyklym notatniku bo popsuje znaczki i serwer moze wywalic error
local antibot_marks = {"ê", "€", "ó", "œ", "¿", "Ÿ", "æ", "ñ", "~", "@", "#", "&", "_", "\"", "|", "`", ";", "'", ",", "Ê", "Ó", "¥", "Œ", "£", "¯", "", "Æ", "Ñ", "¿", "œ", "ß", "¸", "¨", "´", "·", "`", "°", "¢", "¡", "~", "¦", "ð", "Ð", "§"}
antibot_word = {}
antibot_string = {}

local antibot_cfg = {
	min_acctype_to_check = ACCOUNT_TYPE_GOD, -- minimalny typ konta sprawdzajcego by sprawdzic bottera
	max_acc_type = 2, -- mozna sprawdzic maksymalnie konta typu 2(tutor)
	max_group = 1, -- mozna sprawdzic maksymalnie grupe id 1(player)
	force_check_groupid = 4, -- ignoruje ograniczenia, jesli sprawdzajacy ma przynajmniej taki groupid
	minutes_to_reply = 10, -- czas w minutach na wpisanie kodu
	antibot_code_storage = 800, -- storage, w ktorym znajduje sie kod do przepisania
	autoban = false, -- auto-ban jesli gracz nie odpowie
	bandays = 7 -- ilosc dni bana, nie obsluguje perma
}

function testBotter(cid, minutes, checker)
local minutes = minutes - 1
if Player(cid) == nil then
	if Player(checker) ~= nil then
		doPlayerSendTextMessage(checker, MESSAGE_STATUS_CONSOLE_BLUE, "[Antibot]: Test cancelled - Player is offline.")
	end
return true
end

if getPlayerStorageValue(cid, antibot_cfg.antibot_code_storage) > 0 then
	if antibot_word[cid] == nil or Player(checker) == nil then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[Antibot]: Test cancelled.")
		setPlayerStorageValue(cid, antibot_cfg.antibot_code_storage, 0)
		if Player(checker) ~= nil then
			doPlayerSendTextMessage(checker, MESSAGE_STATUS_CONSOLE_BLUE, "[Antibot]: Test cancelled - Code unavailable.")
		end
		return true
	else
		if minutes < 1 then
			setPlayerStorageValue(cid, antibot_cfg.antibot_code_storage, 0)
			doPlayerSendTextMessage(checker, MESSAGE_STATUS_WARNING, "[Antibot]: Player " .. getPlayerName(cid) .. " is afk.")
			if antibot_cfg.autoban then
				local accountId = getAccountNumberByPlayerName(cid)
				local timeNow = os.time()
				db.query("INSERT INTO `account_bans` (`account_id`, `reason`, `banned_at`, `expires_at`, `banned_by`) VALUES (" ..accountId .. ", 'Botting - autoban', " .. timeNow .. ", " .. timeNow + (antibot_cfg.bandays * 86400) .. ", " .. getPlayerGUIDByName(getCreatureName(checker)) .. ")")
				doPlayerSendTextMessage(checker, MESSAGE_STATUS_WARNING, "[Antibot]: Player " .. getPlayerName(cid) .. " banned.")
				doRemoveCreature(cid)
			end
			return true
		else
			if minutes == 1 then bot_min_s = "" else bot_min_s = "s" end
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Antibot]: Anti-bot test launched. You have " .. minutes .. " minute" .. bot_min_s .. " to prove that you are a human.")
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Antibot]: Code: " .. table.concat(antibot_word[cid]))
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Antibot]: Type !antibot with numbers only. Example: !antibot 4502")
			addEvent(testBotter, 60000, cid, minutes, checker)
			return true
		end
	end
else
	doPlayerSendTextMessage(checker, MESSAGE_STATUS_CONSOLE_BLUE, "[Antibot]: Player " .. getPlayerName(cid) .. " is not botting.")
end
return true
end

function canCheckBot(cid, param)
	if getPlayerGroupId(cid) >= antibot_cfg.force_check_groupid then
		return true
	end
	
	if Player(param) == nil then
		return false
	end
	
	if Player(param):getAccountType() > antibot_cfg.max_acc_type then
		return false
	end
	
	if getPlayerGroupId(param) > antibot_cfg.max_group then
		return false
	end
	return true
end

function onSay(cid, words, param)

	if Player(cid):getAccountType() < antibot_cfg.min_acctype_to_check then
		if antibot_word[cid] == nil or getPlayerStorageValue(cid, antibot_cfg.antibot_code_storage) < 1 then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "No code to rewrite.")
			return false
		end
		
		if tonumber(param) ~= getPlayerStorageValue(cid, antibot_cfg.antibot_code_storage) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Antibot]: Code: " .. table.concat(antibot_word[cid]))
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Antibot]: Type !antibot with numbers only. Example: !antibot 4502")
			return false
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Antibot]: Code accepted.")
			setPlayerStorageValue(cid, antibot_cfg.antibot_code_storage, 0)
			
			for k, tmpPlayer in ipairs(Game.getPlayers()) do
				if tmpPlayer:getGroup():getAccess() then
					tmpPlayer:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "[Antibot]: Player " .. getPlayerName(cid) .." rewrote the code correctly.")
				end
			end
			return false
		end
	end
	
	if getPlayerStorageValue(cid, antibot_cfg.antibot_code_storage) > 0 then
		setPlayerStorageValue(cid, antibot_cfg.antibot_code_storage, 0)
	end
	
	if not getPlayerByName(param) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "This player is offline or does not exist.")
		return false
	end
	
	if param:lower() == getPlayerName(cid):lower() then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You are not botting.")
		return false
	end
	
	local pid = getPlayerByName(param)
	if canCheckBot(cid, param) then
		if getPlayerStorageValue(pid, antibot_cfg.antibot_code_storage) > 0 then
			if antibot_word[pid] == nil then
				setPlayerStorageValue(pid, antibot_cfg.antibot_code_storage, 0)
			else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "There is active bot test on " .. Player(param):getName() .. " already.")
				return false
			end
		end
		
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Test on " .. Player(param):getName() .. " launched. Please do not reload the server now.")
		antibot_word[pid] = {}
		for i = 1, 6 do
			antibot_word[pid][i] = antibot_marks[math.random(1, #antibot_marks)]
		end
		antibot_string[pid] = {}
		for i = 1, 4 do
			table.insert(antibot_word[pid], math.random(1, #antibot_word[pid]), math.random(0, 9))
		end

		for i = 1, #antibot_word[pid] do
			if tonumber(antibot_word[pid][i]) ~= nil then
				table.insert(antibot_string[pid], antibot_word[pid][i])
			end
		end
		setPlayerStorageValue(pid, antibot_cfg.antibot_code_storage, tonumber(table.concat(antibot_string[pid])))
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Code: " .. table.concat(antibot_word[pid]) .. ", Key: " .. table.concat(antibot_string[pid]) .. ", Time: " .. antibot_cfg.minutes_to_reply .. " minutes")
		testBotter(pid, antibot_cfg.minutes_to_reply + 1, cid)
		return false
	end
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You can't test this player.")
return false
end