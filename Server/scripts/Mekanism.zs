#MC Eternal Scripts

print("--- loading Mekanism.zs ---");

#Remove Item(s)
recipes.remove(<mekanism:salt>);
recipes.remove(<mekanism:machineblock:8>);
recipes.remove(<mekanism:machineblock:4>);
recipes.remove(<mekanismgenerators:reactor>);
recipes.remove(<mekanismgenerators:generator:3>);

#Add Recipe(s)
recipes.addShaped(<mekanism:machineblock:8>, [[<futuremc:netherite_ingot>, <ancientwarfarevehicle:major_alloy>, <futuremc:netherite_ingot>], [<minecraft:redstone>, <mekanism:basicblock>, <minecraft:redstone>], [<futuremc:netherite_ingot>, <ancientwarfarevehicle:major_alloy>, <futuremc:netherite_ingot>]]);
recipes.addShaped(<mekanism:machineblock:4>, [[<ore:alloyUltimate>, <mekanism:controlcircuit:3>, <ore:alloyUltimate>], [<mekanism:machineblock:15>, <mekanism:robit>, <mekanism:machineblock:15>], [<mekanism:teleportationcore>, <futuremc:netherite_block>, <mekanism:teleportationcore>]]);
recipes.addShaped(<mekanismgenerators:reactor>, [[<mekanism:controlcircuit:3>, <thaumicaugmentation:starfield_glass:2>, <mekanism:controlcircuit:3>], [<ore:blockNetherite>, <advancedrocketry:chemicalreactor>.giveBack(<advancedrocketry:chemicalreactor>), <futuremc:netherite_block>], [<ore:blockNetherite>, <ore:blockAurorianSteel>, <ore:blockNetherite>]]);
recipes.addShaped(<mekanismgenerators:generator:3>, [[<mekanism:clump:2>, <mekanism:atomicalloy>, <mekanism:clump:2>], [<futuremc:netherite_block>, <mekanism:electrolyticcore>, <futuremc:netherite_block>], [<mekanism:clump:2>, <mekanism:atomicalloy>, <mekanism:clump:2>]]);

print("--- Mekanism.zs initialized ---");	