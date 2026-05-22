#loader contenttweaker
#priority 1

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;
import mods.contenttweaker.Color;

#MC Eternal Scripts

print("--- loading contenttweaker/contenttweaker.zs ---");

//Item registry
val simpleItems as string[] = [
    "sky_scarab_crest",
    "kikoku_stick",
    "die_fragment",
    "living_alloy",
    "amalgameat",
    "revival_gem",
    "vampiric_catalyst"
    //"hive_mind"
];

for name in simpleItems {
    VanillaFactory.createItem(name).register();
}


//Fluid registry
val simpleFluids as string[string] = {
    "industrial_dye_blend": "676E85",
    "soul_dye_blend": "523837",
    "enhanced_dye_blend": "3B3540"
};

for name,color in simpleFluids {
    VanillaFactory.createFluid(name, Color.fromHex(color)).register();
}

print("--- contenttweaker/contenttweaker.zs initialized ---");