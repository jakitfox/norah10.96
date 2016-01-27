function onAddItem(moveitem, tileitem, position)
        if (moveitem.itemid == 7732) then
            Item(tileitem.uid):transform(7665)
            Item(moveitem.uid):remove()
            position:sendMagicEffect(CONST_ME_MAGIC_GREEN)
        elseif (moveitem.itemid == 15271) then
            Item(tileitem.uid):transform(15442)
            Item(moveitem.uid):remove()
            position:sendMagicEffect(CONST_ME_MAGIC_BLUE)            
        end  
    return true
end