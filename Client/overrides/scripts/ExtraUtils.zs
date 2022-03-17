#MC Eternal Scripts

print("--- loading ExtrUtils.zs ---");

#Remove Items
#Angel wings
recipes.remove(<extrautils2:angelring:1>);
#Fairy wings
recipes.remove(<extrautils2:angelring:2>);
#Dragon wings
recipes.remove(<extrautils2:angelring:3>);
#Golden Wings
recipes.remove(<extrautils2:angelring:4>);
#Evil wings
recipes.remove(<extrautils2:angelring:5>);
#Standard Angle Ring
recipes.remove(<extrautils2:angelring>);

recipes.remove(<extrautils2:teleporter:1>);
recipes.remove(<extrautils2:lawsword>);
recipes.remove(<extrautils2:quarry>);

#Add Recipes
#Clear wings
recipes.addShaped(<extrautils2:angelring>, [[<botania:phantomink>, <extrautils2:angelring:*>]]);
#Angel wings
recipes.addShaped(<extrautils2:angelring:1>, [[<mekanism:crystal:2>, <extrautils2:angelring:*>]]);
#Fairy wings
recipes.addShaped(<extrautils2:angelring:2>, [[<harvestcraft:fairybreaditem>, <extrautils2:angelring:*>]]);
#Dragon wings
recipes.addShaped(<extrautils2:angelring:3>, [[<extrautils2:ingredients:11>, <extrautils2:angelring:*>]]);
#Golden wings
recipes.addShaped(<extrautils2:angelring:4>, [[<extrautils2:angelblock>, <extrautils2:angelring:*>]]);
#Evil wings
recipes.addShaped(<extrautils2:angelring:5>, [[<midnight:nagrilite_ingot>, <extrautils2:angelring:*>]]);
#Crafting recipe normal angle ring
recipes.addShaped(<extrautils2:angelring>, [[<mekanism:crystal:1>, <mekanism:crystal:2>, <mekanism:crystal:1>], [<twilightforest:trophy:5>, <tconstruct:materials:50>, <thebetweenlands:ring_of_dispersion>], [<mekanism:crystal:1>, <simplyjetpacks:metaitemmods:29>, <mekanism:crystal:1>]]);
#Kikoku
recipes.addShaped(<extrautils2:lawsword>, [[<extrautils2:opinium:8>], [<extrautils2:opinium:8>], [<theaurorian:livingdiviningrod>]]);
#Quantum Quarry
recipes.addShaped(<extrautils2:quarry>, [[<ore:blockCerulean>, <theaurorian:moongem>, <ore:blockCerulean>], [<theaurorian:moongem>, <ore:magic_snow_globe>, <theaurorian:moongem>], [<ore:blockCerulean>, <theaurorian:moongem>, <ore:blockCerulean>]]);

print("--- ExtrUtils.zs initialized ---");
