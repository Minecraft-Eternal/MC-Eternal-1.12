#MC Eternal Scripts

print("--- loading InventoryPets.zs ---");

#Remove Items
recipes.remove(<inventorypets:nugget_coal>);
recipes.remove(<mekanismgenerators:generator:3>);
recipes.remove(<extrautils2:quarry>);
recipes.remove(<rftools:builder>);
recipes.remove(<mekanismgenerators:reactor>);
recipes.remove(<rftoolsdim:dimension_builder>);
recipes.remove(<mekanism:machineblock:4>);
recipes.remove(<wings:monarch_butterfly_wings>);
recipes.removeShapeless(<inventorypets:nugget_coal> * 8, [<minecraft:coal>]);

#Add Recipes
recipes.addShapeless(<inventorypets:nugget_coal> * 8, [<immersiveengineering:tool>, <ore:itemCoal>]);
recipes.addShaped(<rats:arcane_technology>, [[<futuremc:netherite_ingot>, <ebwizardry:magic_crystal>, <futuremc:netherite_ingot>], [<wings:fairy_dust>, <minecraft:emerald_block>, <wings:fairy_dust>], [<futuremc:netherite_ingot>, <ebwizardry:magic_crystal>, <futuremc:netherite_ingot>]]);
recipes.addShaped(<ebwizardry:arcane_tome:3>, [[<iceandfire:sea_serpent_scale_block_purple>, <ebwizardry:magic_crystal>, <iceandfire:sea_serpent_scale_block_purple>], [<wings:fairy_dust>, <ancientspellcraft:charm_evergrowing_crystal>, <wings:fairy_dust>], [<iceandfire:sea_serpent_scale_block_purple>, <ebwizardry:magic_crystal>, <iceandfire:sea_serpent_scale_block_purple>]]);
recipes.addShaped(<biomesoplenty:sapling_0:3>, [[<wings:fairy_dust>, <ebwizardry:magic_crystal>, <wings:fairy_dust>], [<wings:fairy_dust>, <ore:treeSapling>, <wings:fairy_dust>], [<wings:fairy_dust>, <ebwizardry:magic_crystal>, <wings:fairy_dust>]]);
recipes.addShaped(<ebwizardry:grand_crystal>, [[<ebwizardry:magic_crystal>, <ebwizardry:magic_crystal>, <ebwizardry:magic_crystal>], [<wings:fairy_dust>, <ebwizardry:magic_crystal>, <wings:fairy_dust>], [<ebwizardry:magic_crystal>, <ebwizardry:magic_crystal>, <ebwizardry:magic_crystal>]]);
recipes.addShaped(<ebwizardry:charm_haggler>, [[<minecraft:gold_ingot>, <minecraft:gold_block>, <ore:ingotGold>], [<wings:fairy_dust>, <minecraft:gold_ingot>, <wings:fairy_dust>], [null, <minecraft:gold_block>, null]]);
recipes.addShaped(<ebwizardry:charm_spell_discovery>, [[<minecraft:gold_ingot>, <minecraft:gold_block>, <ore:ingotGold>], [<wings:fairy_dust>, <minecraft:gold_ingot>, <wings:fairy_dust>], [null, <wings:fairy_dust>, null]]);
recipes.addShaped(<ebwizardry:amulet_banishing>, [[<minecraft:gold_ingot>, null, <ore:ingotGold>], [null, <minecraft:gold_ingot>, null], [null, <wings:fairy_dust>, null]]);
recipes.addShaped(<twilightforest:minotaur_axe_gold>, [[<minecraft:gold_ingot>, <minecraft:gold_ingot>], [<minecraft:gold_ingot>, <wings:fairy_dust>], [null, <wings:fairy_dust>]]);
recipes.addShaped(<ancientwarfarestructure:golden_idol>, [[null, <ore:blockGold>, null], [<minecraft:gold_block>, <ore:dustFairy>, <ore:blockGold>], [<ore:blockGold>, <ancientwarfarestructure:coin_stack_gold>, <minecraft:gold_block>]]);
recipes.addShaped(<minecraft:iron_ingot>, [[null, <ore:dustFairy>, null], [<ore:dustFairy>, <minecraft:gold_ingot>, <ore:dustFairy>], [null, <ore:dustFairy>, null]]);
recipes.addShaped(<minecraft:gold_ingot>, [[null, <ore:dustFairy>, null], [<ore:dustFairy>, <ore:ingotIron>, <ore:dustFairy>], [null, <ore:dustFairy>, null]]);
recipes.addShaped(<ancientspellcraft:charm_bucket_coal>, [[<wings:fairy_dust>, null, <wings:fairy_dust>], [<wings:fairy_dust>, <minecraft:coal>, <wings:fairy_dust>], [null, <wings:fairy_dust>, null]]);
recipes.addShaped(<twilightforest:magic_beans>, [[<wings:fairy_dust>, <wings:fairy_dust>, <wings:fairy_dust>], [<wings:fairy_dust>, <mowziesmobs:foliaath_seed>, <wings:fairy_dust>], [<wings:fairy_dust>, <wings:fairy_dust>, <wings:fairy_dust>]]);
recipes.addShaped(<thebetweenlands:ancient_boots>, [[<futuremc:netherite_ingot>, null, <futuremc:netherite_ingot>], [<wings:fairy_dust>, <minecraft:chainmail_boots>, <wings:fairy_dust>]]);
recipes.addShaped(<thebetweenlands:ancient_chestplate>, [[<futuremc:netherite_ingot>, null, <futuremc:netherite_ingot>], [<wings:fairy_dust>, <minecraft:chainmail_chestplate>, <wings:fairy_dust>], [<wings:fairy_dust>, <wings:fairy_dust>, <wings:fairy_dust>]]);
recipes.addShaped(<thebetweenlands:ancient_leggings>, [[<futuremc:netherite_ingot>, null, <futuremc:netherite_ingot>], [<wings:fairy_dust>, <minecraft:chainmail_leggings>, <wings:fairy_dust>], [<wings:fairy_dust>, null, <wings:fairy_dust>]]);
recipes.addShaped(<thebetweenlands:ancient_helmet>, [[<ancientwarfare:component:5>, null, <ancientwarfare:component:5>], [<wings:fairy_dust>, <minecraft:chainmail_helmet>, <wings:fairy_dust>], [<wings:fairy_dust>, null, <wings:fairy_dust>]]);
recipes.addShaped(<cyclicmagic:purple_chestplate>, [[<ore:dustFairy>, <minecraft:sea_lantern>, <wings:fairy_dust>], [<wings:fairy_dust>, <minecraft:iron_chestplate>, <wings:fairy_dust>], [<wings:fairy_dust>, <minecraft:sea_lantern>, <wings:fairy_dust>]]);
recipes.addShaped(<minecraft:dirt:2>, [[null, <wings:fairy_dust>, null], [<wings:fairy_dust>, <minecraft:dirt>, <wings:fairy_dust>], [null, <ore:dustFairy>, null]]);
recipes.addShaped(<minecraft:sand>, [[null, <wings:fairy_dust>, null], [<wings:fairy_dust>, <minecraft:gravel>, <wings:fairy_dust>], [null, <ore:dustFairy>, null]]);
recipes.addShaped(<minecraft:gravel>, [[null, <wings:fairy_dust>, null], [<wings:fairy_dust>, <minecraft:sand>, <wings:fairy_dust>], [null, <ore:dustFairy>, null]]);
recipes.addShaped(<theaurorian:moonstonesword>, [[null, <futuremc:netherite_scrap>, <futuremc:netherite_ingot>], [null, <minecraft:diamond_sword>, <futuremc:netherite_scrap>], [<wings:fairy_dust>, null, null]]);
recipes.addShaped(<twilightforest:ice_sword>, [[null, <wings:fairy_dust>, <wings:fairy_dust>], [null, <minecraft:golden_sword>, <wings:fairy_dust>], [<wings:fairy_dust>, null, null]]);
recipes.addShaped(<twilightforest:steeleaf_sword>, [[null, <ore:dustFairy>, <wings:fairy_dust>], [null, <minecraft:iron_sword>, <wings:fairy_dust>], [<wings:fairy_dust>, null, null]]);
recipes.addShaped(<harvestcraft:fairybreaditem>, [[null, <wings:fairy_dust>, null], [<wings:fairy_dust>, <harvestcraft:cinnamonbreaditem>, <wings:fairy_dust>], [null, <wings:fairy_dust>, null]]);
recipes.addShaped(<ebwizardry:magic_crystal>, [[<wings:fairy_dust>]]);
recipes.addShaped(<ebwizardry:amulet_warding>, [[null, <ebwizardry:magic_crystal>, null], [<ore:dustFairy>, <minecraft:iron_block>, <ore:dustFairy>], [null, <ebwizardry:magic_crystal>, null]]);
recipes.addShaped(<ancientspellcraft:ring_mana_transfer>, [[null, <ebwizardry:magic_crystal>, null], [<ore:dustFairy>, <dungeontactics:golden_ring>, <ore:dustFairy>], [null, <ebwizardry:magic_crystal>, null]]);
recipes.addShaped(<ancientspellcraft:ring_prismarine>, [[null, <ore:gemPrismarine>, null], [<ore:dustFairy>, <dungeontactics:golden_ring>, <ore:dustFairy>], [null, <ore:gemPrismarine>, null]]);
recipes.addShaped(<ebwizardry:ring_battlemage>, [[null, <ore:dustFairy>, null], [<ore:dustFairy>, <dungeontactics:golden_ring>, <ore:dustFairy>], [null, <ore:dustFairy>, null]]);
recipes.addShaped(<mekanismgenerators:generator:3>, [[<mekanism:clump:2>, <mekanism:atomicalloy>, <mekanism:clump:2>], [<futuremc:netherite_block>, <mekanism:electrolyticcore>, <futuremc:netherite_block>], [<mekanism:clump:2>, <mekanism:atomicalloy>, <mekanism:clump:2>]]);
recipes.addShaped(<extrautils2:quarry>, [[<ore:blockCerulean>, <theaurorian:moongem>, <ore:blockCerulean>], [<theaurorian:moongem>, <ore:magic_snow_globe>, <theaurorian:moongem>], [<ore:blockCerulean>, <theaurorian:moongem>, <ore:blockCerulean>]]);
recipes.addShaped(<mekanismgenerators:reactor>, [[<mekanism:controlcircuit:3>, <thaumicaugmentation:starfield_glass:2>, <mekanism:controlcircuit:3>], [<ore:blockNetherite>, <advancedrocketry:chemicalreactor>.giveBack(<advancedrocketry:chemicalreactor>), <futuremc:netherite_block>], [<ore:blockNetherite>, <ore:blockAurorianSteel>, <ore:blockNetherite>]]);
recipes.addShaped(<rftools:builder>, [[<theaurorian:auroriancoalblock>, <mekanism:controlcircuit:3>, <theaurorian:auroriancoalblock>], [<mekanism:machineblock:15>, <twilightforest:tower_device:6>, <mekanism:machineblock:15>], [<theaurorian:auroriancoalblock>, <mekanism:teleportationcore>, <theaurorian:auroriancoalblock>]]);
recipes.addShaped(<rftoolsdim:dimension_builder>, [[<futuremc:netherite_ingot>, <futuremc:netherite_ingot>, <futuremc:netherite_ingot>], [<mekanism:machineblock:15>, <ore:blockAurorianSteel>, <mekanism:machineblock:15>], [<mekanism:teleportationcore>, <mekanism:robit>, <mekanism:teleportationcore>]]);
recipes.addShaped(<mekanism:machineblock:4>, [[<ore:alloyUltimate>, <mekanism:controlcircuit:3>, <ore:alloyUltimate>], [<mekanism:machineblock:15>, <mekanism:robit>, <mekanism:machineblock:15>], [<mekanism:teleportationcore>, <futuremc:netherite_block>, <mekanism:teleportationcore>]]);
recipes.addShaped(<wings:monarch_butterfly_wings>, [[<mysticalagriculture:mystical_flower_essence>, <ore:gemAmethyst>, <mysticalagriculture:mystical_flower_essence>], [<futuremc:netherite_ingot>, <ore:dustFairy>, <ore:ingotNetherite>], [<ore:ingotNetherite>, null, <ore:ingotNetherite>]]);

print("--- InventoryPets.zs initialized ---");	