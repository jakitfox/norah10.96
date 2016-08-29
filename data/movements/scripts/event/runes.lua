function onStepOut(creature, item, position, fromPosition)
    if not position:isInRange(MATCH.BOARD.from, MATCH.BOARD.to) and (MATCH.SCORE[creature:getId()] ~= nil) then
        creature:teleportTo(fromPosition)
    end
    return true
end