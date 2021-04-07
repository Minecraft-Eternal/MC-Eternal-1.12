import mods.appliedenergistics2.Grinder;
#MC Eternal Scripts

print("--- loading AE2.zs ---");

#Remove Items
Grinder.removeRecipe(<nuclearcraft:flour>);
Grinder.addRecipe(<nuclearcraft:flour>, <ore:cropWheat>, 5);


print("--- AE2.zs initialized ---");	