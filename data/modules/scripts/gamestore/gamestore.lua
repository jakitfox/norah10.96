-- Parser
dofile('data/modules/scripts/gamestore/init.lua')
-- Config
GameStore.Categories = {
	-- You can use default key [...] or ["..."] or name (=)
	--[[ example = ]] {	name = "Mounts",
		state = GameStore.States.STATE_NEW,
		icons = {"Category_Mounts.png"},
		offers = {
			{name = "Tombstinger", thingId = 36, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 600, icons = {"Product_Tombstinger.png"}, description = "This mount looks so hot!"},
			{name = "Desert King", thingId = 41, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 450, icons = {"Product_Desert_King.png"}, description = "This mount looks so hot!"},
			{name = "Death Crawler", thingId = 46, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 600, icons = {"Product_Death_Crawler.png"}, description = "This mount looks so hot!"},
			{name = "Flamesteed", thingId = 47, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 900, icons = {"Product_Flamesteed.png"}, description = "This mount looks so hot!"},
			{name = "Jade Lion", thingId = 48, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 450, icons = {"Product_Jade_Lion.png"}, description = "This mount looks so hot!"},
			{name = "Jade Pincer", thingId = 49, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 600, icons = {"Product_Jade_Pincer.png"}, description = "This mount looks so hot!"},
			{name = "Nethersteed", thingId = 50, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 900, icons = {"Product_Nethersteed.png"}, description = "This mount looks so hot!"},
			{name = "Tempest", thingId = 51, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 900, icons = {"Product_Tempest.png"}, description = "This mount looks so hot!"},
			{name = "Winter King", thingId = 52, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 450, icons = {"Product_Winter_King.png"}, description = "This mount looks so hot!"},
			{name = "Doombringer", thingId = 53, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 780, icons = {"Product_Doombringer.png"}, description = "This mount looks so hot!"},
			{name = "Woodland Prince", thingId = 54, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 780, icons = {"Product_Woodland_Prince.png"}, description = "This mount looks so hot!"},
			{name = "Hailstorm Fury", thingId = 55, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 780, icons = {"Product_Hailstorm_Fury.png"}, description = "This mount looks so hot!"},
			{name = "Siegebreaker", thingId = 56, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 690, icons = {"Product_Siegebreaker.png"}, description = "This mount looks so hot!"},
			{name = "Poisonbane", thingId = 57, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 690, icons = {"Product_Poisonbane.png"}, description = "This mount looks so hot!"},
			{name = "Blackpelt", thingId = 58, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 690, icons = {"Product_Blackpelt.png"}, description = "This mount looks so hot!"},
			{name = "Golden Dragonfly", thingId = 59, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 600, icons = {"Product_Golden_Dragonfly.png"}, description = "This mount looks so hot!"},
			{name = "Steel Bee", thingId = 60, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 600, icons = {"Product_Steel_Bee.png"}, description = "This mount looks so hot!"},
			{name = "Copper Fly", thingId = 61, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 600, icons = {"Product_Copper_Fly.png"}, description = "This mount looks so hot!"},
			{name = "Tundra Rambler", thingId = 62, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 750, icons = {"Product_Tundra_Rambler.png"}, description = "This mount looks so hot!"},
			{name = "Highland Yak", thingId = 63, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 750, icons = {"Product_Highland_Yak.png"}, description = "This mount looks so hot!"},
			{name = "Glacier Vagabond", thingId = 64, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 750, icons = {"Product_Glacier_Vagabond.png"}, description = "This mount looks so hot!"},
			{name = "Flying Divan", thingId = 65, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 900, icons = {"Product_Flying_Divan.png"}, description = "This mount looks so hot!"},
			{name = "Magic Carpet", thingId = 66, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 900, icons = {"Product_Magic_Carpet.png"}, description = "This mount looks so hot!"},
			{name = "Floating Kashmir", thingId = 67, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 900, icons = {"Product_Floating_Kashmir.png"}, description = "This mount looks so hot!"},
			{name = "Ringtail Waccoon", thingId = 68, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 750, icons = {"Product_Ringtail_Waccoon.png"}, description = "This mount looks so hot!"},
			{name = "Night Waccoon", thingId = 69, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 750, icons = {"Product_Night_Waccoon.png"}, description = "This mount looks so hot!"},
			{name = "Emerald Waccoon", thingId = 70, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 750, icons = {"Product_Emerald_Waccoon.png"}, description = "This mount looks so hot!"},
			{name = "Shadow Hart", thingId = 72, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 660, icons = {"Product_Shadow_Hart.png"}, description = "This mount looks so hot!"},
			{name = "Black Stag", thingId = 73, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 660, icons = {"Product_Black_Stag.png"}, description = "This mount looks so hot!"},
			{name = "Emperor Deer", thingId = 74, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 660, icons = {"Product_Emperor_Deer.png"}, description = "This mount looks so hot!"},
			{name = "Flitterkatzen", thingId = 75, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 870, icons = {"Product_Flitterkatzen.png"}, description = "This mount looks so hot!"},
			{name = "Venompaw", thingId = 76, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 870, icons = {"Product_Venompaw.png"}, description = "This mount looks so hot!"},
			{name = "Batcat", thingId = 77, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 870, icons = {"Product_Batcat.png"}, description = "This mount looks so hot!"},
			{name = "Sea Devil", thingId = 78, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 570, icons = {"Product_Sea_Devil.png"}, description = "This mount looks so hot!"},
			{name = "Coralripper", thingId = 79, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 570, icons = {"Product_Coralripper.png"}, description = "This mount looks so hot!"},
			{name = "Plumfish", thingId = 80, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 570, icons = {"Product_Plumfish.png"}, description = "This mount looks so hot!"},
			{name = "Gorongra", thingId = 81, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 720, icons = {"Product_Gorongra.png"}, description = "This mount looks so hot!"},
			{name = "Noctungra", thingId = 82, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 720, icons = {"Product_Noctungra.png"}, description = "This mount looks so hot!"},
			{name = "Silverneck", thingId = 83, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 720, icons = {"Product_Silverneck.png"}, description = "This mount looks so hot!"},
			{name = "Slagsnare", thingId = 84, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 780, icons = {"Product_Slagsnare.png"}, description = "This mount looks so hot!"},
			{name = "Nightstinger", thingId = 85, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 780, icons = {"Product_Nightstinger.png"}, description = "This mount looks so hot!"},
			{name = "Razorcreep", thingId = 86, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 780, icons = {"Product_Razorcreep.png"}, description = "This mount looks so hot!"},
			{name = "Nightdweller", thingId = 89, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 870, icons = {"Product_Nightdweller.png"}, description = "This mount looks so hot!"},
			{name = "Frostflare", thingId = 90, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 870, icons = {"Product_Frostflare.png"}, description = "This mount looks so hot!"},
			{name = "Cinderhoof", thingId = 91, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 870, icons = {"Product_Cinderhoof.png"}, description = "This mount looks so hot!"},
			{name = "Mouldpincer", thingId = 92, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 750, icons = {"Product_Mouldpincer.png"}, description = "This mount looks so hot!"},
			{name = "Bloodcurl", thingId = 93, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 750, icons = {"Product_Bloodcurl.png"}, description = "This mount looks so hot!"},
			{name = "Leafscuttler", thingId = 94, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 750, icons = {"Product_Leafscuttler.png"}, description = "This mount looks so hot!"},
			{name = "Swamp Snapper", thingId = 96, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 690, icons = {"Product_Swamp_Snapper.png"}, description = "This mount looks so hot!"},
			{name = "Mould Shell", thingId = 97, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 690, icons = {"Product_Mould_Shell.png"}, description = "This mount looks so hot!"},
			{name = "Reed Lurker", thingId = 98, type = GameStore.OfferTypes.OFFER_TYPE_MOUNT, price = 690, icons = {"Product_Reed_Lurker.png"}, description = "This mount looks so hot!"}
		}
	},
	
	{	name = "Addons",
		state = GameStore.States.STATE_NEW,
		icons = {"Category_Addons.png"},
		offers = {
		-- Arena Champion Outfit
			{name = "Full Champion Outfit", thingId = {male=633,female=632}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 570, icons = {"Full_Product_Champion.png"}},
			{name = "Champion Outfit", thingId = {male=633,female=632}, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 390, icons = {"Product_Champion.png"}},
			{name = "Champion Addon 1", thingId = {male=633,female=632}, addon = 1, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 120, icons = {"Product_Champion_Addon1.png"}},
			{name = "Champion Addon 2", thingId = {male=633,female=632}, addon = 2, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 120, icons = {"Product_Champion_Addon2.png"}},
		-- Beastmaster Outfit
			{name = "Full Beastmaster Outfit", thingId = {male=637,female=636}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 870, icons = {"Full_Product_Beastmaster.png"}},
			{name = "Beastmaster Outfit", thingId = {male=637,female=636}, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 690, icons = {"Product_Beastmaster.png"}},
			{name = "Beastmaster Addon 1", thingId = {male=637,female=636}, addon = 1, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 120, icons = {"Product_Beastmaster_Addon1.png"}},
			{name = "Beastmaster Addon 2", thingId = {male=637,female=636}, addon = 2, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 120, icons = {"Product_Beastmaster_Addon2.png"}},
		-- Acolyte Outfit
			{name = "Full Acolyte Outfit", thingId = {male=665,female=664}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 900, icons = {"Full_Product_Acolyte.png"}},
			{name = "Acolyte Outfit", thingId = {male=665,female=664}, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 720, icons = {"Product_Acolyte.png"}},
			{name = "Acolyte Addon 1", thingId = {male=665,female=664}, addon = 1, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 120, icons = {"Product_Acolyte_Addon1.png"}},
			{name = "Acolyte Addon 2", thingId = {male=665,female=664}, addon = 2, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 120, icons = {"Product_Acolyte_Addon2.png"}},
		-- Herald Outfit
			{name = "Full Herald Outfit", thingId = {male=667,female=666}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 600, icons = {"Full_Product_Herald.png"}},
			{name = "Herald Outfit", thingId = {male=667,female=666}, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 420, icons = {"Product_Herald.png"}},
			{name = "Herald Addon 1", thingId = {male=667,female=666}, addon = 1, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 120, icons = {"Product_Herald_Addon1.png"}},
			{name = "Herald Addon 2", thingId = {male=667,female=666}, addon = 2, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 120, icons = {"Product_Herald_Addon2.png"}},
		-- Ranger Outfit
			{name = "Full Ranger Outfit", thingId = {male=684,female=683}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 750, icons = {"Full_Product_Ranger.png"}},
			{name = "Ranger Outfit", thingId = {male=684,female=683}, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 570, icons = {"Product_Ranger.png"}},
			{name = "Ranger Addon 1", thingId = {male=684,female=683}, addon = 1, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 120, icons = {"Product_Ranger_Addon1.png"}},
			{name = "Ranger Addon 2", thingId = {male=684,female=683}, addon = 2, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 120, icons = {"Product_Ranger_Addon2.png"}},
		-- Garb Outfit
			{name = "Full Garb Outfit", thingId = {male=695,female=694}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 750, icons = {"Full_Product_Garb.png"}},
			{name = "Garb Outfit", thingId = {male=695,female=694}, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 570, icons = {"Product_Garb.png"}},
			{name = "Garb Addon 1", thingId = {male=695,female=694}, addon = 1, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 120, icons = {"Product_Garb_Addon1.png"}},
			{name = "Garb Addon 2", thingId = {male=695,female=694}, addon = 2, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 120, icons = {"Product_Garb_Addon2.png"}},
		-- Puppeteer Outfit
			{name = "Full Puppeteer Outfit", thingId = {male=697,female=696}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 870, icons = {"Full_Product_Puppeteer.png"}},
			{name = "Puppeteer Outfit", thingId = {male=697,female=696}, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 690, icons = {"Product_Puppeteer.png"}},
			{name = "Puppeteer Addon 1", thingId = {male=697,female=696}, addon = 1, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 120, icons = {"Product_Puppeteer_Addon1.png"}},
			{name = "Puppeteer Addon 2", thingId = {male=697,female=696}, addon = 2, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 120, icons = {"Product_Puppeteer_Addon2.png"}},
		-- Caller Outfit
			{name = "Full Caller Outfit", thingId = {male=699,female=698}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 600, icons = {"Full_Product_Caller.png"}},
			{name = "Caller Outfit", thingId = {male=699,female=698}, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 420, icons = {"Product_Caller.png"}},
			{name = "Caller Addon 1", thingId = {male=699,female=698}, addon = 1, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 120, icons = {"Product_Caller_Addon1.png"}},
			{name = "Caller Addon 2", thingId = {male=699,female=698}, addon = 2, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 120, icons = {"Product_Caller_Addon2.png"}},
		-- Evoker Outfit
			{name = "Full Evoker Outfit", thingId = {male=725,female=724}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 840, icons = {"Full_Product_Evoker.png"}},
			{name = "Evoker Outfit", thingId = {male=725,female=724}, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 660, icons = {"Product_Evoker.png"}},
			{name = "Evoker Addon 1", thingId = {male=725,female=724}, addon = 1, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 120, icons = {"Product_Evoker_Addon1.png"}},
			{name = "Evoker Addon 2", thingId = {male=725,female=724}, addon = 2, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 120, icons = {"Product_Evoker_Addon2.png"}},
		-- Seaweaver Outfit
			{name = "Full Seaweaver Outfit", thingId = {male=733,female=732}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 570, icons = {"Full_Product_Seaweaver.png"}},
			{name = "Seaweaver Outfit", thingId = {male=733,female=732}, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 390, icons = {"Product_Seaweaver.png"}},
			{name = "Seaweaver Addon 1", thingId = {male=733,female=732}, addon = 1, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 120, icons = {"Product_Seaweaver_Addon1.png"}},
			{name = "Seaweaver Addon 2", thingId = {male=733,female=732}, addon = 2, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 120, icons = {"Product_Seaweaver_Addon2.png"}},
		-- Sea Dog Outfit
			{name = "Full Sea Dog Outfit", thingId = {male=750,female=749}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 600, icons = {"Full_Product_Sea_Dog.png"}},
			{name = "Sea Dog Outfit", thingId = {male=750,female=749}, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 420, icons = {"Product_Sea_Dog.png"}},
			{name = "Sea Dog Addon 1", thingId = {male=750,female=749}, addon = 1, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 120, icons = {"Product_Sea_Dog_Addon1.png"}},
			{name = "Sea Dog Addon 2", thingId = {male=750,female=749}, addon = 2, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 120, icons = {"Product_Sea_Dog_Addon2.png"}},
		-- Royal Pumpkin Outfit
			{name = "Full Royal Pumpkin Outfit", thingId = {male=760,female=759}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 840, icons = {"Full_Product_Royal_Pumpkin.png"}},
			{name = "Royal Pumpkin Outfit", thingId = {male=760,female=759}, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 660, icons = {"Product_Royal_Pumpkin.png"}},
			{name = "Royal Pumpkin Addon 1", thingId = {male=760,female=759}, addon = 1, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 120, icons = {"Product_Royal_Pumpkin_Addon1.png"}},
			{name = "Royal Pumpkin Addon 2", thingId = {male=760,female=759}, addon = 2, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 120, icons = {"Product_Royal_Pumpkin_Addon2.png"}},
		-- Winter Warden Outfit
			{name = "Full Winter Warden Outfit", thingId = {male=853,female=852}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 870, icons = {"Full_Product_Winter_Warden.png"}},
			{name = "Winter Warden Outfit", thingId = {male=853,female=852}, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 690, icons = {"Product_Winter_Warden.png"}},
			{name = "Winter Warden Addon 1", thingId = {male=853,female=852}, addon = 1, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 120, icons = {"Product_Winter_Warden_Addon1.png"}},
			{name = "Winter Warden Addon 2", thingId = {male=853,female=852}, addon = 2, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 120, icons = {"Product_Winter_Warden_Addon2.png"}},
		-- Philosopher Outfit
			{name = "Full Philosopher Outfit", thingId = {male=874,female=873}, addon = 3, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 750, icons = {"Full_Product_Philosopher.png"}},
			{name = "Philosopher Outfit", thingId = {male=874,female=873}, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT, price = 570, icons = {"Product_Philosopher.png"}},
			{name = "Philosopher Addon 1", thingId = {male=874,female=873}, addon = 1, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 120, icons = {"Product_Philosopher_Addon1.png"}},
			{name = "Philosopher Addon 2", thingId = {male=874,female=873}, addon = 2, type = GameStore.OfferTypes.OFFER_TYPE_OUTFIT_ADDON, price = 120, icons = {"Product_Philosopher_Addon2.png"}}	
		}
	},
	
	
	{	name = "Others",
		state = GameStore.States.STATE_NEW,
		icons = {"Category_Others.png"},
		offers = {
			-- Stackable Item Example : thingId = itemId
			--{name = "Crystal Coin", thingId = 2160, count = 200, type = GameStore.OfferTypes.OFFER_TYPE_STACKABLE, price = 150, icons = {"Product_CC.png"}, description = "Become rich!"},
			-- Normal Item Example : thingId = itemId
			--{name = "Sword", thingId = 2376, count = 3, type = GameStore.OfferTypes.OFFER_TYPE_ITEM, price = 150, icons = {"Product_CC.png"}, description = "Become rich!"},
			-- Sexchange example
			{name = "Character Sex Change", type = GameStore.OfferTypes.OFFER_TYPE_SEXCHANGE, price = 200, icons = {"Product_SexChange.png"}},
		}
	},
}

-- For Explanation and information
-- view the readme.md file in github or via markdown viewer.

-- Non-Editable
local runningId = 1
for k, category in ipairs(GameStore.Categories) do
	if category.offers then
		for m, offer in ipairs(category.offers) do
			offer.id = runningId
			runningId = runningId + 1
			
			if not offer.type then
				offer.type = GameStore.OfferTypes.OFFER_TYPE_NONE
			end
		end
	end
end