local page = {
	["normal"] = {
		"!exp",
		"!mana",
		"!stat",
		-- "!antibot",
		"!buyhouse",
		"!leavehouse",
		--"!bug - report a bug",
	},
	["event"] = {
		--"!quit - leave event area",
		"!events - see today's schedule",
		--"!dhelp - dungeon system commands(event channel only)"
	},
	["staff"] = {"/a",
"/t",
"/up",
"/down",
"/town",
"/goto",
"/pos",
"/B - broadcast",
"/save",
"/clean",
"/ghost - toggle ghost mode",
"/info - player info",
"/antibot - put a bot check on player",
"/kick",
"/ban",
"/ipban",
"/unban",
"/r - remove item",
"/blogin - toggle login broadcast"}
}

function onSay(cid, words, param, channel)
	if page[param] ~= nil then
		doPlayerPopupFYI(cid,"Available commands in this section:\n" .. table.concat(page[param], "\n"))
	else
		doPlayerPopupFYI(cid,"To display available commands type !help type.\nExample:  !help normal\n\nTypes of commands:\nnormal - common player commands\nevent - event commands" .. (Player(cid):getGroup():getAccess() and "\nstaff - mod/admin commands" or ""))
	end
return false
end
