function onStepIn(player, item, position, fromPosition)

local trophy = {
	[3275] = {item = 5807, storage = Storage.SvargrondArena.TrophyGreenhorn, text = "Greenhorn"},
	[3276] = {item = 5806, storage = Storage.SvargrondArena.TrophyScrapper, text = "Scrapper"},
	[3277] = {item = 5805, storage = Storage.SvargrondArena.TrophyWarlord, text = "Warlord"}
	}
local v = trophy[item.uid]
 
	local gobletPosition = player:getPosition()
	gobletPosition.y = gobletPosition.y - 1
	 
	if player:getStorageValue(v.storage) ~= 1 then
		player:setStorageValue(v.storage, 1)
		local goblet = Game.createItem(v.item, 1, gobletPosition)
		goblet:setAttribute("description", ("A brave warrior that finished the ".. v.text .." mode.\nAwarded to %s."):format(player:getName()))
	end
	return true
end