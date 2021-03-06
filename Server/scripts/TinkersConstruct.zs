import mods.tconstruct.Alloy;
#MC Eternal Scripts

print("--- loading TinkersConstruct.zs ---");

#Remove Items
mods.tconstruct.Alloy.removeRecipe(<liquid:steel>);

#Add recipe
mods.tconstruct.Alloy.addRecipe(<liquid:iron> * 9, [<liquid:coal> * 25, <liquid:steel> * 9]);

print("--- TinkersConstruct.zs initialized ---");	