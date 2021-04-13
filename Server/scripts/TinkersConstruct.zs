import mods.tconstruct.Alloy;
#MC Eternal Scripts

print("--- loading TinkersConstruct.zs ---");

#Remove Steel from being maked in the tinkers smeltery
mods.tconstruct.Alloy.removeRecipe(<liquid:steel>);

#Remove Fluxed Electrum Alloying/Part Smelting
mods.tconstruct.Alloy.removeRecipe(<liquid:electrumflux>);
mods.tconstruct.Melting.removeRecipe(<liquid:electrumflux>);

print("--- TinkersConstruct.zs initialized ---");	
