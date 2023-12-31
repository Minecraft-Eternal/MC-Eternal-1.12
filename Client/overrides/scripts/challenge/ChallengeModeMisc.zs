#packmode challenge

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import thaumcraft.aspect.CTAspectStack;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.events.IEventManager;
import crafttweaker.event.EntityLivingUseItemEvent.Start;

import mods.mekanism.infuser;
import mods.thermalexpansion.InductionSmelter;

import mods.roots.Fey;
import mods.thaumcraft.ArcaneWorkbench;
import mods.thaumcraft.Infusion;

#MC Eternal Scripts

print("--- Loading /challenge/ChallengeModeMisc.zs ---");

/* Deprecates:
	Mekanism.zs
	RFTools.zs
	Thermal.zs

   Adjusts:
    ExtraUtils.zs
*/


//EnderIO

// Ender Armor
basicDisable(<enderio:item_end_steel_helmet>, "", false, true);

basicDisable(<enderio:item_end_steel_chestplate>, "", false, true);

basicDisable(<enderio:item_end_steel_leggings>, "", false, true);

basicDisable(<enderio:item_end_steel_boots>, "", false, true);



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
InductionSmelter.addRecipe(<thermalfoundation:glass:3>, <mekanism:dust:2>*4, <thermalfoundation:material:67>, 8000);

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
	if(event.isPlayer && !event.player.world.remote && event.item.definition.id == "tombstone:grave_key" && event.item.hasTag){
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

//Deny Wither cheese such as sticking its face in Bedrock
static okWitherDimensions as int[] = [
		0,
		7,
		-8,
		-23
];

events.onEntityJoinWorld(function(event as crafttweaker.event.EntityJoinWorldEvent){
	if(!isNull(event.entity.definition)
	&& event.entity.definition.id == "minecraft:wither"
	&& !(okWitherDimensions has event.entity.dimension)){
		event.entity.setDead();
		event.cancel();
	}
});


//Tooltips
addMultilineLocalizedTooltip(<thermalfoundation:glass:3>, "mce.challengemode.thermal.tip.hardened_glass_needs_osmium");
<tombstone:grave_key>.addTooltip(format.red(game.localize("mce.challengemode.tombstone.tip.grave_key_cant_teleport")));


val witherTooltipShift as string[] = game.localize("mce.challengemode.minecraft.tip.wither_only_in_some_dims.shift").split("<BR>");
val witherTooltip as string[] = game.localize("mce.challengemode.minecraft.tip.wither_only_in_some_dims").split("<BR>");
<minecraft:skull:1>.addShiftTooltip(format.gold(witherTooltipShift[0]), format.gold(witherTooltip[0]));
<minecraft:skull:1>.addShiftTooltip(format.green(witherTooltipShift[1]), format.gold(witherTooltip[1]));
<minecraft:skull:1>.addShiftTooltip(format.green(witherTooltipShift[2]), format.gold(witherTooltip[2]));
<minecraft:skull:1>.addShiftTooltip(format.green(witherTooltipShift[3]));
<minecraft:skull:1>.addShiftTooltip(format.green(witherTooltipShift[4]));


print("--- /challenge/ChallengeModeMisc.zs initialized ---");
