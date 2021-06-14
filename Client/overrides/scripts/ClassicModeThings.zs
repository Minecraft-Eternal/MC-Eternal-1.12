#packmode classic


print("--- loading ClassicModeThings.zs ---");

#Add Recipes
recipes.addShaped("UniDictisaMeanine", <minecraft:iron_ingot>*6, [[<mysticalagriculture:iron_essence>,<mysticalagriculture:iron_essence>,<mysticalagriculture:iron_essence>],[<mysticalagriculture:iron_essence>,null,<mysticalagriculture:iron_essence>],[<mysticalagriculture:iron_essence>,<mysticalagriculture:iron_essence>,<mysticalagriculture:iron_essence>]]);

#Remove Recipes
var nocraftseeds = [<mysticalagriculture:gold_seeds>,<mysticalagriculture:diamond_seeds>,<mysticalagriculture:blaze_seeds>,<mysticalagradditions:nether_star_seeds>]
for stuff in nocraftseeds {
  recipes.remove(stuff);
 }

print("--- ClassicModeThings.zs initialized ---");
