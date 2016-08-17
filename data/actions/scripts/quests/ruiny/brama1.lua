local config = {
	[3141] = {efekt = {x=77, y=409, z=14}, stronge = Storage.Ruiny.Brama01, brampos = {x=119, y=409, z=14, stackpos=1} , brampos1 = {x=120, y=409, z=14, stackpos=1} , brampos2 = {x=121, y=409, z=14, stackpos=1}},
	[3142] = {efekt = {x=101, y=419, z=14}, stronge = Storage.Ruiny.Brama02, brampos = {x=119, y=408, z=14, stackpos=1} , brampos1 = {x=120, y=408, z=14, stackpos=1} , brampos2 = {x=121, y=408, z=14, stackpos=1}},
	[3143] = {efekt = {x=183, y=409, z=14}, stronge = Storage.Ruiny.Brama03, brampos = {x=119, y=407, z=14, stackpos=1} , brampos1 = {x=120, y=407, z=14, stackpos=1} , brampos2 = {x=121, y=407, z=14, stackpos=1}}
}

function onUse(cid, item, fromPos, item2, toPos)

local v = config[item.uid]
	if v then
function onTimer7()
	doCreateItem(1547,1, v.brampos)
	doCreateItem(1547,1, v.brampos1)
	doCreateItem(1547,1, v.brampos2)
	setGlobalStorageValue(v.stronge, -1)
end
	
local brampos = getThingfromPos(v.brampos)
local brampos1 = getThingfromPos(v.brampos1)	
local brampos2 = getThingfromPos(v.brampos2)	
	
    if getGlobalStorageValue(v.stronge) == -1 then
        doRemoveItem(brampos.uid, 1)
        doRemoveItem(brampos1.uid, 1)
		doRemoveItem(brampos2.uid, 1)
		setGlobalStorageValue(v.stronge, 1)
		doSendMagicEffect(v.efekt,CONST_ME_POFF)
        addEvent(onTimer7, 40*60*1000) --40 minutes
		else
		doPlayerSendCancel(cid,"Sorry not possible.")
    end
end
return true
end