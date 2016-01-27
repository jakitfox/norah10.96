function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid == 1485 then
		doTransformItem(itemEx.uid, 1484)
		doDecayItem(itemEx.uid)
		return TRUE
	end
	return destroyItem(cid, itemEx, toPosition)
end