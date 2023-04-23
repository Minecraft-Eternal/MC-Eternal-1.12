#MC Eternal Scripts

print("--- Loading Midnight.zs ---");

// Dark Pearl -> Ender Pearl
//Starmetal is 100.0 for light transmutations, Cake is 600.0
mods.astralsorcery.LightTransmutation.addTransmutation(<midnight:dark_pearl_block>, <actuallyadditions:block_misc:6>, 150.0);
mods.thaumcraft.Crucible.registerRecipe("dark_pearl_to_ender_pearl", "", <minecraft:ender_pearl>, <midnight:dark_pearl>, [<aspect:alienis> *10, <aspect:motus> *10]);
mods.botania.ManaInfusion.addAlchemy(<minecraft:ender_pearl>, <midnight:dark_pearl>, 20000);

// Tenebrum
mods.thaumcraft.Crucible.registerRecipe("tenebrum_to_void_seed", "BASEELDRITCH", <thaumcraft:void_seed> *3, <midnight:tenebrum_block>, [<aspect:vitium> *10, <aspect:alienis> *20, <aspect:vacuos> *20, <aspect:tenebrae> *20]);
recipes.addShapeless("mce_fiery_ingot_from_tenebrum", <twilightforest:fiery_ingot> *2, [<midnight:tenebrum_ingot>, <twilightforest:fiery_blood>|<twilightforest:fiery_tears>]);

// Nagrillite
mods.botania.ManaInfusion.addInfusion(<botania:manaresource:0> *15, <midnight:nagrilite_block>, 40500);
mods.thaumcraft.Crucible.registerRecipe("nagrilite_to_thaumium", "METALLURGY", <thaumcraft:ingot:0> *12, <midnight:nagrilite_block>, [<aspect:praecantatio> *45, <aspect:terra> *45]);
mods.astralsorcery.StarlightInfusion.addInfusion(<midnight:nagrilite_block>, <astralsorcery:itemcraftingcomponent:1> * 12, false, 0.10, 200);

// Ebonite
mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:slate:1> *2, <midnight:ebonys>, 1, 2000, 20, 50);

// Archaic Shard
mods.botania.ManaInfusion.addInfusion(<botania:managlass> *4, <midnight:archaic_glass>, 100);

// Miasma
mods.astralsorcery.Lightwell.addLiquefaction(<midnight:miasma_surface>, <liquid:miasma>, 1, 4.0, 0xba9af5);

// Geode tooltip
<midnight:geode>.addTooltip(format.aqua(game.localize("mce.midnight.tip.throw_geode_at_wall")));

print("--- Midnight.zs initialized ---");
