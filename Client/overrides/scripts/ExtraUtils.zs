#MC Eternal Scripts

print("--- loading ExtrUtils.zs ---");

#Remove Items
#Angel wings
recipes.remove(<extrautils2:angelring:1>);
#Fairy wings
recipes.remove(<extrautils2:angelring:2>);
#Dragon wings
recipes.remove(<extrautils2:angelring:3>);
#Golden wings
recipes.remove(<extrautils2:angelring:4>);
#Evil wings
recipes.remove(<extrautils2:angelring:5>);
#Standard Angle Ring
recipes.remove(<extrautils2:angelring>);

#Chicken Wing Ring
recipes.remove(<extrautils2:chickenring>);
#Flying Squid Ring
recipes.remove(<extrautils2:chickenring:1>);

recipes.remove(<extrautils2:teleporter:1>);
recipes.remove(<extrautils2:lawsword>);

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
recipes.addShaped(<extrautils2:angelring>, [
    [<mekanism:crystal:1>, <mekanism:crystal:2>, <mekanism:crystal:1>],
    [<twilightforest:trophy:5>, <tconstruct:materials:50>, <thebetweenlands:ring_of_dispersion>],
    [<mekanism:crystal:1>, <simplyjetpacks:metaitemmods:29>, <mekanism:crystal:1>]
]);

#Kikoku
recipes.addShaped("mce_kikoku", <extrautils2:lawsword>, [
    [getTconPart("largeblade", "nihilite")],
    [<extrautils2:opinium:8>],
    [kikokuStick]
]);

#Chicken Wing Ring
recipes.addShaped("chickenring_mce", <extrautils2:chickenring>, [
    [<rats:feathery_wing>, <elenaidodge2:iron_feather>, <rats:feathery_wing>],
    [<elenaidodge2:iron_feather>, <fossil:chicken_essence>, <elenaidodge2:iron_feather>],
    [<ebwizardry:grand_crystal>, <elenaidodge2:iron_feather>, <ebwizardry:grand_crystal>]
]);

#Flying Squid Ring
recipes.addShaped("flying_squid_ring_mce", <extrautils2:chickenring:1>, [
    [<mysticalworld:epic_squid>, <simplyjetpacks:metaitemmods:9>|<simplyjetpacks:metaitemmods:28>, <mysticalworld:epic_squid>],
    [<xreliquary:kraken_shell>, <extrautils2:chickenring>, <inventorypets:squid_pet>],
    [<mysticalworld:epic_squid>, <roots:spell_dust>.withTag({spell_storage: {s: "roots:spell_sky_soarer"}}), <mysticalworld:epic_squid>]
]);
print("--- ExtrUtils.zs initialized ---");
