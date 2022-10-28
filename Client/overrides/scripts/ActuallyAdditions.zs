import mods.actuallyadditions.Crusher;
#MC Eternal Scripts

print("--- loading ActuallyAdditions.zs ---");

//val dustDiamond = <nuclearcraft:gem_dust:0>;
val dustDiamond = <ore:dustDiamond>.firstItem;

mods.actuallyadditions.Crusher.removeRecipe(dustDiamond);

mods.actuallyadditions.Crusher.addRecipe(dustDiamond, <minecraft:diamond>);
mods.actuallyadditions.Crusher.addRecipe(dustDiamond*4, <minecraft:diamond_horse_armor>);

print("--- ActuallyAdditions.zs initialized ---");	
