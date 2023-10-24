import mods.immersiveengineering.Excavator;
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

recipes.addShaped("revolver_mce", <immersiveengineering:revolver>, [
  [<powersuits:powerarmorcomponent:13>,<techreborn:part:24>,<immersiveengineering:material:16>],
  [<immersiveengineering:material:14>,<immersiveengineering:material:15>,<openmodularturrets:intermediate_tiered:9>],
  [null,<techreborn:part:1>,<immersiveengineering:material:13>]
]);

// Mineral Mixes :>
Excavator.addMineral("Fissile", 60, 0.1, ["oreUranium", "oreThorium"], [0.5, 0.3], [10]);
Excavator.addMineral("Osmiron", 20, 0.2, ["oreOsmium", "blockIron", "oreIron"], [0.2, 0.1, 0.5], [10]);
Excavator.addMineral("Atometal", 20, 0.1, ["oreBoron", "oreLithium", "oreMagnesium"], [0.35, 0.25, 0.2], [10]);

Excavator.getMineral("Platinum").removeOre("oreIridium");

print("--- Tooltip.zs initialized ---");
