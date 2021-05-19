#packmode normal
#MC Eternal Scripts

print("--- loading Immersive.zs ---");

#Remove Recipes
recipes.remove(<immersiveengineering:railgun>);
recipes.remove(<immersiveengineering:revolver>);

#Add Recipes
recipes.addShaped(<immersiveengineering:railgun>, [[<techreborn:cable:8>,<techreborn:cable:8>,<techreborn:cable:8>], [<immersiveengineering:material:13>,<powersuits:powerarmorcomponent:8>,<powersuits:powerarmorcomponent:19>], [<immersiveengineering:material:13>,<immersiveengineering:material:14>,<immersiveengineering:material:14>]]);
recipes.addShaped(<immersiveengineering:revolver>, [[<powersuits:powerarmorcomponent:13>,<techreborn:part:24>,<immersiveengineering:material:16>], [<immersiveengineering:material:14>,<immersiveengineering:material:15>,<immersiveintelligence:material:14>], [null,<techreborn:part:1>,<immersiveengineering:material:13>]]);

print("--- Tooltip.zs initialized ---");
