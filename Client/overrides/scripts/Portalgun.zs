#MC Eternal Scripts

print("--- loading Portalgun.zs ---");

#Remove Items
recipes.remove(<portalgun:item_portalgun>);

#Add recipe
recipes.addShaped(<portalgun:item_portalgun>, [[<actuallyadditions:block_crystal:2>, <twilightforest:knightmetal_ingot>, <twilightforest:knightmetal_ingot>], [<wrcbe:rep>, <portalgun:item_miniature_black_hole>, <twilightforest:knightmetal_ingot>], [<twilightforest:knightmetal_ingot>, <actuallyadditions:block_crystal:2>, <ore:ingotKnightmetal>]]);

print("--- Portalgun.zs initialized ---");	
