import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.data.IData;
import thaumcraft.aspect.CTAspectStack;
import mod.mekanism.gas.IGasStack;
import mods.mekanism.MekanismHelper;

#MC Eternal Scripts

print("--- Loading Thaumcraft.zs ---");

// TODO: remove non-native vis seed recipes (if i can decipher what the heck their ids are)


// Native Clusters in many more modded Ore Processing options

// Material Names with Clusters, and related Fluid, for certain handlers.
val clusterOreNames = {
	"Aluminium" : <fluid:aluminum>,
	"AncientDebris" : <fluid:ancient_debris>,
	"Ardite" : <fluid:ardite>,
	"AstralStarmetal" : <fluid:astral_starmetal>,
	"Boron" : <fluid:boron>,
	"Cobalt" : <fluid:cobalt>,
	"Dilithium" : <fluid:dilithium>,
	"Iridium" : <fluid:iridium>,
	"Lithium" : <fluid:lithium>,
	"Magnesium" : <fluid:magnesium>,
	"Mithril" : <fluid:mithril>,
	"Nickel" : <fluid:nickel>,
	"Octine" : <fluid:octine>,
	"Osmium" : <fluid:osmium>,
	"Platinum" : <fluid:platinum>,
	"Syrmorite" : <fluid:syrmorite>,
	"Thorium" : <fluid:thorium>,
	"Titanium" : <fluid:titanium>,
	"Tungsten" : <fluid:tungsten>,
	"Uranium" : <fluid:uranium>,
	"Iron" : <fluid:iron>,
	"Gold" : <fluid:gold>,
	"Copper" : <fluid:copper>,
	"Tin" : <fluid:tin>,
	"Silver" : <fluid:silver>,
	"Lead" : <fluid:lead>
} as ILiquidStack[string];

//Catalysts and their info for Induction Smelting
val inductionCatalysts = {
	<ore:sand> : "3,itemSlagRich/5",
	<ore:itemSlagRich> : "4,itemSlag/75",
	<ore:crystalCinnabar> : "4,itemSlagRich/75"
} as string[IOreDictEntry];

//Industrial Grinder catalyst fluid and their production ratios
val indGrinderFluids = {
	<liquid:water> : 3,
	<liquid:fluidsodiumpersulfate> : 4,
	<liquid:fluidmercury> : 4,
} as string[ILiquidStack];

//Slurries which are part of base Mekanism, and do not start with "slurry" in their ID
val baseMekSlurries = {
	"Iron" : <gas:iron>,
	"Gold" : <gas:gold>,
	"Osmium" : <gas:osmium>,
	"Copper" : <gas:copper>,
	"Tin" : <gas:tin>,
	"Silver" : <gas:silver>,
	"Lead" : <gas:lead>
} as IGasStack[string];

//Doing things!
for dictName,fluid in clusterOreNames {
	
	//Variables for convenience of retriving a certain related oredict entry
	var cluster = "cluster"+dictName;
	var ingot = "ingot"+dictName;
	var dust = "dust"+dictName;
	var ore = "ore"+dictName;
	
	// Thermal Induction Smelter
	// Pyro-Concentrator methods do not exist :(
	for catalyst in inductionCatalysts {
		var processAmount = inductionCatalysts[catalyst].split(",")[0] as int;
		var secondaryData = inductionCatalysts[catalyst].split(",")[1].split("/");
		mods.thermalexpansion.InductionSmelter.addRecipe(oreDict.get(ingot).firstItem * processAmount, oreDict.get(cluster).firstItem, catalyst.firstItem, 4000, oreDict.get(secondaryData[0]).firstItem, secondaryData[1] as int);
	}
	
	// Thermal Magma Crucible
	mods.thermalexpansion.Crucible.addRecipe(fluid * 432, oreDict.get(cluster).firstItem, 8000);
	
	// TechReborn Industrial Grinder
	// Byproducts is way too much work, sorry :C
	for processFluid,quant in indGrinderFluids {
		mods.techreborn.industrialGrinder.addRecipe(oreDict.get(dust).firstItem * quant, null, null, null, oreDict.get(cluster), null, processFluid * 1000, 100, 128);
	}
	
	// IE Crusher
	mods.immersiveengineering.Crusher.addRecipe(oreDict.get(dust).firstItem * 3, oreDict.get(cluster), 2048);
	
	// IE Arc Furnace
	mods.immersiveengineering.ArcFurnace.addRecipe(oreDict.get(ingot).firstItem * 3, oreDict.get(cluster), <immersiveengineering:material:7>, 200, 512, [], "Ores");
	
	// Blood Magic Alchemy Table
	mods.bloodmagic.AlchemyTable.addRecipe(oreDict.get(dust).firstItem * 3, [oreDict.get(cluster), <bloodmagic:cutting_fluid>], 400, 200, 1);
	
	// Actually Additions Crusher
	mods.actuallyadditions.Crusher.addRecipe(oreDict.get(dust).firstItem * 3, oreDict.get(cluster));
	
	// Astral Sorcery Starlight Infusion
	mods.astralsorcery.StarlightInfusion.addInfusion(oreDict.get(cluster).firstItem, oreDict.get(ingot).firstItem * 4, false, 0.05, 200);
	
	// TConstruct Smeltery
	mods.tconstruct.Melting.addRecipe(fluid * 432, oreDict.get(cluster));
	
	// Industrial Foregoing Washing Factory (Meat)
	mods.industrialforegoing.WashingFactory.add(cluster, <fluid:meat> * 200, <fluid:if.ore_fluid_raw>.withTag({Ore: ore as IData}) * 200);
	
	// Extra Utils 2 Crusher
	mods.extrautils2.Crusher.add(oreDict.get(dust).firstItem * 3, oreDict.get(cluster).firstItem);
	
	// Nuclearcraft Manufactory
	mods.nuclearcraft.manufactory.addRecipe([oreDict.get(cluster), oreDict.get(dust) * 3]);
	
	// Nuclearcraft Melter
	mods.nuclearcraft.melter.addRecipe([oreDict.get(cluster), fluid * 504]);
	
	// Mekanism Processing
	mods.mekanism.enrichment.addRecipe(oreDict.get(cluster), oreDict.get(dust).firstItem * 3);
	mods.mekanism.purification.addRecipe(oreDict.get(cluster), <gas:oxygen>, oreDict.get("clump"+dictName).firstItem * 4);
	mods.mekanism.chemical.injection.addRecipe(oreDict.get(cluster), <gas:hydrogenchloride>, oreDict.get("shard"+dictName).firstItem * 5);
	if(baseMekSlurries has dictName){
		print(baseMekSlurries[dictName].NAME);
		mods.mekanism.chemical.dissolution.addRecipe(oreDict.get(cluster), baseMekSlurries[dictName] * 1400);
	} else {
		print("slurry"+dictName);
		mods.mekanism.chemical.dissolution.addRecipe(oreDict.get(cluster), MekanismHelper.getGas("slurry"+dictName) * 1400);
	}
	
}

print("--- Thaumcraft.zs initialized ---");
