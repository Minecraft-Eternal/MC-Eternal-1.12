#MC Eternal Scripts

print("--- loading Crushit.zs ---");
#de redstone
mods.immersiveengineering.Crusher.addRecipe(<thermalfoundation:ore_fluid:2>, <thermalfoundation:material:893> * 3, 2048, <thermalfoundation:material:866>, 50);
mods.mekanism.crusher.addRecipe(<thermalfoundation:ore_fluid:2>, <thermalfoundation:material:893> * 3);
#de glowstone
mods.immersiveengineering.Crusher.addRecipe(<thermalfoundation:ore_fluid:3>, <thermalfoundation:material:893> * 3, 2048, <thermalfoundation:material:866>, 50);
mods.mekanism.crusher.addRecipe(<thermalfoundation:ore_fluid:3>, <thermalfoundation:material:893> * 3);
print("--- Crushit.zs initialized ---");	





# mods.immersiveengineering.Crusher.addRecipe(<minecraft:diamond>, <ore:logWood>, 2048, <minecraft:dirt>, 0.5);
# mods.enderio.SagMill.addRecipe([<minecraft:planks>], [100], <minecraft:log>);
# mods.mekanism.crusher.addRecipe(<minecraft:double_plant:4>, <minecraft:dye:1> * 5);