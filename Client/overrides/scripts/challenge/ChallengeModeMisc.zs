#packmode challenge

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import thaumcraft.aspect.CTAspectStack;
import mods.mekanism.infuser;
import mods.roots.Fey;
import mods.thermalexpansion.InductionSmelter;

#MC Eternal Scripts

print("--- Loading /challenge/ChallengeModeMisc.zs ---");

/* Deprecates:
	Mekanism.zs
	RFTools.zs
	Thermal.zs

   Adjusts:
    ExtraUtils.zs
*/

#remove vistical agriculture:tm:
// super op by deleting any kind of challenges with essentia
val validSeedAspects = [
		//Base TC
		<aspect:aer>,
		<aspect:terra>,
		<aspect:ignis>,
		<aspect:aqua>,
		<aspect:ordo>,
		<aspect:perditio>,
		<aspect:vacuos>,
		<aspect:lux>,
		<aspect:motus>,
		<aspect:gelum>,
		<aspect:vitreus>,
		<aspect:metallum>,
		<aspect:victus>,
		<aspect:mortuus>,
		<aspect:potentia>,
		<aspect:permutatio>,
		<aspect:praecantatio>,
		<aspect:auram>,
		<aspect:alkimia>,
		<aspect:vitium>,
		<aspect:tenebrae>,
		<aspect:alienis>,
		<aspect:volatus>,
		<aspect:herba>,
		<aspect:instrumentum>,
		<aspect:fabrico>,
		<aspect:machina>,
		<aspect:vinculum>,
		<aspect:spiritus>,
		<aspect:cognitio>,
		<aspect:sensus>,
		<aspect:aversio>,
		<aspect:praemunio>,
		<aspect:desiderium>,
		<aspect:exanimis>,
		<aspect:bestia>,
		<aspect:humanus>,
		
		//TAdditions
		<aspect:fluctus>,
		<aspect:sonus>,
		<aspect:exitium>,
		<aspect:caeles>,
		<aspect:draco>,
		<aspect:infernum>,
		<aspect:ventus>,
		<aspect:visum>,
		<aspect:imperium>
] as CTAspectStack[];
	
for aspectStack in validSeedAspects {
	var aspect = aspectStack.internal.name.toLowerCase();
	mods.thaumcraft.Crucible.removeRecipe("thaumadditions:"+ aspect +"_vis_seed");
	itemUtils.getItem("thaumadditions:vis_seeds/"+ aspect).addTooltip(format.red(game.localize("mce.generic.tip.challengemode_disabled")));
}

// Thermal Machine Frame
recipes.remove(<thermalexpansion:frame>);
recipes.addShaped("mce_challengemode_thermal_frame", <thermalexpansion:frame>, [
	[<ore:blockSheetmetalIron>, <ore:plateSilver>, <ore:blockSheetmetalIron>],
	[<extrautils2:ineffableglass:2>, <immersiveengineering:metal_decoration0:3>, <extrautils2:ineffableglass:2>],
	[<ore:blockSheetmetalIron>, <immersiveengineering:material:18>, <ore:blockSheetmetalIron>]
]);

//EnderIO

// Ender Armor
basicDisable(<enderio:item_end_steel_helmet>, "", false, true);

basicDisable(<enderio:item_end_steel_chestplate>, "", false, true);

basicDisable(<enderio:item_end_steel_leggings>, "", false, true);

basicDisable(<enderio:item_end_steel_boots>, "", false, true);


//RFTools

// Quarry Shape Card
recipes.remove(<rftools:shape_card:2>);
recipes.addShaped(<rftools:shape_card:2>, [
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

// Quantum Quarry
// test and see if fresh snowglobe works in this recipe, or it has to be toured
recipes.remove(<extrautils2:quarry>);
recipes.addShaped(<extrautils2:quarry>, [
	[<ore:blockCerulean>, <theaurorian:moongem>, <ore:blockCerulean>],
	[<theaurorian:moongem>, <ore:magic_snow_globe>, <theaurorian:moongem>],
	[<ore:blockCerulean>, <theaurorian:moongem>, <ore:blockCerulean>]
]);


//Mekanism

// Metallurgic Infuser
recipes.remove(<mekanism:machineblock:8>);
recipes.addShaped(<mekanism:machineblock:8>, [
	[<futuremc:netherite_ingot>, <nuclearcraft:part:2>, <futuremc:netherite_ingot>],
	[<minecraft:redstone>, <mekanism:basicblock>, <minecraft:redstone>],
	[<futuremc:netherite_ingot>, <nuclearcraft:part:2>, <futuremc:netherite_ingot>]
]);

// Digital Miner
recipes.remove(<mekanism:machineblock:4>);
recipes.addShaped(<mekanism:machineblock:4>, [
	[<ore:alloyUltimate>, <mekanism:controlcircuit:3>, <ore:alloyUltimate>],
	[<mekanism:machineblock:15>, <mekanism:robit>, <mekanism:machineblock:15>],
	[<mekanism:teleportationcore>, <ore:blockNetherite>, <mekanism:teleportationcore>]
]);

// Fusion Controller
recipes.remove(<mekanismgenerators:reactor>);
recipes.addShaped(<mekanismgenerators:reactor>, [
	[<mekanism:controlcircuit:3>, <thaumicaugmentation:starfield_glass:2>, <mekanism:controlcircuit:3>],
	[<ore:blockNetherite>, <advancedrocketry:chemicalreactor>, <ore:blockNetherite>],
	[<ore:blockNetherite>, <ore:blockAurorianSteel>, <ore:blockNetherite>]
]);

// Gasburner
recipes.remove(<mekanismgenerators:generator:3>);
recipes.addShaped(<mekanismgenerators:generator:3>, [
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


//Flux Networks

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

// Flux Controller
val fluxnetItemNames = [
	"fluxcontroller",
	"fluxpoint",
	"fluxplug",
	"fluxstorage",
	"herculeanfluxstorage",
	"gargantuanfluxstorage"
] as string[];

for name in fluxnetItemNames {
	recipes.removeByRecipeName("fluxnetworks:tile.fluxnetworks."+ name);
}

//Enables FluxNet Wireless charging
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

// Roots Unending Bowl
Fey.removeRecipe(<roots:unending_bowl>);
Fey.addRecipe("unending_bowl", <roots:unending_bowl>, [<roots:mortar>, <nuclearcraft:water_source_dense>, <thaumcraft:everfull_urn>, <extrautils2:drum:3>.withTag({Fluid: {FluidName: "water", Amount: 65536000}}), <xreliquary:emperor_chalice>]);


//Gate Witherproofing behind Beneath :>
val thermalGlass = {
	"thermalfoundation:glass" : [1, 2, 3, 4, 5, 6, 7, 8, 9],
	"thermalfoundation:glass_alloy": [1, 2, 3, 4, 5, 6, 7]
} as int[][string];
for id,values in thermalGlass {
	for value in values {
		recipes.removeByRecipeName(id +"_"+ value);
	}
}

//Lead Glass crafting from scratch
recipes.removeByRecipeName("thermalfoundation:glass");
//Steel Glass crafting by hand
recipes.removeByRecipeName("thermalfoundation:glass_alloy");

InductionSmelter.removeRecipe(<thermalfoundation:material:770>, <thermalfoundation:material:67>);
InductionSmelter.addRecipe(<thermalfoundation:glass:3>, <thermalfoundation:material:770>*4, <mekanism:dust:2>, 8000);

//Reinforced Obsidian
recipes.removeByRecipeName("enderio:reinforced_obsidian");
recipes.addShaped("mce_challengemode_reinforced_obsidian", <enderio:block_reinforced_obsidian> *2, [
	[<ore:dustBedrock>, <enderio:block_dark_iron_bars>, <ore:dustBedrock>],
	[<enderio:block_dark_iron_bars>, <ore:blockRefinedObsidian>, <enderio:block_dark_iron_bars>],
	[<ore:dustBedrock>, <enderio:block_dark_iron_bars>, <ore:dustBedrock>]
]);

//Shield Projector
recipes.removeByRecipeName("rftools:shield_block1");
recipes.addShaped("mce_challengemode_shield_projector_1", <rftools:shield_block1>, [
	[<ore:ingotOsmium>, <rftools:infused_diamond>, <ore:ingotOsmium>],
	[<ore:dustRedstone>, <rftools:machine_frame>, <ore:dustRedstone>],
	[<enderio:block_reinforced_obsidian>, <enderio:block_reinforced_obsidian>, <enderio:block_reinforced_obsidian>]
]);

//Block Protector
recipes.removeByRecipeName("rftools:block_protector");
recipes.addShaped("mce_challengemode_block_protector", <rftools:block_protector>, [
	[<enderio:block_reinforced_obsidian>, <rftools:shield_template_block:*>, <enderio:block_reinforced_obsidian>],
	[<rftools:shield_template_block:*>, <rftools:machine_frame>, <rftools:shield_template_block:*>],
	[<enderio:block_reinforced_obsidian>, <rftools:shield_template_block:*>, <enderio:block_reinforced_obsidian>]
]);

//Runed Obsidian
Fey.removeRecipe(<roots:runed_obsidian>);
Fey.addRecipe("runed_obsidian", <roots:runed_obsidian> *4, [<roots:runic_dust>, <thaumcraft:ingot:1>, <ore:runestone>, <mekanism:basicblock:0>, <ore:runestone>]);

//Warding Sigil
ArcaneWorkbench.removeRecipe(<thaumicaugmentation:material:1>);
ArcaneWorkbench.registerShapedRecipe("warding_sigil", "WARDED_ARCANA", 10, 
	[<aspect:ignis>, <aspect:aqua>, <aspect:terra>, <aspect:perditio>],
	<thaumicaugmentation:material:1> *3,
	[
		[null, <thaumcraft:tallow>, <ore:dustOsmium>],
		[<ore:dyePurple>, <thaumcraft:brain>, <ore:dyePurple>],
		[<ore:dustOsmium>, <thaumcraft:tallow>]
	]
);

//Witherproof Gating end


//Make Cropsticks slightly harder (and funnier)
recipes.removeByRecipeName("agricraft:crop_sticks");
//Ancient Wood Rod
recipes.addShaped("mce_challengemode_ancient_wood_cropsticks", <agricraft:crop_sticks> *2, [
	[<naturesaura:ancient_stick>, <naturesaura:ancient_stick>],
	[<naturesaura:ancient_stick>, <naturesaura:ancient_stick>]
]);


//AA Storage Crate stuff
// big, and only just a bunch of wood, needs more evil
//Small Storage Crate (evil version)
recipes.remove(<actuallyadditions:block_giant_chest>);
recipes.addShaped("mce_challengemode_small_storage_crate", <actuallyadditions:block_giant_chest>, [
	[<ironchest:iron_chest:2>, <immersiveengineering:wooden_decoration:1>, <forestry:oak_stick>],
	[<immersiveengineering:wooden_decoration:1>, <actuallyadditions:block_misc:4>, <immersiveengineering:wooden_decoration:1>],
	[<forestry:oak_stick>, <immersiveengineering:wooden_decoration:1>, <immersiveengineering:wooden_device0>]
]);

//Small Storage Crate Upgrade (rude version)
recipes.addShaped("mce_challengemode_small_storage_crate_upgrade", <actuallyadditions:item_chest_to_crate_upgrade>, [
  [<immersiveengineering:wooden_decoration:1>, <ironchest:iron_chest:2>, <immersiveengineering:wooden_decoration:1>],
  [<forestry:oak_stick>, <actuallyadditions:block_misc:4>, <forestry:oak_stick>],
  [<immersiveengineering:wooden_decoration:1>, <immersiveengineering:wooden_device0>, <immersiveengineering:wooden_decoration:1>]
]);

//Wood Casing (slightly evil version)
recipes.remove(<actuallyadditions:block_misc:4>);
recipes.addShaped("mce_challengemode_wood_casing", <actuallyadditions:block_misc:4>, [
	[<ore:plankWood>, <forestry:oak_stick>, <ore:plankWood>],
	[<forestry:oak_stick>, <roots:wildwood_log>, <forestry:oak_stick>],
	[<ore:plankWood>, <forestry:oak_stick>, <ore:plankWood>]
]);


//Yeet Infinite Range + Crafting SSN remotes
for num in 1 to 3 {
	val remote = itemUtils.getItem("storagenetwork:remote", num);
	basicDisable(remote, "", false, true);
}
//Keep the no craft one tho, but price it up
recipes.remove(<storagenetwork:remote:3>);
recipes.addShaped("mce_challengemode_nocraft_ssn_remote", <storagenetwork:remote:3>, [
	[<ore:plateSteel>, <enderio:block_solar_panel:2>, <ore:plateSteel>],
	[<ore:ingotTriberium>, <storagenetwork:master>, <ore:ingotTriberium>],
	[<ore:plateSteel>, <enderio:block_travel_anchor>, <ore:plateSteel>]
]);


//no small plate press
basicDisable(<advancedrocketry:platepress>, "", false, true);

//remove Enchanted Grave key
// very dumb op, basically allows you to negate death
recipes.removeByRecipeName("tombstone:enchanted_grave_key");

// disenchant keys when they are used
events.onEntityLivingUseItemStart(function(event as crafttweaker.event.EntityLivingUseItemEvent.Start){
	if(!event.player.world.remote && event.isPlayer && event.item.definition.id == "tombstone:grave_key" && event.item.hasTag){
		print("EntityLivingUseItemStartEvent of Grave Key Disenchantment");
		print("event is via player: "+ event.isPlayer);
		print("CT Itemdef: "+ event.item.commandString);
		if(isNull(event.item.tag.enchant) || event.item.tag.enchant.asBool() == false) return;
		val unenchantedKey = event.item.updateTag({enchant: false});
		for hand in [IEntityEquipmentSlot.mainHand(), IEntityEquipmentSlot.offhand()] as IEntityEquipmentSlot[] {
			if(event.player.hasItemInSlot(hand) && event.player.getItemInSlot(hand).definition.id == "tombstone:grave_key"){
				event.player.setItemToSlot(hand, unenchantedKey);
				event.player.sendChat(game.localize("mce.challengemode.tombstone.message.grave_key_teleport_fail"));
				event.player.setCooldown(<tombstone:grave_key>, 20);
				event.cancel();
			}
		}
	}
});


//Tooltips
addMultilineLocalizedTooltip(<thermalfoundation:glass:3>, "mce.challengemode.thermal.tip.hardened_glass_needs_osmium");
<tombstone:grave_key>.addTooltip(format.red(game.localize("mce.challengemode.tombstone.tip.grave_key_cant_teleport")));


print("--- /challenge/ChallengeModeMisc.zs initialized ---");
