#MC Eternal Scripts

print("--- loading Portalgun.zs ---");

#Remove Items
recipes.remove(<portalgun:item_portalgun>);
recipes.remove(<littletiles:chisel>);

#Add recipe
recipes.addShaped(<portalgun:item_portalgun>, [[<actuallyadditions:block_crystal:2>, <twilightforest:knightmetal_ingot>, <twilightforest:knightmetal_ingot>], [<wrcbe:rep>, <portalgun:item_miniature_black_hole>, <twilightforest:knightmetal_ingot>], [<twilightforest:knightmetal_ingot>, <actuallyadditions:block_crystal:2>, <ore:ingotKnightmetal>]]);
recipes.addShaped(<littletiles:chisel>, [[<minecraft:iron_ingot>, <minecraft:stone>, <minecraft:stone>], [<minecraft:stone>, <minecraft:stone>, <minecraft:iron_ingot>], [<minecraft:stone>, <minecraft:stone>, <minecraft:stone>]]);

print("--- Portalgun.zs initialized ---");	