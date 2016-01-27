local function getSkillId(skillName)
	if skillName == "club" then
		return SKILL_CLUB
	elseif skillName == "sword" then
		return SKILL_SWORD
	elseif skillName == "axe" then
		return SKILL_AXE
	elseif skillName == "dist" then
		return SKILL_DISTANCE
	elseif skillName == "shield" then
		return SKILL_SHIELD
	end
end	
	
function onUse(cid, item, fromPosition, itemEx, toPosition)
local p = Player(cid)
local voc = {3,4,7,8} 
local config = {
	[4501] = {skill = getSkillId"club", text = "club" },
	[4502] = {skill = getSkillId"sword", text = "swarda" },
	[4503] = {skill = getSkillId"axe", text = "axa" },
	[4504] = {skill = getSkillId"shield", text = "shield" }
}
local v = config[item.uid]
    if v and getPlayerSkill(cid, v.skill) < 15 then
		if isInArray(voc, getPlayerVocation(cid)) then 
			doCreatureSay(cid, "Dostałeś 80 % " .. v.text.. "", TALKTYPE_ORANGE_1)
			p:addSkillTries(v.skill, p:getVocation():getRequiredSkillTries(v.skill, p:getSkillLevel(v.skill) + 1)/100*80)
		else
			doCreatureSay(cid, "Nie mozesz w tego uzyc", TALKTYPE_ORANGE_1)
		end
	
    elseif v and getPlayerSkill(cid, v.skill) >= 50 and getPlayerSkill(cid, v.skill) < 90 then
		if isInArray(voc, getPlayerVocation(cid)) then 
			doCreatureSay(cid, "Dostałeś 80 % " .. v.text.. "", TALKTYPE_ORANGE_1)
			p:addSkillTries(v.skill, p:getVocation():getRequiredSkillTries(v.skill, p:getSkillLevel(v.skill) + 1)/100*80)
		else
			doCreatureSay(cid, "To jest tylko dla EK ", TALKTYPE_ORANGE_1)
		end
	
	elseif v and getPlayerSkill(cid, v.skill) >= 90 then
		if isInArray(voc, getPlayerVocation(cid)) then 
			doCreatureSay(cid, "Dostałeś 80 % " .. v.text.. "", TALKTYPE_ORANGE_1)
			p:addSkillTries(v.skill, p:getVocation():getRequiredSkillTries(v.skill, p:getSkillLevel(v.skill) + 1)/100*80)
		else
			doCreatureSay(cid, "To jest tylko dla EK ", TALKTYPE_ORANGE_1)
		end
	
end
 return true    
end