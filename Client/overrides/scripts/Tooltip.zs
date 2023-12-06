import crafttweaker.item.IItemStack;
import crafttweaker.data.IData;
import crafttweaker.enchantments.IEnchantmentDefinition;
#MC Eternal Scripts

print("--- loading Tooltip.zs ---");


#Add tooltip
<extrautils2:bagofholding>.addTooltip(format.red(game.localize("mce.extrautils2.tip.bagofholding_gamemode_change")));
<rats:arcane_technology>.addTooltip(format.gold(game.localize("mce.generic.tip.drops_from").replace("%s", <entity:rats:marbled_cheese_golem>.name)));
<ftbquests:book>.addTooltip(format.gold(game.localize("mce.ftbquests.tip.questbook_open_it")));
<minecraft:nether_star>.addTooltip(format.gold(game.localize("mce.minecraft.tip.nether_star")));
<ebwizardry:crystal_block:*>.addTooltip(format.gold(game.localize("mce.netherportalcorruption.tip.prevents_corruption")));
<wings:fairy_dust>.addTooltip(format.gold(game.localize("mce.wings.tip.fairy_dust")));
getFTBCrate("cultist").addTooltip(format.darkRed(game.localize("mce.ftbquests.tip.crate.cultist")));
getFTBCrate("extraterrestrial_cache").addTooltip(format.gold(game.localize("mce.ftbquests.tip.crate.extraterrestrial_cache")));
<mysticalagriculture:diamond_seeds>.addTooltip(format.darkPurple(game.localize("mce.generic.tip.do_all_chapter_quests_to_unlock").replace("%s", game.localize("mce.questing.chapter.mystical_agriculture.name"))));
<mysticalagriculture:gold_seeds>.addTooltip(format.darkPurple(game.localize("mce.generic.tip.do_all_chapter_quests_to_unlock").replace("%s", game.localize("mce.questing.chapter.farming_and_agriculture.name"))));
<minecolonies:blockhuttownhall>.addTooltip(format.darkPurple(game.localize("mce.minecolonies.tip.townhall_how_to_get")));
getFTBCrate("cheesy_cache").addTooltip(format.gold(game.localize("mce.ftbquests.tip.crate.cheesey_cache")));
getFTBCrate("common_lootbox").addTooltip(format.gold(game.localize("mce.ftbquests.tip.crate.common_crate")));
getFTBCrate("unclaimed_black_market_container").addTooltip(format.gold(game.localize("mce.ftbquests.tip.crate.blackmarket_crate")));
<icbmclassic:emptower>.addTooltip(format.darkPurple(game.localize("mce.generic.tip.only_from_shop")));
<cyclicmagic:inventory_food>.addTooltip(format.red(game.localize("mce.cyclic.tip.inventory_cake_bad_at_saving")));
<cookingforblockheads:sink>.addTooltip(format.red(game.localize("mce.farmingforblockheads.tip.sink_no_infinite_water")));
<immersiveengineering:railgun>.addTooltip(format.lightPurple(game.localize("mce.generic.tip.damage_buffed_bigtime").replace("%s", "40x")));
<immersiveengineering:revolver>.addTooltip(format.lightPurple(game.localize("mce.immersiveengineering.tip.revoler_bullet_damage")));
<thaumicaugmentation:impulse_cannon>.addTooltip(format.lightPurple(game.localize("mce.generic.tip.damage_buffed_bigtime").replace("%s", "20x")));
<thaumicaugmentation:impulse_cannon_augment:*>.addTooltip(format.lightPurple(game.localize("mce.generic.tip.damage_buffed_bigtime").replace("%s", "20x")));
<agricraft:sprinkler>.addTooltip(format.red(game.localize("mce.agricraft.tip.sprinkler_turn_off_particles_probably")));
<extrautils2:chickenring:1>.addTooltip(format.red(game.localize("mce.extrautils2.tip.flying_squid_ring_random_tp_down")));
<lootgames:ms_activator>.addTooltip(format.red(game.localize("mce.lootgames.tip.minesweeper_dont_put_in_base_dummy")));
<erebus:materials:1>.addTooltip(format.gold(game.localize("mce.tconstruct.tip.material_megabuffed")));
<theaurorian:auroriansteel>.addTooltip(format.gold(game.localize("mce.tconstruct.tip.material_megabuffed")));
<extrautils2:teleporter:1>.addTooltip(format.red(game.localize("mce.extrautils2.tip.deep_dark_portal_dont_use_dummy")));
<thaumcraft:condenser_lattice_dirty>.addTooltip(format.aqua(game.localize("mce.thaumcraft.tip.unclog_lattice.lattice")));
<thaumcraft:filter>.addTooltip(format.aqua(game.localize("mce.thaumcraft.tip.unclog_lattice.filter")));
<nuclearcraft:fission_controller_new_fixed>.addTooltip(format.lightPurple(game.localize("mce.nuclearcraft.tip.fission_power_buff")));
<randomthings:spectreanchor>.addTooltip(format.red(game.localize("mce.randomthings.tip.spectreanchor_use_other_soulbound")));
addMultilineLocalizedTooltip(<appliedenergistics2:material:21>.withEmptyTag(), "mce.appliedenergistics2.tip.name_press.how_its_made");

<necromancersdelight:charm_bone_bag>.addTooltip(format.red("Temporarily Disabled, this item will be obtainable again in a (hopefully near) future version of MCE."));

var beneathores = [
	<mekanism:oreblock>,
	<nuclearcraft:ore:3>,
	<nuclearcraft:ore:4>,
	<nuclearcraft:ore:5>,
	<nuclearcraft:ore:6>,
	<nuclearcraft:ore:7>,
	<immersiveengineering:ore:5>,
	<thermalfoundation:ore:7>,
	<rftools:dimensional_shard_ore:*>
] as IItemStack[];

for ores in beneathores {
	ores.addTooltip(format.darkPurple(game.localize("mce.generic.tip.beneath_only")));
}

var mektooltipitems = [<mekanism:energycube>,<mekanism:basicblock2:3>,<mekanism:basicblock2:4>,<mekanism:transmitter:*>,<mekanism:gastank>,<mekanism:basicblock:6>,<mekanism:machineblock2:11>] as IItemStack[];
for items in mektooltipitems {
		items.addTooltip(format.red(game.localize("mce.mekanism.tip.ae2_nbt_sensitivity")));
		items.addTooltip(format.red(game.localize("mce.mekanism.tip.builders_wand_basic_revert")));
}
val mekfactorymetas = [5,6,7] as int[];
for metas in mekfactorymetas {
	itemUtils.getItem("mekanism:machineblock",metas).addTooltip(format.red(game.localize("mce.mekanism.tip.builders_wand_factory")));
}


val thaumcuriosities = { 
	1:"ALCHEMY", 
	0:"AUROMANCY", 
	4:"INFUSION", 
	5:"ARTIFICE", 
	2:"GOLEMANCY", 
	3:"ELDRITCH",
	6:"ELDRITCH"
} as string[int];

for metas in thaumcuriosities {
	itemUtils.getItem("thaumcraft:curio",metas).addTooltip(format.lightPurple(game.localize("mce.thaumcraft.tip.curiosities.more_likely_to_grant").replace("%s", game.localize("tc.research_category."+ thaumcuriosities[metas]))));
}
<thaumcraft:curio:3>.addTooltip(format.darkPurple(game.localize("mce.thaumcraft.tip.warp_on_use")));
<thaumcraft:curio:6>.addTooltip(format.darkPurple(game.localize("mce.thaumcraft.tip.warp_on_use")));

<thaumadditions:zeith_fur>.addTooltip(format.lightPurple(game.localize("mce.thaumcraft.tip.curiosities.more_likely_to_grant").replace("%s", game.localize("tc.research_category.THAUMADDITIONS"))));

var shopBuyable = [
	<appliedenergistics2:material:13>,
	<appliedenergistics2:material:14>,
	<appliedenergistics2:material:15>,
	<appliedenergistics2:material:19>,
	<ae2wtlib:infinity_booster_card>
] as IItemStack[];

for press in shopBuyable {
	press.addTooltip(format.aqua(game.localize("mce.generic.tip.can_buy_in_shop")));
}

var meteorRelatedItems = [
	<appliedenergistics2:sky_compass>,
	<appliedenergistics2:sky_stone_block>,
] as IItemStack[];

for item in meteorRelatedItems {
	item.addTooltip(format.red(game.localize("mce.appliedenergistics2.tip.meteors_in_beneath")));
}

var candleData = {
	0 : [<enchantment:minecraft:unbreaking>,<enchantment:elenaidodge2:lightweight>],
	1 : [<enchantment:minecraft:fire_protection>,<enchantment:minecraft:fire_aspect>,<enchantment:minecraft:flame>,<enchantment:cofhcore:smelting>,<enchantment:extrautils2:xu.burnerang>],
	2 : [<enchantment:minecraft:knockback>,<enchantment:minecraft:punch>,<enchantment:ebwizardry:magic_protection>],
	3 : [<enchantment:minecraft:feather_falling>,<enchantment:ebwizardry:frost_protection>],
	4 : [<enchantment:minecraft:looting>,<enchantment:minecraft:fortune>,<enchantment:minecraft:luck_of_the_sea>],
	5 : [<enchantment:minecraft:blast_protection>,<enchantment:cofhcore:insight>,<enchantment:endercore:xpboost>],
	6 : [<enchantment:minecraft:silk_touch>,<enchantment:cofhcore:holding>,<enchantment:cofhcore:vorpal>],
	7 : [<enchantment:minecraft:bane_of_arthropods>,<enchantment:cofhcore:smashing>,<enchantment:cyclicmagic:enchantment.magnet>],
	8 : [<enchantment:minecraft:protection>,<enchantment:charm:salvage>,<enchantment:minecraft:infinity>,<enchantment:fossil:paleontology>],
	9 : [<enchantment:minecraft:respiration>,<enchantment:theaurorian:lightning>,<enchantment:theaurorian:lightningresistance>],
	10: [<enchantment:minecraft:sweeping>,<enchantment:enderio:repellent>,<enchantment:tombstone:soulbound>,<enchantment:yoyos:collecting>],
	11: [<enchantment:minecraft:efficiency>,<enchantment:minecraft:sharpness>,<enchantment:minecraft:lure>,<enchantment:minecraft:power>,<enchantment:ebwizardry:shock_protection>,<enchantment:charm:homing>,<enchantment:extrautils2:xu.bladerang>],
	12: [<enchantment:minecraft:aqua_affinity>,<enchantment:minecraft:depth_strider>,<enchantment:extrautils2:xu.zoomerang>,<enchantment:fossil:archeology>],
	13: [<enchantment:minecraft:thorns>,<enchantment:cyclicmagic:enchantment.expboost>,<enchantment:mod_lavacow:poisonous>,<enchantment:extrautils2:xu.boomereaperang>],
	14: [<enchantment:cofhcore:leech>,<enchantment:vampirism:vampireslayer>,<enchantment:extrautils2:xu.kaboomerang>,<enchantment:openblocks:explosive>],
	15: [<enchantment:minecraft:smite>,<enchantment:enderio:witherweapon>,<enchantment:enderio:witherarrow>]
} as IEnchantmentDefinition[][int];

for meta in candleData {
	itemUtils.getItem("quark:candle", meta).addShiftTooltip(
		format.gold(game.localize("mce.quark.oddities.tip.matrix_enchanting_candle.boosts")),
		format.gold(game.localize("mce.quark.oddities.tip.matrix_enchanting_candle.hold_shift")));
	for enchant in candleData[meta] {
		itemUtils.getItem("quark:candle", meta).addShiftTooltip(format.aqua("- "~game.localize(enchant.name)));
	}
}

val nonFunctionalExtraCellsThings = [
	<extracells:storage.component:9>,
	<extracells:storage.component:10>,
	<extracells:storage.fluid:5>,
	<extracells:storage.fluid:6>
] as IItemStack[];

for thing in nonFunctionalExtraCellsThings {
	recipes.remove(thing);
	thing.addTooltip(format.red(game.localize("mce.extracells2.tip.fluid_storage_literally_broken")));
}

val NBeeT = {
	{MaxH: 50, Mate: {Chromosomes: [{UID1: "careerbees.energy", UID0: "careerbees.energy", Slot: 0 as byte}, {UID1: "forestry.speedSlow", UID0: "forestry.speedSlow", Slot: 1 as byte}, {UID1: "forestry.lifespanLong", UID0: "forestry.lifespanLong", Slot: 2 as byte}, {UID1: "forestry.fertilityNormal", UID0: "forestry.fertilityNormal", Slot: 3 as byte}, {UID1: "forestry.toleranceNone", UID0: "forestry.toleranceNone", Slot: 4 as byte}, {UID1: "forestry.boolFalse", UID0: "forestry.boolFalse", Slot: 5 as byte}, {UID1: "forestry.toleranceNone", UID0: "forestry.toleranceNone", Slot: 6 as byte}, {UID1: "forestry.boolFalse", UID0: "forestry.boolFalse", Slot: 7 as byte}, {UID1: "forestry.boolFalse", UID0: "forestry.boolFalse", Slot: 8 as byte}, {UID1: "forestry.flowersVanilla", UID0: "forestry.flowersVanilla", Slot: 9 as byte}, {UID1: "forestry.floweringSlow", UID0: "forestry.floweringSlow", Slot: 10 as byte}, {UID1: "forestry.territoryAverage", UID0: "forestry.territoryAverage", Slot: 11 as byte}, {UID1: "careerbees.effect.rf", UID0: "careerbees.effect.rf", Slot: 12 as byte}]}, Health: 50, IsAnalyzed: 0 as byte, Genome: {Chromosomes: [{UID1: "careerbees.energy", UID0: "careerbees.energy", Slot: 0 as byte}, {UID1: "forestry.speedSlow", UID0: "forestry.speedSlow", Slot: 1 as byte}, {UID1: "forestry.lifespanLong", UID0: "forestry.lifespanLong", Slot: 2 as byte}, {UID1: "forestry.fertilityNormal", UID0: "forestry.fertilityNormal", Slot: 3 as byte}, {UID1: "forestry.toleranceNone", UID0: "forestry.toleranceNone", Slot: 4 as byte}, {UID1: "forestry.boolFalse", UID0: "forestry.boolFalse", Slot: 5 as byte}, {UID1: "forestry.toleranceNone", UID0: "forestry.toleranceNone", Slot: 6 as byte}, {UID1: "forestry.boolFalse", UID0: "forestry.boolFalse", Slot: 7 as byte}, {UID1: "forestry.boolFalse", UID0: "forestry.boolFalse", Slot: 8 as byte}, {UID1: "forestry.flowersVanilla", UID0: "forestry.flowersVanilla", Slot: 9 as byte}, {UID1: "forestry.floweringSlow", UID0: "forestry.floweringSlow", Slot: 10 as byte}, {UID1: "forestry.territoryAverage", UID0: "forestry.territoryAverage", Slot: 11 as byte}, {UID1: "careerbees.effect.rf", UID0: "careerbees.effect.rf", Slot: 12 as byte}]}} :
		"mce.forestry.bees.tip.energy_bee",
	{MaxH: 60, Mate: {Chromosomes: [{UID1: "magicbees.speciesOsmium", UID0: "magicbees.speciesOsmium", Slot: 0 as byte}, {UID1: "forestry.speedSlowest", UID0: "forestry.speedSlowest", Slot: 1 as byte}, {UID1: "forestry.lifespanLonger", UID0: "forestry.lifespanLonger", Slot: 2 as byte}, {UID1: "forestry.fertilityLow", UID0: "forestry.fertilityLow", Slot: 3 as byte}, {UID1: "forestry.toleranceNone", UID0: "forestry.toleranceNone", Slot: 4 as byte}, {UID1: "forestry.boolTrue", UID0: "forestry.boolTrue", Slot: 5 as byte}, {UID1: "forestry.toleranceNone", UID0: "forestry.toleranceNone", Slot: 6 as byte}, {UID1: "forestry.boolFalse", UID0: "forestry.boolFalse", Slot: 7 as byte}, {UID1: "forestry.boolTrue", UID0: "forestry.boolTrue", Slot: 8 as byte}, {UID1: "forestry.flowersVanilla", UID0: "forestry.flowersVanilla", Slot: 9 as byte}, {UID1: "forestry.floweringSlowest", UID0: "forestry.floweringSlowest", Slot: 10 as byte}, {UID1: "forestry.territoryAverage", UID0: "forestry.territoryAverage", Slot: 11 as byte}, {UID1: "forestry.effectNone", UID0: "forestry.effectNone", Slot: 12 as byte}]}, Health: 60, IsAnalyzed: 0 as byte, Genome: {Chromosomes: [{UID1: "magicbees.speciesOsmium", UID0: "magicbees.speciesOsmium", Slot: 0 as byte}, {UID1: "forestry.speedSlowest", UID0: "forestry.speedSlowest", Slot: 1 as byte}, {UID1: "forestry.lifespanLonger", UID0: "forestry.lifespanLonger", Slot: 2 as byte}, {UID1: "forestry.fertilityLow", UID0: "forestry.fertilityLow", Slot: 3 as byte}, {UID1: "forestry.toleranceNone", UID0: "forestry.toleranceNone", Slot: 4 as byte}, {UID1: "forestry.boolTrue", UID0: "forestry.boolTrue", Slot: 5 as byte}, {UID1: "forestry.toleranceNone", UID0: "forestry.toleranceNone", Slot: 6 as byte}, {UID1: "forestry.boolFalse", UID0: "forestry.boolFalse", Slot: 7 as byte}, {UID1: "forestry.boolTrue", UID0: "forestry.boolTrue", Slot: 8 as byte}, {UID1: "forestry.flowersVanilla", UID0: "forestry.flowersVanilla", Slot: 9 as byte}, {UID1: "forestry.floweringSlowest", UID0: "forestry.floweringSlowest", Slot: 10 as byte}, {UID1: "forestry.territoryAverage", UID0: "forestry.territoryAverage", Slot: 11 as byte}, {UID1: "forestry.effectNone", UID0: "forestry.effectNone", Slot: 12 as byte}]}} :
		"mce.forestry.bees.tip.osmium_bee"
} as string[IData];

val beeTypes = [
	<forestry:bee_queen_ge>,
	<forestry:bee_princess_ge>,
	<forestry:bee_drone_ge>
] as IItemStack[];

for geneSet in NBeeT {
	for bee in beeTypes {
		bee.withTag(geneSet).addTooltip(format.aqua(game.localize("mce.forestry.bees.tip.unbreedable_get_elsehow")));
		var beeTipIndex = 1;
		var beeInfo = NBeeT[geneSet] +"."+ beeTipIndex;
		while (game.localize(beeInfo) != beeInfo) {
			bee.withTag(geneSet).addTooltip(format.aqua(game.localize(beeInfo)));
			beeTipIndex += 1;
			beeInfo = NBeeT[geneSet] +"."+ beeTipIndex;
		}
	}
}

for num in 0 to 5 {
	itemUtils.getItem("vampirism:pure_blood", num).addTooltip(format.aqua(game.localize("mce.vampirism.tip.pure_blood_obtain").replace("%s", (num+1) as string)));
}

for resItem,amount in {<xreliquary:angelheart_vial> : 5, <xreliquary:phoenix_down>: 25} as string[IItemStack] {
	resItem.addTooltip(format.lightPurple(game.localize("mce.xreliquary.tip.restores_percent_health").replace("%s", amount as string)));
}

//TAIGA Ores
val taigaOreTip = game.localize("mce.taiga.tip.where_to_find_ores").split("<BR>");
for item in loadedMods["taiga"].items {
	if(item.definition.id has "ore") item.addShiftTooltip(format.gold(taigaOreTip[1]), format.gold(taigaOreTip[0]));
}

print("--- Tooltip.zs initialized ---");	

