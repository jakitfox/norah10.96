function onUse(cid, item, fromPosition, itemEx, toPosition)

local function onTimer5() 
	doTransformItem(13200,3397)
end

if itemEx.itemid == 3397 and itemEx.uid == 3133 then
        doTransformItem(itemEx.uid,3648)
        addEvent(onTimer5, 2*60*1000) -- 2 minutes
    end
return true
end