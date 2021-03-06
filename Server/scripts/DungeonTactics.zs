#MC Eternal Scripts

print("--- loading DungeonTactics.zs ---");

#Remove Items
recipes.remove(<dungeontactics:iron_ring>);

#Add Recipes
recipes.addShaped(<dungeontactics:iron_ring>, [[<ore:nuggetIron>, <ore:nuggetIron>, <ore:nuggetIron>], [<minecraft:iron_nugget>, null, <ore:nuggetIron>], [<ore:nuggetIron>, <ore:nuggetIron>, <ore:nuggetIron>]]);


print("--- DungeonTactics.zs initialized ---");	