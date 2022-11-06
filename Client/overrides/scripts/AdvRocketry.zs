#MC Eternal Scripts

print("--- loading AdvRocketry.zs ---");

#Remove Recipes
recipes.remove(<advancedrocketry:stationbuilder>);
recipes.remove(<advancedrocketry:chemicalreactor>);
recipes.remove(<advancedrocketry:fuelingstation>);
recipes.remove(<advancedrocketry:rocketbuilder>);
recipes.remove(<erebus:gaean_keystone>);
recipes.remove(<erebus:portal_activator>);
recipes.remove(<atum:scarab>);
recipes.remove(<theaurorian:aurorianportalframebricks>);

#Add Recipes
recipes.addShaped(<advancedrocketry:stationbuilder>, [[<advancedrocketry:ic:2>, <rats:arcane_technology>, <advancedrocketry:ic:2>], [<ore:dustDilithium>, <stevescarts:upgrade:5>, <libvulpes:productdust>], [<advancedrocketry:ic:2>, <ore:componentEVCapacitor>, <advancedrocketry:ic:2>]]);
recipes.addShaped(<advancedrocketry:chemicalreactor>, [[<mekanism:polyethene>, <ore:itemPrecientCrystal>, <mekanism:polyethene>], [<ore:componentEVCapacitor>, <ore:blockCoil>, <ore:componentEVCapacitor>], [<ore:componentControlCircuit>, <twilightforest:tower_device:12>, <ore:componentControlCircuit>]]);
recipes.addShaped(<advancedrocketry:fuelingstation>, [[<ore:crystalIron>, <ore:componentEVCapacitor>, <ore:crystalIron>], [<ore:gearTitanium>, <ore:componentControlCircuit>, <ore:gearTitanium>], [<ore:crystalIron>, <ore:componentEVCapacitor>, <ore:crystalIron>]]);
recipes.addShaped(<advancedrocketry:rocketbuilder>, [[<ore:ingotBrickNetherGlazed>, <ore:gearTitanium>, <ore:ingotBrickNetherGlazed>], [<ore:itemPrecientCrystal>, <ore:componentComputerChip>, <ore:itemPrecientCrystal>], [<ore:ingotBrickNetherGlazed>, <powersuits:powerarmorcomponent:12>, <ore:ingotBrickNetherGlazed>]]);

#Space Dimension Tooltips
<erebus:gaean_keystone>.addTooltip(format.red("Erebus is only accessible through Advanced Rocketry."));
<erebus:portal_activator>.addTooltip(format.red("Erebus is only accessible through Advanced Rocketry."));
<atum:scarab>.addTooltip(format.red("The Atum is only accessible through Advanced Rocketry."));
<theaurorian:aurorianportalframebricks>.addTooltip(format.red("The Aurorian is only accessible through Advanced Rocketry."));

print("--- AdvRocketry.zs initialized ---");	
