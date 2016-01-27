function onUse(cid, item, frompos, item2, topos)

local statue
statue = Tile(360,502,10):getItemById(8835)

if item.itemid == 1945 and item.uid == 3064 and statue then
	item:transform(1946)	
	statue:remove()
elseif item.itemid == 1946 and item.uid == 3064 and statue then
	item:transform(1945)	
end
return true
end