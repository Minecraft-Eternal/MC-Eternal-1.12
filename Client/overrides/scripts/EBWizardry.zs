#MC Eternal Scripts

print("--- loading EBWizardry.zs ---");

#Setup/Vars
// The spell oredict was not very functional across saves carried over between versions, it has been deprecated
var disabledSpells = [11,159,151,168] as int[];

#Disabled Spell Tooltips
for spells in disabledSpells {
	itemUtils.getItem("ebwizardry:spell_book", spells).addTooltip(format.red("Disabled, cannot be bound to Wands or Cast."));
	itemUtils.getItem("ebwizardry:scroll", spells).addTooltip(format.red("Disabled, cannot be bound to Wands or Cast."));
	itemUtils.getItem("tfspellpack:twilight_spell_book", spells).addTooltip(format.red("Disabled, cannot be bound to Wands or Cast."));
	itemUtils.getItem("ancientspellcraft:ancient_spellcraft_spell_book", spells).addTooltip(format.red("Disabled, cannot be bound to Wands or Cast."));
	itemUtils.getItem("ancientspellcraft:ancient_spell_book", spells).addTooltip(format.red("Disabled, cannot be bound to Wands or Cast."));
	itemUtils.getItem("ancientspellcraft:ancient_spellcraft_scroll", spells).addTooltip(format.red("Disabled, cannot be bound to Wands or Cast."));
}

print("--- EBWizardry.zs initialized ---");
