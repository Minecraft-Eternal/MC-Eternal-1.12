#MC Eternal Scripts

print("--- loading Crushit.zs ---");
#de redstone
mods.immersiveengineering.Crusher.addRecipe(<thermalfoundation:material:893> * 3, <thermalfoundation:ore_fluid:2>, 2048, <thermalfoundation:material:866>, 0.5);
mods.mekanism.crusher.addRecipe(<thermalfoundation:ore_fluid:2>, <thermalfoundation:material:893> * 3);
#de glowstone
mods.immersiveengineering.Crusher.addRecipe(<thermalfoundation:material:894> * 3, <thermalfoundation:ore_fluid:3>, 2048, <thermalfoundation:material:771>, 0.5);
mods.mekanism.crusher.addRecipe(<thermalfoundation:ore_fluid:3>, <thermalfoundation:material:893> * 3);
print("--- Crushit.zs initialized ---");	





# mods.immersiveengineering.Crusher.addRecipe(<minecraft:diamond>, <ore:logWood>, 2048, <minecraft:dirt>, 0.5);
# mods.enderio.SagMill.addRecipe([<minecraft:planks>], [100], <minecraft:log>);
# mods.mekanism.crusher.addRecipe(<minecraft:double_plant:4>, <minecraft:dye:1> * 5);
