#MC Eternal Scripts

print("--- loading MysticalAgri.zs ---");

#Remove Items
recipes.remove(<mysticalagriculture:iron_seeds>);
recipes.remove(<mysticalagriculture:diamond_seeds>);
recipes.remove(<mysticalagriculture:gold_seeds>);
recipes.remove(<mysticalagradditions:nether_star_seeds>);

#Add Shaped
recipes.addShaped(<mysticalagriculture:iron_seeds>, [[<minecraft:iron_ingot>, <ore:essenceSupremium>, <minecraft:iron_ingot>], [<ore:essenceSupremium>, <mysticalagriculture:crafting:21>, <mysticalagriculture:crafting:4>], [<minecraft:iron_ingot>, <mysticalagriculture:crafting:4>, <minecraft:iron_ingot>]]);

print("--- MysticalAgri.zs initialized ---");	