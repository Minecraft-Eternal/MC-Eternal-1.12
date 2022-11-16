import crafttweaker.item.IIngredient;
#MC Eternal Scripts

print("--- loading ConflictFix.zs ---");

#Remove multishot
mods.thermalexpansion.Enchanter.removeRecipe(<minecraft:book>, <minecraft:arrow>);


#Remove Items
recipes.remove(<littletiles:recipeadvanced>);
recipes.remove(<biomestaff:obsidian_shaft>);
recipes.remove(<enderio:item_material:77>);
recipes.remove(<randomthings:idcard>);
recipes.remove(<vampirism:crossbow_arrow>.withTag({type: "normal"}));
recipes.remove(<iceandfire:chain_link>);
recipes.remove(<opencomputers:material:12>);
recipes.remove(<betterbuilderswands:wandiron>);
recipes.remove(<structurize:sceptersteel>);
recipes.remove(<twilightforest:magic_map_focus>);
recipes.remove(<extrautils2:machine>.withTag({Type: "extrautils2:generator_slime"}));
recipes.remove(<betterbuilderswands:wandstone>);
recipes.remove(<structurize:sceptergold>);
recipes.remove(<iceandfire:wither_shard>);
recipes.removeByRecipeName("techreborn:iron_furnace");
recipes.remove(<bountifulbaubles:ringiron>);

#fixes
recipes.addShaped(<littletiles:recipeadvanced> * 5, [[<ore:paper>, <minecraft:redstone>, <ore:paper>], [<minecraft:redstone>, <minecraft:redstone>, <minecraft:redstone>], [<ore:paper>, <minecraft:redstone>, <ore:paper>]]);
recipes.addShaped(<biomestaff:obsidian_shaft> * 4, [[null, <ore:obsidian>, null], [null, <ore:obsidian>, null], [null, <ore:obsidian>, null]]);
recipes.addShaped(<randomthings:idcard>, [[<minecraft:paper>, <ore:dyeBlack>, null], [null, null, null], [null, null, null]]);
recipes.addShaped(<enderio:item_material:77>, [[<ore:dyeBlack>, <minecraft:paper>, null], [null, null, null], [null, null, null]]);
recipes.addShaped(<vampirism:crossbow_arrow>.withTag({type: "normal"}) * 6, [[null, null, null], [<ore:ingotIron>, null, null], [<ore:stickWood>, null, null]]);
recipes.addShaped(<iceandfire:chain_link>, [[null, <ore:nuggetIron>, null], [<ore:nuggetIron>, null, <ore:nuggetIron>], [null, <ore:nuggetIron>, null]]);
recipes.addShaped(<opencomputers:material:12>, [[null, <ore:nuggetIron>, null], [<ore:nuggetIron>, <ore:nuggetIron>, <ore:nuggetIron>], [null, null, null]]);
recipes.addShaped(<betterbuilderswands:wandiron>, [[<ore:ingotIron>, null, null], [null, <ore:stickWood>, null], [null, null, <ore:stickWood>]]);
recipes.addShaped(<structurize:sceptersteel>, [[null, null, <ore:ingotIron>], [null, <ore:stickWood>, null], [<ore:stickWood>, null, null]]);
recipes.addShapeless(<twilightforest:magic_map_focus>, [<ore:RavenFeather>, <twilightforest:torchberries>, <ore:dustGlowstone>]);
recipes.addShaped(<extrautils2:machine>.withTag({Type: "extrautils2:generator_slime"}), [[<ore:slimeball>, <ore:slimeball>, <ore:slimeball>], [<ore:slimeball>, <ore:blockSlime>, <ore:slimeball>], [<ore:dustRedstone>, <extrautils2:machine>.withTag({Type: "extrautils2:generator"}), <ore:dustRedstone>]]);
recipes.addShapeless(<tconstruct:materials:17>, [<iceandfire:witherbone>]);
recipes.addShapeless(<iceandfire:witherbone>, [<tconstruct:materials:17>]);
recipes.addShapeless(<iceandfire:wither_shard> * 3, [<ore:boneWithered>, <ore:itemFlint>]);
recipes.addShapeless(<quark:birch_trapdoor>, [<malisisdoors:trapdoor_birch>]);
recipes.addShapeless(<quark:acacia_trapdoor>, [<malisisdoors:trapdoor_acacia>]);
recipes.addShapeless(<quark:spruce_trapdoor>, [<malisisdoors:trapdoor_spruce>]);
recipes.addShapeless(<quark:jungle_trapdoor>, [<malisisdoors:trapdoor_jungle>]);
recipes.addShapeless(<quark:dark_oak_trapdoor>, [<malisisdoors:trapdoor_dark_oak>]);
recipes.addShapeless(<randomthings:obsidianskullring>, [<randomthings:obsidianskull>, <dungeontactics:iron_ring>]);
recipes.addShaped(<betterbuilderswands:wandstone>, [[<ore:cobblestone>, null, null], [null, <ore:stickWood>, null], [null, null, <ore:stickWood>]]);
recipes.addShaped(<structurize:sceptergold>, [[null, null, <ore:cobblestone>], [null, <ore:stickWood>, null], [<ore:stickWood>, null, null]]);
recipes.addShaped(<bountifulbaubles:ringiron>, [[<ore:nuggetIron>,<ore:ingotIron>,<ore:nuggetIron>],[<ore:ingotIron>,null,<ore:ingotIron>],[<ore:nuggetIron>,<ore:ingotIron>,<ore:nuggetIron>]]);
#Netherumbrian Pipes recipe by Handeril
recipes.addShaped(<totemic:nether_pipe>, [[<ore:ingotGold>, null, <totemic:flute>], [<ore:ingotGold>, <ore:hideBuffalo>, <ore:ingotNetherite>], [<ore:ingotGold>, <ore:hideBuffalo>, null]]);

//Vanilla Wood Trapdoor Cycling
recipes.remove(<quark:birch_trapdoor>);
recipes.remove(<quark:acacia_trapdoor>);
recipes.remove(<quark:spruce_trapdoor>);
recipes.remove(<quark:jungle_trapdoor>);
recipes.remove(<quark:dark_oak_trapdoor>);
recipes.remove(<futuremc:birch_trapdoor>);
recipes.remove(<futuremc:spruce_trapdoor>);
recipes.remove(<futuremc:jungle_trapdoor>);
recipes.remove(<futuremc:acacia_trapdoor>);
recipes.remove(<futuremc:dark_oak_trapdoor>);

recipes.addShapeless(<quark:birch_trapdoor>, [<futuremc:birch_trapdoor>]);
recipes.addShapeless(<quark:acacia_trapdoor>, [<futuremc:acacia_trapdoor>]);
recipes.addShapeless(<quark:spruce_trapdoor>, [<futuremc:spruce_trapdoor>]);
recipes.addShapeless(<quark:jungle_trapdoor>, [<futuremc:jungle_trapdoor>]);
recipes.addShapeless(<quark:dark_oak_trapdoor>, [<futuremc:dark_oak_trapdoor>]);

recipes.addShapeless(<malisisdoors:trapdoor_birch>, [<quark:birch_trapdoor>]);
recipes.addShapeless(<malisisdoors:trapdoor_acacia>, [<quark:acacia_trapdoor>]);
recipes.addShapeless(<malisisdoors:trapdoor_spruce>, [<quark:spruce_trapdoor>]);
recipes.addShapeless(<malisisdoors:trapdoor_jungle>, [<quark:jungle_trapdoor>]);
recipes.addShapeless(<malisisdoors:trapdoor_dark_oak>, [<quark:dark_oak_trapdoor>]);

recipes.addShapeless(<futuremc:birch_trapdoor>, [<malisisdoors:trapdoor_birch>]);
recipes.addShapeless(<futuremc:acacia_trapdoor>, [<malisisdoors:trapdoor_acacia>]);
recipes.addShapeless(<futuremc:spruce_trapdoor>, [<malisisdoors:trapdoor_spruce>]);
recipes.addShapeless(<futuremc:jungle_trapdoor>, [<malisisdoors:trapdoor_jungle>]);
recipes.addShapeless(<futuremc:dark_oak_trapdoor>, [<malisisdoors:trapdoor_dark_oak>]);

//fix Enchant table not showing in Dischantment gen recipe by removing and readding it lol
recipes.removeByRecipeName("extrautils2:generator_generator_enchant");
recipes.addShaped("eu2_make_table_appear_because_mods_funny", <extrautils2:machine>.withTag({Type: "extrautils2:generator_enchant"}), [
	[<extrautils2:decorativesolidwood:1>, <extrautils2:decorativesolidwood:1>, <extrautils2:decorativesolidwood:1>],
	[<extrautils2:decorativesolidwood:1>, <minecraft:enchanting_table>, <extrautils2:decorativesolidwood:1>],
	[<ore:dustRedstone>, <extrautils2:machine>.withTag({Type: "extrautils2:generator"}), <ore:dustRedstone>]
]);

//#Fix the use of clocks and compasses in the induction smelter
mods.thermalexpansion.InductionSmelter.addRecipe(<minecraft:gold_ingot>*4, <minecraft:sand>, <minecraft:clock>.withTag({"quark:clock_calculated": 1 as byte}), 4000, <thermalfoundation:material:865>, 20);
mods.thermalexpansion.InductionSmelter.addRecipe(<minecraft:iron_ingot>*4, <minecraft:sand>, <minecraft:compass>.withTag({"quark:compass_calculated": 1 as byte, "quark:compass_in_nether": 0 as byte}), 4000, <thermalfoundation:material:865>, 20);
mods.thermalexpansion.InductionSmelter.addRecipe(<minecraft:iron_ingot>*4, <minecraft:sand>, <minecraft:compass>.withTag({"quark:compass_calculated": 1 as byte, "quark:compass_in_nether": 1 as byte}), 4000, <thermalfoundation:material:865>, 20);

print("--- ConflictFix.zs initialized ---");	
