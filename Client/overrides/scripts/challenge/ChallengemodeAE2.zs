#packmode challenge

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;

import mods.appliedenergistics2.Inscriber;

import mods.immersiveengineering.Blueprint;

#MC Eternal scripts

print("--- loading challenge/ChallengemodeAE2.zs ---");

//Challenge mode invoke of this function
scripts.AE2.redoInscriber({
		"Eng" : <ore:gemMoon>,
		"Calc" : <ore:crystalPureCertusQuartz>,
		"Logic" : <ore:ingotLumium>,
		"Sil" : <ore:itemSilicon>
  } as IIngredient[string], 
  {
    <ore:dustTriberium>: 1
  },
  <ore:blockIron>
);


//Quartz Fiber
recipes.remove(AEMaterials["quartzFiber"]);
mods.immersiveengineering.MetalPress.addRecipe(AEMaterials["quartzFiber"] *2, <ore:crystalPureNetherQuartz>, <immersiveengineering:mold:4>, 4800);
mods.techreborn.wireMill.addRecipe(AEMaterials["quartzFiber"] *2, <ore:crystalPureNetherQuartz>, 200, 16);

//Fluix Cable
recipes.removeByRecipeName("appliedenergistics2:network/cables/glass_fluix");
recipes.addShapeless("mce_challengemode_fluix_cable", AEMaterials["glassCable"] *2, [AEMaterials["quartzFiber"], <immersivecables:wire_coil>, <immersivecables:wire_coil>]);

//Dense Covered Cable
recipes.removeByRecipeName("appliedenergistics2:network/cables/dense_covered_fluix");
recipes.addShapeless("mce_challengemode_dense_cable", AEMaterials["denseCable"], [AEMaterials["quartzFiber"], <appliedenergistics2:part:140>, <immersivecables:wire_coil:1>, <immersivecables:wire_coil:1>, <ore:wool>]);

//Vibrant Quartz Glass
recipes.remove(AEMaterials["vibrantQuartzGlass"]);

addUniversalAlloyRecipe(AEMaterials["vibrantQuartzGlass"], [AEMaterials["quartzGlass"], <ore:dustLumium>], "", false, {
    "IEArc": {
        "time": alloyingBaseStats.IEArcTime,
        "energy": alloyingBaseStats.IEArcEnergy *2
    },
    "thermalInduction": {
		"energy": alloyingBaseStats.thermalInductionEnergy *3
	},
    "NCFurnace": {
        "time": alloyingBaseStats.NCFurnaceTime,
        "energy": alloyingBaseStats.NCFurnaceEnergy *2
    },
    "TRSmelter": {
        "time": alloyingBaseStats.TRSmelterTime *2,
        "energy": alloyingBaseStats.TRSmelterEnergy
    },
    "IEKiln": {
        "enabled": 0
    }
});
addUniversalAlloyRecipe(AEMaterials["vibrantQuartzGlass"], [AEMaterials["quartzGlass"], <astralsorcery:itemusabledust:0> *2], "", false, {
    "IEArc": {
        "time": alloyingBaseStats.IESmelterTime,
        "energy": alloyingBaseStats.IEArcEnergy *2
    },
    "thermalInduction": {
		"energy": alloyingBaseStats.thermalInductionEnergy *2
	},
    "NCFurnace": {
        "time": alloyingBaseStats.NCFurnaceTime,
        "energy": alloyingBaseStats.NCFurnaceEnergy *2
    },
    "TRSmelter": {
        "time": alloyingBaseStats.TRSmelterTime *2,
        "energy": alloyingBaseStats.TRSmelterEnergy
    },
    "IEKiln": {
        "enabled": 0
    }
});


//Storage Components
recipes.remove(AEMaterials["1kComponent"]);
recipes.addShaped("mce_challengemode_1k_storage_component", AEMaterials["1kComponent"], [
    [<ore:dustEnergetic>, <ore:gemChargedCertusQuartz>, <ore:dustEnergetic>],
    [<ore:crystalPureCertusQuartz>, AEMaterials.logicCircuit, <ore:crystalPureCertusQuartz>],
    [<ore:dustEnergetic>, <ore:gemChargedCertusQuartz>, <ore:dustEnergetic>]
]);

recipes.remove(AEMaterials["4kComponent"]);
recipes.addShaped("mce_challengemode_4k_storage_component", AEMaterials["4kComponent"], [
    [<ore:dustTiberium>, AEMaterials.calcCircuit, <ore:dustTiberium>],
    [AEMaterials["1kComponent"], AEMaterials.quartzGlass, AEMaterials["1kComponent"]],
    [<ore:dustTiberium>, AEMaterials["1kComponent"], <ore:dustTiberium>]
]);

recipes.remove(AEMaterials["16kComponent"]);
recipes.addShaped("mce_challengemode_16k_storage_component", AEMaterials["16kComponent"], [
    [<ore:dustTriberium>, AEMaterials.calcCircuit, <ore:dustTriberium>],
    [AEMaterials["4kComponent"], AEMaterials.vibrantQuartzGlass, AEMaterials["4kComponent"]],
    [<ore:dustTriberium>, AEMaterials["4kComponent"], <ore:dustTriberium>]
]);

recipes.remove(AEMaterials["64kComponent"]);
recipes.addShaped("mce_challengemode_64k_storage_component", AEMaterials["64kComponent"], [
    [<ore:dustTriberium>, AEMaterials.engCircuit, <ore:dustTriberium>],
    [AEMaterials["16kComponent"], AEMaterials.vibrantQuartzGlass, AEMaterials["16kComponent"]],
    [<ore:dustTriberium>, AEMaterials["16kComponent"], <ore:dustTriberium>]
]);


//Inscriber
recipes.remove(<appliedenergistics2:inscriber>);
recipes.addShaped("mce_challengemode_inscriber", <appliedenergistics2:inscriber>, [
    [<taiga:obsidiorite_ingot>, <minecraft:sticky_piston>, <taiga:obsidiorite_ingot>],
    [<ore:crystalPureFluix>, null, <taiga:duranite_ingot>],
    [<taiga:obsidiorite_ingot>, <minecraft:sticky_piston>, <taiga:obsidiorite_ingot>]
]);

//Adv. Inscriber
recipes.remove(<ae2stuff:inscriber>);
recipes.addShaped("mce_challengemode_adv_inscriber", <ae2stuff:inscriber>, [
    [<ore:plateMagnalium>, <enderio:block_buffer:0>, <ore:plateMagnalium>],
    [AEMaterials.engCircuit, <appliedenergistics2:inscriber>, <mekanism:controlcircuit:1>],
    [<ore:plateIridium>, <ore:plateMagnalium>, <ore:plateIridium>]
]);

//Crystal Growth Chamber
recipes.remove(<ae2stuff:grower>);
recipes.addShaped("mce_challengemode_crystal_growth_chamber", <ae2stuff:grower>, [
    [<appliedenergistics2:quartz_growth_accelerator>, <mekanism:controlcircuit:1>, <appliedenergistics2:quartz_growth_accelerator>],
    [<appliedenergistics2:quartz_growth_accelerator>, <appliedenergistics2:sky_stone_chest>|<appliedenergistics2:smooth_sky_stone_chest>, <appliedenergistics2:quartz_growth_accelerator>],
    [<appliedenergistics2:quartz_growth_accelerator>, AEMaterials.glassCable|AEMaterials.coveredCable, <appliedenergistics2:quartz_growth_accelerator>]
]);

//Molecular Assembler
recipes.remove(<appliedenergistics2:molecular_assembler>);
Blueprint.addRecipe("matter_engineering", <appliedenergistics2:molecular_assembler>, [
    <ore:plateSteel> *4,
    AEMaterials.vibrantQuartzGlass *2,
    AEMaterials.coreFormation,
    AEMaterials.coreAnnihil,
    <buildcraftsilicon:advanced_crafting_table>
]);

//Matter Engineering Blueprint
recipes.addShaped("mce_challengemode_matter_engineering_blueprint", <immersiveengineering:blueprint>.withTag({blueprint: "matter_engineering"}), [
    [<ore:itemQuartzWrench>, AEMaterials.engCircuit, <openblocks:generic:11>],
    [<ore:dyeBlue>, <ore:dyeBlue>, <ore:dyeBlue>],
    [<minecraft:paper>, <minecraft:paper>, <minecraft:paper>]
]);

//Form and Annihil cores
recipes.remove(AEMaterials.coreFormation);
Blueprint.addRecipe("matter_engineering", AEMaterials.coreFormation *2, [AEMaterials.logicCircuit, <ore:crystalPureCertusQuartz>, <ore:dustFluix>, <ore:plateInvar>]);

recipes.remove(AEMaterials.coreAnnihil);
Blueprint.addRecipe("matter_engineering", AEMaterials.coreAnnihil *2, [AEMaterials.logicCircuit, <ore:crystalPureNetherQuartz>, <ore:dustFluix>, <ore:plateInvar>]);

print("--- challenge/ChallengemodeAE2.zs initialized ---");