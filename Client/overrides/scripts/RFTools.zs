#packmode normal

print("--- loading RFTools.zs ---");


#Remove Items
recipes.remove(<rftools:builder>);
recipes.remove(<rftoolsdim:dimension_builder>);

#Add Recipes
recipes.addShaped(<rftools:builder>, [[<theaurorian:auroriancoalblock>, <mekanism:controlcircuit:3>, <theaurorian:auroriancoalblock>], [<mekanism:machineblock:15>, <twilightforest:tower_device:6>, <mekanism:machineblock:15>], [<theaurorian:auroriancoalblock>, <mekanism:teleportationcore>, <theaurorian:auroriancoalblock>]]);
recipes.addShaped(<rftoolsdim:dimension_builder>, [[<futuremc:netherite_ingot>, <futuremc:netherite_ingot>, <futuremc:netherite_ingot>], [<mekanism:machineblock:15>, <ore:blockAurorianSteel>, <mekanism:machineblock:15>], [<mekanism:teleportationcore>, <mekanism:robit>, <mekanism:teleportationcore>]]);

print("--- RFTools.zs initialized ---");
