import mods.tconstruct.Alloy;
#MC Eternal Scripts

print("--- loading TinkersConstruct.zs ---");

#Remove Steel from being maked in the tinkers smeltery
mods.tconstruct.Alloy.removeRecipe(<liquid:steel>);

#Remove Fluxed Electrum Alloying/Part Smelting
mods.tconstruct.Alloy.removeRecipe(<liquid:electrumflux>);
mods.tconstruct.Melting.removeRecipe(<liquid:electrumflux>);

#Add alternate Mirion alloying
mods.tconstruct.Alloy.addRecipe(<liquid:mirion>*72, [<liquid:manasteel>*18, <liquid:elvenelementium>*18, <liquid:terrasteel>*18, <liquid:cobalt>*18, <liquid:glass>*125]);

#Nihilite
// commit space :pointingrat:
recipes.addShapeless("nihilite_mce", <taiga:nihilite_block>, [<taiga:solarium_block>, <taiga:vibranium_block>, <erebus:materials:64>]);
mods.tconstruct.Alloy.removeRecipe(<liquid:nihilite_fluid>);

print("--- TinkersConstruct.zs initialized ---");	
