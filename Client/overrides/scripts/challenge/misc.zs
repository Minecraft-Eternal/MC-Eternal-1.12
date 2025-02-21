#packmode challenge
#priority 2

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.recipes.ICraftingInfo;
import crafttweaker.block.IBlock;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.text.ITextComponent;
import crafttweaker.text.IStyle;

import crafttweaker.events.IEventManager;
import crafttweaker.event.EntityJoinWorldEvent;
import crafttweaker.event.EntityLivingUseItemEvent.Start;
import crafttweaker.event.EntityLivingDeathDropsEvent;

import mods.contenttweaker.Commands;

import thaumcraft.aspect.CTAspectStack;

import mods.jei.JEI;

import mods.roots.Fey;
import mods.thaumcraft.ArcaneWorkbench;
import mods.thaumcraft.Infusion;

import mods.thermalexpansion.InductionSmelter;

import scripts.challenge._challengeconfig as challengeConfig;

#MC Eternal Scripts

print("--- loading challenge/misc.zs ---");

/* Deprecates:
	Mekanism.zs
	RFTools.zs
	Thermal.zs

   Adjusts:
    ExtraUtils.zs
*/

/*
Todo stuff:

	BC Laser and Table recipes need revision, since you can just bypass it with villagers (bruh).

	get to and test NA stuff, figure out what to do with Offering Table.

	Gaia 2 testing

	Loot Crate nerfage (removing some items that could sequence break severely)
		Some Cyclic items
		Wrought Axe (because of steel scrapping)
		Digital Miner
		Creative Jetpack
		Flux Sponge
		Superconductor Cables
		Railgun
		Earth Talisman


	Remove some TR items from loot
		Data Storage Circuit
		Machine Frames
		Electronic Circuit?


	Shop Locks
		Treated Wood behind Simple Alloy Smelter, so you have to make/find some first (dubious, it's not very hard in the first place)
		Livingwood unavailable, automate it epically
		Waystones behind Beneath? recipes also altered, Warp Stone namely
		Fire Axe behind Intro or something? or maybe just Pre-Wither?
		Portal Gun unavailable? or far more expensive

	Gate some teleporty things behind or near Beneath?
		Warp Stone
		Mek Portal
		RFTools Matter


	Make Atomic Reconstructors in birb structure the shattering version
*/


//EnderIO

// Ender Armor
basicDisable(<enderio:item_end_steel_helmet>, "", true);

basicDisable(<enderio:item_end_steel_chestplate>, "", true);

basicDisable(<enderio:item_end_steel_leggings>, "", true);

basicDisable(<enderio:item_end_steel_boots>, "", true);


//Magicbane
// evil naughty knife of number
recipes.remove(<xreliquary:magicbane>);
Infusion.registerRecipe("mce_challengemode_magicbane", "", <xreliquary:magicbane>, 10, [
		<aspect:aversio> *100,
		<aspect:praecantatio> *100,
		<aspect:potentia> *50,
		<aspect:mortuus> *75
	],
	<roots:runed_dagger>,
	[
		<tconstruct:sword_blade>.withTag({Material: "nucleum"})
]);



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

//Witherproof gating end



//Make Cropsticks slightly harder (and funnier)
recipes.removeByRecipeName("agricraft:crop_sticks");
//Ancient Wood Rod
recipes.addShaped("mce_challengemode_ancient_wood_cropsticks", <agricraft:crop_sticks> *2, [
	[<naturesaura:ancient_stick>, <naturesaura:ancient_stick>],
	[<naturesaura:ancient_stick>, <naturesaura:ancient_stick>]
]);


//nerfing SSN
// other options are more interesting and underused because SSN and AE2 are so reliable, almost too reliable infact

//Yeet Infinite Range SSN remotes
for num in 1 to 4 {
	val remote = itemUtils.getItem("storagenetwork:remote", num);
	basicDisable(remote, "", true);
}

val disabledSSNStuff as IItemStack[] = [
	<storagenetwork:ex_kabel>,
	<storagenetwork:im_kabel>,
	<storagenetwork:process_kabel>,
	<storagenetwork:controller>,
	<storagenetwork:upgrade:*>,
	<storagenetwork:picker_remote>,
	<storagenetwork:collector_remote>
];

for item in disabledSSNStuff {
	basicDisable(item, "", true);
	if(!isServer) JEI.hide(item);
}


//no small plate press
basicDisable(<advancedrocketry:platepress>, "", true);


//Cardboard Box
recipes.remove(<mekanism:cardboardbox>);
val sawdust as IIngredient = <ore:dustSawdust>|<ore:pulpWood>;
recipes.addShaped("mce_challengemode_cardboard_box", <mekanism:cardboardbox>, [
	[sawdust, <storagedrawers:tape>, sawdust],
	[sawdust, <actuallyadditions:item_crate_keeper>, sawdust],
	[sawdust, AEMaterials["1kComponent"], sawdust]
]);


//Scannable stuff
//Scanner
recipes.remove(<scannable:scanner>);
recipes.addShaped("mce_challengemode_scannable_scanner", <scannable:scanner>, [
	[getTconPart("toolrod", "manasteel"), <thaumcraft:thaumometer>, getTconPart("toolrod", "manasteel")],
	[<simplyjetpacks:metaitemmods:14>, <bloodmagic:sigil_divination>, <simplyjetpacks:metaitemmods:14>],
	[<ore:ingotConductiveIron>, EIOMaterial.capacitorBasic, <ore:ingotConductiveIron>]
]);

//Block Module
recipes.remove(<scannable:module_block>);
recipes.addShapeless("mce_challengemode_scannable_block_module", <scannable:module_block>, [
	<scannable:module_blank>,
	<appliedenergistics2:memory_card>
]);

//Common Ores
recipes.remove(<scannable:module_ore_common>);
recipes.addShapeless("mce_challengemode_scannable_common_ores_module", <scannable:module_ore_common>, [
	<scannable:module_blank>,
	<randomthings:diviningrod:0>,
	<randomthings:diviningrod:1>,
	<randomthings:diviningrod:4>,
	<randomthings:diviningrod:8>,
	<randomthings:diviningrod:9>,
	<randomthings:diviningrod:11>,
	<randomthings:diviningrod:12>
]);

recipes.addShapeless("mce_challengemode_scannable_common_ores_module_from_vanilla_rod", <scannable:module_ore_common>, [
	<scannable:module_blank>,
	<randomthings:diviningrod:7>,
	<randomthings:diviningrod:8>,
	<randomthings:diviningrod:9>,
	<randomthings:diviningrod:11>,
	<randomthings:diviningrod:12>
]);


//Rare Ores
recipes.remove(<scannable:module_ore_rare>);
recipes.addShapeless("mce_challengemode_scannable_rare_ores_module", <scannable:module_ore_rare>, [
	<scannable:module_blank>,
	<randomthings:diviningrod:2>,
	<randomthings:diviningrod:3>,
	<randomthings:diviningrod:5>,
	<randomthings:diviningrod:6>,
	<randomthings:diviningrod:10>,
	<randomthings:diviningrod:13>,
	<randomthings:diviningrod:14>
]);

recipes.addShapeless("mce_challengemode_scannable_rare_ores_module_from_vanilla_rod", <scannable:module_ore_rare>, [
	<scannable:module_blank>,
	<randomthings:diviningrod:7>,
	<randomthings:diviningrod:10>,
	<randomthings:diviningrod:13>,
	<randomthings:diviningrod:14>
]);

//Range Module
recipes.remove(<scannable:module_range>);
recipes.addShapeless("mce_challengemode_scannable_range_module", <scannable:module_range>, [
	<scannable:module_blank>, <enderio:block_wireless_charger_extension>
]);


//Silly Cyclic items
val cyclicItemsOfSilly as IItemStack[] = [
	<cyclicmagic:tool_launcher>,
	<cyclicmagic:book_ender>,
	<cyclicmagic:soulstone>,
	<cyclicmagic:tool_elevate>,
	<cyclicmagic:cable_wireless>,
	<cyclicmagic:cable_wireless_energy>,
	<cyclicmagic:cable_wireless_fluid>,
	<cyclicmagic:wand_hypno>,
	<cyclicmagic:builder_pattern>,
	<cyclicmagic:magnet_block>,
	<cyclicmagic:magnet_anti_block>,
	<cyclicmagic:block_anvil_magma>,
	<cyclicmagic:item_pipe>,
	<cyclicmagic:item_pump>,
	<cyclicmagic:energy_pipe>,
	<cyclicmagic:energy_pump>,
	<cyclicmagic:fluid_pipe>,
	<cyclicmagic:fluid_pump>,
	<cyclicmagic:bundled_pipe>,
	<cyclicmagic:block_vacuum>,
	<cyclicmagic:block_forester>,
	<cyclicmagic:block_miner>,
	<cyclicmagic:block_anvil>,
	<cyclicmagic:harvester_block>,
	<cyclicmagic:builder_block>,
	<cyclicmagic:block_miner_smart>,
	<cyclicmagic:placer_block>,
	<cyclicmagic:block_user>,
	<cyclicmagic:auto_crafter>,
	<cyclicmagic:block_disenchanter>,
	<cyclicmagic:fluid_placer>,
	<cyclicmagic:tool_warp_home>,
	<cyclicmagic:tool_warp_spawn>
];

for item in cyclicItemsOfSilly {
	basicDisable(item, "", true);
	//if(!isServer) JEI.hide(item);
}


//Openblocks Block Breaker
// violates some laws of unbreakability, such as Waystones
basicDisable(<openblocks:block_breaker>, "", true);


//Destruction Gadget
// violates more laws of unbreakability
basicDisable(<buildinggadgets:destructiontool>, "", true);


//Cyclic Inventory upgrade
// can bypass betweenlands restrictions, and is unreliable anyways
basicDisable(<cyclicmagic:inventory_food>, "", true);

//Player Chest
// also bypasses BL restrictions but is also very funny
basicDisable(<extrautils2:playerchest>, "", true);


//Grave Key Teleportation balancing
// can be configured in "_challengeconfig.zs" if you want to customize aspects of it. Please do not re-hardcode things, for your own sanity.

//This recipe's ingredient size is too limiting.
recipes.removeByRecipeName("tombstone:enchanted_grave_key");

if(challengeConfig.graveKeyTeleportation){

	if(challengeConfig.graveKeyEnchantCraft){
		var keyEnchantingMaterials as IIngredient[] = [<tombstone:grave_key>.marked("key")];
		for item in challengeConfig.graveKeyEnchantCraftItems {
			keyEnchantingMaterials += item;
		}

		recipes.addShapeless("mce_challengemode_new_super_grave_key_enchanting_u_deluxe", <tombstone:grave_key>.withTag({enchant: true, artificiallyEnchanted: true}),
			keyEnchantingMaterials,
			function(out as IItemStack, ins as IItemStack[string], cInfo as ICraftingInfo){
				if(ins.key.hasTag && (isNull(ins.key.tag.artificiallyEnchanted) || !ins.key.tag.artificiallyEnchanted.asBool()))
					return ins.key.updateTag({enchant: true, artificiallyEnchanted: true});
				else
					return null;
		});
	}

	// Grave Key Soul Enchanting handler
	
	events.onPlayerInteractBlock(function(event as crafttweaker.event.PlayerInteractBlockEvent){
		if(!event.world.remote
			&& event.hand == 'MAIN_HAND'
			&& !isNull(event.item)
			&& event.block.definition.id has "tombstone:decorative_"
			&& event.item.definition.id == "tombstone:grave_key"){
			
			//if Disabled, prevent
			if(!challengeConfig.graveKeySoulEnchantment){
				event.player.sendRichTextMessage(ITextComponent.fromTranslation("mce.challengemode.tombstone.message.key_soul_enchantment_disabled"));
				event.cancellationResult = "FAIL";
				event.cancel();
				return;
			}

			//Grave has a Soul?
			val graveHasSoul as bool = event.blockState.withProperty("has_soul", true).matches(event.blockState);

			//if requires Soul for validating Naturally enchanted keys, and Grave has no Soul, prevent
			if(challengeConfig.naturallyEnchantedKeyRequiresSoul && !graveHasSoul){
				event.player.sendRichTextMessage(ITextComponent.fromTranslation("tombstone.message.enchant_item.no_soul"));
				event.cancellationResult = "FAIL";
				event.cancel();
				return;
			}

			//if requires no Catalyst, proceed, or if does, ensure offhand item matches Catalyst ...
			if((!challengeConfig.graveKeySoulEnchantmentCosts
				|| (!isNull(event.player.offHandHeldItem) 
					&& challengeConfig.graveKeySoulEnchantmentCatalyst.matches(event.player.offHandHeldItem)))
				&& (isNull(event.item.tag.artificallyEnchanted) || !event.item.tag.artificiallyEnchanted.asBool())){

				//if requires Catalyst, consume catalyst
				if(challengeConfig.graveKeySoulEnchantmentCosts)
					event.player.offHandHeldItem.mutable().shrink(1);

				if(!isNull(event.item.tag.enchant) && event.item.tag.enchant.asBool()){
					Commands.call("playsound tombstone:magic_use01 player "+ event.player.name, event.player, event.world, false, true);
				}

				//if item is already enchanted and validated, stop, as to not waste items
				if(!isNull(event.item.tag.enchant)
					&& event.item.tag.enchant.asBool()
					&& !isNull(event.item.tag.artificallyEnchanted)
					&& event.item.tag.artificallyEnchanted.asBool())
					return;

				//validate key for Teleportation
				val artificallyEnchantedKey = event.item.updateTag({artificiallyEnchanted: true});
				for hand in [IEntityEquipmentSlot.mainHand(), IEntityEquipmentSlot.offhand()] as IEntityEquipmentSlot[] {
					if(event.player.getItemInSlot(hand).definition.id == "tombstone:grave_key"){
						event.player.setItemToSlot(hand, artificallyEnchantedKey);
						break;
					}
				}
			} else {
				//... but if requires and has no Catalyst, provide error message informing of proper Catalyst
				event.player.sendRichTextMessage(ITextComponent.fromTranslation("mce.challengemode.tombstone.message.no_revival_catalyst", [
						ITextComponent.fromTranslation(challengeConfig.graveKeySoulEnchantmentCatalyst.name +".name").formattedText
					])
				);
				event.cancellationResult = "FAIL";
				event.cancel();
			}
		}
	});


	// Apply debilitating Debuffs when teleporting to grave to make revival much more riskful
	if(challengeConfig.graveKeyTeleportationDebuffs){
		events.onEntityLivingUseItemFinish(function(event as crafttweaker.event.EntityLivingUseItemEvent.Finish){
			if(event.isPlayer
				&& !event.entity.world.remote
				&& event.item.definition.id == "tombstone:grave_key"
				&& event.item.hasTag){

					val unenchantedKey = event.item.removeTag("enchant");
					for hand in [IEntityEquipmentSlot.mainHand(), IEntityEquipmentSlot.offhand()] as IEntityEquipmentSlot[] {
						if(event.player.getItemInSlot(hand).definition.id == "tombstone:grave_key"){
							event.player.setItemToSlot(hand, unenchantedKey);
							break;
						}
					}

					for effect, properties in challengeConfig.graveKeyTeleportationDebuffList {
						val duration = !isNull(properties.duration) ? properties.duration : 200;
						val level = !isNull(properties.level) ? properties.level - 1 : 0;
						event.player.addPotionEffect(effect.makePotionEffect(duration, level));
					}
			}
		});
	}

}

// Prevent use of Enchanted keys to teleport (and disenchant them if it feels like it)
	events.onEntityLivingUseItemStart(function(event as crafttweaker.event.EntityLivingUseItemEvent.Start){
		if(event.isPlayer
			&& !event.player.world.remote
			&& event.item.definition.id == "tombstone:grave_key"
			&& event.item.hasTag){
			print("enchanted? "+ (isNull(event.item.tag.enchant)
				|| event.item.tag.enchant.asBool()));
			print("artifically enchanted? "+ (isNull(event.item.tag.artificiallyEnchanted)
				|| !event.item.tag.artificiallyEnchanted.asBool()));

			if(isNull(event.item.tag.enchant)
				|| !event.item.tag.enchant.asBool())
					return;

			val unenchantedKey = event.item.removeTag("enchant");
			for hand in [IEntityEquipmentSlot.mainHand(), IEntityEquipmentSlot.offhand()] as IEntityEquipmentSlot[] {
				if(event.player.hasItemInSlot(hand)
					&& event.player.getItemInSlot(hand).definition.id == "tombstone:grave_key"
					&& (isNull(event.item.tag.artificiallyEnchanted) || !event.item.tag.artificiallyEnchanted.asBool())){
					event.player.setItemToSlot(hand, unenchantedKey);
					event.player.sendRichTextMessage(ITextComponent.fromTranslation(
						challengeConfig.graveKeyTeleportation ? 
							"mce.challengemode.tombstone.message.enchant_with_revival_catalyst" : "mce.challengemode.tombstone.message.grave_key_teleport_fail", [
								ITextComponent.fromTranslation(challengeConfig.graveKeySoulEnchantmentCatalyst.name +".name").formattedText
						])
					);
					event.player.setCooldown(<tombstone:grave_key>, 20);
					event.cancel();
					break;
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

//apply data to player that kills ender dragon
// using advancement allows collaborating players to both get credit, i think
// COMMENTED OUT INTENTIONALLY, does not work for whatever reason. the advancement event handler can see the flag, but the tick event can't, ever? what the shit.
/*
events.onPlayerAdvancement(function(event as crafttweaker.event.PlayerAdvancementEvent){
	if(event.id == "minecraft:end/kill_dragon" && !(event.player.tags has "killedEnderDragon")){
		event.player.addTag("killedEnderDragon");
	}
});

//Prevent leaving central End island until Ender Dragon is killed
events.onPlayerTick(function(event as crafttweaker.event.PlayerTickEvent){
	if(event.player.world.time % 40 != 0) return;
	var happened = false;
	val player = event.player;
	if(player.dimension == 1
		&& !(player.tags has "killedEnderDragon")
		&& ((player.x > 500 || player.x < -500) || (player.z > 500 || player.z < -500))){
		player.posX = 0.0;
		player.posZ = 0.0;
		player.posY = 255.0;
		happened = true;
	}
	if(!isServer && happened){
		event.player.sendChat("message from serverside: "+ !event.player.world.remote);
		for line in game.localize("mce.challengemode.minecraft.message.kill_enderdragon_to_leave_central_island").split("<BR>") {
			event.player.sendChat(line);
		}
	}
});
*/


//Tooltips
if(!isServer){
	addMultilineLocalizedTooltip(<thermalfoundation:glass:3>, "mce.challengemode.thermal.tip.hardened_glass_needs_osmium");

	if(!challengeConfig.graveKeyTeleportation){
		<tombstone:grave_key>.addTooltip(format.red(game.localize("mce.challengemode.tombstone.tip.grave_key_cant_teleport")));
	} else {
		<tombstone:grave_key>.addAdvancedTooltip(function(item as IItemStack){
			if(!isNull(item.tag)
				&& !isNull(item.tag.artificiallyEnchanted)
				&& item.tag.artificiallyEnchanted.asBool())
				return game.localize("mce.challengemode.tombstone.tip.grave_key_teleport_allowed");
			return null;
		});
	}


	val witherTooltipShift as string[] = game.localize("mce.challengemode.minecraft.tip.wither_only_in_some_dims.shift").split("<BR>");
	val witherTooltip as string[] = game.localize("mce.challengemode.minecraft.tip.wither_only_in_some_dims").split("<BR>");
	<minecraft:skull:1>.addShiftTooltip(format.gold(witherTooltipShift[0]), format.gold(witherTooltip[0]));
	<minecraft:skull:1>.addShiftTooltip(format.green(witherTooltipShift[1]), format.gold(witherTooltip[1]));
	<minecraft:skull:1>.addShiftTooltip(format.green(witherTooltipShift[2]), format.gold(witherTooltip[2]));
	<minecraft:skull:1>.addShiftTooltip(format.green(witherTooltipShift[3]));
	<minecraft:skull:1>.addShiftTooltip(format.green(witherTooltipShift[4]));
}


//Challenge Mode alpha status message
events.onPlayerLoggedIn(function(event as crafttweaker.event.PlayerLoggedInEvent){
	event.player.sendRichTextMessage(ITextComponent.fromTranslation("mce.challengemode.generic.message.challengemode_is_indev.1")
	//.style.setColor("red")
	);
	event.player.sendRichTextMessage(ITextComponent.fromTranslation("mce.challengemode.generic.message.challengemode_is_indev.2")
	//.style.setColor("light_purple")
	);
	event.player.sendRichTextMessage(ITextComponent.fromTranslation("mce.challengemode.generic.message.challengemode_configuration_alert")
	//.style.setColor("gold")
	);
});

print("--- challenge/misc.zs initialized ---");