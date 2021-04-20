#MC Eternal Scripts

print("--- loading GhostsExplosives.zs ---");

#Remove Items
recipes.remove(<ghostsexplosives:dust_charcoal>);
recipes.remove(<ghostsexplosives:tnt_nuclear>);
recipes.removeShaped(<ghostsexplosives:dust_charcoal> * 2, [[<ore:itemCharcoal>]]);

#Add Recipes
recipes.addShapeless(<ghostsexplosives:dust_charcoal> * 2, [<ore:toolMortarandpestle>, <ore:itemCharcoal>]);
recipes.addShaped(<ghostsexplosives:tnt_nuclear>, [[<ghostsexplosives:tnt_x1000>, <ghostsexplosives:block_uranium>, <ghostsexplosives:tnt_x1000>], [<ghostsexplosives:block_uranium>, <ore:depletedFuelHECf251Oxide>, <ghostsexplosives:block_uranium>], [<ghostsexplosives:tnt_x1000>, <ghostsexplosives:block_uranium>, <ghostsexplosives:tnt_x1000>]]);

print("--- GhostsExplosives.zs initialized ---");	