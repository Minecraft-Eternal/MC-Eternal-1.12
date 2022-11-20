#MC Eternal Scripts

print("--- loading EBWizardry.zs ---");

#Setup/Vars
// The spell oredict was not very functional across saves carried over between versions, it has been deprecated
val disabledSpells = [
	11,
	159,
	151,
	168,
	430
] as int[];

val bookTypes = [
	"ebwizardry:spell_book",
	"ebwizardry:scroll",
	"tfspellpack:twilight_spell_book",
	"tfspellpack:twilight_scroll",
	"ancientspellcraft:ancient_spellcraft_spell_book",
	"ancientspellcraft:ancient_spell_book",
	"ancientspellcraft:ancient_spellcraft_scroll",
	"ancientspellcraft:mystic_spell_book",
	"ancientspellcraft:runic_plate",
	"mospells:mospells_spell_book",
	"mospells:mospells_scroll"
] as string[];

#Disabled Spell Tooltips
for spell in disabledSpells {
	for book in bookTypes {
		itemUtils.getItem(book, spell).addTooltip(format.red("Disabled, cannot be bound to Wands or Cast."));
	}
}

// Ancient Spellcraft Transmutation Manipulation Baubles

// Battlemage Hammer
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe("mce_battlemage_transmutation_hammer", "", 100, [<aspect:ignis> *8, <aspect:terra> *8, <aspect:ordo> *10], <ancientspellcraft:charm_runic_hammer>, [
	[<ancientspellcraft:crystal_silver_ingot>, <ancientspellcraft:crystal_silver_nugget>, <ancientspellcraft:rune_gyfu>],
	[<ancientspellcraft:crystal_silver_nugget>, <tconstruct:tough_binding>.withTag({Material: "knightmetal"}), <improvedbackpacks:tanned_leather>],
	[null, <improvedbackpacks:tanned_leather>, <tconstruct:tough_tool_rod>.withTag({Material: "treatedwood"})]
]);
// Sage Toolkit
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe("mce_sage_transmutation_toolkit", "", 100, [<aspect:aer> *8, <aspect:ordo> *18], <ancientspellcraft:charm_fabrikator_toolkit>, [
	[<thaumcraft:fabric>, <ebwizardry:resplendent_thread>, <thaumcraft:fabric>],
	[<ancientspellcraft:crystal_silver_nugget>, <thaumcraft:baubles:6>, <ancientspellcraft:crystal_silver_nugget>],
	[<tconstruct:tool_rod>.withTag({Material: "treatedwood"}), <tconstruct:tool_rod>.withTag({Material: "treatedwood"}), <ancientspellcraft:crystal_silver_nugget>]
]);
// Warlock Scissors
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe("mce_warlock_transmutation_scissors", "", 100, [<aspect:aqua> *8, <aspect:ordo> *10, <aspect:perditio> *8], <ancientspellcraft:charm_scissors>, [
	[null, <ancientspellcraft:crystal_silver_nugget>, null],
	[<twilightforest:knightmetal_ring>, <ancientspellcraft:crystal_silver_nugget>, <ancientspellcraft:crystal_silver_nugget>],
	[<ebwizardry:ethereal_crystalweave>, <twilightforest:knightmetal_ring>, null]
]);

print("--- EBWizardry.zs initialized ---");
