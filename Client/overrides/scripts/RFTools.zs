#packmode normal

print("--- loading RFTools.zs ---");


#Remove Items
recipes.remove(<rftools:shape_card:2>);

#Add Recipes
recipes.addShaped(<rftools:shape_card:2>, [[<theaurorian:auroriancoalblock>, <mekanism:controlcircuit:3>, <theaurorian:auroriancoalblock>], [<mekanism:machineblock:15>, <twilightforest:tower_device:6>, <mekanism:machineblock:15>], [<theaurorian:auroriancoalblock>, <mekanism:teleportationcore>, <theaurorian:auroriancoalblock>]]);

print("--- RFTools.zs initialized ---");
