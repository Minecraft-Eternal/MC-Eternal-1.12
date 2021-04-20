import mods.chisel.Carving;
#MC Eternal Scripts

print("--- loading Timber.zs ---");

val woodTypes = ["oak", "spruce", "birch", "jungle", "acacia", "dark_oak"] as string[];

for woodType in woodTypes {
    mods.chisel.Carving.addGroup("timberframe_" + woodType);
    
    for item in itemUtils.getItemsByRegexRegistryName("structurize:blocktimberframe_" + woodType + "_.*") {
        mods.chisel.Carving.addVariation("timberframe_" + woodType, item);
    }
}

print("--- Timber.zs initialized ---");	