#MC Eternal Scripts

print("--- loading Immersive.zs ---");

#Remove Recipes
recipes.remove(<immersiveengineering:railgun>);
recipes.remove(<immersiveengineering:revolver>);

#Add Recipes
recipes.addShaped("railgun_mce", <immersiveengineering:railgun>, [
	[<rats:psionic_rat_brain>,<powersuits:powerarmorcomponent:7>,<immersiveengineering:material:13>],
	[<twilightforest:ice_bomb>,<immersiveengineering:material:14>,<powersuits:powerarmorcomponent:19>],
	[<immersiveengineering:material:14>,<iceandfire:fire_dragon_heart>,<mekanism:controlcircuit:3>]
]);

recipes.addShaped(<immersiveengineering:revolver>, [
  [<powersuits:powerarmorcomponent:13>,<techreborn:part:24>,<immersiveengineering:material:16>],
  [<immersiveengineering:material:14>,<immersiveengineering:material:15>,<openmodularturrets:intermediate_tiered:9>],
  [null,<techreborn:part:1>,<immersiveengineering:material:13>]
 ]);

print("--- Tooltip.zs initialized ---");
