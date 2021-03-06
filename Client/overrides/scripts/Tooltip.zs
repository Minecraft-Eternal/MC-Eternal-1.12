import crafttweaker.item.IItemStack;
#MC Eternal Scripts

print("--- loading Tooltip.zs ---");

#Add tooltip
<extrautils2:bagofholding>.addTooltip(format.red("WARNING! Deletes items when switching gamemodes"));
<improvedbackpacks:backpack>.addTooltip(format.red("WARNING! Do not SHIFT+Click place into the world"));
<ftbquests:lootcrate>.withTag({type: "cultist"}).addTooltip(format.darkRed("Step one... Dress to impress!"));
<ftbquests:lootcrate>.withTag({type: "extraterrestrial_cache"}).addTooltip(format.gold("Keep your eyes on the stars, and your feet on the ground. -Theodore Roosevelt"));
<mysticalagriculture:diamond_seeds>.addTooltip(format.darkPurple("Do all Mystical Agriculture quests to unlock"));
<mysticalagriculture:gold_seeds>.addTooltip(format.darkPurple("Do all Farming and Agriculture quests to unlock"));
<minecolonies:blockhuttownhall>.addTooltip(format.darkPurple("Use a supplyship or supplycamp to obtain"));
<actuallyadditions:block_grinder>.addTooltip(format.red("Disabled"));
<ftbquests:lootcrate>.withTag({type: "cheesy_cache"}).addTooltip(format.gold("Hmm I wonder what it tastes like?... Did I really just think that? Yes you did"));
<ftbquests:lootcrate>.withTag({type: "common_lootbox"}).addTooltip(format.gold("Random loot reward for completing a quest"));
<ftbquests:lootcrate>.withTag({type: "unclaimed_black_market_container"}).addTooltip(format.gold("An item sold at a previous auction that was never picked up by the winning bidder. Buyer beware."));
<nuclearcraft:ore:3>.addTooltip(format.darkPurple("Only found in the Beneath"));
<immersiveengineering:ore:5>.addTooltip(format.darkPurple("Only found in the Beneath"));
<icbmclassic:emptower>.addTooltip(format.darkPurple("Only obtainable from the Shop"));
<nuclearcraft:ore:5>.addTooltip(format.darkPurple("Only found in the Beneath"));
<nuclearcraft:ore:6>.addTooltip(format.darkPurple("Only found in the Beneath"));
<nuclearcraft:ore:7>.addTooltip(format.darkPurple("Only found in the Beneath"));
<mekanism:oreblock>.addTooltip(format.darkPurple("Only found in the Beneath"));
<mysticalagriculture:supremium_helmet>.addTooltip(format.red("Disabled Flight"));
<mysticalagriculture:supremium_chestplate>.addTooltip(format.red("Disabled Flight"));
<mysticalagriculture:supremium_leggings>.addTooltip(format.red("Disabled Flight"));
<mysticalagriculture:supremium_boots>.addTooltip(format.red("Disabled Flight"));
<icbmclassic:batterybox>.addTooltip(format.red("DO NOT USE!"));

print("--- Tooltip.zs initialized ---");	
