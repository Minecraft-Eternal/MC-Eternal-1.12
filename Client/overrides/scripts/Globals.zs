#priority 5

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.data.IData;
import crafttweaker.block.IBlock;

#MC Eternal Scripts

print("--- loading GlobalFuncs.zs ---");

global getFTBCrate as function(string) IItemStack = function
    (id as string) as IItemStack {
	return <ftbquests:lootcrate>.withTag({type: id as IData});
};

global addMultilineLocalizedTooltip as function(IItemStack, string) void = function
    (item as IItemStack, key as string) as void {
	for line in game.localize(key).split("<BR>") {
		item.addTooltip(format.gold(line));
	}
};


//Get an IItemStack from an IIngredient
// returns as IItemStack if the IIngredient is an IItemStack, or the first entry in the oredict entry if it is an IOreDictEntry.
// mainly used to allow a function (see below) to produce a Thermal Expansion Alloy Smelter recipe from an IIngredient set of parameters
// aswell as generate Copy-pastable XML data for EnderIO's Alloy Smelter and Advanced Rocketry's Arc Furnace
global getIngredientItemstack as function(IIngredient) IItemStack = function 
	(ingredient as IIngredient) as IItemStack {
	if(ingredient instanceof IOreDictEntry){
		val oreDictEntry as IOreDictEntry = ingredient;
		val castedIngredient as IItemStack = oreDictEntry.firstItem;
		return castedIngredient;
	} else {
		val castedIngredient as IItemStack = ingredient;
		return castedIngredient;
	}
};

global alloyingBaseStats as int[string] = {
	"IESmelterTime": 200,
	"IEArcEnergy": 512,
	"thermalInductionEnergy": 4000,
	"NCFurnaceTime": 400,
	"NCFurnaceEnergy": 10,
	"TRSmelterTime": 200,
	"TRSmelterEnergy": 20,
	//The XML siblings
	"ARArcTime": 10,
	"ARArcEnergy": 10000,
	"EIOSmelterEnergy": 10000
};

//Simultaneously add an Alloying recipe to various Alloying machines 
/* Adds recipes to:
    IE's Arc Furnace
    Thermal's Induction Smelter
    Nuclearcraft's Alloy Furnace
    TechReborn's Alloy Furnace/Smelter

// Generates XML Data for:
    EnderIO's Alloy Smeltery
    Advanced Rocketry's Arc Furnace

*/
global addUniversalAlloyRecipe as function(IItemStack, IIngredient[], string, bool, int[string][string]) void = function 
	(result as IItemStack, ingredients as IIngredient[], recipeID as string, enableXMLPrint as bool, parameterMap as int[string][string]) as void {

	//IE Arc Furnace
	if(!isNull(parameterMap.IEArc) && !isNull(parameterMap.IEArc.enabled) ? parameterMap.IEArc.enabled == 1 : true){
		var ingredientArrayWithoutFirst as IIngredient[] = [];
		for entry in ingredients {
			if(!(ingredients[0] in entry)) ingredientArrayWithoutFirst += entry;
		}

		mods.immersiveengineering.ArcFurnace.addRecipe(result, ingredients[0], null,
			(!isNull(parameterMap.IEArc) && !isNull(parameterMap.IEArc.time) ? parameterMap.IEArc.time : alloyingBaseStats.IESmelterTime),
			(!isNull(parameterMap.IEArc) && !isNull(parameterMap.IEArc.energy) ? parameterMap.IEArc.energy : alloyingBaseStats.IEArcEnergy),
			ingredientArrayWithoutFirst
		);
	}

	if(enableXMLPrint){

		var ARXMLIngredients as string = "";
		var EIOXMLIngredients as string = "";
		for ing in ingredients {
			val typedIngredient = getIngredientItemstack(ing);

			ARXMLIngredients += typedIngredient instanceof IItemStack ? '
			<itemStack>'+ typedIngredient.definition.id +';'+ typedIngredient.amount +';'+ typedIngredient.metadata +'</itemStack>' : '
			<oreDict>'+ typedIngredient.name +';'+ typedIngredient.amount +'</oreDict>';

			EIOXMLIngredients += typedIngredient instanceof IItemStack ? '
		<input name="'+ typedIngredient.definition.id +':'+ typedIngredient.metadata +'" amount="'+ typedIngredient.amount +'"/>' : '
		<input name="'+ typedIngredient.name +'" amount="'+ typedIngredient.amount +'">';
		}

	//AR Electric Arc Furnace XML Printing
		print("AR XML for "+ result.definition.id);
		print(
'<!-- '+ recipeID +' -->
	<Recipe timeRequired="'+
	(!isNull(parameterMap.ARArc) && !isNull(parameterMap.ARArc.time) ? parameterMap.ARArc.time : alloyingBaseStats.ARArcTime)
+'" power="'+
	(!isNull(parameterMap.ARArc) && !isNull(parameterMap.ARArc.energy) ? parameterMap.ARArc.energy : alloyingBaseStats.ARArcEnergy)
+'">
		<input>'+
		ARXMLIngredients
+'
		</input>
		<output>
			<itemStack>'+
		result.definition.id
		+';'+
		result.amount
		+';'+
		result.metadata
		+'</itemStack>
		</output>
	</Recipe>'
		);

		if(ingredients.length < 4){
			//EnderIO Alloy Smelter XML Printing
			print("EIO XML for "+ result.definition.id);
			print(
'<recipe name="'+
	recipeID
+'" required="true">
	<alloying energy="'+
	(!isNull(parameterMap.EIOSmelter) && !isNull(parameterMap.EIOSmelter.energy) ? parameterMap.EIOSmelter.energy : alloyingBaseStats.EIOSmelterEnergy)
	+'">'+
		EIOXMLIngredients
+'		
		<output name="'+ result.definition.id +'" amount="'+ result.amount +'"/>
	</alloying>
</recipe>'
			);
		}

	}

	if(ingredients.length < 3){
		//Thermal Induction Smelter
		if(!isNull(parameterMap.thermalInduction) && !isNull(parameterMap.thermalInduction.enabled) ? parameterMap.thermalInduction.enabled == 1 : true)
			mods.thermalexpansion.InductionSmelter.addRecipe(result, getIngredientItemstack(ingredients[0]), getIngredientItemstack(ingredients[1]),
				(!isNull(parameterMap.thermalInduction) && !isNull(parameterMap.thermalInduction.energy) ? parameterMap.thermalInduction.energy : alloyingBaseStats.thermalInductionEnergy)
			);
		
		//Nuclearcraft Alloy Furnace
		if(!isNull(parameterMap.NCFurnace) && !isNull(parameterMap.NCFurnace.enabled) ? parameterMap.NCFurnace.enabled == 1 : true)
			mods.nuclearcraft.alloy_furnace.addRecipe([ingredients[0], ingredients[1], result,
				(!isNull(parameterMap.NCFurnace) && !isNull(parameterMap.NCFurnace.time) ? parameterMap.NCFurnace.time : alloyingBaseStats.NCFurnaceTime) / 400,
				(!isNull(parameterMap.NCFurnace) && !isNull(parameterMap.NCFurnace.energy) ? parameterMap.NCFurnace.energy : alloyingBaseStats.NCFurnaceEnergy) / 10
			]);
		
		//TechReborn Alloy Smelter
		if(!isNull(parameterMap.TRSmelter) && !isNull(parameterMap.TRSmelter.enabled) ? parameterMap.TRSmelter.enabled == 1 : true)
			mods.techreborn.alloySmelter.addRecipe(result, ingredients[0], ingredients[1],
				(!isNull(parameterMap.TRSmelter) && !isNull(parameterMap.TRSmelter.time) ? parameterMap.TRSmelter.time : alloyingBaseStats.TRSmelterTime),
				(!isNull(parameterMap.TRSmelter) && !isNull(parameterMap.TRSmelter.energy) ? parameterMap.TRSmelter.energy : alloyingBaseStats.TRSmelterEnergy)
			);

		//Immersive Engineering Alloy Kiln
		if(!isNull(parameterMap.IEKiln) && !isNull(parameterMap.IEKiln.enabled) ? parameterMap.IEKiln.enabled == 1 : true)
			mods.immersiveengineering.AlloySmelter.addRecipe(result, ingredients[0], ingredients[1],
				(!isNull(parameterMap.IEKiln) && !isNull(parameterMap.IEKiln.time) ? parameterMap.IEKiln.time : alloyingBaseStats.IESmelterTime)
			);
	}
};


//Fetch a Tinkers' tool part's ID as a string by using a shorthand name
global tconPart as string[string] = {
	"binding": "tconstruct:binding",
	"toolrod": "tconstruct:tool_rod",
	"handguard": "tconstruct:hand_guard",
	"knifeblade": "tconstruct:knife_blade",
	"wideguard": "tconstruct:wide_guard",
	"crossguard": "tconstruct:cross_guard",
	"armortrim": "conarm:armor_trim",
	"arrowhead": "tconstruct:arrow_head",
	"sharpeningkit": "tconstruct:sharpening_kit",
	"axehead": "tconstruct:axe_head",
	"shovelhead": "tconstruct:shovel_head",
	"kamahead": "tconstruct:kama_head",
	"swordblade": "tconstruct:sword_blade",
	"pickhead": "tconstruct:pick_head",
	"bowlimb": "tconstruct:bow_limb",
	"signhead": "tconstruct:sign_head",
	"toughrod": "tconstruct:tough_tool_rod",
	"toughbind": "tconstruct:tough_binding",
	"armorplate": "conarm:armor_plate",
	"armorplate": "tconstruct:pan_head",
	"helmcore": "conarm:helmet_core",
	"bootscore": "conarm:boots_core",
	"legscore": "conarm:leggings_core",
	"chestcore": "conarm:chest_core",
	"scythehead": "tconstruct:scythe_head",
	"largeblade": "tconstruct:large_sword_blade",
	"largeplate": "tconstruct:large_plate",
	"hammerhead": "tconstruct:hammer_head",
	"excavatorhead": "tconstruct:excavator_head",
	"broadaxehead": "tconstruct:broad_axe_head"
};

//Fetch a Tinkers' part of a specified material using the shorthand map name and material name
global getTconPart as function(string, string) IItemStack = function
    (part as string, mat as string) as IItemStack {
	return itemUtils.getItem(tconPart[part]).withTag({Material: mat});
};

//Fetch an AE resource's IItemStack from a shorthand name, instead of a magic number
global AEMaterials as IItemStack[string] = {
    "engCircuit": <appliedenergistics2:material:24>,
    "logicCircuit": <appliedenergistics2:material:22>,
    "calcCircuit": <appliedenergistics2:material:23>,
    "1kComponent": <appliedenergistics2:material:35>,
    "4kComponent": <appliedenergistics2:material:36>,
    "16kComponent": <appliedenergistics2:material:37>,
    "64kComponent": <appliedenergistics2:material:38>,
    "1kFluid": <appliedenergistics2:material:54>,
    "4kFluid": <appliedenergistics2:material:55>,
    "16kFluid": <appliedenergistics2:material:56>,
    "64kFluid": <appliedenergistics2:material:57>,
    "printEng": <appliedenergistics2:material:17>,
	"printCalc": <appliedenergistics2:material:16>,
	"printLogic": <appliedenergistics2:material:18>,
	"printSil": <appliedenergistics2:material:20>,
    "pressEng": <appliedenergistics2:material:14>,
	"pressCalc": <appliedenergistics2:material:13>,
	"pressLogic": <appliedenergistics2:material:15>,
	"pressSil": <appliedenergistics2:material:19>,
    "coveredCable": <appliedenergistics2:part:36>,
    "quartzFiber": <appliedenergistics2:part:140>,
    "glassCable": <appliedenergistics2:part:16>,
    "denseCable": <appliedenergistics2:part:516>,
    "vibrantQuartzGlass": <appliedenergistics2:quartz_vibrant_glass>,
    "quartzGlass": <appliedenergistics2:quartz_glass>,
	"coreAnnihil": <appliedenergistics2:material:44>,
	"coreFormation": <appliedenergistics2:material:43>
};

//Get Botania flower with its String ID
global getBotaniaFlower as function(string) IItemStack = function
	(flowerName as string) as IItemStack {
	return <botania:specialflower>.withTag({type: flowerName});
};

//Simple function to remove an item's Crafting table recipes and add a "disabled" tooltip to it
global basicDisable as function(IItemStack, string, bool, bool) void = function
	(item as IItemStack, recipeID as string, removeByRecipeID as bool, isChallengeOnly as bool) as void {
	val tooltipType = isChallengeOnly ? "mce.generic.tip.challengemode_disabled" : "mce.generic.tip.disabled";
	item.addTooltip(format.red(game.localize(tooltipType)));
	if(removeByRecipeID){
		recipes.removeByRecipeName(recipeID);
	} else {
		recipes.remove(item);
	}
};

//"Simple" function to simultaneously add a Salis Mundus conversion, and add a tooltip to the Result item
global addSalisMundusConversion as function(IItemStack, IIngredient, bool) void = function
	(result as IItemStack, input as IIngredient, isInputOredict as bool) as void {
	val debugThis = false;
	var tooltipString as string = "mce.generic.tip.salis_mundus_craft";
	var inputStack as IItemStack = <minecraft:stone>;
	var inputDict as IOreDictEntry = <ore:stone>;

	if(!isInputOredict){
		inputStack = getIngredientItemstack(input);
		tooltipString = game.localize(tooltipString +".specific_mod_block").replace("%s", inputStack.displayName).replace("%m", game.localize("itemGroup."+ inputStack.definition.owner));
	} else if(input instanceof IOreDictEntry){
		val inputTemp as IOreDictEntry = input;
		inputDict = inputTemp;
		tooltipString = game.localize(tooltipString).replace("%s", inputDict.name);
	}
	
	for line in tooltipString.split("<BR>") {
		result.addTooltip(format.gold(line));
	}
	
	if(debugThis){
		print("Information for Salis Mundus conversion to "+ result.displayName);
		print("Input is Oredict: "+ isInputOredict);
		print("Tooltip: "+ tooltipString);
		print("Input Block: "+ isInputOredict ? inputDict.name : inputStack.commandString);
	}
	

	if(!isInputOredict){
		mods.thaumcraft.SalisMundus.addSingleConversion(inputStack, result);
	} else if(isInputOredict){
		mods.thaumcraft.SalisMundus.addSingleConversion(inputDict, result);
	}

	if(<ore:stone>.matches(inputStack)){
		print("Salis Mundus Conversion for "+ result.displayName +" has an input of Stone, is this intentional, or did the fallback activate?");
	}
};

//Fetch an Astral Sorcery Marble variant by a shorthand name, instead of a magic number
global blockMarble as IItemStack[string] = {
	"normal": <astralsorcery:blockmarble:0>,
	"brick": <astralsorcery:blockmarble:1>,
	"pillar": <astralsorcery:blockmarble:2>,
	"arch": <astralsorcery:blockmarble:3>,
	"chiseled": <astralsorcery:blockmarble:4>,
	"engraved": <astralsorcery:blockmarble:5>,
	"runed": <astralsorcery:blockmarble:6>,

	"normalSooty": <astralsorcery:blockblackmarble:0>,
	"brickSooty": <astralsorcery:blockblackmarble:1>,
	"pillarSooty": <astralsorcery:blockblackmarble:2>,
	"archSooty": <astralsorcery:blockblackmarble:3>,
	"chiseledSooty": <astralsorcery:blockblackmarble:4>,
	"engravedSooty": <astralsorcery:blockblackmarble:5>,
	"runedSooty": <astralsorcery:blockblackmarble:6>
};

//Fetch one of a handful of Botania materials by a shorthand name, instead of a magic number
global manaResource as IItemStack[string] = {
	"manaString": <botania:manaresource:16>,
	"manaCloth": <botania:manaresource:22>,
	"manaNugget": <botania:manaresource:17>,
	"manasteel": <botania:manaresource:0>,
	"manasteelBlock": <botania:storage:0>,
	"manaPearl": <botania:manaresource:1>,
	"manaDiamond": <botania:manaresource:2>,
	"manaDiamondBlock": <botania:storage:3>,
	"manaPowder": <botania:manaresource:23>,
	"elementiumNugget": <botania:manaresource:19>,
	"elementium": <botania:manaresource:7>,
	"elementiumBlock": <botania:storage:2>,
	"pixieDust": <botania:manaresource:8>,
	"dragonstone": <botania:manaresource:9>,
	"dragonstoneBlock": <botania:storage:4>,
	"terrasteelNugget": <botania:manaresource:18>,
	"terrasteel": <botania:manaresource:4>,
	"terrasteelBlock": <botania:storage:1>,
	"gaiaSpirit": <botania:manaresource:5>,
	"gaiaIngot": <botania:manaresource:14>
};

global MAEssenceTier as int[string] = {
	"prosperity": -1,
	"inferium": 0,
	"prudentium": 1,
	"intermedium": 2,
	"superium": 3,
	"supremium": 4
};

global MAResourceMap as int[string] = {
	"ingot": 33,
	"essence": 0,
	"souliumDust": 29,
	"souliumIngot": 38
};

global getMAResource as function(string, int) IItemStack = function
	(resourceType as string, tier as int) as IItemStack {
	return itemUtils.getItem("mysticalagriculture:crafting", MAResourceMap[resourceType] + tier);
};

//Fetch an EnderIO material by a shorthand name, instead of a magic number
global EIOMaterial as IItemStack[string] = {
	"chassisSimple": <enderio:item_material:0>,
	"chassisMachine": <enderio:item_material:1>,
	"chassisSoul": <enderio:item_material:53>,
	"chassisEndsteel": <enderio:item_material:66>,
	"chassisEnhanced": <enderio:item_material:54>,
	"chassisSoulless": <enderio:item_material:55>,
	"organicDyeGreen": <enderio:item_material:48>,
	"organicDyeBrown": <enderio:item_material:49>,
	"organicDyeBlack": <enderio:item_material:50>,
	"industrialDye": <enderio:item_material:51>,
	"soulDye": <enderio:item_material:52>,
	"enhancedDye": <enderio:item_material:67>,
	"grainsPrescience": <enderio:item_material:34>,
	"grainsVibrant": <enderio:item_material:35>,
	"grainsPulsating": <enderio:item_material:36>,
	"grainsEnd": <enderio:item_material:37>,
	"capacitorBasic": <enderio:item_basic_capacitor:0>,
	"capacitorEnhanced": <enderio:item_basic_capacitor:1>,
	"capacitorOctadic": <enderio:item_basic_capacitor:2>
};

//Fetch an Immersive Engineering item by a shorthand name, instead of a magic number
global IEItem as IItemStack[string] = {
	"redstoneEngineeringBlock": <immersiveengineering:metal_decoration0:3>,
	"lightEngineeringBlock": <immersiveengineering:metal_decoration0:4>,
	"heavyEngineeringBlock": <immersiveengineering:metal_decoration0:5>,
	"generatorBlock": <immersiveengineering:metal_decoration0:6>,
	"radiatorBlock": <immersiveengineering:metal_decoration0:7>,
	"capacitorLV": <immersiveengineering:metal_device0:0>,
	"capacitorMV": <immersiveengineering:metal_device0:1>,
	"capacitorHV": <immersiveengineering:metal_device0:2>,
	"redstoneBreaker": <immersiveengineering:connector:10>,
	"ironMechComponent": <immersiveengineering:material:8>,
	"steelMechComponent": <immersiveengineering:material:9>
};

global AAItem as IItemStack[string] = {
	"ironCasing": <actuallyadditions:block_misc:9>,
	"woodCasing": <actuallyadditions:block_misc:4>,
	"blockVoid": <actuallyadditions:block_crystal:3>,
	"blockPalis": <actuallyadditions:block_crystal:1>,
	"blockRestonia": <actuallyadditions:block_crystal:0>,
	"blockEnori": <actuallyadditions:block_crystal:5>,
	"blockDiamatine": <actuallyadditions:block_crystal:2>,
	"blockEmeradic": <actuallyadditions:block_crystal:4>,
	"crystalVoid": <actuallyadditions:item_crystal:3>,
	"crystalPalis": <actuallyadditions:item_crystal:1>,
	"crystalRestonia": <actuallyadditions:item_crystal:0>,
	"crystalEnori": <actuallyadditions:item_crystal:5>,
	"crystalDiamatine": <actuallyadditions:item_crystal:2>,
	"crystalEmeradic": <actuallyadditions:item_crystal:4>
};

print("--- GlobalFuncs.zs initalized ---");