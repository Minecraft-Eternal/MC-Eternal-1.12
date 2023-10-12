import mods.tconstruct.Alloy;
import mods.tconstruct.Melting;
import mods.tconstruct.Fuel;
import mods.tconstruct.Casting;
import crafttweaker.data.IData;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.IItemStack;
#MC Eternal Scripts

print("--- loading TinkersConstruct.zs ---");

#Remove Steel from being maked in the tinkers smeltery
Alloy.removeRecipe(<liquid:steel>);

#Remove Fluxed Electrum Alloying/Part Smelting
Alloy.removeRecipe(<liquid:electrumflux>);
Melting.removeRecipe(<liquid:electrumflux>);

#Add alternate Mirion alloying
Alloy.addRecipe(<liquid:mirion>*72, [<liquid:manasteel>*18, <liquid:elvenelementium>*18, <liquid:terrasteel>*18, <liquid:cobalt>*18, <liquid:glass>*125]);

#Nihilite
// commit space :pointingrat:
recipes.addShapeless("nihilite_mce", <taiga:nihilite_block>, [<taiga:solarium_block>, <taiga:vibranium_block>, <erebus:materials:64>]);
Alloy.removeRecipe(<liquid:nihilite_fluid>);

// patch funni iron>gold exploit
Melting.removeRecipe(<liquid:gold>, <minecraft:name_tag>);

// addSmelteryFuel(liquid as ILiquidStack, duration as int, temp as int);
// use -1 for the temp to not change the temp
function addSmelteryFuel (fluid as ILiquidStack, duration as int, temp as int) {
	Fuel.registerFuel(fluid, duration);
	if(temp != -1){
		fluid.definition.temperature = temp;
	}
	val buckets = [
		<forge:bucketfilled>,
		<thebetweenlands:bl_bucket:*>,
		<erebus:bambucket>,
		<theaurorian:ceruleanbucket>
	] as IItemStack[];

	for bucketItem in buckets {
		var bucket = bucketItem.withTag({FluidName: fluid.name, Amount: 1000});
		bucket.addShiftTooltip(
			format.gold(game.localize("mce.tconstruct.tip.smeltery_fuel_stats.1")
				.replace("%s", fluid.amount as string)),
			format.aqua(game.localize("mce.tconstruct.tip.custom_smeltery_fuel")));
		bucket.addShiftTooltip(
			format.gold(game.localize("mce.tconstruct.tip.smeltery_fuel_stats.2")
				.replace("%s", (duration / 20) as string)),
			format.aqua(game.localize("mce.generic.tip.hold_shift_for_info")));
		bucket.addShiftTooltip(
			format.gold(game.localize("mce.tconstruct.tip.smeltery_fuel_stats.3")
				.replace("%s", (fluid.temperature - (fluid.temperature > 1000 ? 300 : 0)) as string)));
	}
}

addSmelteryFuel(<liquid:formic_acid>*75, 3000, 10000);
addSmelteryFuel(<liquid:miasma>*25, 500, 2000);
addSmelteryFuel(<liquid:liquid_death>*10, 2400, 2744);
addSmelteryFuel(<liquid:endacid>*20, 300, 3001);

// Starmetal Fix v2
// aka: the version using a central concept i figured out while making a Gregtech script inspired by FTB Interactions
val allparts = {
	1:["tconstruct:binding","tconstruct:tool_rod","tconstruct:hand_guard","tconstruct:knife_blade","tconstruct:wide_guard","tconstruct:cross_guard","conarm:armor_trim"],
	2:["tconstruct:arrow_head","tconstruct:sharpening_kit","tconstruct:axe_head","tconstruct:shovel_head","tconstruct:kama_head","tconstruct:sword_blade"],
	3:["tconstruct:pick_head","tconstruct:bow_limb","tconstruct:sign_head","tconstruct:tough_tool_rod","tconstruct:tough_binding","conarm:armor_plate"],
	4:["tconstruct:pan_head","conarm:helmet_core","conarm:boots_core"],
	5:["conarm:leggings_core"],
	6:["conarm:chest_core"],
	8:["tconstruct:scythe_head","tconstruct:large_sword_blade","tconstruct:large_plate","tconstruct:hammer_head","tconstruct:excavator_head","tconstruct:broad_axe_head"]
} as string[][int];

for value in allparts {
	for part in allparts[value] {
		Casting.addTableRecipe(itemUtils.getItem(part).withTag({Material: "starmetal"}),<tconstruct:cast>.withTag({PartType: part as IData}), <liquid:astral_starmetal>, 144*value, false, 85*value);
		Casting.addTableRecipe(itemUtils.getItem(part).withTag({Material: "starmetal"}),<tconstruct:clay_cast>.withTag({PartType: part as IData}), <liquid:astral_starmetal>, 144*value, false, 85*value);
	}
}

val materialsThatDontExist = [
	"electrumflux",
	"redmatter",
	"ebonypsi",
	"ivorypsi",
	"psigem",
	"psi",
	"quartzenrichediron",
	"yellorium"
] as string[];

for material in materialsThatDontExist {
	mods.jei.JEI.hide(<tconstruct:shard>.withTag({Material: material as IData}));
	for value in allparts {
		for part in allparts[value] {
			mods.jei.JEI.hide(itemUtils.getItem(part).withTag({Material: material as IData}));
		}
	}
}

print("--- TinkersConstruct.zs initialized ---");	
