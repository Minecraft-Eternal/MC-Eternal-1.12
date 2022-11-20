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

for name in noDupeRecipeNames {
	recipes.removeByRecipeName(name);
}

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



//Crafting Pure Blood with Magic mods
// because i can't be bothered to try and fix vampire baron spawnrates, it will suck i am sure.

// tier 1
mods.thaumcraft.Crucible.registerRecipe("mce_pure_blood_1", "", <vampirism:pure_blood:0>, <vampirism:blood_bottle:9>, [<aspect:victus> *30, <aspect:alkimia> *20, <aspect:auram> *11]);

// tier 2
mods.naturesaura.Altar.addRecipe("mce_pure_blood_2", <vampirism:pure_blood:0>, <vampirism:pure_blood:1>, <ebwizardry:crystal_block:1>, 52000, 600);

// tier 3
mods.roots.Pyre.addRecipe("mce_pure_blood_3", <vampirism:pure_blood:2>, [<vampirism:pure_blood:1>, <midnight:rouxe>, <ebwizardry:spectral_dust:1>, <thebetweenlands:crimson_middle_gem>, <tconstruct:slime:3>], 3);

// tier 4
mods.bloodmagic.TartaricForge.addRecipe(<vampirism:pure_blood:3>, [<vampirism:pure_blood:2>, <bloodmagic:blood_shard>, <bewitchment:demon_heart>, <xreliquary:angelheart_vial>], 880, 440);

// tier 5
mods.botania.ElvenTrade.addRecipe([<vampirism:pure_blood:4>], [<vampirism:pure_blood:3>, <botania:manaresource:5>, <bloodmagic:activation_crystal:1>, <twilightforest:carminite>, <iceandfire:fire_dragon_blood>]);


// RATIFICATION STONE
mods.thaumcraft.Infusion.registerRecipe("mce_ratification_stone", "", <morphspellpack:charm_druid_stone>.withTag({Entity: "rats:rat", display:{Name:"Stone of Ratification",Lore:["I am become Rat, consumer of Cheese.","Transform into a Rat for 15 seconds.","Not consumed on use"]}}), 12, 
	[<aspect:rattus> *150, <aspect:cognitio> *30, <aspect:praecantatio> *50, <aspect:alienis> *20], 
	<bewitchment:waystone>, 
	[<rats:ratlantean_flame>, <rats:rat_pelt>, <rats:ratlantean_flame>, <rats:raw_rat>, <rats:ratlantean_flame>, <rats:rat_pelt>, <rats:ratlantean_flame>, <rats:idol_of_ratlantis>]
);

print("--- MiscCrafting.zs initialized ---");	
