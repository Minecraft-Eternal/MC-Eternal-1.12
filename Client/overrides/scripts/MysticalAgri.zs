import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
#packmode normal
#MC Eternal Scripts

print("--- loading MysticalAgri.zs ---");

#Seeds to remove
var removedSeeds = ["diamond","blaze","coal","emerald","end","enderman","experience","ghast","glowstone","gold","iron","lapis_lazuli","nature","nether","obsidian","pig","redstone","sheep","wood","aluminum","boron","bronze","enderium","invar","iridium","lead","lithium","lumium","thorium","magnesium","osmium","platinum","silver","dirt","creeper","cow"] as string[];

#Essence Recipes to disable
var essenceRecipeNames = ["coal","emerald","end_stone","purpur_block","chorus_fruit","ender_pearl","xp_droplet","ghast_tear","glowstone_dust","dye_13","grass","mycelium","vine","cactus","reeds","pumpkin","melon_block","wheat","potato","poisonous_potato","carrot","beetroot","waterlily","dye","brown_mushroom","red_mushroom","mossy_cobblestone","stonebrick_2","apple","tallgrass","sapling","sapling_1","sapling_2","sapling_3","sapling_4","sapling_5","nether_wart","menril_sapling","netherrack","soul_sand","nether_brick","crafting_2","crafting_3","obsidian","porkchop","redstone","mutton","wool","log","log_1","log_2","log_3","log2","log2_1","ingotaluminum","ingotboron","ingotbronze","ingotinvar","ingotiridium","ingotlead","ingotlithium","ingotlumium","ingotthorium","ingotmagnesium","ingotosmium","ingotplatinum","ingotsilver","dirt","dirt_1","dirt_2","gravel","clay_ball","sand","sand_1","crafting_5","gunpowder","skull_2","record_13","record_cat","record_blocks","record_chirp","record_far","record_mall","record_mellohi","record_stal","record_strad","record_ward","record_11","record_wait","beef","leather","milk_bucket","ingotenderium"] as string[];

#Yeeting process
for theseeds in removedSeeds {
	recipes.remove(itemUtils.getItem("mysticalagriculture:"~theseeds~"_seeds"));
	if ("gold".matches(theseeds) || "diamond".matches(theseeds) ||  "blaze".matches(theseeds)) {
		print("Not hiding "~theseeds~" seeds from JEI as it is still obtainable via quests.");
	} else {
		mods.jei.JEI.removeAndHide(itemUtils.getItem("mysticalagriculture:"~theseeds~"_seeds"));
		mods.jei.JEI.removeAndHide(itemUtils.getItem("mysticalagriculture:"~theseeds~"_crop"));
		mods.jei.JEI.removeAndHide(itemUtils.getItem("mysticalagriculture:"~theseeds~"_essence"));
	}
}
for essenceRecipes in essenceRecipeNames {	
	recipes.removeByRecipeName("mysticalagriculture:"~essenceRecipes);
}

#MystAggra recipes
var mystAggraRecipenames = ["stuff_1","nether_star_seeds","dragon_egg_seeds","dragon_egg_chunks","special_1"] as string[];
for magrecipes in mystAggraRecipenames {
	recipes.removeByRecipeName("mysticalagradditions:"~magrecipes);
}
var hiddenMystAggraMats = {"dragon_egg_seeds" : 0, "dragon_egg_essence": 0, "special" : 1, "stuff" : 2, "dragon_egg_crop" : 0} as int[string];
for materials in hiddenMystAggraMats {
	mods.jei.JEI.removeAndHide(itemUtils.getItem("mysticalagradditions:"~materials, hiddenMystAggraMats[materials]));
}

#Remove Chunk recipes for disabled Mob seeds and hide them
val chunkMetaValue = ["19","18","17","13","10","9","7"] as string[];
for chunks in chunkMetaValue {
	recipes.remove(itemUtils.getItem("mysticalagriculture:chunk",chunks));
	mods.jei.JEI.removeAndHide(itemUtils.getItem("mysticalagriculture:chunk",chunks));
}

print("--- MysticalAgri.zs initialized ---");	
