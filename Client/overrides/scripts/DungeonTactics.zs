import crafttweaker.item.IItemTransformer;
#MC Eternal Scripts

print("--- loading DungeonTactics.zs ---");

#Remove Items
recipes.remove(<dungeontactics:iron_ring>);
recipes.removeShapeless(<thermalfoundation:material:768>, [<dungeontactics:mortar&pestle>], true);
furnace.remove(<techreborn:ore:8>, <dungeontactics:tungsten_dust>);
furnace.remove(<libvulpes:ore0:8>, <dungeontactics:titanium_dust>);
recipes.removeByRecipeName("dungeontactics:misc/materials/extra_materials/tungsten_dust");
recipes.removeByRecipeName("dungeontactics:misc/materials/extra_materials/titanium_dust");



#Add Recipes
recipes.addShaped("mce_nonconflicting_iron_ring", <dungeontactics:iron_ring>, [[<ore:nuggetIron>, <ore:nuggetIron>, <ore:nuggetIron>], [<minecraft:iron_nugget>, null, <ore:nuggetIron>], [<ore:nuggetIron>, <ore:nuggetIron>, <ore:nuggetIron>]]);
recipes.addShapeless("mce_working_mortar_and_pestle_coal_dust", <thermalfoundation:material:768>, [<dungeontactics:mortar&pestle:*>.transformDamage(), <minecraft:coal:0>]);


print("--- DungeonTactics.zs initialized ---");	
