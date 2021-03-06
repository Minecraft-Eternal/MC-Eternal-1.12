#MC Eternal Scripts

print("--- loading ICBM.zs ---");

#Remove Items
recipes.remove(<icbmclassic:launcherbase:1>);
recipes.remove(<icbmclassic:launcherframe>);
recipes.remove(<icbmclassic:launcherbase>);
recipes.remove(<icbmclassic:explosives:1>);
recipes.remove(<icbmclassic:explosives:22>);
recipes.remove(<icbmclassic:explosives>);
recipes.remove(<icbmclassic:explosives:15>);
recipes.remove(<icbmclassic:explosives:23>);
recipes.remove(<icbmclassic:batterybox>);
recipes.remove(<icbmclassic:battery>);
recipes.remove(<icbmclassic:emptower>);
recipes.removeShaped(<icbmclassic:launcherbase:1>, [[<mekanism:ingot>, <techreborn:cable:6>, <mekanism:ingot>], [<mekanism:ingot>, <icbmclassic:launcherbase>, <mekanism:ingot>], [<mekanism:ingot>, <techreborn:lapotroncrystal>, <mekanism:ingot>]]);

#Add recipes
recipes.addShaped(<icbmclassic:explosives:22>, [[<techreborn:ingot:25>, <techreborn:plates:38>, <techreborn:ingot:25>], [<extrautils2:compressedcobblestone:7>, <icbmclassic:explosives:15>, <extrautils2:compressedcobblestone:7>], [<techreborn:ingot:25>, <minecraft:bedrock>, <techreborn:ingot:25>]]);
recipes.addShaped(<icbmclassic:explosives:23>, [[<extrautils2:compressedcobblestone:7>, <extrautils2:compressedcobblestone:7>, <extrautils2:compressedcobblestone:7>], [<extrautils2:compressedcobblestone:7>, <icbmclassic:explosives:15>, <extrautils2:compressedcobblestone:7>], [<extrautils2:compressedcobblestone:7>, <extrautils2:compressedcobblestone:7>, <extrautils2:compressedcobblestone:7>]]);
recipes.addShaped(<icbmclassic:launcherbase:1>, [[<mekanism:ingot>, <techreborn:cable:6>, <mekanism:ingot>], [<mekanism:ingot>, <icbmclassic:launcherbase>, <mekanism:ingot>], [<mekanism:ingot>, <techreborn:lapotroncrystal>, <mekanism:ingot>]]);
recipes.addShaped(<icbmclassic:launcherframe>, [[<techreborn:plates:2>, <techreborn:cable:6>, <techreborn:plates:2>], [<techreborn:plates:2>, null, <techreborn:plates:2>], [<techreborn:plates:2>, <techreborn:lapotroncrystal>, <techreborn:plates:2>]]);
recipes.addShaped(<icbmclassic:launcherbase>, [[<techreborn:plates:2>, null, <techreborn:plates:2>], [<techreborn:plates:2>, <techreborn:cable:6>, <techreborn:plates:2>], [<techreborn:plates:2>, <techreborn:lapotroncrystal>, <techreborn:plates:2>]]);
recipes.addShaped(<icbmclassic:explosives:1>, [[<techreborn:cable:6>, <ore:plateCarbon>, <ore:insulatedGoldCableItem>], [<ore:plateCarbon>, <icbmclassic:explosives>, <ore:plateCarbon>], [<ore:insulatedGoldCableItem>, <techreborn:plates:2>, <ore:insulatedGoldCableItem>]]);
recipes.addShaped(<icbmclassic:explosives:22>, [[<extrautils2:compressednetherrack:5>, <extrautils2:compressedcobblestone:7>, <extrautils2:compressednetherrack:5>], [<extrautils2:compressednetherrack:5>, <tconstruct:shard>, <extrautils2:compressednetherrack:5>], [<extrautils2:compressednetherrack:5>, <extrautils2:compressedcobblestone:7>, <extrautils2:compressednetherrack:5>]]);
recipes.addShaped(<icbmclassic:explosives>, [[<mekanism:obsidiantnt>, <mekanism:ingot>, <mekanism:obsidiantnt>], [<mekanism:ingot>, <ghostsexplosives:tnt_x100>, <mekanism:ingot>], [<mekanism:obsidiantnt>, <mekanism:ingot>, <mekanism:obsidiantnt>]]);
recipes.addShaped(<icbmclassic:explosives:15>, [[<techreborn:ingot:25>, <techreborn:plates:38>, <techreborn:ingot:25>], [<techreborn:plates:38>, <ghostsexplosives:tnt_nuclear>, <techreborn:plates:38>], [<techreborn:ingot:25>, <techreborn:plates:38>, <techreborn:ingot:25>]]);

print("--- ICBM.zs initialized ---");	