#MC Eternal Scripts

print("--- loading JAOPCA.zs ---");

#Remove Items
recipes.remove(<jaopca:item_nuggetcoal>);
recipes.removeShapeless(<jaopca:item_nuggetcoal> * 9, [<minecraft:coal>]);

print("--- JAOPCA.zs initialized ---");	