import crafttweaker.item.IItemStack;
#MC Eternal Scripts

print("--- loading AdvRocketry.zs ---");

#Remove Recipes
var removerecipes = [
	<advancedrocketry:rocketbuilder>,
	<advancedrocketry:stationbuilder>,
//	<advancedrocketry:warpmonitor>,
//	<advancedrocketry:warpcore>,
	<advancedrocketry:chemicalreactor>,
//	<advancedrocketry:guidancecomputer>,
//	<advancedrocketry:rollingmachine>,
//	<advancedrocketry:electrolyser>,
//	<advancedrocketry:precisionassemblingmachine>,
//	<advancedrocketry:cuttingmachine>,
	<advancedrocketry:fuelingstation>,
	<advancedrocketry:blastbrick>,
	<advancedrocketry:arcfurnace>,
	<libvulpes:structuremachine>,
	<advancedrocketry:ic:3>,
	<advancedrocketry:ic:4>,
	<advancedrocketry:ic:5>,
	<advancedrocketry:misc:0>,
	<advancedrocketry:liquidtank>,
	
	#Usual Access items, go put in effort :pointingrat:
	<erebus:gaean_keystone>,
	<erebus:portal_activator>,
	<atum:scarab>,
	<theaurorian:aurorianportalframebricks>
] as IItemStack[];

for items in removerecipes {
	recipes.remove(items);
}

#Add Recipes
//Station Assembler
recipes.addShaped("mce_station_assembler", <advancedrocketry:stationbuilder>, [
	[<advancedrocketry:ic:2>, <rats:arcane_technology>, <advancedrocketry:ic:2>],
	[<ore:dustDilithium>, <stevescarts:upgrade:5>, <libvulpes:productdust>],
	[<advancedrocketry:ic:2>, <ore:componentEVCapacitor>, <advancedrocketry:ic:2>]
]);

//Chemical Reactor
recipes.addShaped("mce_advrocketry_chemical_reactor", <advancedrocketry:chemicalreactor>, [
	[<mekanism:polyethene>, <ore:itemPrecientCrystal>, <mekanism:polyethene>],
	[<ore:componentEVCapacitor>, <ore:blockCoil>, <ore:componentEVCapacitor>],
	[<ore:componentControlCircuit>, <twilightforest:tower_device:12>, <ore:componentControlCircuit>]
]);

//Fueling Station
// no reason to be very expensive :V
recipes.addShaped("mce_fueling_station", <advancedrocketry:fuelingstation>, [
	[<ore:crystalIron>, <ore:componentEVCapacitor>, <ore:crystalIron>],
	[<ore:gearTitanium>, <ore:componentControlCircuit>, <ore:gearTitanium>],
	[<ore:crystalIron>, <ore:componentEVCapacitor>, <ore:crystalIron>]
]);

//Rocket Assembler
recipes.addShaped("mce_rocket_assembler", <advancedrocketry:rocketbuilder>, [
	[<ore:ingotBrickNetherGlazed>, <ore:gearTitanium>, <ore:ingotBrickNetherGlazed>],
	[<ore:itemPrecientCrystal>, <ore:componentComputerChip>, <ore:itemPrecientCrystal>],
	[<ore:ingotBrickNetherGlazed>, <powersuits:powerarmorcomponent:12>, <ore:ingotBrickNetherGlazed>]
]);

//Electric Arc Furnace
// now with more overpoweredness!
recipes.addShaped("mce_heatproof_brick", <advancedrocketry:blastbrick> *6, [
	[<iceandfire:dragonforge_ice_brick>, <ore:dustAdamant>, <iceandfire:dragonforge_fire_brick>],
	[<mekanismgenerators:reactor:1>, <nuclearcraft:rad_shielding:2>, <mekanismgenerators:reactor:1>],
	[<iceandfire:dragonforge_fire_brick>, <techreborn:part:14>, <iceandfire:dragonforge_ice_brick>]
]);

recipes.addShaped("mce_electric_arc_furnace", <advancedrocketry:arcfurnace>, [
	[null, <advancedrocketry:misc:0>, null],
	[<iceandfire:dragonforge_ice_core_disabled>, <advancedrocketry:ic:3>, <iceandfire:dragonforge_fire_core_disabled>],
	[<ore:blockFireDragonsteel>, <advancedrocketry:ic:4>, <ore:blockIceDragonsteel>]
]);



//Circuit Boards
// Control
recipes.addShaped("mce_circuit_board_control", <advancedrocketry:ic:3>, [
	[null, <mekanism:controlcircuit:3>, null],
	[<stevescarts:modulecomponents:45>, <techreborn:part:43>, <techreborn:part:1>],
	[<ore:plateDenseEmerald>, <mekanism:teleportationcore>, <ore:plateDenseEmerald>]
]);

// Item IO
recipes.addShaped("mce_circuit_board_item_io", <advancedrocketry:ic:4>, [
	[null, <mekanism:controlcircuit:3>, null],
	[<stevescarts:modulecomponents:45>, <techreborn:part:43>, <actuallyadditions:block_item_viewer>],
	[<ore:plateDenseAmber>, <mekanism:teleportationcore>, <ore:plateDenseAmber>]
]);

// Liquid IO
recipes.addShaped("mce_circuit_board_liquid_io", <advancedrocketry:ic:5>, [
	[null, <mekanism:controlcircuit:3>, null],
	[<stevescarts:modulecomponents:45>, <techreborn:part:43>, <advancedrocketry:liquidtank>],
	[<ore:plateDenseSapphire>, <mekanism:teleportationcore>, <ore:plateDenseSapphire>]
]);


//User Interface
recipes.addShaped("mce_user_interface", <advancedrocketry:misc:0>, [
	[<thermalfoundation:glass:*>, <extrautils2:screen>, <thermalfoundation:glass:*>],
	[<thermalfoundation:glass:*>, <opencomputers:card:3>, <thermalfoundation:glass:*>],
	[<ore:plateTitaniumIridium>, <opencomputers:keyboard>, <ore:plateTitaniumIridium>]
]);


//Machine Structure
recipes.addShaped("mce_machine_structure", <libvulpes:structuremachine> *4, [
	[<ore:stickTitaniumAluminide>, <techreborn:plates:38>, <ore:stickTitaniumAluminide>],
	[<nuclearcraft:part:3>, null, <nuclearcraft:part:3>],
	[<ore:stickTitaniumAluminide>, <ore:plateMithril>, <ore:stickTitaniumAluminide>]
]);


//Pressurized Tank (block)
recipes.addShaped("mce_ar_pressurized_tank_block", <advancedrocketry:liquidtank>, [
	[<ore:plateTitaniumIridium>, <openblocks:tank>, <ore:plateTitaniumIridium>],
	[<libvulpes:structuremachine>, <openblocks:tank>, <libvulpes:structuremachine>]
]);

#Space Dimension Tooltips
var ohnoeffort = {
	<erebus:gaean_keystone> : "advancement.erebus.exploration.root",
	<erebus:portal_activator> : "advancement.erebus.exploration.root",
	<atum:scarab> : "itemGroup.atum",
	<theaurorian:aurorianportalframebricks> : "itemGroup.theaurorian"
} as string[IItemStack];

for usualobjects in ohnoeffort {
	usualobjects.addTooltip(format.red(game.localize("mce.advrocketry.message.get_there_with_rocket.1").replace("%s", game.localize(ohnoeffort[usualobjects]))));
	usualobjects.addTooltip(format.red(game.localize("mce.advrocketry.message.get_there_with_rocket.2")));
}

print("--- AdvRocketry.zs initialized ---");	
