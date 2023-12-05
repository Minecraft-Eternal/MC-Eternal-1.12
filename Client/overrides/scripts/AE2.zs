#priority 1

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import mods.appliedenergistics2.Grinder;
import mods.appliedenergistics2.Inscriber;
#MC Eternal Scripts

print("--- loading AE2.zs ---");

#Remove Items
Grinder.removeRecipe(<nuclearcraft:flour>);
Grinder.addRecipe(<nuclearcraft:flour>, <ore:cropWheat>, 5);


// Fix AE2stuff Adv. Inscribers getting confused by capNBT


function redoInscriber(circuitMaterialMap as IIngredient[string], conductive as int[IIngredient], pressCopyItem as IIngredient) {
	val types = [
		"print",
		"press",
		"circuit"
	] as string[];

	// remembering magic numbers is annoying and dumb
	val AEMaterials = {
		"printEng"		: <appliedenergistics2:material:17>,
		"printCalc"		: <appliedenergistics2:material:16>,
		"printLogic"	: <appliedenergistics2:material:18>,
		"printSil"		: <appliedenergistics2:material:20>,
		"pressEng"		: <appliedenergistics2:material:14>,
		"pressCalc"		: <appliedenergistics2:material:13>,
		"pressLogic"	: <appliedenergistics2:material:15>,
		"pressSil"		: <appliedenergistics2:material:19>,
		"circuitEng"	: <appliedenergistics2:material:24>,
		"circuitCalc"	: <appliedenergistics2:material:23>,
		"circuitLogic"	: <appliedenergistics2:material:22>
	} as IItemStack[string];

	// Yeet the not functioning recipes
	for circuitType,material in circuitMaterialMap {
		for type in types {
			if(type+circuitType != "circuitSil"){
				Inscriber.removeRecipe(AEMaterials[type+circuitType]);
			}
		}
		// Press Copying
		Inscriber.addRecipe(AEMaterials["press"+circuitType], pressCopyItem, true, AEMaterials["press"+circuitType]);
		
		// Processor Finalization
		if(circuitType != "Sil"){
			for energeticMaterial,resultAmount in conductive {
				Inscriber.addRecipe(AEMaterials["circuit"+circuitType] * resultAmount, energeticMaterial, false, AEMaterials["print"+circuitType], AEMaterials["printSil"]);
			}
		}
		
		// Printing
		Inscriber.addRecipe(AEMaterials["print"+circuitType], material, true, AEMaterials["press"+circuitType]);
	}
}

print("--- AE2.zs initialized ---");	