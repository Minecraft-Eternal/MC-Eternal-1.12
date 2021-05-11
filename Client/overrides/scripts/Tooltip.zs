import crafttweaker.item.IItemStack;
#MC Eternal Scripts

print("--- loading Tooltip.zs ---");

#Add tooltip
<extrautils2:bagofholding>.addTooltip(format.red("WARNING! Deletes items when switching gamemodes"));
<rats:arcane_technology>.addTooltip(format.gold("Drops from the Ratlantean Automaton"));
<ftbquests:book>.addTooltip(format.gold("A new beginning, Open me!"));
<minecraft:nether_star>.addTooltip(format.gold("Earth below us, Drifting falling"));
<ebwizardry:crystal_block>.addTooltip(format.gold("Can be used to ward off Nether Portal Corruption"));
<wings:fairy_dust>.addTooltip(format.gold("Can be used to transmute certain metals. This dust radiates primal magic energy"));
<mekanismgenerators:reactor>.addTooltip(format.gold("Only requires one Chemical Reactor for recipe"));
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
<cyclicmagic:inventory_food>.addTooltip(format.red("WARNING! Can deletes items when the game crash or close unexpectedly"));
<cookingforblockheads:sink>.addTooltip(format.red("Does not produce Infinite Water"));
<immersiveengineering:railgun>.addTooltip(format.lightPurple("Damage amplified to 40x"));
<immersiveengineering:revolver>.addTooltip(format.lightPurple("Bullet Damage values amplified to ~50x"));
<thaumicaugmentation:impulse_cannon>.addTooltip(format.lightPurple("Damage Amplified to 20x"));
<agricraft:sprinkler>.addTooltip(format.red("WARNING: Will cause serious FPS lag if Particles are not disabled in Agricraft's Config");

print("--- Tooltip.zs initialized ---");	
