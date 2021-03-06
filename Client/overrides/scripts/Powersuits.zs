import crafttweaker.item.IItemStack;
#MC Eternal Scripts

print("--- loading Powersuit.zs ---");

#Remove Items
recipes.remove(<powersuits:powerarmorcomponent:4>);
recipes.remove(<powersuits:tinkertable>);
recipes.remove(<powersuits:powerarmor_torso>);
recipes.remove(<powersuits:power_fist>);
recipes.removeShaped(<powersuits:powerarmor_torso>, [[<techreborn:plates:36>, null, <techreborn:plates:36>], [<techreborn:plates:38>, <mekanismtools:osmiumchestplate>, <techreborn:plates:38>], [<techreborn:plates:36>, <techreborn:part:43>, <techreborn:plates:36>]]);

#add recipes
recipes.addShaped(<powersuits:tinkertable>, [[<ore:ingotKnightmetal>, <rats:arcane_technology>, <ore:ingotKnightmetal>], [<enderio:item_alloy_ingot>, <twilightforest:knightmetal_ingot>, <ore:ingotElectricalSteel>], [<ore:ingotElectricalSteel>, <ore:ingotKnightmetal>, <ore:ingotElectricalSteel>]]);
recipes.addShaped(<powersuits:powerarmorcomponent:4>, [[<jaopca:item_platedenseiridium>, <thermalfoundation:material:326>, <jaopca:item_platedenseiridium>], [<powersuits:powerarmorcomponent:12>, <powersuits:powerarmorcomponent:8>, <powersuits:powerarmorcomponent:12>], [<ore:plateDenseIridium>, <ore:platePlatinum>, <ore:plateDenseIridium>]]);
recipes.addShaped(<powersuits:tinkertable>, [[<ore:plateEmerald>, <rats:arcane_technology>, <ore:plateEmerald>], [<ore:ingotSteel>, <ore:skullZombieElectrode>, <ore:ingotSteel>], [<ore:ingotSteel>, <enderio:item_material:20>, <thermalfoundation:material:160>]]);
recipes.addShaped(<powersuits:powerarmor_torso>, [[<techreborn:plates:36>, null, <techreborn:plates:36>], [<techreborn:plates:38>, <mekanismtools:osmiumchestplate>, <techreborn:plates:38>], [<techreborn:plates:36>, <techreborn:part:43>, <techreborn:plates:36>]]);
recipes.addShaped(<powersuits:power_fist>, [[<ore:ingotEndSteel>, <openmodularturrets:intermediate_tiered:9>, <enderio:item_alloy_ingot:8>], [null, <techreborn:advanceddrill>.onlyDamageBetween(0, 10000000), null], [null, <ore:ingotVibrantAlloy>, null]]);
recipes.addShapeless(<techreborn:advanceddrill>.withTag({energy: 0}), [<techreborn:advanceddrill>]);
print("--- Powersuit.zs initialized ---");	