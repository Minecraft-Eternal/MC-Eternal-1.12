import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.recipes.ICraftingInfo;
import crafttweaker.data.IData;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.player.IPlayer;

import thaumcraft.aspect.CTAspectStack;

import mods.nuclearcraft.alloy_furnace;
import mods.mekanism.combiner;
import mods.techreborn.alloySmelter;
import mods.immersiveengineering.ArcFurnace;
import mods.thermalexpansion.InductionSmelter;
import mods.chisel.Carving;

import mods.roots.Mortar;
import mods.roots.RunicShears;
import mods.bloodmagic.BloodAltar;
import mods.naturesaura.AnimalSpawner;

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
	item.addTooltip(format.red(game.localize("mce.generic.tip.disabled")));
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

//Fix Salt Block not being craftable with Bewitchment salt
recipes.remove(<mekanism:saltblock>);
recipes.addShaped("mce_salt_block", <mekanism:saltblock>, [
	[<ore:dustSalt>, <ore:dustSalt>],
	[<ore:dustSalt>, <ore:dustSalt>]
]);

#Danknull T6
#stupidly op and too stupidly cheap, some spicy is nice yeah?
recipes.remove(<danknull:dank_null_5>);
recipes.addShaped("danknull_t6_mce", 
		<danknull:dank_null_5>.withTag({
		display:{
			Lore:[
				game.localize("mce.danknull.crafting_info.1"),
				game.localize("mce.danknull.crafting_info.2")
			]}}),
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

// Blackholes Units/Tanks
val blackHoleFrames = {
	"industrialforegoing": <teslacorelib:machine_case>,
	"thermal": <thermalexpansion:frame:0>,
	"enderio": <enderio:item_material:0>
} as IItemStack[string];

for mod,frame in blackHoleFrames {
	val blackHoleFrameModID = (mod == "industrialforegoing" ? "" : "_"+ mod);

	recipes.removeByRecipeName("industrialforegoing:black_hole_unit"+ blackHoleFrameModID);
	recipes.addShaped("mce_blackhole_unit_"+ mod, <industrialforegoing:black_hole_unit>, [
		[<industrialforegoing:plastic>, <ore:enderpearl>, <industrialforegoing:plastic>],
		[<extracells:storage.component:0>, frame, <extracells:storage.component:0>],
		[<mekanism:teleportationcore>, <minecraft:nether_star>, <mekanism:teleportationcore>]
	]);

	recipes.removeByRecipeName("industrialforegoing:black_hole_tank"+ blackHoleFrameModID);
	recipes.addShaped("mce_blackhole_tank_"+ mod, <industrialforegoing:black_hole_tank>, [
		[<industrialforegoing:plastic>, <ore:enderpearl>, <industrialforegoing:plastic>],
		[<extracells:storage.component:7>, frame, <extracells:storage.component:7>],
		[<mekanism:teleportationcore>, <minecraft:nether_star>, <mekanism:teleportationcore>]
	]);
}

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
		Arc Furnace (Immersive Engineering)
		Induction Smelter (Induction Smelter)
		Alloy Furnace (Nuclearcraft)
		Alloy Smelter (TechReborn)
		Electric Arc Furnace (Advanced Rocketry)
		Alloy Smelter (EnderIO)
*/

for recipe in taigaAlloyMap {
	val result as IItemStack = recipe.result[0];
	val ingredients as IItemStack[] = recipe.inputs;
	val materialName = result.definition.id.split(":")[1].split("_")[0];
	addUniversalAlloyRecipe(result, ingredients,
		"MCE: TAIGA Alloy - "+ materialName,
//		materialName.replace("\\w(?=\\w{"+ (materialName.length - 1) +"})", materialName.substring(0, 1).toUpperCase())
		false,
		{}
	);
}


//IF Protein Reactor additions
mods.industrialforegoing.ProteinReactor.add(<biomesoplenty:fleshchunk>);
mods.industrialforegoing.ProteinReactor.add(<rats:raw_rat>);
mods.industrialforegoing.ProteinReactor.add(<totemic:buffalo_meat>);
mods.industrialforegoing.ProteinReactor.add(<twilightforest:raw_venison>);
mods.industrialforegoing.ProteinReactor.add(<twilightforest:raw_meef>);
for meat in <ore:allFlesh>.items {
	mods.industrialforegoing.ProteinReactor.add(meat);
}

//Thermal Reactant Dynamo
mods.thermalexpansion.ReactantDynamo.addReaction(<fossil:failuresaurus_flesh>, <liquid:mutagen> *200, 1200000);
mods.thermalexpansion.ReactantDynamo.addReaction(<astralsorcery:itemcraftingcomponent:2>, <liquid:astralsorcery.liquidstarlight> *100, 600000);

//limit slimeball alchemy
// previously, you could insert a pink slimeball into a Compacting Drawer, and then add Slime Blocks to effectively transmute any slimeball into pink slimeball
// the same is also possible with failuresaurus flesh
<ore:nonPinkSlimeballs>.add([
	<minecraft:slime_ball>,
	<actuallyadditions:item_misc:12>,
	<mod_lavacow:silky_sludge>,
	<fossil:tardrop>,
	<quark:slime_bucket>,
	<roots:strange_ooze>,
	<theaurorian:aurorianslimeball>,
	<tconstruct:edible:1>,
	<tconstruct:edible:2>,
	<tconstruct:edible:3>,
	<tconstruct:edible:4>
]);

recipes.removeByRecipeName("minecraft:slime");
recipes.addShapeless("mce_pinkbgone", <minecraft:slime>, [
	<ore:nonPinkSlimeballs>,
	<ore:nonPinkSlimeballs>,
	<ore:nonPinkSlimeballs>,
	<ore:nonPinkSlimeballs>,
	<ore:nonPinkSlimeballs>,
	<ore:nonPinkSlimeballs>,
	<ore:nonPinkSlimeballs>,
	<ore:nonPinkSlimeballs>,
	<ore:nonPinkSlimeballs>
]);


//fun(ny) cropstick recipes
// enforced in challengemode :)
//Treated Wood Stick
recipes.addShaped("mce_treated_wood_cropsticks", <agricraft:crop_sticks> *6, [
	[<ore:stickTreatedWood>, <ore:stickTreatedWood>],
	[<ore:stickTreatedWood>, <ore:stickTreatedWood>]
]);
//Impregnated Stick
mods.forestry.Carpenter.addRecipe(<agricraft:crop_sticks> *12, [
		[<forestry:oak_stick>, <forestry:oak_stick>],
		[<forestry:oak_stick>, <forestry:oak_stick>]
	],
	40
);
//Atum Sticks
mods.mekanism.sawmill.addRecipe(<ore:atumStick>, <agricraft:crop_sticks> *8);

//Actually Additions Storage Crate Upgrade remix
// always thought it was really weird you void a whole crate for this

//Medium Crate Upgrade
recipes.remove(<actuallyadditions:item_small_to_medium_crate_upgrade>);
recipes.addShaped("mce_medium_storage_crate_upgrade_remix", <actuallyadditions:item_small_to_medium_crate_upgrade>, [
	[<ore:plankWood>, <actuallyadditions:block_crystal:3>, <ore:plankWood>],
	[<actuallyadditions:block_crystal:3>, null, <actuallyadditions:block_crystal:3>],
	[<ore:plankWood>, <actuallyadditions:block_crystal:3>, <ore:plankWood>]
]);

//Large Crate Upgrade
recipes.remove(<actuallyadditions:item_medium_to_large_crate_upgrade>);
recipes.addShaped("mce_large_storage_crate_upgrade_remix", <actuallyadditions:item_medium_to_large_crate_upgrade>, [
	[<ore:plankWood>, <actuallyadditions:block_crystal_empowered:3>, <ore:plankWood>,],
	[<actuallyadditions:block_crystal_empowered:3>, null, <actuallyadditions:block_crystal_empowered:3>],
	[<ore:plankWood>, <actuallyadditions:block_crystal_empowered:3>, <ore:plankWood>]
]);

//Remove base Small Crate Upgrade recipe
// differs in Challenge mode and Classic mode, so removing it in one place is a bit more clean
recipes.removeByRecipeName("actuallyadditions:recipes13");


//Upgrade TR Iron Alloy Furnace into TR Alloy Smelter
recipes.addShaped("mce_upgrade_iron_alloy_furnace_to_smelter", <techreborn:alloy_smelter>, [
	[<techreborn:part:29>, <ore:ingotRefinedIron>, <techreborn:part:29>],
	[<ore:dustRedstone>, <techreborn:iron_alloy_furnace>, <ore:dustRedstone>],
	[<techreborn:part:29>, <ore:ingotRefinedIron>, <techreborn:part:29>]
]);


//NA Gold Powder in Roots Mortar
// enforced in challenge mode
Mortar.addRecipe("mce_gold_powder_in_roots_mortar", <naturesaura:gold_powder> *2, [<naturesaura:gold_leaf>]);


//Unify Roots Flour recipe
Mortar.removeRecipe(<roots:flour>);
Mortar.addRecipe("wheat_flour", <nuclearcraft:flour>, [<ore:cropWheat>]);
Mortar.addRecipe("potato_flour", <nuclearcraft:flour>, [<ore:cropPotato>]);


//Craft EU2 Moonstone with Moon Turf
recipes.addShaped("mce_moonstone_from_moon_turf_with_diamond", <extrautils2:ingredients:5> *3, [
	[<ore:turfMoon>, <ore:turfMoon>, <ore:turfMoon>],
	[<ore:turfMoon>, <ore:gemDiamond>, <ore:turfMoon>],
	[<ore:turfMoon>, <ore:turfMoon>, <ore:turfMoon>]
]);

recipes.addShaped("mce_moonstone_from_moon_turf_with_unstable_ingot", <extrautils2:ingredients:5> * 18, [
	[<ore:turfMoon>, <ore:turfMoon>, <ore:turfMoon>],
	[<ore:turfMoon>, <ore:ingotUnstable>, <ore:turfMoon>],
	[<ore:turfMoon>, <ore:turfMoon>, <ore:turfMoon>]
]);


//Fabulous a Mana Pool
recipes.addShaped("mce_make_mana_pool_fabulous", <botania:pool:3>, [
	[<botania:bifrostperm>, <botania:pool:0>, <botania:bifrostperm>],
	[<botania:bifrostperm>, <botania:bifrostperm>, <botania:bifrostperm>]
]);

//Un-Fabulous a Mana Pool
recipes.addShapeless("mce_classicmode_unfabulous_mana_pool", <botania:pool:0>.withLore([game.localize("mce.botania.crafting_info.unfabulous_mana_pool")]), [<botania:pool:3>],
	function(out as IItemStack, ins as IItemStack[string], cInfo as ICraftingInfo){
		return <botania:pool:0>;
	},
	function(out as IItemStack, cInfo as ICraftingInfo, player as IPlayer){
		player.give(<botania:elfglass> *5);
});

//Change Wand of the Forest petals
recipes.addShaped("mce_change_forest_wand_petals", <botania:twigwand>.withLore([game.localize("mce.botania.crafting_info.change_forest_wand_petals")]), [
	[null, <botania:petal:*>.marked("petal2")],
	[<botania:petal:*>.marked("petal1"), <botania:twigwand>.marked("wand")]
	],
	function(output as IItemStack, inputs as IItemStack[string], cInfo as ICraftingInfo){
		return inputs.wand.updateTag({color1: inputs.petal1.metadata, color2: inputs.petal2.metadata});
});


//NA Altar of Birthing stuff

//Thermal Elementals
//Blizz
AnimalSpawner.addRecipe("mce_thermal_blizz", "thermalfoundation:blizz", 120000, 120, [<naturesaura:birth_spirit>, <ore:rodBlizz>, <minecraft:snow>]);
//Blitz
AnimalSpawner.addRecipe("mce_thermal_blitz", "thermalfoundation:blitz", 120000, 120, [<naturesaura:birth_spirit>, <ore:rodBlitz>, <minecraft:sandstone>]);
//Basalz
AnimalSpawner.addRecipe("mce_thermal_basalz", "thermalfoundation:basalz", 120000, 120, [<naturesaura:birth_spirit>, <ore:rodBasalz>, <minecraft:obsidian>]);

//Rat (friend :>)
AnimalSpawner.addRecipe("mce_rat", "rats:rat", 30000, 80, [<naturesaura:birth_spirit>, <rats:block_of_cheese>]);

//Feral Ratlantean
AnimalSpawner.addRecipe("mce_feral_ratlantean", "rats:feral_ratlantean", 90000, 120, [<naturesaura:birth_spirit>, <rats:feral_rat_claw>, <rats:rat_pelt>, <rats:ratglove_petals>]);

//Ratlantean Spirit
AnimalSpawner.addRecipe("mce_ratlantean_spirit", "rats:ratlantean_spirit", 75000, 100, [<naturesaura:birth_spirit>, <rats:ratlantean_flame>, <rats:cheese>]);

//Amphithere
AnimalSpawner.addRecipe("mce_amphithere", "iceandfire:amphithere", 300000, 300, [<naturesaura:birth_spirit>, <enderio:item_material:7>, <stevescarts:cartmodule:101>, <bloodmagic:component:2>]);

//Pixie
AnimalSpawner.addRecipe("mce_pixie", "iceandfire:if_pixie", 45000, 80, [<naturesaura:birth_spirit>, <iceandfire:pixie_dust>]);

//Hippogryph
AnimalSpawner.addRecipe("mce_hippogryph", "iceandfire:hippogryph", 120000, 120, [<naturesaura:birth_spirit>, <cqrepoured:leather_bull>, <fossil:horse_dna>, <fossil:chicken_dna>]);
//Alt using Egg
AnimalSpawner.addRecipe("mce_hippogryph_from_egg", "iceandfire:hippogryph", 900000, 80, [<naturesaura:birth_spirit>, <iceandfire:hippogryph_egg:*>, <fossil:cooked_chicken_soup>]);

//Hippcampus
AnimalSpawner.addRecipe("mce_hippocampus", "iceandfire:hippocampus", 120000, 120, [<naturesaura:birth_spirit>, <iceandfire:shiny_scales>, <minecraft:sponge>]);

//Cockatrice (death chicken)
AnimalSpawner.addRecipe("mce_cockatrice", "iceandfire:if_cockatrice", 120000, 100, [<naturesaura:birth_spirit>, <iceandfire:rotten_egg>, <fossil:chicken_dna>]);

//Moogma
AnimalSpawner.addRecipe("mce_moogma", "mod_lavacow:lavacow", 200000, 200, [<naturesaura:birth_spirit>,
	<mod_lavacow:potion_of_mooten_lava>,
	<minecraft:potion>.withTag({Potion: "minecraft:fire_resistance"}),
	<fossil:cow_dna>
]);

//Wisp
AnimalSpawner.addRecipe("mce_eerieentities_wisp", "eerieentities:wisp", 10000, 100, [<naturesaura:birth_spirit>, <astralsorcery:itemusabledust:0>]);

//Fox
AnimalSpawner.addRecipe("mce_mysticalworld_fox", "mysticalworld:entity_fox", 30000, 100, [<naturesaura:birth_spirit>, <mysticalworld:pelt>, <minecraft:chicken>]);

//Frog
AnimalSpawner.addRecipe("mce_mysticalworld_frog", "mysticalworld:entity_frog", 30000, 100, [<naturesaura:birth_spirit>, <minecraft:slime_ball>, <bloodmagic:component:0>]);

//Beetle
AnimalSpawner.addRecipe("mce_mysticalworld_beetle", "mysticalworld:entity_beetle", 30000, 100, [<naturesaura:birth_spirit>, <mysticalworld:beetle_mask>]);

//Deer
AnimalSpawner.addRecipe("mce_mysticalworld_deer", "mysticalworld:entity_deer", 30000, 100, [<naturesaura:birth_spirit>, <mysticalworld:antler_hat>]);

//Sprout
AnimalSpawner.addRecipe("mce_mysticalworld_sprout", "mysticalworld:entity_sprout", 30000, 100, [<naturesaura:birth_spirit>, <minecraft:melon>, <minecraft:beetroot>, <mysticalworld:aubergine>]);

//Hell Sprout
AnimalSpawner.addRecipe("mce_mysticalworld_hell_sprout", "mysticalworld:entity_hell_sprout", 20000, 100, [<naturesaura:birth_spirit>, <minecraft:nether_wart_block>, <minecraft:blaze_powder>]);

//Owl
AnimalSpawner.addRecipe("mce_mysticalworld_owl", "mysticalworld:entity_owl", 30000, 100, [<naturesaura:birth_spirit>, <roots:mystic_feather>, <ore:logWood>]);

//Lava Cat
AnimalSpawner.addRecipe("mce_mysticalworld_lava_cat", "mysticalworld:entity_lava_cat", 30000, 100, [<naturesaura:birth_spirit>, <minecraft:lava_bucket>, <minecraft:obsidian>, <minecraft:blaze_powder>]);

//Clam
AnimalSpawner.addRecipe("mce_mysticalworld_clam", "mysticalworld:entity_clam", 45000, 100, [<naturesaura:birth_spirit>, <mysticalworld:pearl_block>, <minecraft:sand>]);




//Altar of Birthing stuff end


//Runic Shearing

//Amphithere
RunicShears.addEntityRecipe("mce_amphithere_feather_from_amphithere", <iceandfire:amphithere_feather>, <entity:iceandfire:amphithere>, 1800);

//Hippocampus
RunicShears.addEntityRecipe("mce_shiny_scales_from_hippocampus", <iceandfire:shiny_scales>, <entity:iceandfire:hippocampus>, 3000);

//Runic Shearing end


//Herb Bundle
// so it doesn't cost ungodly things
recipes.remove(<rats:herb_bundle>);
recipes.addShaped("mce_herb_bundle", <rats:herb_bundle>, [
	[<ore:allFlowers>, <ore:allFlowers>, <ore:allFlowers>],
	[<ore:allFlowers>, <ore:listAllVeggie>, <ore:allFlowers>],
	[<ore:allFlowers>, <ore:allFlowers>, <ore:allFlowers>]
]);


//Remove Mossy Stone Brick Chiseling
Carving.removeVariation("stonebrick", <minecraft:stonebrick:1>);


//Allow using Extra Storage Drawers for all the things
<ore:drawerBasic>.add(<storagedrawersextra:extra_drawers:*>);

//EnderIO "Construction Alloy" Ingot
addUniversalAlloyRecipe(<enderio:item_alloy_ingot:9> *3, [<ore:ingotIron>, <ore:ingotLead> *2], "MCE: Construction Alloy", false, {
	"thermalInduction": {
		"enabled": 0
	},
	"TRSmelter": {
		"enabled": 0
	},
	"NCFurnace": {
		"enabled": 0
	}
});


//Space Dimension Flight-permitting Items

//Staff of Gaea
recipes.addShaped("mce_erebus_staff_for_flying", <erebus:portal_activator>, [
	[null, <erebus:tarantula_egg>.reuse(), <erebus:materials:38>],
	[<ore:ingotDyonite>, <erebus:wand_of_animation>, <erebus:antlion_egg>.reuse()],
	[<erebus:materials:39>, <ore:ingotDyonite>]
]);

//Scarab
recipes.addShaped("mce_atum_scarab_for_flying", <atum:scarab>, [
	[null, skyScarabCrest],
	[<atum:idol_of_labor>.reuse(), <atum:crunchy_golden_scarab>, <atum:heart_of_ra>.reuse()],
	[null, <minecraft:elytra>]
]);

//"Aurorian Sky Spirit"
recipes.addShaped("mce_aurorian_spirit_for_flying", <theaurorian:crystallinesprite>, [
	[<enderio:block_holier_fog>, <theaurorian:trophykeeper>.reuse(), <enderio:block_holier_fog>],
	[<theaurorian:bepsi>, <theaurorian:trophyspider>.reuse(), <theaurorian:bepsi>],
	[<enderio:block_holier_fog>, <theaurorian:trophymoonqueen>.reuse(), <enderio:block_holier_fog>]
]);

print("--- MiscCrafting.zs initialized ---");	
