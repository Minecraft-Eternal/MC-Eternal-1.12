#packmode classic

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

#MC Eternal Scripts

print("--- loading ClassicModeThings.zs ---");

#Add Recipes
recipes.addShaped("unidictisameanie", <minecraft:iron_ingot>*6, [[<mysticalagriculture:iron_essence>,<mysticalagriculture:iron_essence>,<mysticalagriculture:iron_essence>],[<mysticalagriculture:iron_essence>,null,<mysticalagriculture:iron_essence>],[<mysticalagriculture:iron_essence>,<mysticalagriculture:iron_essence>,<mysticalagriculture:iron_essence>]]);

#Remove Recipes
var nocraftseeds = [<mysticalagriculture:gold_seeds>,<mysticalagriculture:diamond_seeds>,<mysticalagriculture:blaze_seeds>,<mysticalagradditions:nether_star_seeds>] as IItemStack[];
for stuff in nocraftseeds {
  recipes.remove(stuff);
 }

//Classic mode invoke of this function, default materials
scripts.AE2.redoInscriber({
		"Eng" : <ore:gemDiamond>,
		"Calc" : <ore:crystalPureCertusQuartz>,
		"Logic" : <ore:ingotGold>,
		"Sil" : <ore:itemSilicon>
  } as IIngredient[string], 
  {
    <minecraft:redstone>: 1
  },
  <ore:blockIron>
);

//BL Ancient Armor
// moved here to not let you go into BL immediately with the best armor in Challenge mode, that is a little silly
recipes.addShaped("mce_classicmode_bl_ancient_boots", <thebetweenlands:ancient_boots>, [[<futuremc:netherite_ingot>, null, <futuremc:netherite_ingot>], [<wings:fairy_dust>, <minecraft:chainmail_boots>, <wings:fairy_dust>]]);
recipes.addShaped("mce_classicmode_bl_ancient_chestplate", <thebetweenlands:ancient_chestplate>, [[<futuremc:netherite_ingot>, null, <futuremc:netherite_ingot>], [<wings:fairy_dust>, <minecraft:chainmail_chestplate>, <wings:fairy_dust>], [<wings:fairy_dust>, <wings:fairy_dust>, <wings:fairy_dust>]]);
recipes.addShaped("mce_classicmode_bl_ancient_leggings", <thebetweenlands:ancient_leggings>, [[<futuremc:netherite_ingot>, null, <futuremc:netherite_ingot>], [<wings:fairy_dust>, <minecraft:chainmail_leggings>, <wings:fairy_dust>], [<wings:fairy_dust>, null, <wings:fairy_dust>]]);
recipes.addShaped("mce_classicmode_bl_ancient_helment", <thebetweenlands:ancient_helmet>, [[<ore:dinosaurArmBone>, <futuremc:netherite_ingot>, <ore:dinosaurArmBone>], [<wings:fairy_dust>, <minecraft:chainmail_helmet>, <wings:fairy_dust>], [<wings:fairy_dust>, null, <wings:fairy_dust>]]);


//Small Storage Crate Upgrade (nice version)
recipes.addShaped("mce_classicmode_small_storage_crate_upgrade", <actuallyadditions:item_chest_to_crate_upgrade>, [
  [<ore:plankWood>, null, <ore:plankWood>],
  [<ore:chestWood>, <actuallyadditions:block_misc:4>, <ore:chestWood>],
  [<ore:plankWood>, <ore:chestWood>, <ore:plankWood>]
]);

print("--- ClassicModeThings.zs initialized ---");
