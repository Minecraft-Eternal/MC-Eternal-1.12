#MC Eternal Scripts

print("--- loading InventoryPets.zs ---");

#Remove Items
recipes.remove(<inventorypets:nugget_coal>);
recipes.removeShapeless(<inventorypets:nugget_coal> * 8, [<minecraft:coal>]);

#Add Recipes
recipes.addShapeless(<inventorypets:nugget_coal> * 8, [<immersiveengineering:tool>, <ore:itemCoal>]);

print("--- InventoryPets.zs initialized ---");	