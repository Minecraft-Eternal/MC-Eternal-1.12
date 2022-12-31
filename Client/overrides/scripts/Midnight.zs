#MC Eternal Scripts

print("--- Loading Midnight.zs ---");

// Dark Pearl -> Ender Pearl
//Starmetal is 100.0 for light transmutations, Cake is 600.0
mods.astralsorcery.LightTransmutation.addTransmutation(<midnight:dark_pearl_block>, <actuallyadditions:block_misc:6>, 150.0);
mods.thaumcraft.Crucible.registerRecipe("dark_pearl_to_ender_pearl", "", <minecraft:ender_pearl>, <midnight:dark_pearl>, [<aspect:alienis> *5, <aspect:motus> *10]);
mods.botania.ManaInfusion.addAlchemy(<minecraft:ender_pearl>, <midnight:dark_pearl>, 20000);
mods.bloodmagic.AlchemyTable.addRecipe(<minecraft:ender_pearl>, [<midnight:dark_pearl>, <thebetweenlands:sap_ball>], 5000, 200, 1);
//Infused Iron is 15000 AU at 80 ticks
mods.naturesaura.Altar.addRecipe("mce_transmute_dark_pearl_to_ender_pearl", <midnight:dark_pearl>, <minecraft:ender_pearl>, <naturesaura:conversion_catalyst>, 25000, 200);

// Tenebrum
mods.thaumcraft.Crucible.registerRecipe("tenebrum_to_void_seed", "BASEELDRITCH", <thaumcraft:void_seed> *3, <midnight:tenebrum_block>, [<aspect:vitium> *10, <aspect:alienis> *20, <aspect:vacuos> *20, <aspect:tenebrae> *20]);
recipes.addShapeless("mce_fiery_ingot_from_tenebrum", <twilightforest:fiery_ingot> *2, [<midnight:tenebrum_ingot>, <twilightforest:fiery_blood>|<twilightforest:fiery_tears>]);

// Nagrillite
mods.botania.ManaInfusion.addInfusion(<botania:manaresource:0> *15, <midnight:nagrilite_block>, 27000);
mods.thaumcraft.Crucible.registerRecipe("nagrilite_to_thaumium", "METALLURGY", <thaumcraft:ingot:0> *12, <midnight:nagrilite_block>, [<aspect:praecantatio> *45, <aspect:terra> *45]);
mods.astralsorcery.StarlightInfusion.addInfusion(<midnight:nagrilite_block>, <astralsorcery:itemcraftingcomponent:1> * 12, false, 0.10, 200);
mods.naturesaura.Altar.addRecipe("mce_nagrilite_to_infused_iron", <midnight:nagrilite_block>, <naturesaura:infused_iron> *15, null, 120000, 700);

// Ebonite
mods.astralsorcery.Altar.addDiscoveryAltarRecipe("mce:altar/luminoustable/nocturnal_powder_midnight_edition", <astralsorcery:itemusabledust:1>*16, 250, 100, [
    null, <midnight:ebonys>, null,
    null, <astralsorcery:itemusabledust:0>, null,
    null, <ore:gemLapis>, null
]);

// Archaic Glass
mods.botania.ManaInfusion.addInfusion(<botania:managlass> *4, <midnight:archaic_glass>, 100);
mods.astralsorcery.Altar.addDiscoveryAltarRecipe("mce:altar/luminoustable/glass_lens_midnight_edition", <astralsorcery:itemcraftingcomponent:3>*3, 330, 100, [
    null, <midnight:archaic_glass_pane>, null,
    <midnight:archaic_glass_pane>, <astralsorcery:itemcraftingcomponent:0>, <midnight:archaic_glass_pane>,
    null, <midnight:archaic_glass_pane>, null
]);
mods.astralsorcery.StarlightInfusion.addInfusion(<midnight:archaic_glass_pane>, <astralsorcery:itemcraftingcomponent:3>*3, false, 0.05f, 200);

// Miasma
mods.astralsorcery.Lightwell.addLiquefaction(<midnight:miasma_surface>, <liquid:miasma>, 1, 4.0, 0xba9af5);
mods.thermalexpansion.MagmaticDynamo.addFuel(<liquid:miasma>, 1000000);
mods.techreborn.fluidGen.addThermalFluid(<liquid:miasma>, 1000);

// Miasma Surface
val metamorphicStone = <botania:biomestonea:0>|<botania:biomestonea:1>|<botania:biomestonea:2>|<botania:biomestonea:3>|<botania:biomestonea:4>|<botania:biomestonea:5>|<botania:biomestonea:6>|<botania:biomestonea:7>;
mods.nuclearcraft.infuser.addRecipe([<botania:livingrock>, <liquid:miasma>*1000, <midnight:miasma_surface>, 1.0, 10.0]);
mods.nuclearcraft.infuser.addRecipe([metamorphicStone, <liquid:miasma>*1000, <midnight:miasma_surface>*2, 1.0, 10.0]);

// Shroom Stuff
mods.thaumcraft.Crucible.registerRecipe("nightshroom_bomb_to_alumentum", "ALUMENTUM", <thaumcraft:alumentum> *3, <midnight:spore_bomb>, [<aspect:potentia> *10, <aspect:ignis> *10, <aspect:perditio> *5]);


// Blood Magic Slates
//Reinforced Shortcut
mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:slate:1>, <midnight:trenchstone>, 1, 1000, 25, 25);

//Imbued shortcut
mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:slate:2>, <midnight:ebonys>, 2, 2500, 100, 50);


// Stinger Egg
<ore:egg>.add(<midnight:stinger_egg>);
<ore:listAllEgg>.add(<midnight:stinger_egg>);

print("--- Midnight.zs initialized ---");
