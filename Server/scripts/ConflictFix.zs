import mods.enderio.SoulBinder;
#MC Eternal Scripts

print("--- loading ConflictFix.zs ---");

#Remove Items
recipes.addShaped(<littletiles:recipeadvanced> * 5, [[<ore:paper>, <minecraft:redstone>, <ore:paper>], [<minecraft:redstone>, <minecraft:redstone>, <minecraft:redstone>], [<ore:paper>, <minecraft:redstone>, <ore:paper>]]);
recipes.addShaped(<biomestaff:obsidian_shaft> * 4, [[null, <ore:obsidian>, null], [null, <ore:obsidian>, null], [null, <ore:obsidian>, null]]);
mods.enderio.SoulBinder.addRecipe(<randomthings:obsidianskullring>, <randomthings:obsidianskull>, ["minecraft:skeleton"], 3000);


print("--- ConflictFix.zs initialized ---");	