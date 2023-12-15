#packmode challenge

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import thaumcraft.aspect.CTAspectStack;

import mods.mekanism.infuser;

import mods.thermalexpansion.InductionSmelter;

import mods.actuallyadditions.AtomicReconstructor;

import mods.immersiveengineering.Blueprint;
import mods.immersiveengineering.ArcFurnace;

import mods.forestry.Carpenter;

import mods.buildcraft.AssemblyTable;

#MC Eternal Scripts

print("--- loading challenge/ChallengemodeTechStuff.zs ---");

// Thermal Machine Frame
recipes.remove(<thermalexpansion:frame>);
recipes.addShaped("mce_challengemode_thermal_frame", <thermalexpansion:frame>, [
	[<ore:blockSheetmetalIron>, <ore:plateSilver>, <ore:blockSheetmetalIron>],
	[<extrautils2:ineffableglass:2>, <immersiveengineering:metal_decoration0:3>, <extrautils2:ineffableglass:2>],
	[<ore:blockSheetmetalIron>, <immersiveengineering:material:18>, <ore:blockSheetmetalIron>]
]);


//RFTools

// Quarry Shape Card
recipes.remove(<rftools:shape_card:2>);
recipes.addShaped("mce_challengemode_quarry_shape_card", <rftools:shape_card:2>, [
	[<theaurorian:auroriancoalblock>, <mekanism:controlcircuit:3>, <theaurorian:auroriancoalblock>],
	[<mekanism:machineblock:15>, <twilightforest:tower_device:6>, <mekanism:machineblock:15>],
	[<theaurorian:auroriancoalblock>, <mekanism:teleportationcore>, <theaurorian:auroriancoalblock>]
]);

// Endergenic Generator
recipes.remove(<rftools:endergenic>);
recipes.addShaped("mce_challengemode_endergenic_gen", <rftools:endergenic>, [
	[<rftools:infused_diamond>, <rftools:infused_enderpearl>, <rftools:infused_diamond>],
	[<rftools:infused_enderpearl>, <rftools:machine_frame>, <rftools:infused_enderpearl>],
	[<rftools:infused_diamond>, <rftools:infused_enderpearl>, <rftools:infused_diamond>]
]);

//RFTools end


//Mekanism

// Metallurgic Infuser
recipes.remove(<mekanism:machineblock:8>);
recipes.addShaped("mce_challengemode_metallurgic_infuser", <mekanism:machineblock:8>, [
	[<futuremc:netherite_ingot>, <nuclearcraft:part:2>, <futuremc:netherite_ingot>],
	[<minecraft:redstone>, <mekanism:basicblock>, <minecraft:redstone>],
	[<futuremc:netherite_ingot>, <nuclearcraft:part:2>, <futuremc:netherite_ingot>]
]);

// Digital Miner
recipes.remove(<mekanism:machineblock:4>);
recipes.addShaped("mce_challengemode_digital_miner", <mekanism:machineblock:4>, [
	[<ore:alloyUltimate>, <mekanism:controlcircuit:3>, <ore:alloyUltimate>],
	[<mekanism:machineblock:15>, <mekanism:robit>, <mekanism:machineblock:15>],
	[<mekanism:teleportationcore>, <ore:blockAurorianSteel>, <mekanism:teleportationcore>]
]);

// Fusion Controller
recipes.remove(<mekanismgenerators:reactor>);
recipes.addShaped("mce_challengemode_mek_fusion_reactor", <mekanismgenerators:reactor>, [
	[<mekanism:controlcircuit:3>, <thaumicaugmentation:starfield_glass:2>, <mekanism:controlcircuit:3>],
	[<ore:blockNetherite>, <advancedrocketry:chemicalreactor>, <ore:blockNetherite>],
	[<ore:blockNetherite>, <ore:blockAurorianSteel>, <ore:blockNetherite>]
]);

// Gasburner
recipes.remove(<mekanismgenerators:generator:3>);
recipes.addShaped("mce_challengemode_gasburning_generator", <mekanismgenerators:generator:3>, [
	[<mekanism:clump:2>, <mekanism:atomicalloy>, <mekanism:clump:2>],
	[<ore:blockNetherite>, <mekanism:electrolyticcore>, <ore:blockNetherite>],
	[<mekanism:clump:2>, <mekanism:atomicalloy>, <mekanism:clump:2>]
]);

// Mek Alloys
// should choose less plain ingots for reinforced and atomic, taiga alloys perhaps?
infuser.removeRecipe(<mekanism:enrichedalloy>);
infuser.addRecipe("REDSTONE", 20, <ore:ingotHSLASteel>, <mekanism:enrichedalloy>);

infuser.removeRecipe(<mekanism:reinforcedalloy>);
infuser.addRecipe("DIAMOND", 20, <ore:ingotTough>, <mekanism:reinforcedalloy>);

infuser.removeRecipe(<mekanism:atomicalloy>);
infuser.addRecipe("OBSIDIAN", 40, <ore:ingotTerrax>, <mekanism:atomicalloy>);

//Mekanism end


//Flux Networks

val fluxnetItemNames = [
	"fluxcontroller",
	"fluxpoint",
	"fluxplug",
	"fluxstorage",
	"herculeanfluxstorage",
	"gargantuanfluxstorage",
	"fluxblock"
] as string[];

for name in fluxnetItemNames {
	recipes.removeByRecipeName("fluxnetworks:tile.fluxnetworks."+ name);
}

// Flux Cores
recipes.remove(<fluxnetworks:fluxcore>);
recipes.addShaped("mce_challengemode_flux_core", <fluxnetworks:fluxcore> *8, [
	[<fluxnetworks:flux>, <tconstruct:large_plate>.withTag({Material: "obsidiorite"}), <dimdoors:world_thread>],
	[<nuclearcraft:part:5>, <appliedenergistics2:material:48>, <nuclearcraft:part:5>],
	[<dimdoors:world_thread>, <tconstruct:large_plate>.withTag({Material: "obsidiorite"}), <fluxnetworks:flux>],
]);

//Flux Block
recipes.addShaped("mce_challengemode_flux_block", <fluxnetworks:fluxblock>, [
	[<fluxnetworks:flux>, <fluxnetworks:fluxcore>, <fluxnetworks:flux>],
	[<fluxnetworks:fluxcore>, <quark:biotite_block>, <fluxnetworks:fluxcore>],
	[<fluxnetworks:flux>, <fluxnetworks:fluxcore>, <fluxnetworks:flux>]
]);

//Flux Controller
// Enables FluxNet Wireless charging, which is very op
mods.thaumcraft.Infusion.registerRecipe("mce_challengemode_flux_controller", "", <fluxnetworks:fluxcontroller>, 8, [
        <aspect:spiritus> * 200,
        <aspect:machina> * 150,
        <aspect:motus> * 75
    ], 
    <randomthings:spectrecharger:2>, 
    [
        <fluxnetworks:gargantuanfluxstorage>,
        <rats:psionic_rat_brain>,
        <iceandfire:fire_dragon_heart>,
        <fluxnetworks:gargantuanfluxstorage>,
        <rats:arcane_technology>,
        <iceandfire:ice_dragon_heart>
]);

// Flux Point
recipes.addShaped("mce_challengemode_flux_point", <fluxnetworks:fluxpoint>, [
	[null, <fluxnetworks:fluxcore>],
	[<fluxnetworks:fluxcore>, <randomthings:spectrecoil_ender>, <fluxnetworks:fluxcore>],
	[null, <fluxnetworks:fluxcore>]
]);

// Flux Plug
recipes.addShaped("mce_challengemode_flux_plug", <fluxnetworks:fluxplug>, [
	[null, <fluxnetworks:fluxcore>],
	[<fluxnetworks:fluxcore>, <randomthings:spectreenergyinjector>, <fluxnetworks:fluxcore>],
	[null, <fluxnetworks:fluxcore>]
]);

// Flux Storages
//Basic
recipes.addShaped("mce_challengemode_flux_storage", <fluxnetworks:fluxstorage>, [
	[null, <fluxnetworks:fluxcore>, null],
	[<fluxnetworks:fluxcore>, <rftools:powercell>, <fluxnetworks:fluxcore>],
	[null, <fluxnetworks:fluxcore>, null]
]);

//Herculean
recipes.addShaped("mce_challengemode_flux_storage_herculean", <fluxnetworks:herculeanfluxstorage>, [
	[null, <fluxnetworks:fluxstorage>, null],
	[<fluxnetworks:fluxstorage>, <rftools:powercell_advanced>, <fluxnetworks:fluxstorage>],
	[<fluxnetworks:fluxblock>, <fluxnetworks:fluxstorage>, <fluxnetworks:fluxblock>]
]);

//Gargantuan
recipes.addShaped("mce_challengemode_flux_storage_gargantuan", <fluxnetworks:gargantuanfluxstorage>, [
	[<fluxnetworks:fluxblock>, <fluxnetworks:herculeanfluxstorage>, <fluxnetworks:fluxblock>],
	[<fluxnetworks:herculeanfluxstorage>, <mekanism:machineblock3:0>, <fluxnetworks:herculeanfluxstorage>],
	[<fluxnetworks:fluxblock>, <fluxnetworks:herculeanfluxstorage>, <fluxnetworks:fluxblock>]
]);

//Fluxnet Networks end


//EnderIO

//Workbench Blueprint
recipes.addShaped("mce_challengemode_eio_component_blueprint", <immersiveengineering:blueprint>.withTag({blueprint: "enderio_components"}), [
	[<enderio:item_yeta_wrench>, EIOMaterial.capacitorBasic, <openblocks:generic:11>],
	[<ore:dyeBlue>, <ore:dyeBlue>, <ore:dyeBlue>],
	[<minecraft:paper>, <minecraft:paper>, <minecraft:paper>]
]);

//Simple Machine Frame
recipes.remove(EIOMaterial.chassisSimple);
Blueprint.addRecipe("enderio_components", EIOMaterial.chassisSimple, [EIOMaterial.capacitorBasic, <ore:ingotConstructionAlloy> *4, <ancientspellcraft:devoritium_bars> *6]);

//Industrial Dye Blend
recipes.remove(EIOMaterial.industrialDye);
Carpenter.addRecipe(EIOMaterial.industrialDye *2, [
		[<ore:dustTritonite>, <ore:dustQuartz>, EIOMaterial.organicDyeGreen],
		[<ore:dustQuartz>, EIOMaterial.organicDyeBlack, <ore:dustQuartz>],
		[EIOMaterial.organicDyeGreen, <ore:dustQuartz>, <ore:dustTritonite>]
	],
	60,
	<liquid:concrete> *2000
);

//Soul Dye Blend
recipes.remove(EIOMaterial.soulDye);
Carpenter.addRecipe(EIOMaterial.soulDye *2, [
		[getMAResource("souliumDust", 0), <ore:dustQuartz>, EIOMaterial.organicDyeGreen],
		[<ore:dustQuartz>, EIOMaterial.organicDyeBlack, <ore:dustQuartz>],
		[EIOMaterial.organicDyeGreen, <ore:dustQuartz>, getMAResource("souliumDust", 0)]
	],
	60,
	<liquid:concrete> *2000
);

//Enhanced Dye Blend
recipes.remove(EIOMaterial.enhancedDye);
ArcFurnace.addRecipe(EIOMaterial.enhancedDye *2, EIOMaterial.organicDyeBlack, null, 200, 1024, [
	<ore:gemEnderBiotite> *4,
	EIOMaterial.grainsPrescience,
	EIOMaterial.grainsEnd,
	<ore:dustUru> *2
]);

//Double-Layer Capacitor
recipes.remove(EIOMaterial.capacitorEnhanced);
recipes.addShaped("mce_challengemode_enhanced_capacitor", EIOMaterial.capacitorEnhanced, [
	[<ore:ingotEnergeticAlloy>, null, <ore:ingotEnergeticAlloy>],
	[EIOMaterial.capacitorBasic, <ore:ingotSiliconCarbide>, EIOMaterial.capacitorBasic],
	[<ore:ingotEnergeticAlloy>, null, <ore:ingotEnergeticAlloy>]
]);
//Better Workbench recipe
Blueprint.addRecipe("enderio_components", EIOMaterial.capacitorEnhanced, [EIOMaterial.capacitorBasic *2, <ore:ingotEnergeticAlloy> *2, <ore:ingotSiliconCarbide>]);

//Octadic Capacitor
recipes.remove(EIOMaterial.capacitorOctadic);
recipes.addShaped("mce_challenge_octadic_capacitor", EIOMaterial.capacitorOctadic, [
	[<ore:ingotVibrantAlloy>, null, <ore:ingotVibrantAlloy>],
	[EIOMaterial.capacitorEnhanced, <ore:ingotRefinedGlowstone>, EIOMaterial.capacitorEnhanced],
	[<ore:ingotVibrantAlloy>, null, <ore:ingotVibrantAlloy>]
]);
//Better Workbench recipe
Blueprint.addRecipe("enderio_components", EIOMaterial.capacitorOctadic, [EIOMaterial.capacitorEnhanced *2, <ore:ingotVibrantAlloy> *2, <ore:ingotRefinedGlowstone>]);

//Simple Alloy Smelter
recipes.removeByRecipeName("enderio:simple_alloy_smelter");
recipes.addShaped("mce_challengemode_simple_alloy_smelter", <enderio:block_simple_alloy_smelter>, [
	[<ore:ingotConstructionAlloy>, <ore:ingotConstructionAlloy>, <ore:ingotConstructionAlloy>],
	[null, <tconstruct:smeltery_controller>, null],
	[<ore:gearStone>, EIOMaterial.chassisSimple, <ore:gearStone>]
]);

//Endsteel Chassis
recipes.remove(EIOMaterial.chassisEndsteel);
Blueprint.addRecipe("enderio_components", EIOMaterial.chassisEndsteel, [EIOMaterial.grainsVibrant, <ore:ingotEndSteel> *4, <enderio:block_end_iron_bars> *6]);

//EnderIO end


//Actually Additions

//Atomic Reconstructor
recipes.remove(<actuallyadditions:block_atomic_reconstructor>);
recipes.addShaped("mce_challengemode_atomic_reconstructor", <actuallyadditions:block_atomic_reconstructor>, [
	[IEItem.redstoneBreaker, <simplyjetpacks:metaitemmods:14>, null],
	[IEItem.capacitorLV, AAItem.ironCasing, <botania:lens>],
	[<immersivetech:connectors>, <simplyjetpacks:metaitemmods:14>, null]
]);

//Iron Casing
recipes.remove(AAItem.ironCasing);
recipes.addShaped("mce_challengemode_iron_casing", AAItem.ironCasing, [
	[<ore:plateIron>, <ore:scaffoldingAluminum>, <ore:plateIron>],
	[<ore:scaffoldingAluminum>, <ore:blockQuartzBlack>, <ore:scaffoldingAluminum>],
	[<ore:plateIron>, <ore:scaffoldingAluminum>, <ore:plateIron>]
]);

//Actually Additions end


// Quantum Quarry
recipes.remove(<extrautils2:quarry>);
recipes.addShaped("mce_challengemode_quantum_quarry_core", <extrautils2:quarry>, [
	[<ore:blockCerulean>, <theaurorian:moongem>, <ore:blockCerulean>],
	[<theaurorian:moongem>, <ore:magic_snow_globe>, <theaurorian:moongem>],
	[<ore:blockCerulean>, <theaurorian:moongem>, <ore:blockCerulean>]
]);


//Rainbow Generator (evil edition)
recipes.removeByRecipeName("extrautils2:rainbow_gen");
recipes.addShaped("mce_challengemode_rainbow_gen", <extrautils2:rainbowgenerator:0>, [
	[<openblocks:technicolor_glasses>, <extrautils2:rainbowgenerator:2>, <doggytalents:multicoloured_collar>],
	[<taiga:adamant_ingot>, <nuclearcraft:rtg_californium>, <taiga:adamant_ingot>],
	[<quark:rune:16>, <extrautils2:rainbowgenerator:1>, <actuallyadditions:item_color_lens>]
]);


//Yeet Fluid Laser
AtomicReconstructor.removeRecipe(<actuallyadditions:block_laser_relay_fluids>);
AtomicReconstructor.removeRecipe(<actuallyadditions:block_laser_relay_item>);
AtomicReconstructor.addRecipe(<actuallyadditions:block_laser_relay_item>, <actuallyadditions:block_laser_relay>, 2000);
<actuallyadditions:block_laser_relay_fluids>.addTooltip(format.red(game.localize("mce.generic.tip.challengemode_disabled")));

print("--- challenge/ChallengemodetechStuff.zs initialized ---");
