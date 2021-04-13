import mods.enderio.SoulBinder;
import crafttweaker.item.IIngredient;
#MC Eternal Scripts

print("--- loading ConflictFix.zs ---");

#Remove Items
recipes.remove(<littletiles:recipeadvanced>);
recipes.remove(<biomestaff:obsidian_shaft>);
recipes.remove(<enderio:item_material:77>);
recipes.remove(<randomthings:idcard>);
recipes.remove(<vampirism:crossbow_arrow>.withTag({type: "normal"}));
recipes.remove(<dungeontactics:iron_knife>);
recipes.remove(<iceandfire:chain_link>);
recipes.remove(<opencomputers:material:12>);
recipes.remove(<betterbuilderswands:wandiron>);
recipes.remove(<structurize:sceptersteel>);
recipes.remove(<twilightforest:magic_map_focus>);
recipes.remove(<extrautils2:machine>.withTag({Type: "extrautils2:generator_slime"}));
recipes.remove(<quark:birch_trapdoor>);
recipes.remove(<quark:acacia_trapdoor>);
recipes.remove(<quark:spruce_trapdoor>);
recipes.remove(<quark:jungle_trapdoor>);
recipes.remove(<quark:dark_oak_trapdoor>);
recipes.remove(<betterbuilderswands:wandstone>);
recipes.remove(<structurize:sceptergold>);
recipes.remove(<iceandfire:wither_shard>);

#fixes
recipes.addShaped(<littletiles:recipeadvanced> * 5, [[<ore:paper>, <minecraft:redstone>, <ore:paper>], [<minecraft:redstone>, <minecraft:redstone>, <minecraft:redstone>], [<ore:paper>, <minecraft:redstone>, <ore:paper>]]);
recipes.addShaped(<biomestaff:obsidian_shaft> * 4, [[null, <ore:obsidian>, null], [null, <ore:obsidian>, null], [null, <ore:obsidian>, null]]);
recipes.addShaped(<randomthings:idcard>, [[<minecraft:paper>, <ore:dyeBlack>, null], [null, null, null], [null, null, null]]);
recipes.addShaped(<enderio:item_material:77>, [[<ore:dyeBlack>, <minecraft:paper>, null], [null, null, null], [null, null, null]]);
recipes.addShaped(<vampirism:crossbow_arrow>.withTag({type: "normal"}) * 6, [[null, null, null], [<ore:ingotIron>, null, null], [<ore:stickWood>, null, null]]);
recipes.addShaped(<dungeontactics:iron_knife>, [[null, null, null], [null, <ore:ingotIron>, null], [null, <ore:stickWood>, null]]);
recipes.addShaped(<iceandfire:chain_link>, [[null, <ore:nuggetIron>, null], [<ore:nuggetIron>, null, <ore:nuggetIron>], [null, <ore:nuggetIron>, null]]);
recipes.addShaped(<opencomputers:material:12>, [[null, <ore:nuggetIron>, null], [<ore:nuggetIron>, <ore:nuggetIron>, <ore:nuggetIron>], [null, null, null]]);
recipes.addShaped(<betterbuilderswands:wandiron>, [[<ore:ingotIron>, null, null], [null, <ore:stickWood>, null], [null, null, <ore:stickWood>]]);
recipes.addShaped(<structurize:sceptersteel>, [[null, null, <ore:ingotIron>], [null, <ore:stickWood>, null], [<ore:stickWood>, null, null]]);
recipes.addShaped(<twilightforest:magic_map_focus>, [[<ore:RavenFeather>, <twilightforest:torchberries>, null], [<ore:dustGlowstone>, null, null], [null, null, null]]);
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

recipes.addShapeless(<malisisdoors:trapdoor_birch>, [<quark:birch_trapdoor>]);
recipes.addShapeless(<malisisdoors:trapdoor_acacia>, [<quark:acacia_trapdoor>]);
recipes.addShapeless(<malisisdoors:trapdoor_spruce>, [<quark:spruce_trapdoor>]);
recipes.addShapeless(<malisisdoors:trapdoor_jungle>, [<quark:jungle_trapdoor>]);
recipes.addShapeless(<malisisdoors:trapdoor_dark_oak>, [<quark:dark_oak_trapdoor>]);

print("--- ConflictFix.zs initialized ---");	