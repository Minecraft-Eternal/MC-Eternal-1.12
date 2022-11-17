import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.recipes.ICraftingInfo;
import crafttweaker.data.IData;

import mods.nuclearcraft.alloy_furnace;
import mods.mekanism.combiner;
import mods.techreborn.alloySmelter;
import mods.chisel.Carving;

#MC Eternal Scripts

print("--- loading MiscCrafting.zs ---");

#Yeet Things
var itemsToNuke = [
	<xreliquary:twilight_cloak>,
	<extrautils2:bagofholding>,
	<bewitchment:poppet_deathprotection>,
	<bewitchment:poppet_vampiric>,
	<openmodularturrets:addon_meta:1>,
 	<inventorypets:solstice_sword>,
	<randomthings:spectreanchor>
] as IItemStack[];

for item in itemsToNuke {
	recipes.remove(item);
	item.addTooltip(format.red("Disabled"));
}

#Homing Beecon
recipes.addShaped(<erebus:homing_beecon_advanced>, [[<erebus:materials:41>],[<erebus:homing_beecon>],[<mekanism:teleportationcore>]]);

#Soul Torches
recipes.addShaped("soultorch_mce", <futuremc:soul_fire_torch>, [[<ore:coal>|<ore:charcoal>],[<ore:stickWood>],[<ore:soulSand>]]);

#Soul Soil
recipes.addShapeless("soulsoil_mce", <futuremc:soul_soil>, [<ore:soulSand>,<ore:dirt>]);

#Jade Seeds
#funny recipe for the sake of funny
#these are really not necessary to make, you just don't need that much jade, but it's also a very op endgame material so hehe
recipes.remove(<mysticalagriculture:jade_seeds>);
recipes.addShaped("jadeseeds_mce", <mysticalagriculture:jade_seeds>, 
	[[<erebus:jade_block>, <mysticalagradditions:storage:1>, <erebus:jade_block>], 
	[<mysticalagradditions:storage:1>, <mysticalagradditions:insanium:1>, <mysticalagradditions:storage:1>], 
	[<erebus:jade_block>, <mysticalagradditions:storage:1>, <erebus:jade_block>]]
);

#Remove some funni Duping
val noDupeRecipeNames = [
	"biomesoplenty:amber",
	"biomesoplenty:amber_block",
	"bewitchment:block_of_salt",
	"bewitchment:block_of_salt_to_resource"
] as string[];

var chiseling = {
	"amberblock": [
		<biomesoplenty:gem_block:7>,
		<thaumcraft:amber_block>,
		<thaumcraft:amber_brick>,
		<thaumadditions:chiseled_amber_block>
	],
	"saltblock": [
		<bewitchment:block_of_salt>,
		<mekanism:saltblock>
	]
} as IItemStack[][string];

for entry in chiseling {
	Carving.addGroup(entry);
	for block in chiseling[entry] {
		Carving.addVariation(entry, block);
	}
}

#Danknull T6
#stupidly op and too stupidly cheap, some spicy is nice yeah?
recipes.remove(<danknull:dank_null_5>);
recipes.addShaped("danknull_t6_mce", <danknull:dank_null_5>.withTag({display:{Lore:["Compact Machine must be freshly crafted","Contents and settings will be retained!"]}}),
	[[<danknull:dank_null_panel_5>, <rats:idol_of_ratlantis>, <danknull:dank_null_panel_5>],
	[<extracells:storage.component:2>, <danknull:dank_null_4>.marked("dank5"), <extracells:storage.component:2>],
	[<danknull:dank_null_panel_5>, <compactmachines3:machine:5>.marked("cm"),<danknull:dank_null_panel_5>]],
	
	function(output as IItemStack, input as IItemStack[string], cInfo as ICraftingInfo){
		if(!input.cm.hasTag){
			return output.withTag(input.dank5.tag);
		} else {
			return null;
		}
	}
);

#Forced Danknull tiering
val dankRecipes = [
	"dank_null_1",
	"dank_null_2",
	"dank_null_3",
	"dank_null_4",
	"dank_null_5"
] as string[];
for recipe in dankRecipes { 
	recipes.removeByRecipeName("danknull:"+recipe);
}

#Infinite Barrel/Drawer Upgrade
recipes.addShaped("mce_drawers_upgrade_infinite_capacity", <storagedrawers:upgrade_creative:0>, [
	[null, <extracells:storage.component:1>, null],
	[<mekanism:teleportationcore>, <storagedrawers:upgrade_template>, <mekanism:teleportationcore>],
	[null, <minecraft:nether_star>, null]
]);
	
recipes.remove(<yabba:upgrade_star_tier>);
recipes.addShaped("mce_yabba_upgrade_infinite_capacity", <yabba:upgrade_star_tier>*2, [
	[null, <extracells:storage.component:1>, null],
	[<mekanism:teleportationcore>, <yabba:upgrade_blank>, <mekanism:teleportationcore>],
	[null, <minecraft:nether_star>, null]
]);

// Tiberium as Dynamo fuel
mods.thermalexpansion.EnervationDynamo.addFuel(<taiga:tiberium_crystal>, 1000000);

#Dimension Builder
// balanced
recipes.remove(<rftoolsdim:dimension_builder>);
recipes.addShaped("dimbuilder_mce", <rftoolsdim:dimension_builder>,
	[[<theaurorian:auroriansteelblock>,<rats:idol_of_ratlantis>,<erebus:jade_block>],
	[<ore:relicItemAtum>,<rftools:machine_frame>,<tconstruct:materials:50>],
	[<rftools:shield_block4>,<fossil:time_machine>,<rftools:shield_block4>]]
);

#Energy Bee
// todo: tweak this to be locked behind planet [zappy] in [slightly secret 1.7 update star], aswell as most of this madness
recipes.addShaped("energybee_mce", <gendustry:gene_sample>.withTag({species: "rootBees", chromosome: 0, allele: "careerbees.energy"}), [
	[<erebus:tarantula_egg>.reuse(),<ore:relicItemAtum>,<erebus:antlion_egg>.reuse()],
	[<gendustry:gene_sample>.withTag({species: "rootBees", chromosome: 0, allele: "careerbees.repair"}),<rats:idol_of_ratlantis>,<gendustry:gene_sample>.withTag({species: "rootBees", chromosome: 0, allele: "careerbees.clock"})],
	[<theaurorian:trophyspider>.reuse(),<theaurorian:trophymoonqueen>.reuse(),<theaurorian:trophykeeper>.reuse()]
]);

// Fix string duping via Factorizer
recipes.removeByRecipeName("theaurorian:items/stringfromplantfiber");

print("--- MiscCrafting.zs initialized ---");	
