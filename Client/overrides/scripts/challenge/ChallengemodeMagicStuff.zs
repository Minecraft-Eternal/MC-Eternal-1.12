#packmode challenge

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import thaumcraft.aspect.CTAspectStack;

import mods.roots.Fey;
import mods.roots.Pyre;
import mods.roots.Spells;
import mods.roots.Spell;
import mods.roots.Mortar;
import mods.roots.Chrysopoeia;

import mods.botania.ManaInfusion;
import mods.botania.Apothecary;
import mods.botania.ElvenTrade;
import mods.botania.PureDaisy;

import mods.bloodmagic.BloodAltar;
import mods.bloodmagic.TartaricForge;
import mods.bloodmagic.AlchemyArray;

import mods.thaumcraft.ArcaneWorkbench;
import mods.thaumcraft.Infusion;
import mods.thaumcraft.SmeltingBonus;
import mods.thaumcraft.SalisMundus;
import mods.thaumcraft.Crucible;

import mods.astralsorcery.Altar;
import mods.astralsorcery.StarlightInfusion;
import mods.astralsorcery.LightTransmutation;

import mods.naturesaura.TreeRitual;

#MC Eternal Scripts

print("--- loading challenge/ChallengemodeMagicStuff.zs ---");


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
	Crucible.removeRecipe("thaumadditions:"+ aspect +"_vis_seed");
	itemUtils.getItem("thaumadditions:vis_seeds/"+ aspect).addTooltip(format.red(game.localize("mce.generic.tip.challengemode_disabled")));
}

function useInscriptionTool (tool as IItemStack) as IItemStack {
	if(isNull(tool.tag.uses) || tool.tag.uses == 1) return null;
	return tool.updateTag({uses: tool.tag.uses - 1});
} 

//Blood Magic stuff

function getBloodOrb (tier as string) as IItemStack {
	return <bloodmagic:blood_orb>.withTag({orb: "bloodmagic:"+ tier});
}

//Slates
// Blank
BloodAltar.removeRecipe(<minecraft:stone>);
BloodAltar.addRecipe(<bloodmagic:slate:0>, <midnight:nightstone>, 0, 500, 10, 5);

// Reinforced
//gotten with Trenchstone from Midnight
BloodAltar.removeRecipe(<bloodmagic:slate:0>);

// Imbued
//gotten with Ebonite from Midnight
BloodAltar.removeRecipe(<bloodmagic:slate:1>);

// Demonic
//BloodAltar.removeRecipe(<bloodmagic:slate:2>);
//BloodAltar.addRecipe(<bloodmagic:slate:3>, <>, 3, 10000, 50, 100);

// Ethereal
BloodAltar.removeRecipe(<bloodmagic:slate:3>);
BloodAltar.addRecipe(<bloodmagic:slate:4>, <thaumicaugmentation:stone:0>, 4, 20000, 100, 250);


//Orbs
//Weak
BloodAltar.removeRecipe(<minecraft:diamond>);
BloodAltar.addRecipe(getBloodOrb("weak"), <botania:manaresource:2>, 0, 2000, 10, 20);

//Apprentice
//BloodAltar.removeRecipe(<minecraft:redstone_block>);
//BloodAltar.addRecipe(getBloodOrb("apprentice"), <minecraft:dirt:1>, 1, 5000, 15, 25);

//Magician
BloodAltar.removeRecipe(<minecraft:gold_block>);
BloodAltar.addRecipe(getBloodOrb("magician"), <thebetweenlands:life_crystal:0>, 2, 10000, 20, 30);

// Master
//BloodAltar.removeRecipe(<bloodmagic:blood_shard:0>);
//BloodAltar.addRecipe(getBloodOrb("master"), <astralsorcery:itemshiftingstar>, 3, 40000, 50, 50);

//Archmage
BloodAltar.removeRecipe(<minecraft:nether_star>);
BloodAltar.addRecipe(getBloodOrb("archmage"), <thaumcraft:voidseer_charm>, 4, 100000, 100, 100);

//Bloodstone Tile
recipes.removeByRecipeName("bloodmagic:decorative_brick_bloodstone_tile");
Infusion.registerRecipe("mce_challengemode_bloodstone_tile", "", <bloodmagic:decorative_brick:0>, 3, [
		<aspect:victus> * 30,
		<aspect:mortuus> * 20,
		<aspect:spiritus> * 20,
		<aspect:desiderium> * 10,
		<aspect:diabolus> * 10
	],
	<thaumcraft:stone_arcane>,
	[
		<bloodmagic:blood_shard:0>,
		<bewitchment:dragons_blood_resin>,
		<bloodmagic:blood_shard:0>,
		<vampirism:pure_blood:2>,
	]
);
//for after you make tier 4, for deco purposes
BloodAltar.addRecipe(<bloodmagic:decorative_brick:0>, <thaumcraft:stone_arcane>, 3, 2500, 100, 100);


//Sacrificial Dagger
recipes.remove(<bloodmagic:sacrificial_dagger>);
ArcaneWorkbench.registerShapedRecipe("mce_challengemode_sacrificial_dagger", "", 50,
	[<aspect:aqua> * 5, <aspect:terra>* 5, <aspect:ordo> *3, <aspect:perditio> * 3],
	<bloodmagic:sacrificial_dagger>,
	[	
		[<appliedenergistics2:quartz_glass>, <appliedenergistics2:quartz_glass>, <ancientspellcraft:battlemage_sword_blade>],
		[null, getTconPart("crossguard", "manyullyn"), <appliedenergistics2:quartz_glass>],
		[getTconPart("toolrod", "cobalt"), null, <appliedenergistics2:quartz_glass>]
	]
);

//Blood Altar
//recipes.remove(<bloodmagic:blood_altar>);

//Rudimentary Snare
recipes.remove(<bloodmagic:soul_snare>);
Fey.addRecipe("mce_challengemode_rudimentary_snare", <bloodmagic:soul_snare> *12, [
	<bewitchment:ectoplasm>,
	<randomthings:ingredient:12>,
	<randomthings:ingredient:12>,
	getTconPart("knifeblade", "ma.soulium"),
	getTconPart("crossguard", "iron")
]);

//Sentient Sword
TartaricForge.removeRecipe([<minecraft:iron_sword>, <bloodmagic:soul_gem:0>]);
Altar.addDiscoveryAltarRecipe("mce:shaped/altar/challengemode/sentient_sword", <bloodmagic:sentient_sword>, 500, 100, [
	null, null, getTconPart("swordblade", "ma.base_essence"),
	null, getTconPart("wideguard", "duranite"), null,
	<bloodmagic:soul_gem:0>, getTconPart("toolrod", "steel"), null
]);

//Sigils
//Air Sigil
AlchemyArray.removeRecipe(<bloodmagic:component:2>, <bloodmagic:slate:1>);
AlchemyArray.addRecipe(<bloodmagic:sigil_air>, <bloodmagic:component:2>, <bloodmagic:slate:3>, "bloodmagic:textures/models/alchemyarrays/airsigil.png");


//Blood Magic stuff end


//Astral Sorcery evil

//Sooty Marble
recipes.removeByRecipeName("astralsorcery:shaped/marble_black_raw");
Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/marble_black_raw");

Pyre.addRecipe("mce_challengemode_sooty_marble", blockMarble.normalSooty * 4, [
	<bloodmagic:inscription_tool:2>.transformNew(function(item as IItemStack){
		return useInscriptionTool(item);
	}),
	<ore:stoneMarble>,
	<ore:stoneMarble>,
	<ore:stoneMarble>,
	<ore:stoneMarble>
]);

//Ritual Pedestal
Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/ritualpedestal");
Altar.addAttunementAltarRecipe("mce:shaped/altar/challengemode/ritual_pedestal", <astralsorcery:blockritualpedestal>, 1200, 200, [
	blockMarble.chiseled, <minecraft:nether_star>, blockMarble.chiseled,
	blockMarble.pillar, <fluid:astralsorcery.liquidstarlight> *1000, blockMarble.pillar,
	blockMarble.runed, <ebwizardry:runestone_pedestal:*>, blockMarble.runed,
	<taiga:lumix_ingot>, <taiga:lumix_ingot>,
	blockMarble.pillar, blockMarble.pillar
]);

//Attunement Altar
Altar.removeAltarRecipe("astralsorcery:shaped/attunementaltar");
Altar.addAttunementAltarRecipe("mce:shaped/altar/challengemode/attunement_altar", <astralsorcery:blockattunementaltar>, 1200, 300, [
	null, mods.astralsorcery.Utils.getCrystalORIngredient(false, false), null,
	<ore:ingotAstralStarmetal>, <minecraft:nether_star>, <ore:ingotAstralStarmetal>,
	blockMarble.runed, <astralsorcery:blockattunementrelay>, blockMarble.runed,
	<ore:gemAquamarine>, <ore:gemAquamarine>,
	blockMarble.runed, blockMarble.runed
]);

//Glass Lens
// use Archaic Glass recipes
Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/glasslens");
StarlightInfusion.removeInfusion(<astralsorcery:itemcraftingcomponent:3>);

//Nocturnal Powder
// use Ebonite recipe
Altar.removeAltarRecipe("astralsorcery:shaped/internal/altar/nocturnalpowder");

//Cake conversion is kill
// very op for Botania Mana with the Kekimurus
LightTransmutation.removeTransmutation(<minecraft:cake>, false);

//Astral Sorcery end


//Botania

//Mana String
ManaInfusion.removeRecipe(manaResource.manaString);
ManaInfusion.addInfusion(manaResource.manaString, <ebwizardry:magic_silk>, 1250);

//Manasteel
// make with Nagrilite insted
ManaInfusion.removeRecipe(manaResource.manasteel);
ManaInfusion.removeRecipe(manaResource.manasteelBlock);

//Pixie Dust
// now using I&F Pixie Dust because hehe
ElvenTrade.removeRecipe(manaResource.pixieDust);
ElvenTrade.addRecipe([manaResource.pixieDust], [manaResource.manaPearl, <iceandfire:pixie_dust>]);

//Petal Apothecary
recipes.remove(<botania:altar:0>);
Altar.addDiscoveryAltarRecipe("mce:shaped/altar/challengemode/petal_apothecary", <botania:altar:0>, 700, 100, [
	<thaumcraft:slab_arcane_stone>, null, <thaumcraft:slab_arcane_stone>,
	null, <roots:runestone>, null,
	<roots:runestone_slab>, <roots:chiseled_runestone>, <roots:runestone_slab>
]);

//Pure Daisy
Apothecary.removeRecipe("puredaisy");
Apothecary.addRecipe("puredaisy", [<ore:crystalPureNetherQuartz>, <ore:petalWhite>, <ore:petalWhite>, <ore:crystalPureNetherQuartz>, <ore:petalWhite>, <ore:petalWhite>]);

//Diluted Mana Pool
recipes.remove(<botania:pool:2>);
addSalisMundusConversion(<botania:pool:2>, <ore:stoneMarble>, true);

//Hydroangea
Crucible.registerRecipe("mce_challengemode_early_hydroangea", "", getBotaniaFlower("hydroangeas"), <botania:flower:3>, [<aspect:aqua> *10, <aspect:desiderium> *4, <aspect:auram> *3]);

//Endoflame
Apothecary.removeRecipe("endoflame");
getBotaniaFlower("endoflame").addTooltip(format.red(game.localize("mce.generic.tip.challengemode_disabled")));

//Livingwood
addSalisMundusConversion(<botania:livingwood>, <roots:wildwood_log>, false);
PureDaisy.removeRecipe(<botania:livingwood>);
PureDaisy.addRecipe(<ore:logAncient>, <botania:livingwood>, 1200);

//Mana Pool
recipes.remove(<botania:pool:0>);
Altar.addDiscoveryAltarRecipe("mce/shaped/altar/challengemode/mana_pool_temp", <botania:pool:0>, 1000, 100, [
	<ore:dustFairy>, <botania:manaresource:2>, <ore:dustFairy>,
	<botania:livingrock:0>, <botania:pool:2>, <botania:livingrock:0>,
	<botania:livingrock:0>, <botania:livingrock:0>, <botania:livingrock:0>
]);

//Livingrock
PureDaisy.removeRecipe(<botania:livingrock:0>);
PureDaisy.addRecipe(<naturesaura:infused_stone>, <botania:livingrock:0>, 1200);

//Mana Spreader
recipes.remove(<botania:spreader:0>);
ArcaneWorkbench.registerShapedRecipe("mce_challengemode_mana_spreader", "", 25, 
	[<aspect:aer> *1, <aspect:aqua> *1, <aspect:ordo> *2],
	<botania:spreader:0>,
	[
		[<botania:livingwood>, <botania:livingwood>, <botania:livingwood>],
		[<thaumcraft:ingot:2>, <ebwizardry:crystal_block:0>],
		[<botania:livingwood>, <botania:livingwood>, <botania:livingwood>]
	]
);

//Botania end


//Roots things

//Elemental Soil
Fey.removeRecipe(<roots:elemental_soil>);
Fey.addRecipe("elemental_soil", <roots:elemental_soil> *4, [
	<bloodmagic:inscription_tool:3>.transformNew(function(item as IItemStack){
		return useInscriptionTool(item);
	}),
	<ore:dirt>,
	<roots:terra_moss>,
	<roots:wildroot>,
	<ore:gravel>,
]);

// Roots Unending Bowl
Fey.removeRecipe(<roots:unending_bowl>);
Fey.addRecipe("unending_bowl", <roots:unending_bowl>, [
	<roots:mortar>,
	<nuclearcraft:water_source_dense>,
	<thaumcraft:everfull_urn>,
	<extrautils2:drum:3>.withTag({Fluid: {FluidName: "water", Amount: 65536000}}),
	<xreliquary:emperor_chalice>
]);

//make Petal Shell more of a "parry"
// later anyway, duration can't be adjusted in roots 3.1.7 and below :v
val petalShell = Spells.getSpell("petal_shell") as Spell;
petalShell.setCooldown(1200);


//Pyre
recipes.remove(<roots:pyre>);
addSalisMundusConversion(<roots:pyre>, <futuremc:campfire>, false);


//Mortar
recipes.remove(<roots:mortar>);
Fey.addRecipe("mce_challengemode_mortar", <roots:mortar>, [
	<actuallyadditions:item_misc:14>.transformReplace(<ore:foodCoffee>.firstItem), //Empty Cup
	<roots:wildroot>,
	<roots:terra_moss>,
	<minecraft:water_bucket>,
	<ore:toolPot>
]);

//Pestle
recipes.remove(<roots:pestle>);
ArcaneWorkbench.registerShapedRecipe("mce_challengemode_pestle", "", 30,
	[<aspect:terra> *3, <aspect:ordo> *2, <aspect:perditio> *4],
	<roots:pestle>,
	[
		[<thaumcraft:stone_arcane>],
		[null, <thaumcraft:stone_arcane>, <quark:polished_stone>],
		[null, <quark:polished_stone>, <quark:sturdy_stone>]
	]
);


//Imbuer
recipes.remove(<roots:imbuer>);
ArcaneWorkbench.registerShapedRecipe("mce_challengemode_roots_imbuer", "", 50,
	[<aspect:terra> *5, <aspect:ordo> *3],
	<roots:imbuer>,
	[
		[<naturesaura:ancient_stick>, null, <naturesaura:ancient_stick>],
		[null, <roots:chiseled_runestone>],
		[<naturesaura:ancient_stick>, null, <naturesaura:ancient_stick>]
	]
);

//Fey Crafting
recipes.remove(<roots:fey_crafter>);
ArcaneWorkbench.registerShapedRecipe("mce_challengemode_roots_fey_crafter", "", 75,
	[<aspect:aer> *2, <aspect:terra> *5, <aspect:ordo> *2],
	<roots:fey_crafter>,
	[
		[<ore:treeLeaves>, <twilightforest:twilight_sapling:1>, <ore:treeLeaves>],
		[<ore:treeLeaves>, <botania:livingwood>, <ore:treeLeaves>],
		[<roots:terra_moss>, <botania:livingwood>, <roots:wildroot>]
	]
);

//Grove Supplication
// solves a paradox by being a custom recipe (Roots Petals require Mortar, but that needs Fey Crafting...)
Rituals.modifyRitual("ritual_grove_supplication", [<ore:doorWood>, <ore:treeSapling>, <botania:petal:*>, <roots:wildroot>, <tconstruct:materials:18>]);

//Wildroot Growth
// solves another paradox (Spirit Herb needs Runic Shears, but that needs Fey Crafting...)
Rituals.modifyRitual("ritual_wildroot_growth", [<roots:wildroot>, <roots:bark_oak>, <roots:bark_spruce>, <roots:bark_dark_oak>, <botania:fertilizer>]);

//Roots things end


//Nature's Aura stuff

//Brilliant Fiber
recipes.remove(<naturesaura:gold_fiber>);
Apothecary.addRecipe(<naturesaura:gold_fiber> *4, [<botania:grassseeds:4>, <ore:gemAmber>, <ore:treeLeaves>, <ore:dustSmallGold>]);
//BL Ingredient recipe
Apothecary.addRecipe(<naturesaura:gold_fiber> *8, [<thebetweenlands:items_crushed:35>, <ore:gemAmber>, <ore:leavesBL>, <ore:dustSmallGold>]);

//Gold Powder
//enforces using added Roots mortar recipe
recipes.remove(<naturesaura:gold_powder>);

//Golden Stone Bricks
recipes.remove(<naturesaura:gold_brick>);
AlchemyArray.addRecipe(<naturesaura:gold_brick>, <naturesaura:gold_fiber>, <minecraft:stonebrick:0>, "bloodmagic:textures/models/alchemyarrays/growthsigil.png");

//Crumbling Catalyst
TreeRitual.removeRecipe(<naturesaura:crushing_catalyst>);
TreeRitual.addRecipe("mce_challengemode_crumbling_catalyst", <minecraft:sapling:4>, <naturesaura:crushing_catalyst>, 80, [
	<naturesaura:gold_brick>,
	<naturesaura:infused_stone>,
	<minecraft:piston>,
	<minecraft:flint>,
	<naturesaura:token_anger>,
	<roots:stalicripe>
]);

//Nature's Aura stuff end


//MA Stuff

//Master Infusion Crystal
recipes.removeByRecipeName("mysticalagriculture:core/master_infusion_crystal");

//Prosperity Ingot crafting
recipes.removeByRecipeName("mysticalagriculture:crafting_16");
Chrysopoeia.addRecipe("mce_challengemode_prosperity_ingot", <ore:shardProsperity> *6, getMAResource("ingot", MAEssenceTier["prosperity"]));

//Remove Tinkering Tables (except Insanium)
recipes.remove(<mysticalagriculture:tinkering_table:*>);
<mysticalagriculture:tinkering_table:*>.addTooltip(format.red(game.localize("mce.challengemode.mysticalagriculture.tip.only_insanium_tinker_table")));


//MA Stuff end



//Tooltips
val itemsCraftedUsingInscriptionTool = [
	blockMarble.normalSooty,
	<roots:elemental_soil>
] as IItemStack[];

for item in itemsCraftedUsingInscriptionTool {
	val inscriptionCraftingTip = game.localize("mce.challengemode.generic.tip.damages_inscription_tool_instead_of_consume").split("<BR>");
	item.addShiftTooltip(format.gold(inscriptionCraftingTip[0]), format.gold(game.localize("mce.challengemode.generic.tip.has_crafting_quirk")));
	item.addShiftTooltip(format.gold(inscriptionCraftingTip[1]));
}

print("--- challenge/ChallengemodeMagicStuff.zs initialized ---");
