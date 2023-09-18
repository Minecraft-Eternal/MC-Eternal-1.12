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
	<randomthings:spectreanchor>,
	<xreliquary:rod_of_lyssa>,
	<mysticalagriculture:supremium_helmet>,
	<mysticalagriculture:supremium_chestplate>,
	<mysticalagriculture:supremium_leggings>,
	<mysticalagriculture:supremium_boots>
] as IItemStack[];

for item in itemsToNuke {
	recipes.remove(item);
	item.addTooltip(format.red("Disabled"));
}

#Homing Beecon
recipes.addShaped(<erebus:homing_beecon_advanced>, [[<erebus:materials:41>],[<erebus:homing_beecon>],[<mekanism:teleportationcore>]]);

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

// Nerf Angelheart Vial and Phoenix Down
recipes.remove(<xreliquary:angelheart_vial>);
recipes.remove(<xreliquary:phoenix_down>);

//Angelheart Vial
// go loot it lol

//Phoenix Down
mods.thaumcraft.Infusion.registerRecipe("mce_phoenix_down", "", <xreliquary:phoenix_down>, 10,
	[<aspect:victus> *125, <aspect:mortuus> *100, <aspect:auram> *50, <aspect:praemunio> *75, <aspect:draco> *50],
	<xreliquary:angelic_feather>,
	[<mod_lavacow:mootenheart>, <xreliquary:angelheart_vial>, <iceandfire:fire_dragon_heart>, <xreliquary:angelheart_vial>, <vampirism:pure_blood:3>, <xreliquary:angelheart_vial>]
);

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

// Assorted Vegetables (Confit Byaldi)
recipes.remove(<rats:assorted_vegetables>);
recipes.addShaped("mce_assorted_vegetables", <rats:assorted_vegetables>, [
	[<thebetweenlands:spirit_fruit>, <mysticalagriculture:superium_apple>, <twilightforest:magic_beans>],
	[<harvestcraft:nopalessaladitem>, <iceandfire:ambrosia>, <harvestcraft:spicygreensitem>],
	[<arcaneworld:glowing_chorus>, <nuclearcraft:moresmore>, <ore:unstableFruit>]
]);

// Potato Knishes chain
//Potato Pancake
recipes.remove(<rats:potato_pancake>);
recipes.addShaped("mce_potato_pancake", <rats:potato_pancake>, [
	[<harvestcraft:bakedsweetpotatoitem>, <botania:tinypotato>, <minecraft:baked_potato>],
	[<ore:blockCopper>, <ore:blockCopper>, <ore:blockCopper>],
	[<minecraft:baked_potato>, <botania:tinypotato>, <harvestcraft:bakedsweetpotatoitem>]
]);

//Little Black Squash Balls
mods.rats.recipes.removeGemcutterRatRecipe(<rats:little_black_squash_balls>);
mods.rats.recipes.addGemcutterRatRecipe(<thebetweenlands:log_sap:*>, <rats:little_black_squash_balls>);

//Centipede
mods.rats.recipes.removeGemcutterRatRecipe(<rats:centipede>);
recipes.addShaped("mce_rats_centipede", <rats:centipede>, [
	[<rats:little_black_worm>, <rats:little_black_worm>, <rats:little_black_worm>],
	[<buildcraftsilicon:redstone_chipset>, <erebus:materials:15>, <buildcraftsilicon:redstone_chipset>],
	[<rats:little_black_worm>, <rats:little_black_worm>, <rats:little_black_worm>]
]);


// Spectre Energy Injector
recipes.remove(<randomthings:spectreenergyinjector>);
recipes.addShaped("mce_spectre_energy_injector", <randomthings:spectreenergyinjector>, [
	[<minecraft:obsidian>, <randomthings:spectrelens>, <minecraft:obsidian>],
	[<randomthings:ingredient:12>, <actuallyadditions:block_phantom_energyface>, <randomthings:ingredient:12>],
	[<minecraft:obsidian>, <randomthings:ingredient:12>, <minecraft:obsidian>]
]);

// Osmium Bee
mods.mekanism.combiner.addRecipe(
	<gendustry:gene_sample>.withTag({species: "rootBees", chromosome: 0, allele: "magicbees.speciesCobalt"}),
	<gendustry:gene_sample>.withTag({species: "rootBees", chromosome: 0, allele: "magicbees.speciesSilver"}),
	<gendustry:gene_sample>.withTag({species: "rootBees", chromosome: 0, allele: "magicbees.speciesOsmium"})
);

// IF Tree Fluid Extractor
//BL Sap Log
mods.industrialforegoing.Extractor.add(<thebetweenlands:log_sap:*>, <liquid:latex> * 5);

// MA Witherproof Blocks
//only a cosmetic difference with these recipes, they are kinda nice looking, mostly the block.

//Witherproof Glass
mods.thermalexpansion.InductionSmelter.addRecipe(<mysticalagriculture:witherproof_glass>, <enderio:block_reinforced_obsidian>, <extrautils2:decorativeglass:3>, 16000);
mods.nuclearcraft.alloy_furnace.addRecipe([<enderio:block_reinforced_obsidian>, <extrautils2:decorativeglass:3>, <mysticalagriculture:witherproof_glass>, 4, 8]);
mods.mekanism.combiner.addRecipe(<extrautils2:decorativeglass:3>, <enderio:block_reinforced_obsidian>, <mysticalagriculture:witherproof_glass>);
mods.techreborn.alloySmelter.addRecipe(<mysticalagriculture:witherproof_glass>, <enderio:block_reinforced_obsidian>, <extrautils2:decorativeglass:3>, 400, 10);

//Witherproof Block
mods.thermalexpansion.InductionSmelter.addRecipe(<mysticalagriculture:witherproof_block>, <enderio:block_reinforced_obsidian>, <quark:black_ash>*4, 16000);
mods.nuclearcraft.alloy_furnace.addRecipe([<enderio:block_reinforced_obsidian>, <quark:black_ash>*4, <mysticalagriculture:witherproof_block>, 4, 8]);
mods.mekanism.combiner.addRecipe(<quark:black_ash>*4, <enderio:block_reinforced_obsidian>, <mysticalagriculture:witherproof_block>);
mods.techreborn.alloySmelter.addRecipe(<mysticalagriculture:witherproof_block>, <enderio:block_reinforced_obsidian>, <quark:black_ash>*4, 400, 10);


// Add TAIGA alloying recipes in modded alloying machines
val taigaAlloyMap = [
	{
		"result": [<taiga:terrax_ingot> *2],
		"inputs": [<taiga:karmesine_ingot>, <taiga:ovium_ingot>, <taiga:jauxum_ingot>]
	},
	{
		"result": [<taiga:triberium_ingot>],
		"inputs": [<taiga:tiberium_ingot> *5, <taiga:basalt_ingot>]
	},
	{
		"result": [<taiga:triberium_ingot>],
		"inputs": [<taiga:tiberium_ingot> *5, <taiga:dilithium_ingot> *2]
	},
	{
		"result": [<taiga:fractum_ingot> *2],
		"inputs": [<taiga:triberium_ingot> *3, <thermalfoundation:material:770> *6, <taiga:abyssum_ingot>]
	},
	{
		"result": [<taiga:violium_ingot> *2],
		"inputs": [<taiga:aurorium_ingot> *3, <tconstruct:ingots:1> *2]
	},
	{
		"result": [<taiga:proxii_ingot> *3],
		"inputs": [<taiga:prometheum_ingot> *3, <taiga:palladium_ingot> *3, <taiga:eezo_ingot>]
	},
	{
		"result": [<taiga:tritonite_ingot> *2],
		"inputs": [<tconstruct:ingots:0> *3, <taiga:terrax_ingot> *2]
	},
	{
		"result": [<taiga:ignitz_ingot> *2],
		"inputs": [<tconstruct:ingots:1> *2, <taiga:terrax_ingot> *2, <taiga:osram_ingot>]
	},
	{
		"result": [<taiga:imperomite_ingot> *2],
		"inputs": [<taiga:duranite_ingot> *3, <taiga:prometheum_ingot>, <taiga:abyssum_ingot>],
	},
	{
		"result": [<taiga:solarium_ingot> *2],
		"inputs": [<taiga:valyrium_ingot> *2, <taiga:uru_ingot> *2, <taiga:nucleum_ingot>]
	},
	{
		"result": [<taiga:adamant_ingot> *3],
		"inputs": [<taiga:vibranium_ingot>, <taiga:solarium_ingot>, <taiga:iox_ingot> *3]
	},
	{
		"result": [<taiga:seismum_ingot> *4],
		"inputs": [<thermalfoundation:material:770> *8, <taiga:triberium_ingot> *2, <taiga:eezo_ingot>]
	},
	{
		"result": [<taiga:astrium_ingot> *2],
		"inputs": [<taiga:terrax_ingot> *3, <taiga:aurorium_ingot> *2]
	},
	{
		"result": [<taiga:niob_ingot> *3],
		"inputs": [<taiga:palladium_ingot> *3, <taiga:duranite_ingot>, <taiga:osram_ingot>]
	},
	{
		"result": [<taiga:yrdeen_ingot> *3],
		"inputs": [<taiga:uru_ingot> *3, <taiga:valyrium_ingot> *3, <taiga:osram_ingot>]
	},
	{
		"result": [<taiga:yrdeen_ingot> *3],
		"inputs": [<taiga:uru_ingot> *3, <taiga:valyrium_ingot> *3, <taiga:eezo_ingot>]
	},
	{
		"result": [<taiga:yrdeen_ingot> *3],
		"inputs": [<taiga:uru_ingot> *3, <taiga:valyrium_ingot> *3, <taiga:abyssum_ingot>]
	},
	{
		"result": [<taiga:iox_ingot>],
		"inputs": [<taiga:eezo_ingot> *2, <taiga:abyssum_ingot> *2, <taiga:osram_ingot> *2, <taiga:obsidiorite_ingot> *9]
	},
	{
		"result": [<taiga:iox_ingot>],
		"inputs": [<taiga:eezo_ingot> *2, <taiga:abyssum_ingot> *2, <taiga:osram_ingot> *2, <taiga:meteorite_ingot> *9, <thermalfoundation:material:770> *18]
	},
	{
		"result": [<taiga:lumix_ingot>],
		"inputs": [<taiga:palladium_ingot>, <taiga:terrax_ingot>]
	},
	{
		"result": [<taiga:obsidiorite_ingot>],
		"inputs": [<taiga:meteorite_ingot>, <thermalfoundation:material:770> *2]
	},
	{
		"result": [<taiga:nucleum_ingot> *3],
		"inputs": [<taiga:proxii_ingot> *3, <taiga:abyssum_ingot>, <taiga:osram_ingot>]
	},
	{
		"result": [<taiga:nucleum_ingot> *3],
		"inputs": [<taiga:imperomite_ingot> *3, <taiga:osram_ingot>, <taiga:eezo_ingot>]
	},
	{
		"result": [<taiga:nucleum_ingot> *3],
		"inputs": [<taiga:niob_ingot> *3, <taiga:eezo_ingot>, <taiga:abyssum_ingot>]
	},
	{
		"result": [<taiga:dyonite_ingot> *3],
		"inputs": [<taiga:triberium_ingot> *3, <taiga:fractum_ingot>, <taiga:seismum_ingot>, <taiga:osram_ingot>]
	},
	{
		"result": [<taiga:dyonite_ingot> *3],
		"inputs": [<taiga:tiberium_ingot> *12, <taiga:fractum_ingot>, <taiga:seismum_ingot>, <taiga:osram_ingot>]
	}
] as IItemStack[][string][];
/*
	Alloying Things
		Induction Smelter - yep
		Alloy Furnace - yep
		Alloy Smelter - maybe?
		Electric Arc Furnace - maybe?
		Arc Furnace - yep
*/

for recipe in taigaAlloyMap {
	val result as IItemStack = recipe.result[0];
	val ingredients as IItemStack[] = recipe.inputs;
	var ingredientArrayWithoutFirst as IItemStack[] = [];
	for entry in ingredients {
		if(!(ingredients[0].matches(entry))) ingredientArrayWithoutFirst += entry;
	}
	// Arc Furnace (Immersive Engineering)
	mods.immersiveengineering.ArcFurnace.addRecipe(result, ingredients[0], null, 200, 512, ingredientArrayWithoutFirst);

	//Electric Arc Furnace (Advanced Rocketry)
	//print();

//	if(ingredients.length < 4){
		//Alloy Smelter (Ender IO)
		//print();

		if(ingredients.length < 3){
			// Induction Smelter (Thermal)
			mods.thermalexpansion.InductionSmelter.addRecipe(result, ingredients[0], ingredients[1], 4000);

			// Alloy Furnace (Nuclearcraft)
			mods.nuclearcraft.alloy_furnace.addRecipe([ingredients[0], ingredients[1], result]);
		}
//	}
}

print("--- MiscCrafting.zs initialized ---");	
