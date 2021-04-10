import crafttweaker.data.IData;
#MC Eternal Scripts

print("--- loading StarmetalFix.zs ---");

#script by Emperdog

var mat1partnames = ["conarm:armor_trim","tconstruct:tool_rod","tconstruct:wide_guard","tconstruct:hand_guard","tconstruct:cross_guard","tconstruct:binding","tconstruct:knife_blade"] as string[];

for part in mat1partnames {
mods.tconstruct.Casting.addTableRecipe(itemUtils.getItem(part).withTag({Material: "starmetal"}),<tconstruct:cast>.withTag({PartType: part as string} as IData),<liquid:astral_starmetal>, 144, false, 85);
}

var mat2partnames = ["tconstruct:sharpening_kit","tconstruct:shovel_head","tconstruct:arrow_head","tconstruct:kama_head","tconstruct:sword_blade","conarm:polishing_kit"] as string[];

for part in mat2partnames {
mods.tconstruct.Casting.addTableRecipe(itemUtils.getItem(part).withTag({Material: "starmetal"}),<tconstruct:cast>.withTag({PartType: part as string} as IData),<liquid:astral_starmetal>, 288, false, 150);
}

var mat3partnames = ["conarm:armor_plate","tconstruct:bow_limb","tconstruct:sign_head","tconstruct:tough_tool_rod","tconstruct:tough_binding","tconstruct:pick_head","tconstruct:axe_head"] as string[];

for part in mat3partnames {
mods.tconstruct.Casting.addTableRecipe(itemUtils.getItem(part).withTag({Material: "starmetal"}),<tconstruct:cast>.withTag({PartType: part as string} as IData),<liquid:astral_starmetal>, 432, false, 210);
}

var mat4partnames = ["conarm:boots_core","conarm:helmet_core","tconstruct:pan_head"] as string[];

for part in mat4partnames {
mods.tconstruct.Casting.addTableRecipe(itemUtils.getItem(part).withTag({Material: "starmetal"}),<tconstruct:cast>.withTag({PartType: part as string} as IData),<liquid:astral_starmetal>, 576, false, 275);
}

var mat5partnames = ["conarm:leggings_core"] as string[];

for part in mat5partnames {
mods.tconstruct.Casting.addTableRecipe(itemUtils.getItem(part).withTag({Material: "starmetal"}),<tconstruct:cast>.withTag({PartType: part as string} as IData),<liquid:astral_starmetal>, 720, false, 337);
}

var mat6partnames = ["conarm:chest_core"] as string[];

for part in mat6partnames {
mods.tconstruct.Casting.addTableRecipe(itemUtils.getItem(part).withTag({Material: "starmetal"}),<tconstruct:cast>.withTag({PartType: part as string} as IData),<liquid:astral_starmetal>, 864, false, 400);
}

var mat8partnames = ["tconstruct:large_sword_blade","tconstruct:broad_axe_head","tconstruct:excavator_head","tconstruct:hammer_head","tconstruct:large_plate","tconstruct:scythe_head"] as string[];

for part in mat8partnames {
mods.tconstruct.Casting.addTableRecipe(itemUtils.getItem(part).withTag({Material: "starmetal"}),<tconstruct:cast>.withTag({PartType: part as string} as IData),<liquid:astral_starmetal>, 1152, false, 525);
}

print("--- StarmetalFix.zs initialized ---");
