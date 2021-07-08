#MC Eternal Scripts

print("--- loading Harvestcraft.zs ---");

var pamgarden = ["arid","frost","shaded","soggy","tropical","windy"] as string[];

#Add Recipe
recipes.addShaped(<harvestcraft:toastitem>, [[<ore:cropCinnamon>, <dungeontactics:toast>]]);
recipes.removeShapeless(<harvestcraft:plainyogurtitem> * 4, [<harvestcraft:plainyogurtitem>, <minecraft:leather>]);
for gardens in pamgarden {
	itemUtils.getItem("harvestcraft:"~gardens~"garden").addTooltip(format.red("Disabled, purchase Harvestcraft seeds from the Farming for Blockheads Market"));
}

print("--- Harvestcraft.zs initialized ---");	
