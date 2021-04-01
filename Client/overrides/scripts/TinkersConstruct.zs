import mods.tconstruct.Alloy;
#MC Eternal Scripts

print("--- loading TinkersConstruct.zs ---");

#Remove Steel from being maked in the tinkers smeltery
mods.tconstruct.Alloy.removeRecipe(<liquid:steel>);

print("--- TinkersConstruct.zs initialized ---");	