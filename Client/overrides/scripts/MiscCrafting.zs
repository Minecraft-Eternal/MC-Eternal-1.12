import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.recipes.ICraftingInfo;
import crafttweaker.data.IData;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.player.IPlayer;

import thaumcraft.aspect.CTAspectStack;

#MC Eternal Scripts

print("--- loading MiscCrafting.zs ---");

/*

#MC Eternal Scripts

print("--- loading .zs ---");



print("--- .zs initialized ---");
*/

#Yeet Things
var itemsToNuke = [
	<xreliquary:twilight_cloak>,
	<extrautils2:bagofholding>,
	<bewitchment:poppet_deathprotection>,
	<bewitchment:poppet_vampiric>,
	<inventorypets:solstice_sword>,
	<openmodularturrets:addon_meta:1>,
	<randomthings:spectreanchor>,
	<xreliquary:rod_of_lyssa>,
	<mysticalagriculture:supremium_helmet>,
	<mysticalagriculture:supremium_chestplate>,
	<mysticalagriculture:supremium_leggings>,
	<mysticalagriculture:supremium_boots>
] as IItemStack[];

for item in itemsToNuke {
	basicDisable(item, "", false);
}

#Homing Beecon
recipes.addShaped(<erebus:homing_beecon_advanced>, [[<erebus:materials:41>],[<erebus:homing_beecon>],[<mekanism:teleportationcore>]]);

#Soul Soil
recipes.addShapeless("soulsoil_mce", <futuremc:soul_soil>, [<ore:soulSand>,<ore:dirt>]);


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


//Energy Bee
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


// RATIFICATION STONE
mods.thaumcraft.Infusion.registerRecipe("mce_ratification_stone", "", <morphspellpack:charm_druid_stone>.withTag({Entity: "rats:rat", display:{Name:"Stone of Ratification",Lore:["I am become Rat, consumer of Cheese.","Transform into a Rat for 15 seconds.","Not consumed on use"]}}), 12, 
	[<aspect:rattus> *150, <aspect:cognitio> *30, <aspect:praecantatio> *50, <aspect:alienis> *20], 
	<bewitchment:waystone>, 
	[<rats:ratlantean_flame>, <rats:rat_pelt>, <rats:ratlantean_flame>, <rats:raw_rat>, <rats:ratlantean_flame>, <rats:rat_pelt>, <rats:ratlantean_flame>, <rats:idol_of_ratlantis>]
);


// Osmium Bee
mods.mekanism.combiner.addRecipe(
	<gendustry:gene_sample>.withTag({species: "rootBees", chromosome: 0, allele: "magicbees.speciesCobalt"}),
	<gendustry:gene_sample>.withTag({species: "rootBees", chromosome: 0, allele: "magicbees.speciesSilver"}),
	<gendustry:gene_sample>.withTag({species: "rootBees", chromosome: 0, allele: "magicbees.speciesOsmium"})
);


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


//Allow using Extra Storage Drawers for all the things
<ore:drawerBasic>.add(<storagedrawersextra:extra_drawers:*>);


//EnderIO "Construction Alloy" Ingot
addUniversalAlloyRecipe(<enderio:item_alloy_ingot:9> *3, [<ore:ingotIron>, <ore:ingotLead> *2], "Construction Alloy", false, {});


//Cheaper Dragonforge Bricks after making one
val dragonElements as string[][string] = {
	"fire": [
		"red",
		"green",
		"bronze",
		"gray"
	],
	"ice": [
		"white",
		"sapphire",
		"blue",
		"silver"
	]
};

for element,colors in dragonElements {
	for color in colors {
		val scales as IItemStack = itemUtils.getItem("iceandfire:dragonscale_"+ color);
		element == "fire" ?
			mods.iceandfire.recipes.addFireDragonForgeRecipe(<minecraft:stonebrick>, scales, <iceandfire:dragonforge_fire_brick> *2) :
			mods.iceandfire.recipes.addIceDragonForgeRecipe(<minecraft:stonebrick>, scales, <iceandfire:dragonforge_ice_brick> *2);
	}
}

//pasted from Tooltip.zs to here because of loading and lazy reasons
val nonFunctionalExtraCellsThings = [
	<extracells:storage.component:9>,
	<extracells:storage.component:10>,
	<extracells:storage.fluid:5>,
	<extracells:storage.fluid:6>
] as IItemStack[];

for thing in nonFunctionalExtraCellsThings {
	recipes.remove(thing);
	if(!isServer){
		thing.addTooltip(format.red(game.localize("mce.extracells2.tip.fluid_storage_literally_broken")));
	}
}



//Space Dimension Flight-permitting Items

//Staff of Gaea
recipes.addShaped("mce_erebus_staff_for_flying", <erebus:portal_activator>, [
	[null, <erebus:tarantula_egg>.reuse(), <erebus:materials:38>],
	[<ore:ingotDyonite>, <erebus:wand_of_animation>, <erebus:antlion_egg>.reuse()],
	[<erebus:materials:39>, <ore:ingotDyonite>]
]);

//Scarab
recipes.addShaped("mce_atum_scarab_for_flying", <atum:scarab>, [
	[null, <contenttweaker:sky_scarab_crest>],
	[<atum:idol_of_labor>.reuse(), <atum:crunchy_golden_scarab>, <atum:heart_of_ra>.reuse()],
	[null, <minecraft:elytra>]
]);

//"Aurorian Sky Spirit"
recipes.addShaped("mce_aurorian_spirit_for_flying", <theaurorian:crystallinesprite>, [
	[<enderio:block_holier_fog>, <theaurorian:trophykeeper>.reuse(), <enderio:block_holier_fog>],
	[<theaurorian:bepsi>, <theaurorian:trophyspider>.reuse(), <theaurorian:bepsi>],
	[<enderio:block_holier_fog>, <theaurorian:trophymoonqueen>.reuse(), <enderio:block_holier_fog>]
]);



//ZenSummoning altar
recipes.addShaped("mce_zensummoning_altar", <zensummoning:altar>, [
	[null, <randomthings:ingredient:2>],
	[<randomthings:runedust:14>, null, <randomthings:runedust:14>],
	[blockMarble.runedSooty, <ancientspellcraft:blank_rune>, blockMarble.runedSooty]
]);


print("--- MiscCrafting.zs initialized ---");	
