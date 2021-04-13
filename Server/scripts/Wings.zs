#MC Eternal Scripts

print("--- loading Wings.zs ---");

#Remove Recipes
recipes.remove(<wings:evil_wings>);
recipes.remove(<wings:dragon_wings>);
recipes.remove(<wings:angel_wings>);
recipes.remove(<wings:slime_wings>);
recipes.remove(<wings:blue_butterfly_wings>);
recipes.remove(<wings:fire_wings>);
recipes.remove(<wings:bat_wings>);
recipes.remove(<wings:fairy_wings>);
recipes.remove(<wings:monarch_butterfly_wings>);

#Add Recipes
recipes.addShaped(<wings:bat_wings>, [[<wings:bat_blood>, <wings:amethyst>, <wings:bat_blood>], [<ore:ingotNetherite>, <ore:dustFairy>, <ore:ingotNetherite>], [<ore:ingotNetherite>, null, <ore:ingotNetherite>]]);
recipes.addShaped(<wings:fire_wings>, [[<mod_lavacow:mootenheart>, <wings:amethyst>, <mod_lavacow:mootenheart>], [<ore:ingotNetherite>, <ore:dustFairy>, <ore:ingotNetherite>], [<ore:ingotNetherite>, null, <ore:ingotNetherite>]]);
recipes.addShaped(<wings:blue_butterfly_wings>, [[<minecraft:lapis_block>, <wings:amethyst>, <minecraft:lapis_block>], [<ore:ingotNetherite>, <ore:dustFairy>, <ore:ingotNetherite>], [<ore:ingotNetherite>, null, <ore:ingotNetherite>]]);
recipes.addShaped(<wings:fairy_wings>, [[<fairylights:light:9>, <wings:amethyst>, <fairylights:light:9>], [<ore:ingotNetherite>, <ore:dustFairy>, <ore:ingotNetherite>], [<ore:ingotNetherite>, null, <ore:ingotNetherite>]]);
recipes.addShaped(<wings:slime_wings>, [[<minecraft:slime>, <wings:amethyst>, <minecraft:slime>], [<ore:ingotNetherite>, <ore:dustFairy>, <ore:ingotNetherite>], [<ore:ingotNetherite>, null, <ore:ingotNetherite>]]);
recipes.addShaped(<wings:dragon_wings>, [[<rats:dragon_wing>, <wings:amethyst>, <rats:dragon_wing>], [<ore:ingotNetherite>, <ore:dustFairy>, <ore:ingotNetherite>], [<ore:ingotNetherite>, null, <ore:ingotNetherite>]]);
recipes.addShaped(<wings:angel_wings>, [[<ore:dustFairy>, <wings:amethyst>, <ore:dustFairy>], [<ore:ingotNetherite>, <ore:dustFairy>, <ore:ingotNetherite>], [<ore:ingotNetherite>, null, <ore:ingotNetherite>]]);
recipes.addShaped(<wings:evil_wings>, [[<ore:blockCoal>, <wings:amethyst>, <ore:blockCoal>], [<ore:ingotNetherite>, <ore:dustFairy>, <ore:ingotNetherite>], [<ore:ingotNetherite>, null, <ore:ingotNetherite>]]);

print("--- Wings.zs initialized ---");