#MC Eternal Scripts

print("--- loading Techreborn.zs ---");

#Remove Items
recipes.remove(<techreborn:grinder>);
furnace.remove(<techreborn:ingot:19>);

#Add Recipes
recipes.addShaped(<techreborn:grinder>, [[<techreborn:cable:4>, <techreborn:iron_furnace>, <techreborn:cable:4>], [<minecraft:flint>, <techreborn:part:40>, <minecraft:flint>]]);
recipes.addShaped(<techreborn:chunk_loader>, [[<techreborn:part:5>, <ore:enderpearl>, <techreborn:part:5>], [<mekanism:ingot>, <techreborn:part:41>, <ore:ingotRefinedObsidian>], [<ore:lapotronCrystal>, <techreborn:plates:32>, <ore:lapotronCrystal>]]);
recipes.addShapeless(<techreborn:ingot:19>, [<ore:ingotIron>, <ore:dustCoal>]);

print("--- Techreborn.zs initialized ---");	
