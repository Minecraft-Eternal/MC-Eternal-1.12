#MC Eternal Scripts

print("--- loading Harvestcraft.zs ---");

#Add Recipe
recipes.addShaped(<harvestcraft:toastitem>, [[<ore:cropCinnamon>, <dungeontactics:toast>]]);
recipes.removeShapeless(<harvestcraft:plainyogurtitem> * 4, [<harvestcraft:plainyogurtitem>, <minecraft:leather>]);

print("--- Harvestcraft.zs initialized ---");	