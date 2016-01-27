function onUse(cid, item, fromPosition, itemEx, toPosition)

local voc = {1,2,5,6} -- IDS of all elf vocations

    if getPlayerMagLevel(cid) < 15 then
		if isInArray(voc, getPlayerVocation(cid)) then 
			doCreatureSay(cid, "Dostałeś 80 % magic levela", TALKTYPE_ORANGE_1)
			Player(cid):addManaSpent(Player(cid):getVocation():getRequiredManaSpent(Player(cid):getBaseMagicLevel() + 1)/100*80)
		else
			doCreatureSay(cid, "To jest tylko dla ED i MS", TALKTYPE_ORANGE_1)
		end
	
    elseif getPlayerMagLevel(cid) >= 50 and getPlayerMagLevel(cid) < 90 then
		if isInArray(voc, getPlayerVocation(cid)) then 
			doCreatureSay(cid, "Dostałeś 60 % magic levela", TALKTYPE_ORANGE_1)
			Player(cid):addManaSpent(Player(cid):getVocation():getRequiredManaSpent(Player(cid):getBaseMagicLevel() + 1)/100*60)
		else
			doCreatureSay(cid, "To jest tylko dla ED i MS", TALKTYPE_ORANGE_1)
		end
    elseif getPlayerMagLevel(cid) >= 90 then
		if isInArray(voc, getPlayerVocation(cid)) then 
			doCreatureSay(cid, "Dostałeś 40 % magic levela", TALKTYPE_ORANGE_1)		
			Player(cid):addManaSpent(Player(cid):getVocation():getRequiredManaSpent(Player(cid):getBaseMagicLevel() + 1)/100*40)
		else
			doCreatureSay(cid, "To jest tylko dla ED i MS", TALKTYPE_ORANGE_1)
		end	
end
 return true    
end