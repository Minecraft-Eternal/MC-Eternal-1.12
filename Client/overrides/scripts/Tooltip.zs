import crafttweaker.item.IItemStack;
import crafttweaker.enchantments.IEnchantmentDefinition;
#MC Eternal Scripts

print("--- loading Tooltip.zs ---");

#Add tooltip
<extrautils2:bagofholding>.addTooltip(format.red("WARNING! Deletes items when switching gamemodes"));
<rats:arcane_technology>.addTooltip(format.gold("Drops from the Ratlantean Automaton"));
<ftbquests:book>.addTooltip(format.gold("A new beginning, Open me!"));
<minecraft:nether_star>.addTooltip(format.gold("Earth below us, Drifting falling"));
<ebwizardry:crystal_block:*>.addTooltip(format.gold("Can be used to ward off Nether Portal Corruption"));
<wings:fairy_dust>.addTooltip(format.gold("Can be used to transmute certain metals. This dust radiates primal magic energy"));
<ftbquests:lootcrate>.withTag({type: "cultist"}).addTooltip(format.darkRed("Step one... Dress to impress!"));
<ftbquests:lootcrate>.withTag({type: "extraterrestrial_cache"}).addTooltip(format.gold("Keep your eyes on the stars, and your feet on the ground. -Theodore Roosevelt"));
<mysticalagriculture:diamond_seeds>.addTooltip(format.darkPurple("Do all Mystical Agriculture quests to unlock"));
<mysticalagriculture:gold_seeds>.addTooltip(format.darkPurple("Do all Farming and Agriculture quests to unlock"));
<minecolonies:blockhuttownhall>.addTooltip(format.darkPurple("Use a supplyship or supplycamp to obtain"));
<ftbquests:lootcrate>.withTag({type: "cheesy_cache"}).addTooltip(format.gold("Hmm I wonder what it tastes like?... Did I really just think that? Yes you did"));
<ftbquests:lootcrate>.withTag({type: "common_lootbox"}).addTooltip(format.gold("Random loot reward for completing a quest"));
<ftbquests:lootcrate>.withTag({type: "unclaimed_black_market_container"}).addTooltip(format.gold("An item sold at a previous auction that was never picked up by the winning bidder. Buyer beware."));
<icbmclassic:emptower>.addTooltip(format.darkPurple("Only obtainable from the Shop"));
<cyclicmagic:inventory_food>.addTooltip(format.red("WARNING! Can delete items inside when the game crashes or closes unexpectedly"));
<cookingforblockheads:sink>.addTooltip(format.red("Does not produce Infinite Water"));
<immersiveengineering:railgun>.addTooltip(format.lightPurple("Damage amplified to 40x"));
<immersiveengineering:revolver>.addTooltip(format.lightPurple("Bullet Damage values amplified to ~15x"));
<thaumicaugmentation:impulse_cannon>.addTooltip(format.lightPurple("Damage Amplified to 20x"));
<agricraft:sprinkler>.addTooltip(format.red("WARNING: Will cause serious FPS lag if Particles are not disabled in Agricraft's Config"));
<extrautils2:chickenring:1>.addTooltip(format.red("Do not wear as a bauble, may teleport you down randomly while flying"));
<appliedenergistics2:sky_stone_block>.addTooltip(format.red("Only Spawns in The Beneath and on The Moon"));
<thaumicaugmentation:impulse_cannon_augment>.addTooltip(format.lightPurple("Damage Amplified to 20x"));
<appliedenergistics2:sky_compass>.addTooltip(format.red("Only Spawns in The Beneath and on The Moon"));
<lootgames:ms_activator>.addTooltip(format.red("WARNING: DO NOT PLACE IN YOUR BASE"));
<erebus:materials:1>.addTooltip(format.gold("The Tinkers' Construct material for this item has been buffed massively."));
<theaurorian:auroriansteel>.addTooltip(format.gold("The Tinkers' Construct material for this item has been buffed massively."));
<extrautils2:teleporter:1>.addTooltip(format.red("Disabled and will cause a Crash if you try to use it! use the Beneath and Beneath Teleporter instead."));
<thaumcraft:condenser_lattice_dirty>.addTooltip(format.aqua("Right-click with an Essentia Filter to unclog!"));
<thaumcraft:filter>.addTooltip(format.aqua("Right-click a Clogged Flux Condenser Lattice to unclog it!"));
<nuclearcraft:fission_controller_new_fixed>.addTooltip(format.lightPurple("4x Total Power Generation! (Disclaimer: reflected in Fuel tooltips)"));
<randomthings:spectreanchor>.addTooltip(format.red("Use Tombstone Soulbound instead"));

<necromancersdelight:charm_bone_bag>.addTooltip(format.red("Temporarily Disabled, this item will be obtainable again in a (hopefully near) future version of MCE."));

var supremarmor = [<mysticalagriculture:supremium_helmet>,<mysticalagriculture:supremium_chestplate>,<mysticalagriculture:supremium_leggings>,<mysticalagriculture:supremium_boots>] as IItemStack[];
for armor in supremarmor {
  armor.addTooltip(format.red("Flight Disabled"));
}

var beneathores = [<mekanism:oreblock>,<nuclearcraft:ore:3>,<nuclearcraft:ore:5>,<nuclearcraft:ore:6>,<nuclearcraft:ore:7>,<immersiveengineering:ore:5>] as IItemStack[];
for ores in beneathores {
	ores.addTooltip(format.darkPurple("Only found in the Beneath"));
}

var mektooltiptext = ["If used in an AE2 Autocrafting Pattern, manually add this item into the crafting pattern, else it will not work.","Do not place with a Builder's Wand, will revert to Basic version."] as string[];
var mektooltipitems = [<mekanism:energycube>,<mekanism:basicblock2:3>,<mekanism:basicblock2:4>,<mekanism:transmitter:*>,<mekanism:gastank>,<mekanism:basicblock:6>,<mekanism:machineblock2:11>] as IItemStack[];
for items in mektooltipitems {
	for text in mektooltiptext {
		items.addTooltip(format.red(text));
	}
}
val mekfactorymetas = [5,6,7] as int[];
for metas in mekfactorymetas {
	itemUtils.getItem("mekanism:machineblock",metas).addTooltip(format.red("Do not place with a Builder's Wand, will transform into a Smelting Factory"));
}


val thaumcuriosities = { 
	1:"Alchemy", 
	0:"Auromancy", 
	4:"Infusion", 
	5:"Artifice", 
	2:"Golemancy", 
	3:"Eldritch"
} as string[int];

for metas in thaumcuriosities {
	itemUtils.getItem("thaumcraft:curio",metas).addTooltip(format.lightPurple("More likely to give "~thaumcuriosities[metas]~" Research"));
}
<thaumcraft:curio:3>.addTooltip(format.darkPurple("Will grant some Warp on use!"));

var aePresses = [
	<appliedenergistics2:material:13>,
	<appliedenergistics2:material:14>,
	<appliedenergistics2:material:15>,
	<appliedenergistics2:material:19>
] as IItemStack[];

for press in aePresses {
	press.addTooltip(format.aqua("Can be purchased in the Shop!"));
}

var meteorRelatedItems = [
	<appliedenergistics2:sky_compass>,
	<appliedenergistics2:sky_stone_block>,
] as IItemStack[];

for item in meteorRelatedItems {
	item.addTooltip(format.red("AE2 Meteors Spawn in The Beneath and on The Moon"));
}

var candleData = {
	0 : [<enchantment:minecraft:unbreaking>,<enchantment:elenaidodge2:lightweight>],
	1 : [<enchantment:minecraft:fire_protection>,<enchantment:minecraft:fire_aspect>,<enchantment:minecraft:flame>,<enchantment:cofhcore:smelting>,<enchantment:extrautils2:xu.burnerang>],
	2 : [<enchantment:minecraft:knockback>,<enchantment:minecraft:punch>,<enchantment:ebwizardry:magic_protection>],
	3 : [<enchantment:minecraft:feather_falling>,<enchantment:ebwizardry:frost_protection>,<enchantment:cyclicmagic:enchantment.launch>],
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
	itemUtils.getItem("quark:candle", meta).addShiftTooltip(format.gold("Boosts rates of in Matrix Enchanting:"), format.gold("Hold SHIFT to see affected Enchantments"));
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
	thing.addTooltip(format.red("Disabled, doesn't work for technical reasons."));
}

val NBeeT = {MaxH: 50, Mate: {Chromosomes: [{UID1: "careerbees.energy", UID0: "careerbees.energy", Slot: 0 as byte}, {UID1: "forestry.speedSlow", UID0: "forestry.speedSlow", Slot: 1 as byte}, {UID1: "forestry.lifespanLong", UID0: "forestry.lifespanLong", Slot: 2 as byte}, {UID1: "forestry.fertilityNormal", UID0: "forestry.fertilityNormal", Slot: 3 as byte}, {UID1: "forestry.toleranceNone", UID0: "forestry.toleranceNone", Slot: 4 as byte}, {UID1: "forestry.boolFalse", UID0: "forestry.boolFalse", Slot: 5 as byte}, {UID1: "forestry.toleranceNone", UID0: "forestry.toleranceNone", Slot: 6 as byte}, {UID1: "forestry.boolFalse", UID0: "forestry.boolFalse", Slot: 7 as byte}, {UID1: "forestry.boolFalse", UID0: "forestry.boolFalse", Slot: 8 as byte}, {UID1: "forestry.flowersVanilla", UID0: "forestry.flowersVanilla", Slot: 9 as byte}, {UID1: "forestry.floweringSlow", UID0: "forestry.floweringSlow", Slot: 10 as byte}, {UID1: "forestry.territoryAverage", UID0: "forestry.territoryAverage", Slot: 11 as byte}, {UID1: "careerbees.effect.rf", UID0: "careerbees.effect.rf", Slot: 12 as byte}]}, Health: 50, IsAnalyzed: 0 as byte, Genome: {Chromosomes: [{UID1: "careerbees.energy", UID0: "careerbees.energy", Slot: 0 as byte}, {UID1: "forestry.speedSlow", UID0: "forestry.speedSlow", Slot: 1 as byte}, {UID1: "forestry.lifespanLong", UID0: "forestry.lifespanLong", Slot: 2 as byte}, {UID1: "forestry.fertilityNormal", UID0: "forestry.fertilityNormal", Slot: 3 as byte}, {UID1: "forestry.toleranceNone", UID0: "forestry.toleranceNone", Slot: 4 as byte}, {UID1: "forestry.boolFalse", UID0: "forestry.boolFalse", Slot: 5 as byte}, {UID1: "forestry.toleranceNone", UID0: "forestry.toleranceNone", Slot: 6 as byte}, {UID1: "forestry.boolFalse", UID0: "forestry.boolFalse", Slot: 7 as byte}, {UID1: "forestry.boolFalse", UID0: "forestry.boolFalse", Slot: 8 as byte}, {UID1: "forestry.flowersVanilla", UID0: "forestry.flowersVanilla", Slot: 9 as byte}, {UID1: "forestry.floweringSlow", UID0: "forestry.floweringSlow", Slot: 10 as byte}, {UID1: "forestry.territoryAverage", UID0: "forestry.territoryAverage", Slot: 11 as byte}, {UID1: "careerbees.effect.rf", UID0: "careerbees.effect.rf", Slot: 12 as byte}]}} as IData;
val beeTypes = [
	<forestry:bee_queen_ge>,
	<forestry:bee_princess_ge>,
	<forestry:bee_drone_ge>
] as IItemStack[];
for bee in beeTypes {
	bee.withTag(NBeeT).addTooltip(format.aqua("Cannot be bred directly, craft a Gene Sample of this species to acquire it"));
	bee.withTag(NBeeT).addTooltip(format.aqua("See the uses for 'Avatar of Ratlantis' to find the recipe"));
}

print("--- Tooltip.zs initialized ---");	

