#MC Eternal Scripts

print("--- loading Techreborn.zs ---");

#Remove Items
recipes.remove(<techreborn:grinder>);
recipes.remove(<erebus:gaean_keystone>);
recipes.remove(<erebus:portal_activator>);
recipes.remove(<atum:scarab>);
recipes.remove(<theaurorian:aurorianportalframebricks>);
recipes.remove(<from_the_depths:block_altar_of_summoning>);
recipes.remove(<advancedrocketry:stationbuilder>);
recipes.remove(<advancedrocketry:chemicalreactor>);
recipes.remove(<advancedrocketry:fuelingstation>);
recipes.remove(<advancedrocketry:rocketbuilder>);

#Add Recipes
recipes.addShaped(<advancedrocketry:stationbuilder>, [[<advancedrocketry:ic:2>, <rats:arcane_technology>, <advancedrocketry:ic:2>], [<ore:dustDilithium>, <stevescarts:upgrade:5>, <libvulpes:productdust>], [<advancedrocketry:ic:2>, <ore:componentEVCapacitor>, <advancedrocketry:ic:2>]]);
recipes.addShaped(<techreborn:grinder>, [[<techreborn:cable:4>, <techreborn:iron_furnace>, <techreborn:cable:4>], [<minecraft:flint>, <techreborn:part:40>, <minecraft:flint>]]);
recipes.addShaped(<techreborn:chunk_loader>, [[<techreborn:part:5>, <ore:enderpearl>, <techreborn:part:5>], [<mekanism:ingot>, <techreborn:part:41>, <ore:ingotRefinedObsidian>], [<ore:lapotronCrystal>, <techreborn:plates:32>, <ore:lapotronCrystal>]]);
recipes.addShaped(<advancedrocketry:chemicalreactor>, [[<mekanism:polyethene>, <ore:itemPrecientCrystal>, <mekanism:polyethene>], [<ore:componentEVCapacitor>, <ore:blockCoil>, <ore:componentEVCapacitor>], [<ore:componentControlCircuit>, <twilightforest:tower_device:12>, <ore:componentControlCircuit>]]);
recipes.addShaped(<advancedrocketry:fuelingstation>, [[<ore:crystalIron>, <ore:componentEVCapacitor>, <ore:crystalIron>], [<ore:gearTitanium>, <ore:componentControlCircuit>, <ore:gearTitanium>], [<ore:crystalIron>, <ore:componentEVCapacitor>, <ore:crystalIron>]]);
recipes.addShaped(<advancedrocketry:rocketbuilder>, [[<ore:ingotBrickNetherGlazed>, <ore:gearTitanium>, <ore:ingotBrickNetherGlazed>], [<ore:itemPrecientCrystal>, <ore:componentComputerChip>, <ore:itemPrecientCrystal>], [<ore:ingotBrickNetherGlazed>, <powersuits:powerarmorcomponent:12>, <ore:ingotBrickNetherGlazed>]]);

print("--- Techreborn.zs initialized ---");	