#packmode classic


print("--- loading ClassicModeThings.zs ---");

#Add Recipes
recipes.addShaped("UniDictisaMeanine", <minecraft:iron_ingot>*6, [[<mysticalagriculture:iron_essence>,<mysticalagriculture:iron_essence>,<mysticalagriculture:iron_essence>],[<mysticalagriculture:iron_essence>,null,<mysticalagriculture:iron_essence>],[<mysticalagriculture:iron_essence>,<mysticalagriculture:iron_essence>,<mysticalagriculture:iron_essence>]]);

#Remove Recipes
recipes.remove(<mysticalagriculture:gold_seeds>);
recipes.remove(<mysticalagriculture:diamond_seeds>);
recipes.remove(<mysticalagriculture:blaze_seeds>);

print("--- ClassicModeThings.zs initialized ---");
