import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
#MC Eternal Scripts

print("--- loading Decaster.zs ---");

#list of Part types
var allparttypes = [
"tconstruct:pick_head",
"tconstruct:shovel_head",
"tconstruct:axe_head",
"tconstruct:broad_axe_head",
"tconstruct:sword_blade",
"tconstruct:large_sword_blade",
"tconstruct:hammer_head",
"tconstruct:excavator_head",
"tconstruct:kama_head",
"tconstruct:scythe_head",
"tconstruct:pan_head",
"tconstruct:sign_head",
"tconstruct:tool_rod",
"tconstruct:tough_tool_rod",
"tconstruct:binding",
"tconstruct:tough_binding",
"tconstruct:wide_guard",
"tconstruct:hand_guard",
"tconstruct:cross_guard",
"tconstruct:large_plate",
"tconstruct:knife_blade",
"tconstruct:bow_limb",
"tconstruct:arrow_head",
"conarm:armor_trim",
"conarm:armor_plate",
"conarm:helmet_core",
"conarm:chest_core",
"conarm:leggings_core",
"conarm:boots_core"] as string[];

#Materials to remove parts from
#Warning tooltip will also be added to these parts
val materialnames = ["vibranium"] as string[];
val liquidmaterialnames = [<liquid:vibranium_fluid>] as ILiquidStack[];

#Warning Tooltip addition
for stuff in materialnames {
	for parts in allparttypes {
		itemUtils.getItem(parts).withTag({Material: stuff as string}).addTooltip(format.red("WARNING: This Tool part has a Crash associated with it, it has been disabled to avoid that issue."));
		mods.tconstruct.Casting.removeTableRecipe(itemUtils.getItem(parts).withTag({Material: stuff as string}));
	}
}

#Bolt Cores
for fluids in liquidmaterialnames {
	mods.tconstruct.Casting.removeTableRecipe(<tconstruct:bolt_core>, fluids);
}

print("--- Decaster.zs initialized ---");