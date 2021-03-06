#MC Eternal Scripts

print("--- loading ExtrUtils.zs ---");

#Remove Items
#Glass wings
recipes.remove(<extrautils2:angelring:1>);
#fairy wings
recipes.remove(<extrautils2:angelring:2>);
#Dragon wings
recipes.remove(<extrautils2:angelring:3>);
#Golden Wings
recipes.remove(<extrautils2:angelring:4>);
#Black wings
recipes.remove(<extrautils2:angelring:5>);
#Standard Angle Ring
recipes.remove(<extrautils2:angelring>);

recipes.remove(<extrautils2:teleporter:1>);

#Add Recipes
#Glass wings
recipes.addShaped(<extrautils2:angelring:1>, [[<mekanism:crystal:2>, <extrautils2:angelring>]]);
#fairy wings
recipes.addShaped(<extrautils2:angelring:2>, [[<harvestcraft:fairybreaditem>, <extrautils2:angelring>]]);
#Dragon wings
recipes.addShaped(<extrautils2:angelring:3>, [[<extrautils2:ingredients:11>, <extrautils2:angelring>]]);
#Golden Wings
recipes.addShaped(<extrautils2:angelring:4>, [[<extrautils2:angelblock>, <extrautils2:angelring>]]);
#Black wings
recipes.addShaped(<extrautils2:angelring:5>, [[<midnight:nagrilite_ingot>, <extrautils2:angelring>]]);
#Crafting recipe normal angle ring
recipes.addShaped(<extrautils2:angelring>, [[<mekanism:crystal:1>, <mekanism:crystal:2>, <mekanism:crystal:1>], [<twilightforest:trophy:5>, <tconstruct:materials:50>, <thebetweenlands:ring_of_dispersion>], [<mekanism:crystal:1>, <simplyjetpacks:metaitemmods:29>, <mekanism:crystal:1>]]);

print("--- ExtrUtils.zs initialized ---");