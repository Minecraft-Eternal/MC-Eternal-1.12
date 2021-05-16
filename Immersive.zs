#packmode normal
#MC Eternal Scripts

print("--- loading Immersive.zs ---");

#Remove Recipe
recipes.remove(<immersiveengineering:railgun>);

#Add Recipe
recipes.addShaped(<immersiveengineering:railgun>, [[<techreborn:cable:8>,<techreborn:cable:8>,<techreborn:cable:8>], [<immersiveengineering:material:13>,<techreborn:lapotronicorb>,<powersuits:powerarmorcomponent:19>], [<immersiveengineering:material:13>,<immersiveengineering:material:14>,<immersiveengineering:material:14>]]);

print("--- Tooltip.zs initialized ---");