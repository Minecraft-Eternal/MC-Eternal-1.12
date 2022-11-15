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

print("--- EBWizardry.zs initialized ---");
