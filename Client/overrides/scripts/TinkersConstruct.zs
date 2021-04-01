import mods.tconstruct.Alloy;
#MC Eternal Scripts

print("--- loading TinkersConstruct.zs ---");

#Remove Steel from being maked in the tinkers smeltery
mods.tconstruct.Alloy.removeRecipe(<liquid:steel>);

#Remove Fluxed Electrum Alloying/Part Smelting
mods.tconstruct.Alloy.removeRecipe(<liquid:molten_electrumflux>);
mods.tconstruct.Melting.removeRecipe(<liquid:molten_electrumflux>);

print("--- TinkersConstruct.zs initialized ---");	
