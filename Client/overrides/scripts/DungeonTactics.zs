import crafttweaker.item.IItemTransformer;
#MC Eternal Scripts

print("--- loading DungeonTactics.zs ---");

#Remove Items
recipes.remove(<dungeontactics:iron_ring>);
recipes.removeShapeless(<thermalfoundation:material:768>, [<dungeontactics:mortar&pestle>], true);

#Add Recipes
recipes.addShaped(<dungeontactics:iron_ring>, [[<ore:nuggetIron>, <ore:nuggetIron>, <ore:nuggetIron>], [<minecraft:iron_nugget>, null, <ore:nuggetIron>], [<ore:nuggetIron>, <ore:nuggetIron>, <ore:nuggetIron>]]);
recipes.addShapeless(<thermalfoundation:material:768>, [<dungeontactics:mortar&pestle:*>.transformDamage(), <minecraft:coal:0>]);

print("--- DungeonTactics.zs initialized ---");	